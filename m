Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788F227BD0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 08:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgI2GW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 02:22:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:50190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgI2GWT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 02:22:19 -0400
Received: from mail.kernel.org (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BE0F20BED;
        Tue, 29 Sep 2020 06:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601360538;
        bh=uHJGfFfxEsHLO5eWd/AelHCZUHpBL7I1dn3ww937d/w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FYCTVBSzQ10VJNTKvqdLNA69TY4sw+WB+WgrCx4ZwhN5OOyjQVf9rPVRN7uWzaCTn
         dZGwVqYRuhq/SrRZuzxwqsYPGBpYSMsD9tIb6R0kLl9Gs3DvZPhby3s4FBBi3HYs53
         CrXleN1poYH3PpatCu/8YEVPI2osmvbxCSoFPExo=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kN91j-000cE5-Lv; Tue, 29 Sep 2020 08:22:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "John Stultz" <john.stultz@linaro.org>,
        "Manivannan Sadhasivam" <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] spmi: fix some coding style issues at the spmi core
Date:   Tue, 29 Sep 2020 08:22:13 +0200
Message-Id: <fec878502147336cbf2cf86e476e9dd797cd7e6f.1601360391.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601360391.git.mchehab+huawei@kernel.org>
References: <cover.1601360391.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While preparing to port the HiSilicon 6421v600 SPMI driver,
I noticed some coding style issues at the SPMI core.

Address them.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
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

