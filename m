Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B3B27E35F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 10:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgI3IOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 04:14:51 -0400
Received: from z5.mailgun.us ([104.130.96.5]:37029 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgI3IOu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 04:14:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601453689; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=E9G8R12eJFpuZMok5GIHcewvV/QV4LDFn6WPUhUSPmM=; b=EiJJCjDNOUYb/t+5uR9Ocd+EbmRKFbEFMK9oux9ns1WRNr5ed91KQUawbNndilKnUrXwAVHo
 C71DTJ2ouLEAy0608fWU2zc5xYBbjd0UuaB0sef+70Tk2FYzz1Hl1wTvgFLJXrxwueeIqNAa
 0UZWGnaK1l2qLM7HlZo9ZXRPqps=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f743e791fdd3a13907c949f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Sep 2020 08:14:49
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9467FC433C8; Wed, 30 Sep 2020 08:14:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A30F0C433CA;
        Wed, 30 Sep 2020 08:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A30F0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V1 2/3] soc: qcom: llcc: Add configuration data for SM8150
Date:   Wed, 30 Sep 2020 13:44:13 +0530
Message-Id: <957e3ae50c75720ef6227529d5ce3d4b457802e9.1601452132.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1601452132.git.schowdhu@codeaurora.org>
References: <cover.1601452132.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1601452132.git.schowdhu@codeaurora.org>
References: <cover.1601452132.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LLCC configuration data for SM8150 SoC which controls
LLCC behaviour.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 drivers/soc/qcom/llcc-qcom.c       | 30 ++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  6 ++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 70fbe70c6213..8b245006e33e 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -119,6 +119,30 @@ static const struct llcc_slice_config sdm845_data[] =  {
 	{ LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0 },
 };
 
+static const struct llcc_slice_config sm8150_data[] =  {
+        {  LLCC_CPUSS,    1, 3072, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 1 },
+        {  LLCC_VIDSC0,   2, 512,  2, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_VIDSC1,   3, 512,  2, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_AUDIO,    6, 1024, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_MDMHPGRW, 7, 3072, 1, 0, 0xFF,  0xF00, 0, 0, 0, 1, 0 },
+        {  LLCC_MDM,      8, 3072, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_MODHW,    9, 1024, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_CMPT,    10, 3072, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_GPUHTW , 11, 512,  1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_GPU,     12, 2560, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_MMUHWT,  13, 1024, 1, 1, 0xFFF, 0x0,   0, 0, 0, 0, 1 },
+        {  LLCC_CMPTDMA, 15, 3072, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_DISP,    16, 3072, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_MDMHPFX, 20, 1024, 2, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_MDMHPFX, 21, 1024, 0, 1, 0xF,   0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_AUDHW,   22, 1024, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_NPU,     23, 3072, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_WLHW,    24, 3072, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_MODPE,   29, 256,  1, 1, 0xF,   0x0,   0, 0, 0, 1, 0 },
+        {  LLCC_APTCM,   30, 256,  3, 1, 0x0,   0x1,   1, 0, 0, 1, 0 },
+        {  LLCC_WRCACHE, 31, 128,  1, 1, 0xFFF, 0x0,   0, 0, 0, 0, 0 },
+};
+
 static const struct qcom_llcc_config sc7180_cfg = {
 	.sct_data	= sc7180_data,
 	.size		= ARRAY_SIZE(sc7180_data),
@@ -129,6 +153,11 @@ static const struct qcom_llcc_config sdm845_cfg = {
 	.size		= ARRAY_SIZE(sdm845_data),
 };
 
+static const struct qcom_llcc_config sm8150_cfg = {
+        .sct_data       = sm8150_data,
+        .size           = ARRAY_SIZE(sm8150_data),
+};
+
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
 /**
@@ -494,6 +523,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfg },
 	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
+        { .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfg },
 	{ }
 };
 
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 90b864655822..3db6797ba6ff 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -16,6 +16,7 @@
 #define LLCC_AUDIO       6
 #define LLCC_MDMHPGRW    7
 #define LLCC_MDM         8
+#define LLCC_MODHW       9
 #define LLCC_CMPT        10
 #define LLCC_GPUHTW      11
 #define LLCC_GPU         12
@@ -26,6 +27,11 @@
 #define LLCC_MDMHPFX     20
 #define LLCC_MDMPNG      21
 #define LLCC_AUDHW       22
+#define LLCC_NPU         23
+#define LLCC_WLHW        24
+#define LLCC_MODPE       29
+#define LLCC_APTCM       30
+#define LLCC_WRCACHE     31
 
 /**
  * llcc_slice_desc - Cache slice descriptor
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

