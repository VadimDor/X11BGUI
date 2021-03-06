/*************************************************************************
 * DeepTags, Markdown Notes Manager
 * Copyright (C) 2020  Zineddine Saibi
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *************************************************************************/
#include "tagitem.h"
#include <QApplication>
#include "settings.h"


TagItem::TagItem(const QString& label, bool special, TagItem* parent)
    : QTreeWidgetItem(parent, QStringList(label), 1500), m_elements(new QVector<Element*>()),
      m_special(special), m_pinned(false) {}

TagItem::TagItem(const QString& label, const QString& icon, bool special)
    : TagItem(label, special, nullptr) {
    if (!icon.isEmpty()) setIcon(0, QIcon(icon));
}

TagItem::~TagItem() {
    delete m_elements;
}


void TagItem::removeElement(Element* element) {
    for (int i = 0; i < m_elements->size(); i++)
        if (*m_elements->at(i) == *element) m_elements->remove(i);
}

bool TagItem::contains(Element* e) {
    for (Element* i : *m_elements)
        if (*i == *e) return true;
    return false;
}


void TagItem::setColor(const QString& color) {
    if (color.isEmpty())
        setForeground(0, qApp->palette().text());
    else {
        QBrush brush(foreground(0));
        brush.setColor(color);
        setForeground(0, brush);
    }
    Settings::setTagItemColor(label(), color);
}

void TagItem::setPinned(bool pinned) {
    m_pinned = pinned;
    QFont f  = font(0);
    f.setBold(pinned);
    setFont(0, f);
    if (pinned)
        Settings::setTagPinned(label());
    else
        Settings::setTagUnpinned(label());
}
