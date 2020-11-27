Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A352C6500
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 13:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728726AbgK0MLy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 07:11:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728224AbgK0MLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 07:11:54 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47738C0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 04:11:54 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id y7so4397091pfq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kzKkCt4qLiDzrU3pEP907cfAa2/fONI8wtqu9xL5mS0=;
        b=P7i2Ll/VDLXnkAb5dj7yRmliym5AB6RYeHpjrxYWRuNLbGw/FKkje6xqCYyjoyouEe
         f1/XEQ8lXJf9BAjF2k1ihJkH7JHMKE/G73Z4SwWWUVCW3PirFQpWYq+oxROR2nppaEvO
         JC22O1idq4jMYm9bYAtPgWaxdD7fhhqG5Q9jhGHEEomRO41tOh7d33ju4VpFag0U9dRx
         jDFSa6ZWxu44POcTTNDG1N2v0d3IkfTpfK4MSXPUIN3ENRLXcHjUWPA5R9HrFcCQV1Jg
         d01j0iIbUtA1U1nV6QE5rdiTW5LZ7g5E6wfJ17wis1LyNtOZbX2s8udaraMr6dKfaDof
         +Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kzKkCt4qLiDzrU3pEP907cfAa2/fONI8wtqu9xL5mS0=;
        b=gHRYUH5Ph3U4nI5koCy45g5DHuZ61/Yr2yZUHFU6FZdRJr/WawRoSUZcOhMAcTVwWy
         rftUZKhRQAu5Hx+zva2ZFQ7RaPLLiV6Yn1IqyDRJyUeydNLMvRI7jP8tVpAIKimqIVox
         P9SYSTVMhLLaomOV3gOvHv7hOQRUiIdSTgkWpskOP0YhChrNkFqjA0mOt9x8Uut09nOh
         sPVcwgf+NIftxG3xUyjunrTwBVye29Vm92Zv6HfnH6lckR2LPZkMqNJwPMPsyuqgUt0x
         W+1vcw/oBsvwvFOUoRjmOmm6HPhT8V8Auc7aWiTNcWJih0MVxcURk26FhkHWWAxevONf
         /VIw==
X-Gm-Message-State: AOAM531j/907D7UMQ2FMWmXT4ej55ieP/MP6jm7Xd9pGn1gZBXDEgyWg
        HiF05uPAuCf340S/oHYXpaCR
X-Google-Smtp-Source: ABdhPJwrQpc1YXtzJf4bP4Bjz2pW+fSWY6ctAxzT4c47z/mOAomfSUducLY0iVjT2ZG0mB7fh1GXvw==
X-Received: by 2002:a63:445c:: with SMTP id t28mr6341331pgk.373.1606479113785;
        Fri, 27 Nov 2020 04:11:53 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:480:e2cd:2509:49c2:a270:1438])
        by smtp.gmail.com with ESMTPSA id g8sm7318790pgn.47.2020.11.27.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 04:11:53 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] soc: qcom: llcc-qcom: Add support for SM8250 SoC
Date:   Fri, 27 Nov 2020 17:41:27 +0530
Message-Id: <20201127121127.158082-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127121127.158082-1-manivannan.sadhasivam@linaro.org>
References: <20201127121127.158082-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 SoC uses LLCC IP version 2. In this version, the WRSC_EN register
needs to be written to enable the Write Sub Cache for each SCID. Hence,
use a dedicated "write_scid_en" member with predefined values and write
them for SoCs enabling the "llcc_v2" flag.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c       | 40 ++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 16b421608e9c..3ec4cdffa852 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -47,6 +47,7 @@
 
 #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
 #define LLCC_TRP_PCB_ACT              0x21f04
+#define LLCC_TRP_WRSC_EN              0x21f20
 
 #define BANK_OFFSET_STRIDE	      0x80000
 
@@ -73,6 +74,7 @@
  *               then the ways assigned to this client are not flushed on power
  *               collapse.
  * @activate_on_init: Activate the slice immediately after it is programmed
+ * @write_scid_en: Bit enables write cache support for a given scid.
  */
 struct llcc_slice_config {
 	u32 usecase_id;
@@ -87,12 +89,14 @@ struct llcc_slice_config {
 	bool dis_cap_alloc;
 	bool retain_on_pc;
 	bool activate_on_init;
+	bool write_scid_en;
 };
 
 struct qcom_llcc_config {
 	const struct llcc_slice_config *sct_data;
 	int size;
 	bool need_llcc_cfg;
+	bool llcc_v2;
 };
 
 static const struct llcc_slice_config sc7180_data[] =  {
@@ -147,6 +151,25 @@ static const struct llcc_slice_config sm8150_data[] =  {
 	{  LLCC_WRCACHE, 31, 128,  1, 1, 0xFFF, 0x0,   0, 0, 0, 0, 0 },
 };
 
+static const struct llcc_slice_config sm8250_data[] =  {
+	{ LLCC_CPUSS,    1, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 1, 0 },
+	{ LLCC_VIDSC0,   2, 512,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_AUDIO,    6, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
+	{ LLCC_CMPT,    10, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
+	{ LLCC_GPUHTW,  11, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_GPU,     12, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 1 },
+	{ LLCC_MMUHWT,  13, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_CMPTDMA, 15, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_DISP,    16, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_VIDFW,   17, 512,  1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_AUDHW,   22, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_NPU,     23, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_WLHW,    24, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_CVP,     28, 256,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_APTCM,   30, 128,  3, 0, 0x0,   0x3, 1, 0, 0, 1, 0, 0 },
+	{ LLCC_WRCACHE, 31, 256,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+};
+
 static const struct qcom_llcc_config sc7180_cfg = {
 	.sct_data	= sc7180_data,
 	.size		= ARRAY_SIZE(sc7180_data),
@@ -164,6 +187,12 @@ static const struct qcom_llcc_config sm8150_cfg = {
 	.size           = ARRAY_SIZE(sm8150_data),
 };
 
+static const struct qcom_llcc_config sm8250_cfg = {
+	.sct_data       = sm8250_data,
+	.size           = ARRAY_SIZE(sm8250_data),
+	.llcc_v2	= true,
+};
+
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
 /**
@@ -413,6 +442,16 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 			return ret;
 	}
 
+	if (cfg->llcc_v2) {
+		u32 wren;
+
+		wren = config->write_scid_en << config->slice_id;
+		ret = regmap_update_bits(drv_data->bcast_regmap, LLCC_TRP_WRSC_EN,
+					 BIT(config->slice_id), wren);
+		if (ret)
+			return ret;
+	}
+
 	if (config->activate_on_init) {
 		desc.slice_id = config->slice_id;
 		ret = llcc_slice_activate(&desc);
@@ -559,6 +598,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfg },
 	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
 	{ .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfg },
+	{ .compatible = "qcom,sm8250-llcc", .data = &sm8250_cfg },
 	{ }
 };
 
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 3db6797ba6ff..85f18ae7692f 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -29,6 +29,7 @@
 #define LLCC_AUDHW       22
 #define LLCC_NPU         23
 #define LLCC_WLHW        24
+#define LLCC_CVP         28
 #define LLCC_MODPE       29
 #define LLCC_APTCM       30
 #define LLCC_WRCACHE     31
-- 
2.25.1

