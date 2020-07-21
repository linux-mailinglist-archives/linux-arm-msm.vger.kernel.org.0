Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAA722896A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 21:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730335AbgGUTqL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 15:46:11 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:14210 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730250AbgGUTqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 15:46:11 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Jul 2020 12:46:10 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 21 Jul 2020 12:46:10 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 23AE915B2; Tue, 21 Jul 2020 12:46:10 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Shyam Kumar Thella <sthella@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v2 1/1] nvmem: qcom-spmi-sdam: Enable multiple devices
Date:   Tue, 21 Jul 2020 12:46:01 -0700
Message-Id: <1595360761-640-1-git-send-email-gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using pdev->id as the nvmem's config ID (which, by default, is
NVMEM_DEVID_NONE) prevents multiple instances of this driver from
probing because of the following error:

  sysfs: cannot create duplicate filename '/bus/nvmem/devices/spmi_sdam'

Use NVMEM_DEVID_AUTO as the NVMEM config ID to fix the issue.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/nvmem/qcom-spmi-sdam.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index 8682cda..a72704c 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2017 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/device.h>
@@ -141,7 +141,7 @@ static int sdam_probe(struct platform_device *pdev)
 
 	sdam->sdam_config.dev = &pdev->dev;
 	sdam->sdam_config.name = "spmi_sdam";
-	sdam->sdam_config.id = pdev->id;
+	sdam->sdam_config.id = NVMEM_DEVID_AUTO;
 	sdam->sdam_config.owner = THIS_MODULE,
 	sdam->sdam_config.stride = 1;
 	sdam->sdam_config.word_size = 1;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

