Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F19D6F6684
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 10:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjEDIBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 04:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjEDIBd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 04:01:33 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4732728
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 01:01:30 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ac733b813fso2053361fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683187289; x=1685779289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wx5dYQRwBkTI+vIENabmZFidu+UG6bsoT2w/E9azkMk=;
        b=Ms5+Av3job8E1NirdFNKWCSJStO92kIfaxqw+VlDjqCaZhN/Efha3zMGCWN79gHpm6
         AYoNhZnRWQ9mpboNWew9+7ajEw1d4K/Xe6khT7s1u3m7cb81rm8QRb1qyBClKM4Bwdvk
         XF1fy4+eiM9SKrtyWY7+hv1TyqVZhuSlHj7dsbVOcvP62ynjzhKFPx48lhLRjMvjiArs
         PM3nsodeZfLfyymZbj+LVVubsodwoxVLtg/5F2SC9T4T7WA2AP7NdrmgNRgFB+1Sc2zG
         p1GH22purCn1XKxIjU8l01PR8N/5xVG6bmsVO8uLsN0D/11cQ/5JBPi4rUk2bQePDbFp
         v9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683187289; x=1685779289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wx5dYQRwBkTI+vIENabmZFidu+UG6bsoT2w/E9azkMk=;
        b=KcrVXrr8g0MaPwOaS/rumpdHluG+uAGV3dyOPyiWiABTNivlAv+9IaMU9m/Stwe1Wd
         5fU/9MpqtWghOej9LjRWADl7kubaZR0whODwDDQ5ECD7LdhUi73N4LkZ+GqrqsDOdPCC
         4nsqHgV/Ublz4kGbwpZMvNBGrvnlofswDO0+p/o0PP4wcB8N/rZTM5NMGI7JK+rHREAE
         fwOZJIwZQhBJr84d4tZI+VvFMcNimAPgj2o4oY29WN14XZI7Id/hXn7Zv+v4x1czDOSY
         JfH9OLKyGr0nG4s0GLBGc8x1FvtKyr6c7IAYRF6l+NHv2Es8YioHIEOfCyKlB9sKr+M3
         Focw==
X-Gm-Message-State: AC+VfDwiXwQ3z9MnHpie5t0sVFzVMWrkYPn88ysL4v1QMT6EXG8HRn5l
        zSnCisXpKPU2gruVV4qIQryIow==
X-Google-Smtp-Source: ACHHUZ6CyMNlAZTEzik9cGKDzfRA1RlhDbXEVY0QlyDTBymjy/GmJD7hBMdMn0kMtxJXRttKUIbCgw==
X-Received: by 2002:ac2:5237:0:b0:4ef:d573:c8a7 with SMTP id i23-20020ac25237000000b004efd573c8a7mr1613614lfl.32.1683187289004;
        Thu, 04 May 2023 01:01:29 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n26-20020ac2491a000000b004edc512515fsm917165lfi.47.2023.05.04.01.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:01:28 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 04 May 2023 10:00:58 +0200
Subject: [PATCH v2 02/18] media: venus: hfi_venus: Write to VIDC_CTRL_INIT
 after unmasking interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v2-2-d95d14949c79@linaro.org>
References: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
In-Reply-To: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
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
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683187284; l=1480;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0Uv5fE0exjmqzKoKkMe6XjqGKp8vRm4Af+NoaiadWoA=;
 b=p8XdYya25TcMY0FfaMTCVG6sx7I3fHtL6U+tbVXguByuFj0SbJNHB2/NIZMhEKfLrj5xnCFBx
 cYuHLgF7x4LD9tjzFro39MJA/tVrZd6hjnrRRYtXA4l4c3Km44/4ybo
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The downstream driver signals the hardware to be enabled only after the
interrupts are unmasked, which... makes sense. Follow suit.

Cc: stable@vger.kernel.org # v4.12+
Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bff435abd59b..8fc8f46dc390 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -453,7 +453,6 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	int ret = 0;
 
-	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
 	if (IS_V6(hdev->core)) {
 		mask_val = readl(wrapper_base + WRAPPER_INTR_MASK);
 		mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BASK_V6 |
@@ -464,6 +463,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
 	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
 
+	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(cpu_cs_base + CPU_CS_SCIACMDARG0);
 		if ((ctrl_status & CPU_CS_SCIACMDARG0_ERROR_STATUS_MASK) == 4) {

-- 
2.40.1

