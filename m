Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56760138AB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 06:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgAMFY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 00:24:59 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:64233 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgAMFY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 00:24:59 -0500
IronPort-SDR: iUfXovQqKuP2DRr0pmspHZz9vCmh36r6Ug5UQURi93Ra/uKY4HaZzlJWzcsuvVNzGeMIoQfYJZ
 sXiGGZArRobg==
IronPort-PHdr: =?us-ascii?q?9a23=3ADcLoThBw8jRrDXZz2+uFUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSPTyrsbcNUDSrc9gkEXOFd2Cra4d0KyM7fGrCTZIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfL1/IA+ooQjQssQajohvJrgswR?=
 =?us-ascii?q?bVv3VEfPhby3l1LlyJhRb84cmw/J9n8ytOvv8q6tBNX6bncakmVLJUFDspPX?=
 =?us-ascii?q?w7683trhnDUBCA5mAAXWUMkxpHGBbK4RfnVZrsqCT6t+592C6HPc3qSL0/RD?=
 =?us-ascii?q?qv47t3RBLulSwLMTk1/nzLhcNqiaJaoAutqgJ4w47OeIGVM+B+cbnBfdwEXG?=
 =?us-ascii?q?ZOQMBRWzVdD4Ogc4sAFfYOPeZGoIn4uVQOqwe+CRCyC+Pp0zNGgXj23ask3O?=
 =?us-ascii?q?UhCA3JwgogFM8KvHnasNn5KKIeXOaox6fK0DrDdetb1zn95ojSbB4vouyCUr?=
 =?us-ascii?q?1sfsTe0kQvCwHIgUmMpYD5Iz+ZyOIAuHWb4ep6UuKvjnYqpRtvrTiz2MgskJ?=
 =?us-ascii?q?TCiYISylDC+iVy3YE4JcWmR05nf9GkCpVRtyacN4t5Wc4iQ3potz0mxbEcpZ?=
 =?us-ascii?q?G7ey0KxI4nxx7ccvGKdZWD7BH7VOuJPzt0mXBodKiiixu87USs0PPwW8au3F?=
 =?us-ascii?q?tEridIlMTHuGoX2BzJ8MeHT+Nw/kKm2TmSyQ/e8vpEIUUolarDLJ4h36Iwmo?=
 =?us-ascii?q?ITsUvdGi/2n137jKqMeUUl/uio8froYrH6qpKTLYN0lAb+Pbk0lcyxBuQ4NB?=
 =?us-ascii?q?YBU3KF9uSnzLHj/Ev5T6tWjvAujKXVrZLXKd4GqqO3HwNZyJgv5hmlAzqo0N?=
 =?us-ascii?q?kUhXwHI0hEeBKDgYjpIVbOIPXgAPennVusjClkx+rIP73mBJXNIWPOkLf6fb?=
 =?us-ascii?q?lm90FQ0hY8zdda555OCrEBI+r/WlXtu9zAEh85Lwu0zv7jCNV80IMeRG2ODr?=
 =?us-ascii?q?aDP6PItF+E/+cvI/KJZIIOpjb9JOYq5+T0gX86h1AdZ6+p0oUTaHyiGfRmOU?=
 =?us-ascii?q?qZMjLQhYIFEGEXrk83VumvjUaHeSBcamz0XK8m4Dw/ToW8AtT5S5ipkYCGiR?=
 =?us-ascii?q?+2ApBMLl9BDF/ERW/la4ieRPAKZyKRItRrmRQLULGgT8kq0hT45yHgzL8yFu?=
 =?us-ascii?q?fI9zdQipXl25Ah/+DPmAst8jp7J8SG2WrLRGZx2GMLEWxllJtjqFBwnw7QmZ?=
 =?us-ascii?q?NzhOZVQIcLv/4=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ETKgBD/htemCMYgtkUBjMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4E?=
 =?us-ascii?q?Agx4VhggTDIFbDQEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAE?=
 =?us-ascii?q?BAhABAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4M?=
 =?us-ascii?q?EgksBATOFJZdNAY0EDQ0ChR2CQwQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V4EMDXpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IPAS-Result: =?us-ascii?q?A2ETKgBD/htemCMYgtkUBjMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbD?=
 =?us-ascii?q?QEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAEBAhABAQEBAQYNC?=
 =?us-ascii?q?wYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgksBATOFJZdNA?=
 =?us-ascii?q?Y0EDQ0ChR2CQwQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V4EMD?=
 =?us-ascii?q?XpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,427,1571695200"; 
   d="scan'208";a="304565393"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 13 Jan 2020 06:24:55 +0100
Received: (qmail 24371 invoked from network); 12 Jan 2020 05:00:20 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-arm-msm@vger.kernel.org>; 12 Jan 2020 05:00:20 -0000
Date:   Sun, 12 Jan 2020 06:00:18 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Message-ID: <10135674.460778.1578805220811.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

