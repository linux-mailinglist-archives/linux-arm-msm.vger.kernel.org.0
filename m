Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66836517973
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 23:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387738AbiEBV4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 17:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237633AbiEBVzx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 17:55:53 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD11262D2
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 14:52:22 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id m25so2615932oih.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 14:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Itt6Al99ZXx55Z0+z/aCQlFJ/Qfe/PU2t5niCqn7/5o=;
        b=KMInJEqwKGYo9VD+rJE0s46CLrRx3VyNtX3LYH2SLwXOspWyNxcn9rlbSkgtE86l8u
         5ocLNSoT3Hhk6px4uPINBumsib5vPUUYsBpVKUCWMFi+PFwtgdYiw0E8G5f22yXdxDaz
         N5Gf/uXZFkSM3+yxnyL5vmL0UqTMLXuje6AXD0CUjgLedqtmUVNd+sQrmYg/+k87sV42
         3nq+VHpdTe2MTy1YiGUarcMG2vSLFc05X5TA2iyclcv0/vmMBPUKKvnlIgN9begP2MSC
         Ue+x2kYdfOEw46yHnDydj6ISm/Ue1htfjqX+nRjXfS94lo3j4dk8ZJPChc76s1/3ee0t
         tyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Itt6Al99ZXx55Z0+z/aCQlFJ/Qfe/PU2t5niCqn7/5o=;
        b=geCB1Tfak4daKowJE+tynqXzJvGCpK2FRgMe2lmL8kfc4RDX1UFR4qqZAQlVj4EtSA
         AzggeJ1TQAoRzozkv2De0X/voMkgk6Ng3sRw7wBUK6ZhpL4aF7sUBt9YszHRYOvSlU9B
         bXK0ZYe9S4VPLYEBdGvPN9hk8yodXl31pcVrm9zMopWRy0SMvCE3J7lfITfmXA+naO7V
         IsnBB/wxuRrAgctB1b+IlZfzMMvkbdI3MXsMj4Q+VrWd7Islg2Ha4SpKlM9et5D0q5CI
         0lvbqPUWgaOaNyMol7zjKe4v0VzyNYwz/wM1vpyQk2H9vi1aPfMeUqNSVXe4YMl2sy0X
         DadQ==
X-Gm-Message-State: AOAM531sDIv1BvflZtArlJzvAgXLITyP+RFTIBXhsLEhaSSBgGcfZAXt
        JFkR8MFpto0/AIh1oopTghARrQ==
X-Google-Smtp-Source: ABdhPJzbdVQSZgbYyzvz3zoArhe5129vL7dGg1H3rMhLTvKMlXnmgkmSK4GtIZT7xVGzTPb9GMp6dw==
X-Received: by 2002:a05:6808:aa4:b0:325:91ff:43cc with SMTP id r4-20020a0568080aa400b0032591ff43ccmr582084oij.166.1651528342081;
        Mon, 02 May 2022 14:52:22 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k16-20020a544710000000b00325cda1ff8asm2720406oik.9.2022.05.02.14.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 14:52:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: llcc: Add sc8180x and sc8280xp configurations
Date:   Mon,  2 May 2022 14:54:06 -0700
Message-Id: <20220502215406.612967-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502215406.612967-1-bjorn.andersson@linaro.org>
References: <20220502215406.612967-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LLCC configuration data for the SC8180X and SC8280XP platforms,
based on the downstream tables.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changs since v1:
- Updated tables according to documentation - thanks Sai!

 drivers/soc/qcom/llcc-qcom.c       | 60 ++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  2 +
 2 files changed, 62 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 85ba8209b182..4b143cf7b4ce 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -130,6 +130,50 @@ static const struct llcc_slice_config sc7280_data[] =  {
 	{ LLCC_MODPE,    29, 64,  1, 1, 0x3f, 0x0, 0, 0, 0, 1, 0, 0},
 };
 
