Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D712429CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 14:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgHLMxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 08:53:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:58354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728077AbgHLMxb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 08:53:31 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADB4A20855;
        Wed, 12 Aug 2020 12:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597236810;
        bh=sMR5WfU/yDqf04UKZ+4F9gNr4i3+0PkGJ5r2jnWOGds=;
        h=From:To:Cc:Subject:Date:From;
        b=wFrep99YdXa9sIM8tOmHVjJNWR/xF0x/zDxDubDPzMm/FYL2ZVMFbRcqJzRqELQ1H
         QdqSQsaYjVeKK6/JP4s1QN9gi2fa/HBJBFiCP57fxuWUR2IiK9UeY4miij15qkq0Jj
         SfuOUGOawD3V5fzjyUeHPv/ELyjOCfb3O4OoxsZk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5qG0-005gsV-Hr; Wed, 12 Aug 2020 14:53:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] spmi: fix some coding style issues at the spmi core
Date:   Wed, 12 Aug 2020 14:53:27 +0200
Message-Id: <2736eaf03a5b8bf3aa4566198a98f3d2073d0070.1597236805.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While preparing to port the HiSilicon 6421v600 SPMI driver,
I noticed some coding style issues at the SPMI core.

Address them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/spmi/spmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index fd3ff6079b15..253340e10dab 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -23,6 +23,7 @@ static DEFINE_IDA(ctrl_ida);
 static void spmi_dev_release(struct device *dev)
 {
 	struct spmi_device *sdev = to_spmi_device(dev);
+
 	kfree(sdev);
 }
 
@@ -33,6 +34,7 @@ static const struct device_type spmi_dev_type = {
 static void spmi_ctrl_release(struct device *dev)
 {
 	struct spmi_controller *ctrl = to_spmi_controller(dev);
+
 	ida_simple_remove(&ctrl_ida, ctrl->nr);
 	kfree(ctrl);
 }
@@ -487,7 +489,7 @@ static void of_spmi_register_devices(struct spmi_controller *ctrl)
 			continue;
 
 		sdev->dev.of_node = node;
-		sdev->usid = (u8) reg[0];
+		sdev->usid = (u8)reg[0];
 
 		err = spmi_device_add(sdev);
 		if (err) {
@@ -531,6 +533,7 @@ EXPORT_SYMBOL_GPL(spmi_controller_add);
 static int spmi_ctrl_remove_device(struct device *dev, void *data)
 {
 	struct spmi_device *spmidev = to_spmi_device(dev);
+
 	if (dev->type == &spmi_dev_type)
 		spmi_device_remove(spmidev);
 	return 0;
-- 
2.26.2

