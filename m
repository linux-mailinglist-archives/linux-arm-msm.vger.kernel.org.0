Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD36936ABED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 07:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhDZFz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 01:55:29 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61644 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbhDZFz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 01:55:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619416488; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=P8V8QMRXR8RSMWA+38eUkmtqIUVqsIXcqd72opEfYnA=; b=lNaNFHX+Vz4z5qWZeRbp35qt10+tWykd68qS4HYqqC8ggDeGNRMK4QCSc4HrmPZeXAl3eHZA
 dP046kTsu2Xud8yrtIRsL+HwJ9jiEMFLkJhnvDf/NDYtuTpfcBZJQyuqblrSI8OcEf/UeCeM
 Yam4DlfRGBqnvPqh+24MZq05Q+Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60865591e0e9c9a6b698021e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Apr 2021 05:54:25
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 745ECC43460; Mon, 26 Apr 2021 05:54:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CB376C433D3;
        Mon, 26 Apr 2021 05:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CB376C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rbokka@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2] nvmem: qfprom: minor nit fixes
Date:   Mon, 26 Apr 2021 11:24:12 +0530
Message-Id: <1619416452-6852-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix a missed newline, change an 'if' to 'else if' and update
a comment which is stale after the merge of '5a1bea2a: nvmem:
qfprom: Add support for fuseblowing on sc7280'

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
v2: Added the change to move the 'if' to 'else if'
Sending a follow-up patch for these nits since they came in after
the previous patch was already pulled in
https://lore.kernel.org/patchwork/patch/1401964/

 drivers/nvmem/qfprom.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index d6d3f24..1ba666b 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -122,6 +122,7 @@ static const struct qfprom_soc_compatible_data sc7280_qfprom = {
 	.keepout = sc7280_qfprom_keepout,
 	.nkeepout = ARRAY_SIZE(sc7280_qfprom_keepout)
 };
+
 /**
  * qfprom_disable_fuse_blowing() - Undo enabling of fuse blowing.
  * @priv: Our driver data.
@@ -195,7 +196,7 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
 	}
 
 	/*
-	 * Hardware requires 1.8V min for fuse blowing; this may be
+	 * Hardware requires a min voltage for fuse blowing; this may be
 	 * a rail shared do don't specify a max--regulator constraints
 	 * will handle.
 	 */
@@ -399,7 +400,7 @@ static int qfprom_probe(struct platform_device *pdev)
 
 		if (major_version == 7 && minor_version == 8)
 			priv->soc_data = &qfprom_7_8_data;
-		if (major_version == 7 && minor_version == 15)
+		else if (major_version == 7 && minor_version == 15)
 			priv->soc_data = &qfprom_7_15_data;
 
 		priv->vcc = devm_regulator_get(&pdev->dev, "vcc");
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

