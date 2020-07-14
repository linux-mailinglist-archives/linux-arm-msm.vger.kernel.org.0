Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B3921E431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 02:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgGNABe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 20:01:34 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:39815 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726150AbgGNABd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 20:01:33 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jul 2020 17:01:33 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 13 Jul 2020 17:01:31 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id A5C241ADD; Mon, 13 Jul 2020 17:01:30 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v1 1/1] nvmem: qcom-spmi-sdam: Enable multiple devices
Date:   Mon, 13 Jul 2020 17:01:28 -0700
Message-Id: <1594684888-19090-1-git-send-email-gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specifying the name of the nvmem device while registering it with the
nvmem framework has the side effect of causing the second instance of a
device using this driver to fail probe with the following error message:

  sysfs: cannot create duplicate filename '/bus/nvmem/devices/spmi_sdam'

Removing the name allows the nvmem framework to assign a monotonically
increasing integer id to each instance of this driver automatically,
like so:

  /sys/bus/nvmem/devices # ls
  nvmem0  nvmem1  nvmem2

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/nvmem/qcom-spmi-sdam.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index 8682cda..6275f14 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2017 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/device.h>
@@ -140,8 +140,6 @@ static int sdam_probe(struct platform_device *pdev)
 	sdam->size = val * 32;
 
 	sdam->sdam_config.dev = &pdev->dev;
-	sdam->sdam_config.name = "spmi_sdam";
-	sdam->sdam_config.id = pdev->id;
 	sdam->sdam_config.owner = THIS_MODULE,
 	sdam->sdam_config.stride = 1;
 	sdam->sdam_config.word_size = 1;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

