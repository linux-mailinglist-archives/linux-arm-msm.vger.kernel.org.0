Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A19441B824
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 22:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242695AbhI1UKo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 16:10:44 -0400
Received: from mail.shanghaitech.edu.cn ([119.78.254.11]:7418 "EHLO
        mail.shanghaitech.edu.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242679AbhI1UK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 16:10:28 -0400
X-Greylist: delayed 677 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Sep 2021 16:10:25 EDT
Received: from [10.15.44.215] by mail.shanghaitech.edu.cn with MESSAGESEC ESMTP id 480409496331105;
        Wed, 29 Sep 2021 04:08:24 +0800 (CST)
Received: from DESKTOP-FOJ6ELG.localdomain (10.15.44.220) by
 smtp.shanghaitech.edu.cn (10.15.44.215) with Microsoft SMTP Server (TLS) id
 14.3.399.0; Wed, 29 Sep 2021 04:08:22 +0800
From:   Mianhan Liu <liumh1@shanghaitech.edu.cn>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Mianhan Liu <liumh1@shanghaitech.edu.cn>
Subject: [PATCH -next -v2] ./drivers/bluetooth/btqcomsmd.c: remove superfluous header files from btqcomsmd.c
Date:   Wed, 29 Sep 2021 04:08:11 +0800
Message-ID: <20210928200811.22059-1-liumh1@shanghaitech.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain
X-Originating-IP: [10.15.44.220]
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

btqcomsmd.c hasn't use any macro or function declared in linux/of.h
and linux/slab.h.
Thus, these files can be removed from btqcomsmd.c safely without
affecting the compilation of the ./drivers/bluetooth module

Signed-off-by: Mianhan Liu <liumh1@shanghaitech.edu.cn>

---
 drivers/bluetooth/btqcomsmd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bluetooth/btqcomsmd.c b/drivers/bluetooth/btqcomsmd.c
index 2acb719e5..e556d96a4 100644
--- a/drivers/bluetooth/btqcomsmd.c
+++ b/drivers/bluetooth/btqcomsmd.c
@@ -5,9 +5,7 @@
  */
 
 #include <linux/module.h>
-#include <linux/slab.h>
 #include <linux/rpmsg.h>
-#include <linux/of.h>
 
 #include <linux/soc/qcom/wcnss_ctrl.h>
 #include <linux/platform_device.h>
-- 
2.25.1


