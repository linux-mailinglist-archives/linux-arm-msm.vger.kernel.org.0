Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0AC96828B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 10:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjAaJYi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 04:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbjAaJYh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 04:24:37 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EE140DF
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 01:24:36 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id y11so13759172edd.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYcNGVRGbKvF1Kz2a8/niRAnUQJ33SC+hNf9Bt1i/nk=;
        b=A4+selVb+SU8uj4VbWW/KF+30EVjg1kP+jxLrA+k4od8Oza/oykPDWeKVuVfOJ8pGS
         qGoOLfMHnOJvE+uwQuoIIm5PaJ5u4gSgyuRpxCYpV7i+V9PFa4dwYK9JdMWQh85h11vg
         I3M+sUVE0FuD9Ql5PYlw/zwjQ6DhAJyk5ir9yPd0B0JDvNbAdrnR9EHg8/CqpbEV6NEK
         E1yHRovnPVFjEFEY7VHaDsBU+VcxrMBSm2QaDuR0IrZZ0lZI21vgNGSfq0hauA9YQHW1
         H8arwih30vcRqdEv4/7xGLxAW1mjAa6qFZPDhc7fzMAUILI06FejJbq59rQgHJrPxcPa
         Qkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYcNGVRGbKvF1Kz2a8/niRAnUQJ33SC+hNf9Bt1i/nk=;
        b=qus/8hYA5irJUHdJXkEsMS3eI8MKcH7FUFfWfYdufH5/2U6sdIWPYSYwAEgLgFhEIH
         1rzc1SiS17JB9ooxzcZzgrSD9pGg+MF3K7WNuts/3WyporiBtbdxO6QxAuy5z/9Laujc
         cjQzh1VHCIIm503rhtAXn+bCSAVz4vLt1D4WtXaIkuIXrFmqIZjrrVCj7Rsov3uzjoHl
         fk/JpcZPcbYyhQENLSYlVTwCifHCUF/NGtdOGGiHHGHtHI4eqSQyo2MZ6inHWUYe0Ls8
         +ZfkE+L0fkhM3FQ6S9MqbwEPuUfn4Km3mUZ7DtYCO8b/FFEplhMCvKoTV/1K1iCKF9r6
         c7aw==
X-Gm-Message-State: AO0yUKVtJu4tFSGq+gaqaUEyUo/ZrTuzXyw5LsNb9wV7LA21fw1nrMfP
        DA1/Tq0nz+3VSSaGFgs3U+aDr1cdYVxAMM12+ho=
X-Google-Smtp-Source: AK7set9y6lTD51mLZcUsXx1buhsZhQcxfYD32N+QZR9bUJynZR0UQBhQeAD1CoyNEvUVdY8FPCKrDQ==
X-Received: by 2002:a05:6402:6d4:b0:4a1:2ed2:7822 with SMTP id n20-20020a05640206d400b004a12ed27822mr2383236edy.5.1675157075383;
        Tue, 31 Jan 2023 01:24:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id rh16-20020a17090720f000b0084c7029b24dsm8205198ejb.151.2023.01.31.01.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 01:24:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
Date:   Tue, 31 Jan 2023 11:24:32 +0200
Message-Id: <20230131092432.122711-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230131092432.122711-1-dmitry.baryshkov@linaro.org>
References: <20230131092432.122711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The gdsc_init() function will rewrite the CLK_DIS_WAIT field while
registering the GDSC (writing the value 0x2 by default). This will
override the setting done in the driver's probe function.

Set cx_gdsc.clk_dis_wait_val to 8 to follow the intention of the probe
function.

Fixes: 453361cdd757 ("clk: qcom: Add graphics clock controller driver for SDM845")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm845.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 622a54a67d32..c51feb556f41 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -22,8 +22,6 @@
 #define CX_GMU_CBCR_SLEEP_SHIFT		4
 #define CX_GMU_CBCR_WAKE_MASK		0xf
 #define CX_GMU_CBCR_WAKE_SHIFT		8
-#define CLK_DIS_WAIT_SHIFT		12
-#define CLK_DIS_WAIT_MASK		(0xf << CLK_DIS_WAIT_SHIFT)
 
 enum {
 	P_BI_TCXO,
@@ -121,6 +119,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.clk_dis_wait = 0x8,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -193,10 +192,6 @@ static int gpu_cc_sdm845_probe(struct platform_device *pdev)
 	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	/* Configure clk_dis_wait for gpu_cx_gdsc */
-	regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
-						8 << CLK_DIS_WAIT_SHIFT);
-
 	return qcom_cc_really_probe(pdev, &gpu_cc_sdm845_desc, regmap);
 }
 
-- 
2.39.0

