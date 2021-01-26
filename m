Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6BE2303481
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732637AbhAZFYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:24:40 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:21149 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727417AbhAZEUF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 23:20:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611634784; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IhQq464FAKYY3Pw5e/mnjd4aWb7ctts6/K72ciBiFCg=; b=nLPrmLf//I0pqZufffU/C4npfAPLY7KOLnBpxejkfZjTCOblk5AjoGdLn3WlcoH5e9KUgC6y
 jdEnZeuLfbiIw3C9k6tXgZ7EMqcYc/fNO82AFQUvEHmfW0DuaL9IutZaWkLos2NCBXzXO6lY
 tUZHwNkmQQlEecTKilPvJdi1SN8=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 600f983b2c36b2106d90d88a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Jan 2021 04:19:07
 GMT
Sender: subbaram=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 332C6C433C6; Tue, 26 Jan 2021 04:19:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from subbaram-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: subbaram)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 18E0BC433CA;
        Tue, 26 Jan 2021 04:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 18E0BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=subbaram@codeaurora.org
From:   Subbaraman Narayanamurthy <subbaram@codeaurora.org>
To:     srinivas.kandagatla@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [PATCH] nvmem: qcom-spmi-sdam: Fix uninitialized pdev pointer
Date:   Mon, 25 Jan 2021 20:18:55 -0800
Message-Id: <1611634735-5366-1-git-send-email-subbaram@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"sdam->pdev" is uninitialized and it is used to print error logs.
Fix it. Since device pointer can be used from sdam_config, use it
directly thereby removing pdev pointer.

Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
---
---
 drivers/nvmem/qcom-spmi-sdam.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index a72704c..f6e9f96 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2017, 2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017, 2020-2021, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/device.h>
@@ -18,7 +18,6 @@
 #define SDAM_PBS_TRIG_CLR		0xE6
 
 struct sdam_chip {
-	struct platform_device		*pdev;
 	struct regmap			*regmap;
 	struct nvmem_config		sdam_config;
 	unsigned int			base;
@@ -65,7 +64,7 @@ static int sdam_read(void *priv, unsigned int offset, void *val,
 				size_t bytes)
 {
 	struct sdam_chip *sdam = priv;
-	struct device *dev = &sdam->pdev->dev;
+	struct device *dev = sdam->sdam_config.dev;
 	int rc;
 
 	if (!sdam_is_valid(sdam, offset, bytes)) {
@@ -86,7 +85,7 @@ static int sdam_write(void *priv, unsigned int offset, void *val,
 				size_t bytes)
 {
 	struct sdam_chip *sdam = priv;
-	struct device *dev = &sdam->pdev->dev;
+	struct device *dev = sdam->sdam_config.dev;
 	int rc;
 
 	if (!sdam_is_valid(sdam, offset, bytes)) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

