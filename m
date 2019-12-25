Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86CB312A6CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2019 09:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfLYIdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Dec 2019 03:33:05 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:15831 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfLYIdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Dec 2019 03:33:05 -0500
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Dec 2019 03:33:04 EST
IronPort-SDR: PxQ0wZ2p1KzSy+gzkjT8pv2j5lauKCYsOaHa+udHzX/XJJkVOJZ4gWpkyBeOdz9WPbQpdUdtRd
 PPeyby0pZQYg==
IronPort-PHdr: =?us-ascii?q?9a23=3AKGOSlBINqBO8YVsADtmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgeKPzxwZ3uMQTl6Ol3ixeRBMOHsqkC0bCN+P+6EUU7or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCezbL9oMhm6swvcusYUjId8N6081g?=
 =?us-ascii?q?bHrnxUdupM2GhmP0iTnxHy5sex+J5s7SFdsO8/+sBDTKv3Yb02QaRXAzo6PW?=
 =?us-ascii?q?814tbrtQTYQguU+nQcSGQWnQFWDAXD8Rr3Q43+sir+tup6xSmaIcj7Rq06VD?=
 =?us-ascii?q?i+86tmTgLjhSEaPDA77W7XkNR9gqxbrhK7uRJxwJPab46JO/RxZa7dYdEXSn?=
 =?us-ascii?q?ZdUspNSyBNHIWxZJYPAeobOuZYqpHwqV0UohCjHwesHuLvyjpJhn/q3K06zf?=
 =?us-ascii?q?4uGhzB0Qw8AtIOtGjbrNToO6gISuC416zIwi/Cb/NSwzv99JbHchQ/rvGUR7?=
 =?us-ascii?q?1/bdDdyVEzFw7ciFibtI/rPyuN2+gTrmSW7fBsWf+hhmI7sQ19vDeiyt0ih4?=
 =?us-ascii?q?TJgI8e10rK+j9jwIkvIN21UEt7Ydm5H5ROryyaLI52Qt86Q2FvpSY61qUKuZ?=
 =?us-ascii?q?6lcygOz5Qq3xvfZOaGc4iM+BLsSuKRLSt3iX5/ZrK/gAu9/lKuyu37UMm7zk?=
 =?us-ascii?q?xGoTRektXUt3AN0QLc6tSfR/dj40us2yyD2x3d5+1YO0w4i6XWJ4Qvz7Mwjp?=
 =?us-ascii?q?YTtF7MHi7ymEX4lq+WcUAk9/C06+T6ZrXpup6cOJJuhQHlKakun9awAeU8Mg?=
 =?us-ascii?q?QUQ2iU5+C826P7/ULjXLpGlOU2krXBvJDAOcsbvrK5AxNS0os77xa/DjGm0M?=
 =?us-ascii?q?kXnHUeNl1FYheHg5HsO1HVJfD1Fum/g1uynzdx3fzGPaPuAo/LLnfdlLftZ7?=
 =?us-ascii?q?F961RTyFl78dcK45NSF6FEKej2H0rqsfTGARIjdQ+52eDqDJN6zIxNY2+XBr?=
 =?us-ascii?q?6lN/b2uBew/OMqIvWNeoZd7DL0M+Ik4v/yjGEwlEQ1b66p2p4eaXT+E+kwcG?=
 =?us-ascii?q?uDZn+5pt5JKX0LuwsiTfLjwAmeTDpYZnq7RIo57zA/Tp6rCYrbT4vrmKDXj3?=
 =?us-ascii?q?TzJYFfem0TUgPEKnzvbYjRA/o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GTKgAeHQNemCMYgtllgkQBGAEBgns?=
 =?us-ascii?q?3GyASk0JUBnUdihKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQU?=
 =?us-ascii?q?BAQEBAQUEAQECEAEBAQEBCAsLBimFSkIBDAGBayKEF4EDgSyDA4JTKa0WGgK?=
 =?us-ascii?q?FI4R1gTYBjBgaeYEHgUSCMoUCARIBbIUhBI1FIYhLYZd+gj4EljANgikBjDg?=
 =?us-ascii?q?DglSJEacigjdVgQuBCnFNOIFyGYEdTxgNjSyOLUCBFhACT4VAh1yCMgEB?=
X-IPAS-Result: =?us-ascii?q?A2GTKgAeHQNemCMYgtllgkQBGAEBgns3GyASk0JUBnUdi?=
 =?us-ascii?q?hKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQUBAQEBAQUEAQECE?=
 =?us-ascii?q?AEBAQEBCAsLBimFSkIBDAGBayKEF4EDgSyDA4JTKa0WGgKFI4R1gTYBjBgae?=
 =?us-ascii?q?YEHgUSCMoUCARIBbIUhBI1FIYhLYZd+gj4EljANgikBjDgDglSJEacigjdVg?=
 =?us-ascii?q?QuBCnFNOIFyGYEdTxgNjSyOLUCBFhACT4VAh1yCMgEB?=
X-IronPort-AV: E=Sophos;i="5.69,353,1571695200"; 
   d="scan'208";a="298603260"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 25 Dec 2019 09:27:59 +0100
Received: (qmail 32449 invoked from network); 25 Dec 2019 04:33:53 -0000
Received: from unknown (HELO 192.168.1.88) (seigo@[217.217.179.17])
          (envelope-sender <tulcidas@mail.telepac.pt>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-arm-msm@vger.kernel.org>; 25 Dec 2019 04:33:53 -0000
Date:   Wed, 25 Dec 2019 05:33:41 +0100 (CET)
From:   La Primitiva <tulcidas@mail.telepac.pt>
Reply-To: La Primitiva <laprimitivaes@zohomail.eu>
To:     linux-arm-msm@vger.kernel.org
Message-ID: <3335273.259451.1577248425031.JavaMail.javamailuser@localhost>
Subject: Take home 750,000 Euros this end of year
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Attn: Email User,

You have won, you are to reply back with your name and phone number for
claim.

La Primitiva




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