+static const struct llcc_slice_config sc8180x_data[] = {
+	{ LLCC_CPUSS,    1, 6144,  1, 1, 0xfff, 0x0,   0, 0, 0, 1, 1 },
+	{ LLCC_VIDSC0,   2, 512,   2, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_VIDSC1,   3, 512,   2, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_AUDIO,    6, 1024,  1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_MDMHPGRW, 7, 3072,  1, 1, 0x3ff, 0xc00, 0, 0, 0, 1, 0 },
+	{ LLCC_MDM,      8, 3072,  1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_MODHW,    9, 1024,  1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_CMPT,     10, 6144, 1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_GPUHTW,   11, 1024, 1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_GPU,      12, 5120, 1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_MMUHWT,   13, 1024, 1, 1, 0xfff, 0x0,   0, 0, 0, 0, 1 },
+	{ LLCC_CMPTDMA,  15, 6144, 1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_DISP,     16, 6144, 1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_VIDFW,    17, 1024, 1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_MDMHPFX,  20, 1024, 2, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_MDMPNG,   21, 1024, 0, 1, 0xc,   0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_AUDHW,    22, 1024, 1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_NPU,      23, 6144, 1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_WLHW,     24, 6144, 1, 1, 0xfff, 0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_MODPE,    29, 512,  1, 1, 0xc,   0x0,   0, 0, 0, 1, 0 },
+	{ LLCC_APTCM,    30, 512,  3, 1, 0x0,   0x1,   1, 0, 0, 1, 0 },
+	{ LLCC_WRCACHE,  31, 128,  1, 1, 0xfff, 0x0,   0, 0, 0, 0, 0 },
+};
+
+static const struct llcc_slice_config sc8280xp_data[] = {
+	{ LLCC_CPUSS,    1,  6144, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 1, 0 },
+	{ LLCC_VIDSC0,   2,  512,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_AUDIO,    6,  1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
+	{ LLCC_CMPT,     10, 6144, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
+	{ LLCC_GPUHTW,   11, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_GPU,      12, 4096, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 1 },
+	{ LLCC_MMUHWT,   13, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_DISP,     16, 6144, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_AUDHW,    22, 2048, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_DRE,      26, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_CVP,      28, 512,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_APTCM,    30, 1024, 3, 1, 0x0,   0x1, 1, 0, 0, 1, 0, 0 },
+	{ LLCC_WRCACHE,  31, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_CVPFW,    32, 512,  1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_CPUSS1,   33, 2048, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_CPUHWT,   36, 512,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+};
+
 static const struct llcc_slice_config sdm845_data[] =  {
 	{ LLCC_CPUSS,    1,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 1 },
 	{ LLCC_VIDSC0,   2,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0 },
@@ -276,6 +320,20 @@ static const struct qcom_llcc_config sc7280_cfg = {
 	.reg_offset	= llcc_v1_2_reg_offset,
 };
 
+static const struct qcom_llcc_config sc8180x_cfg = {
+	.sct_data	= sc8180x_data,
+	.size		= ARRAY_SIZE(sc8180x_data),
+	.need_llcc_cfg	= true,
+	.reg_offset	= llcc_v1_2_reg_offset,
+};
+
+static const struct qcom_llcc_config sc8280xp_cfg = {
+	.sct_data	= sc8280xp_data,
+	.size		= ARRAY_SIZE(sc8280xp_data),
+	.need_llcc_cfg	= true,
+	.reg_offset	= llcc_v1_2_reg_offset,
+};
+
 static const struct qcom_llcc_config sdm845_cfg = {
 	.sct_data	= sdm845_data,
 	.size		= ARRAY_SIZE(sdm845_data),
@@ -741,6 +799,8 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfg },
 	{ .compatible = "qcom,sc7280-llcc", .data = &sc7280_cfg },
+	{ .compatible = "qcom,sc8180x-llcc", .data = &sc8180x_cfg },
+	{ .compatible = "qcom,sc8280xp-llcc", .data = &sc8280xp_cfg },
 	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
 	{ .compatible = "qcom,sm6350-llcc", .data = &sm6350_cfg },
 	{ .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfg },
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 0bc21ee58fac..9ed5384c5ca1 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -29,6 +29,8 @@
 #define LLCC_AUDHW       22
 #define LLCC_NPU         23
 #define LLCC_WLHW        24
+#define LLCC_PIMEM       25
+#define LLCC_DRE         26
 #define LLCC_CVP         28
 #define LLCC_MODPE       29
 #define LLCC_APTCM       30
-- 
2.35.1

