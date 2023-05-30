Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50FD715FA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 14:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjE3Mbv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 08:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbjE3Mba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 08:31:30 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E4B1B6
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:31:08 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so5023288e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449847; x=1688041847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X2YmPxQFhKCq03fcQ2JuiF4fVCtctwggowl35Zs1sw=;
        b=ca7h0aksE6lqaLTt5whA5LVMO73Bk/YrNfB1jvw8kSNKoz1jpQdCuxhJYXLsrm7MeI
         xUYIzUzUzmx+3YFLRFLgeufLPCXdFc5VtrVsoJ8hiPV7BJq1Bopei/WX3i6GfJH/ABrv
         nrjuFMK7hjo4gi/z5deVlB+B0KtkUzKXmhreAYc/sCpv8W6gnyFh9GNXMtoZ+At61SU5
         aW3oYNclpB9gr+YFXsctJ1O5dOGiPXC1vHiCJ54KSxbSVzLvGm7TaZnkyrQo++52Zw+s
         F4mIRjw0uzpI4UibVzoq75I5tURDnwucGlu2Ezr0T36ZrXzEqnqj/wxxs7kJXko5rqnF
         1dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449847; x=1688041847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7X2YmPxQFhKCq03fcQ2JuiF4fVCtctwggowl35Zs1sw=;
        b=Ha37LiD4yRzutdhVfr5/S20ZEPTlzZQr/DBQQPAEvPwXbBvooE7M075MrbbWIwRN2I
         152dWS+BhXgqfb3K1NPJ2u+8KGKVF52U/ZzHCEj6OlT4r8dbjssOgxh24XnPlF63hqko
         NEIZKIHVwsvKXRNm1knFPWuCoWd0o8pMurijDHehHzhAfZrVzcyu8xVkXfCL516kniPE
         bPqqx/zr3DAi3zW3M/Yi5DkaXD66QpYmGHs7WFL3lOTt94RQsFKBC565b0o33uFCgNq6
         YTOdnV35VZb/H3ZBa2bikyab0YNjIOfUBpwljtWGD9NdCvTAyOWbMZQrdDIXH1V3ayZM
         VljA==
X-Gm-Message-State: AC+VfDwEoyRcSFyhvRIvB1dPq/zOya0HifHANrY/8OCRK9k/2J560IOs
        Hl//FfZ76mOyaGxdMobDkXijIA==
X-Google-Smtp-Source: ACHHUZ6sug8Jb6T0DVsEM2OIlTBPSQWVfDfYgOBvujKQ2Sa9PpU+updIylMFCueoeDmfNp6e4m+ApA==
X-Received: by 2002:a2e:b349:0:b0:2ad:dab5:fe8e with SMTP id q9-20020a2eb349000000b002addab5fe8emr696149lja.47.1685449847537;
        Tue, 30 May 2023 05:30:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id u18-20020a2e91d2000000b002a8b8baf542sm2854814ljg.126.2023.05.30.05.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:30:47 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 14:30:40 +0200
Subject: [PATCH v4 06/17] media: venus: hfi_venus: Sanitize
 venus_boot_core() per-VPU-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v4-6-feebb2f6e9b8@linaro.org>
References: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
In-Reply-To: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685449837; l=1704;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=GIwAiWH9yip6A08qldobhtvjYZiRCRgkhQUH81kLo/0=;
 b=s4cSpf3PKrrmU9HsxpFz4ai3ElIyaSW/PvhbmUBdDBGfPGPk4wENmhxardXBtfi7UUOAfLG/E
 XAqhvTs6Pr0DBJz2jDcl7ivTQCp+eqfrQNCjVACGxBjeLc3F+289R//
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current assumption of IS_V6 is overgeneralized. Adjust the logic
to take the VPU hardware version into account.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 5506a0d196ef..9e36ef9076a0 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -447,19 +447,20 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 {
 	struct device *dev = hdev->core->dev;
 	static const unsigned int max_tries = 100;
-	u32 ctrl_status = 0, mask_val;
+	u32 ctrl_status = 0, mask_val = 0;
 	unsigned int count = 0;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	int ret = 0;
 
-	if (IS_V6(hdev->core)) {
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
 		mask_val = readl(wrapper_base + WRAPPER_INTR_MASK);
 		mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BASK_V6 |
 			      WRAPPER_INTR_MASK_A2HCPU_MASK);
 	} else {
 		mask_val = WRAPPER_INTR_MASK_A2HVCODEC_MASK;
 	}
+
 	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
 	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
 
@@ -479,7 +480,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
-	if (IS_V6(hdev->core)) {
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
 		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
 		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
 	}

-- 
2.40.1

