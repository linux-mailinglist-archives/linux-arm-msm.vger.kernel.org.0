Return-Path: <linux-arm-msm+bounces-2569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62587FDFDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 19:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 108C81C20B7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 18:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7DF5DF0D;
	Wed, 29 Nov 2023 18:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qutbMOhJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8730E170E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 10:59:40 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a03a900956dso17939766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701284379; x=1701889179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlDUepmJECDPJhuprnqUu3VqOzP0g1ylAOO9+Ec40Fc=;
        b=qutbMOhJVBo1eaAK6wX5JXfMQchq6V5+TTrZIjuBrnvvemi4hSKfJPzrxiRDIe/nQ/
         TjfD1FwQz/fRQzMRaXeilla1ql+wJPFC1G16GlQhbkVmYevj9xP/ma1vA0ks0oVbu+Zl
         71jRQBxSDJxFYbULEOR7EgoxFG8kmOajWTDf5d6JaNyyJvPizr+qokV/8BiU9J5IES7/
         AlVGgven+RzlrORc9SpKGaNz5SO2SmNDRn7rgtrMqa5nvizkmxkiQVYXIv+3wSFxkGLg
         LxsINhfkB7OJ1kXkRT2vPsmVcRG2VuZIQDwNRz3eIBYqoPx0ZNtO8N4lvYYiyz4FuLfc
         0UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284379; x=1701889179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlDUepmJECDPJhuprnqUu3VqOzP0g1ylAOO9+Ec40Fc=;
        b=pUN6W4+tCH/MwF/rmPnUuJX6SLC2hIkM74vhR01etwHUQVfy/FmckcVDf2nCJDk9YS
         Z1NnrPtK1eTjCl6/3EN+XEkCZmMYc+nVnGAQ4ccVFYXzEtcTYtqKK5RvfI0RwMeSVwnd
         UOuuhRp0cnjEm78NJ2tzuak3GBRVS2skE749G4NZiwpRkto8OcfrBlkWV/gYYh3WDVze
         uuCHYKChGbbVGNtHZykuhS2lfZOnW4GGjwY5EX/8ZVnHT5YbqiSwLazmLIz4eapiSIgS
         9tOze81X+qqmjfdhxvg/041SbsjTN4BkdyeLCIiogYKVbsM/HN/ux97+rtNsaHck52do
         gWFA==
X-Gm-Message-State: AOJu0Yy44Ye5/6DK3zoFeI2MRbg1q+ZeBBIqCqYOUMOMF1gePtDWl3zi
	UZ4p3a1C06+qDpM3S/llxJqbgw==
X-Google-Smtp-Source: AGHT+IGrFuuirgbflWVWu41OzF03NDDuEMuQXDJ+cEw++BBXMgKEaWD9G1+yl9mYtK5v0zFbHw9X8A==
X-Received: by 2002:a17:906:f811:b0:a0f:1882:d5e with SMTP id kh17-20020a170906f81100b00a0f18820d5emr7816584ejb.37.1701284379041;
        Wed, 29 Nov 2023 10:59:39 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709061d4b00b009faca59cf38sm8160232ejh.182.2023.11.29.10.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:59:38 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 19:59:25 +0100
Subject: [PATCH v2 06/15] clk: qcom: gpucc-sm6115: Unregister critical
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v2-6-2a583460ef26@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701284367; l=2946;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=L0PymLuHyWV4Yhgl+FgHBcte5FGcWRmHBmwI88u/f0w=;
 b=tqlg8aYXsgxwZazuI492ThhgAeDgh5mPmkZVU+QiLkmD1qTdon0KEaQ7oZzqoxLNuw50o/X6i
 zcYQaJCO5OMAcCUkT3+H7u0oCnQ/FZU/be3nz+a4AtyNjAlX/a0G6A5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some clocks need to be always-on, but we don't really do anything
with them, other than calling enable() once and telling Linux they're
enabled.

Unregister them to save a couple of bytes and, perhaps more
importantly, allow for runtime suspend of the clock controller device,
as CLK_IS_CRITICAL prevents the latter.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-sm6115.c | 33 +++------------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
index fb71c21c9a89..93a50431aef8 100644
--- a/drivers/clk/qcom/gpucc-sm6115.c
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -234,20 +234,6 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	},
 };
 
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.halt_reg = 0x107c,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -336,20 +322,6 @@ static struct clk_branch gpu_cc_cxo_clk = {
 	},
 };
 
-static struct clk_branch gpu_cc_gx_cxo_clk = {
-	.halt_reg = 0x1060,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1060,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_gx_cxo_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_gx_gfx3d_clk = {
 	.halt_reg = 0x1054,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -418,7 +390,6 @@ static struct gdsc gpu_gx_gdsc = {
 };
 
 static struct clk_regmap *gpu_cc_sm6115_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
@@ -426,7 +397,6 @@ static struct clk_regmap *gpu_cc_sm6115_clocks[] = {
 	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
 	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
 	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
-	[GPU_CC_GX_CXO_CLK] = &gpu_cc_gx_cxo_clk.clkr,
 	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
 	[GPU_CC_GX_GFX3D_CLK_SRC] = &gpu_cc_gx_gfx3d_clk_src.clkr,
 	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
@@ -488,6 +458,9 @@ static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 	qcom_branch_set_force_mem_core(regmap, gpu_cc_gx_gfx3d_clk, true);
 	qcom_branch_set_force_periph_on(regmap, gpu_cc_gx_gfx3d_clk, true);
 
+	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x1060); /* GPU_CC_GX_CXO_CLK */
+
 	return qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
 }
 

-- 
2.43.0


