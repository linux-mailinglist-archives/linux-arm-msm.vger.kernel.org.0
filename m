Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C97CC7010EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 23:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240326AbjELVSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 17:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240417AbjELVSI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 17:18:08 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1965B61B4
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:17:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f11d267d8bso11692313e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683926253; x=1686518253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syiDzOsg6XJ4uXn4QKeAjfrg2I2yS6EiIwWVe3QYC4w=;
        b=DfJ5S5ceTi7oPQlB7mZgaNUdPnoyHIQVNfkztLUDT+85YTmQDS9uv8Nw6OzftPw6ex
         axgGerrw1in3MFAIGDSSAf3bSFSvWG8Ljof1Gs6cLtEyr6LXXtyS5n/kzZnkjcOoNg18
         CjAzrEo6SWcKbZO6Tp7mzTx2fcwiH5S6mno+dYvvUK0Fc/+NrMIdxGrF83qusJWULDWJ
         0algqOXpebvxkt/pgTl93zEUD3VS+hjJnTNwdlQJqS1bQ9tvcvBVDOAYxok5FbVHK+PC
         2n4UM+nPEax0BM8j7u60si2fz4IV5ZXWjQ5HkGBF3F1qITJmMxjhBrrqynWxnbKpwTYm
         7/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683926253; x=1686518253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syiDzOsg6XJ4uXn4QKeAjfrg2I2yS6EiIwWVe3QYC4w=;
        b=B1SC4RPx9/qekj9CcgPzgoapGoNnUUDfXWbdfK7SIr9okHkjETZRTpnuwI7cH98LSp
         fcZd3ZSRdiHC5khkxryicaZCsGypcADOb1rNKQNiI4xsuQZe1vr37PXhN+9cyAaGmxSx
         znNqk+ZSr5T8Rq7sA/oJ6V51yQV0reKcUWWE0qWl9uOHlb/In1J9nnOI1PTLybsbLfwa
         TxEZXpgIr+F+3eJfeuvTs/N02sslxi/SRRxEPtoIy05QCUFL0SU0j4nsBW66UE+sPw5t
         /vGnVXrLFq0xdNGW0MKV7ckb5phKnToPQckYqJ09BLf3wwL++SwAI0HyBMMU2ZpnrL8N
         i2kw==
X-Gm-Message-State: AC+VfDyRdVHvtkLRlAJ7VUgk1I8up/8pAJsOOjt/zX4Dmg9ksvbcl2+m
        8Itvoi3Zd7wZA0vtBs1ZDkZ7gQ==
X-Google-Smtp-Source: ACHHUZ5+twwR+D+moPybDSGPRlR068A+WUkERVv/70oJILlrizt0o+StmA4U5UyFeyzoywzXYdRvQg==
X-Received: by 2002:ac2:4255:0:b0:4f1:2ebf:5370 with SMTP id m21-20020ac24255000000b004f12ebf5370mr3806218lfl.23.1683926253000;
        Fri, 12 May 2023 14:17:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w4-20020ac254a4000000b004edafe3f8dbsm1590363lfk.11.2023.05.12.14.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:17:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 05/10] clk: qcom: drop lcc-mdm9615 in favour of lcc-msm8960
Date:   Sat, 13 May 2023 00:17:22 +0300
Message-Id: <20230512211727.3445575-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The two LCC drivers, msm8960 and mdm9615 are almost the same. The only
difference is the platform clock: msm8960/apq8064 use pxo, while mdm9615
uses cxo. Drop the lcc-mdm9615 in favour of using lcc-msm8960 instead.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/Kconfig       |  14 +-
 drivers/clk/qcom/Makefile      |   1 -
 drivers/clk/qcom/lcc-mdm9615.c | 572 ---------------------------------
 drivers/clk/qcom/lcc-msm8960.c |  19 +-
 4 files changed, 18 insertions(+), 588 deletions(-)
 delete mode 100644 drivers/clk/qcom/lcc-mdm9615.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 12be3e2371b3..72ee4d46aa81 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -238,10 +238,10 @@ config MSM_GCC_8960
 	  i2c, USB, SD/eMMC, SATA, PCIe, etc.
 
 config MSM_LCC_8960
-	tristate "APQ8064/MSM8960 LPASS Clock Controller"
-	select MSM_GCC_8960
+	tristate "APQ8064/MSM8960/MDM9650 LPASS Clock Controller"
 	help
-	  Support for the LPASS clock controller on apq8064/msm8960 devices.
+	  Support for the LPASS clock controller on apq8064/msm8960/mdm9650
+	  devices.
 	  Say Y if you want to use audio devices such as i2s, pcm,
 	  SLIMBus, etc.
 
@@ -259,14 +259,6 @@ config MDM_GCC_9615
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  i2c, USB, SD/eMMC, etc.
 
-config MDM_LCC_9615
-	tristate "MDM9615 LPASS Clock Controller"
-	select MDM_GCC_9615
-	help
-	  Support for the LPASS clock controller on mdm9615 devices.
-	  Say Y if you want to use audio devices such as i2s, pcm,
-	  SLIMBus, etc.
-
 config MSM_MMCC_8960
 	tristate "MSM8960 Multimedia Clock Controller"
 	select MSM_GCC_8960
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9ff4c373ad95..13bd35f17a61 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -32,7 +32,6 @@ obj-$(CONFIG_IPQ_GCC_9574) += gcc-ipq9574.o
 obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
 obj-$(CONFIG_MDM_GCC_9607) += gcc-mdm9607.o
 obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
-obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
 obj-$(CONFIG_MSM_GCC_8660) += gcc-msm8660.o
 obj-$(CONFIG_MSM_GCC_8909) += gcc-msm8909.o
 obj-$(CONFIG_MSM_GCC_8916) += gcc-msm8916.o
diff --git a/drivers/clk/qcom/lcc-mdm9615.c b/drivers/clk/qcom/lcc-mdm9615.c
deleted file mode 100644
index c17caffdc349..000000000000
--- a/drivers/clk/qcom/lcc-mdm9615.c
+++ /dev/null
@@ -1,572 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2014, The Linux Foundation. All rights reserved.
- * Copyright (c) BayLibre, SAS.
- * Author : Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/bitops.h>
-#include <linux/err.h>
-#include <linux/platform_device.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/clk-provider.h>
-#include <linux/regmap.h>
-
-#include <dt-bindings/clock/qcom,lcc-msm8960.h>
-
-#include "common.h"
-#include "clk-regmap.h"
-#include "clk-pll.h"
-#include "clk-rcg.h"
-#include "clk-branch.h"
-#include "clk-regmap-divider.h"
-#include "clk-regmap-mux.h"
-
-static struct clk_pll pll4 = {
-	.l_reg = 0x4,
-	.m_reg = 0x8,
-	.n_reg = 0xc,
-	.config_reg = 0x14,
-	.mode_reg = 0x0,
-	.status_reg = 0x18,
-	.status_bit = 16,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "pll4",
-		.parent_names = (const char *[]){ "cxo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-enum {
-	P_CXO,
-	P_PLL4,
-};
-
-static const struct parent_map lcc_cxo_pll4_map[] = {
-	{ P_CXO, 0 },
-	{ P_PLL4, 2 }
-};
-
-static const char * const lcc_cxo_pll4[] = {
-	"cxo",
-	"pll4_vote",
-};
-
-static struct freq_tbl clk_tbl_aif_osr_492[] = {
-	{   512000, P_PLL4, 4, 1, 240 },
-	{   768000, P_PLL4, 4, 1, 160 },
-	{  1024000, P_PLL4, 4, 1, 120 },
-	{  1536000, P_PLL4, 4, 1,  80 },
-	{  2048000, P_PLL4, 4, 1,  60 },
-	{  3072000, P_PLL4, 4, 1,  40 },
-	{  4096000, P_PLL4, 4, 1,  30 },
-	{  6144000, P_PLL4, 4, 1,  20 },
-	{  8192000, P_PLL4, 4, 1,  15 },
-	{ 12288000, P_PLL4, 4, 1,  10 },
-	{ 24576000, P_PLL4, 4, 1,   5 },
-	{ 27000000, P_CXO,  1, 0,   0 },
-	{ }
-};
-
-static struct freq_tbl clk_tbl_aif_osr_393[] = {
-	{   512000, P_PLL4, 4, 1, 192 },
-	{   768000, P_PLL4, 4, 1, 128 },
-	{  1024000, P_PLL4, 4, 1,  96 },
-	{  1536000, P_PLL4, 4, 1,  64 },
-	{  2048000, P_PLL4, 4, 1,  48 },
-	{  3072000, P_PLL4, 4, 1,  32 },
-	{  4096000, P_PLL4, 4, 1,  24 },
-	{  6144000, P_PLL4, 4, 1,  16 },
-	{  8192000, P_PLL4, 4, 1,  12 },
-	{ 12288000, P_PLL4, 4, 1,   8 },
-	{ 24576000, P_PLL4, 4, 1,   4 },
-	{ 27000000, P_CXO,  1, 0,   0 },
-	{ }
-};
-
-static struct clk_rcg mi2s_osr_src = {
-	.ns_reg = 0x48,
-	.md_reg = 0x4c,
-	.mn = {
-		.mnctr_en_bit = 8,
-		.mnctr_reset_bit = 7,
-		.mnctr_mode_shift = 5,
-		.n_val_shift = 24,
-		.m_val_shift = 8,
-		.width = 8,
-	},
-	.p = {
-		.pre_div_shift = 3,
-		.pre_div_width = 2,
-	},
-	.s = {
-		.src_sel_shift = 0,
-		.parent_map = lcc_cxo_pll4_map,
-	},
-	.freq_tbl = clk_tbl_aif_osr_393,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(9),
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_osr_src",
-			.parent_names = lcc_cxo_pll4,
-			.num_parents = 2,
-			.ops = &clk_rcg_ops,
-			.flags = CLK_SET_RATE_GATE,
-		},
-	},
-};
-
-static const char * const lcc_mi2s_parents[] = {
-	"mi2s_osr_src",
-};
-
-static struct clk_branch mi2s_osr_clk = {
-	.halt_reg = 0x50,
-	.halt_bit = 1,
-	.halt_check = BRANCH_HALT_ENABLE,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(17),
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_osr_clk",
-			.parent_names = lcc_mi2s_parents,
-			.num_parents = 1,
-			.ops = &clk_branch_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-static struct clk_regmap_div mi2s_div_clk = {
-	.reg = 0x48,
-	.shift = 10,
-	.width = 4,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(15),
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_div_clk",
-			.parent_names = lcc_mi2s_parents,
-			.num_parents = 1,
-			.ops = &clk_regmap_div_ops,
-		},
-	},
-};
-
-static struct clk_branch mi2s_bit_div_clk = {
-	.halt_reg = 0x50,
-	.halt_bit = 0,
-	.halt_check = BRANCH_HALT_ENABLE,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(15),
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_bit_div_clk",
-			.parent_names = (const char *[]){ "mi2s_div_clk" },
-			.num_parents = 1,
-			.ops = &clk_branch_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-static struct clk_regmap_mux mi2s_bit_clk = {
-	.reg = 0x48,
-	.shift = 14,
-	.width = 1,
-	.clkr = {
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_bit_clk",
-			.parent_names = (const char *[]){
-				"mi2s_bit_div_clk",
-				"mi2s_codec_clk",
-			},
-			.num_parents = 2,
-			.ops = &clk_regmap_mux_closest_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-#define CLK_AIF_OSR_DIV(prefix, _ns, _md, hr)			\
-static struct clk_rcg prefix##_osr_src = {			\
-	.ns_reg = _ns,						\
-	.md_reg = _md,						\
-	.mn = {							\
-		.mnctr_en_bit = 8,				\
-		.mnctr_reset_bit = 7,				\
-		.mnctr_mode_shift = 5,				\
-		.n_val_shift = 24,				\
-		.m_val_shift = 8,				\
-		.width = 8,					\
-	},							\
-	.p = {							\
-		.pre_div_shift = 3,				\
-		.pre_div_width = 2,				\
-	},							\
-	.s = {							\
-		.src_sel_shift = 0,				\
-		.parent_map = lcc_cxo_pll4_map,			\
-	},							\
-	.freq_tbl = clk_tbl_aif_osr_393,			\
-	.clkr = {						\
-		.enable_reg = _ns,				\
-		.enable_mask = BIT(9),				\
-		.hw.init = &(struct clk_init_data){		\
-			.name = #prefix "_osr_src",		\
-			.parent_names = lcc_cxo_pll4,		\
-			.num_parents = 2,			\
-			.ops = &clk_rcg_ops,			\
-			.flags = CLK_SET_RATE_GATE,		\
-		},						\
-	},							\
-};								\
-								\
-static const char * const lcc_##prefix##_parents[] = {		\
-	#prefix "_osr_src",					\
-};								\
-								\
-static struct clk_branch prefix##_osr_clk = {			\
-	.halt_reg = hr,						\
-	.halt_bit = 1,						\
-	.halt_check = BRANCH_HALT_ENABLE,			\
-	.clkr = {						\
-		.enable_reg = _ns,				\
-		.enable_mask = BIT(21),				\
-		.hw.init = &(struct clk_init_data){		\
-			.name = #prefix "_osr_clk",		\
-			.parent_names = lcc_##prefix##_parents,	\
-			.num_parents = 1,			\
-			.ops = &clk_branch_ops,			\
-			.flags = CLK_SET_RATE_PARENT,		\
-		},						\
-	},							\
-};								\
-								\
-static struct clk_regmap_div prefix##_div_clk = {		\
-	.reg = _ns,						\
-	.shift = 10,						\
-	.width = 8,						\
-	.clkr = {						\
-		.hw.init = &(struct clk_init_data){		\
-			.name = #prefix "_div_clk",		\
-			.parent_names = lcc_##prefix##_parents,	\
-			.num_parents = 1,			\
-			.ops = &clk_regmap_div_ops,		\
-		},						\
-	},							\
-};								\
-								\
-static struct clk_branch prefix##_bit_div_clk = {		\
-	.halt_reg = hr,						\
-	.halt_bit = 0,						\
-	.halt_check = BRANCH_HALT_ENABLE,			\
-	.clkr = {						\
-		.enable_reg = _ns,				\
-		.enable_mask = BIT(19),				\
-		.hw.init = &(struct clk_init_data){		\
-			.name = #prefix "_bit_div_clk",		\
-			.parent_names = (const char *[]){	\
-				#prefix "_div_clk"		\
-			},					\
-			.num_parents = 1,			\
-			.ops = &clk_branch_ops,			\
-			.flags = CLK_SET_RATE_PARENT,		\
-		},						\
-	},							\
-};								\
-								\
-static struct clk_regmap_mux prefix##_bit_clk = {		\
-	.reg = _ns,						\
-	.shift = 18,						\
-	.width = 1,						\
-	.clkr = {						\
-		.hw.init = &(struct clk_init_data){		\
-			.name = #prefix "_bit_clk",		\
-			.parent_names = (const char *[]){	\
-				#prefix "_bit_div_clk",		\
-				#prefix "_codec_clk",		\
-			},					\
-			.num_parents = 2,			\
-			.ops = &clk_regmap_mux_closest_ops,	\
-			.flags = CLK_SET_RATE_PARENT,		\
-		},						\
-	},							\
-}
-
-CLK_AIF_OSR_DIV(codec_i2s_mic, 0x60, 0x64, 0x68);
-CLK_AIF_OSR_DIV(spare_i2s_mic, 0x78, 0x7c, 0x80);
-CLK_AIF_OSR_DIV(codec_i2s_spkr, 0x6c, 0x70, 0x74);
-CLK_AIF_OSR_DIV(spare_i2s_spkr, 0x84, 0x88, 0x8c);
-
-static struct freq_tbl clk_tbl_pcm_492[] = {
-	{   256000, P_PLL4, 4, 1, 480 },
-	{   512000, P_PLL4, 4, 1, 240 },
-	{   768000, P_PLL4, 4, 1, 160 },
-	{  1024000, P_PLL4, 4, 1, 120 },
-	{  1536000, P_PLL4, 4, 1,  80 },
-	{  2048000, P_PLL4, 4, 1,  60 },
-	{  3072000, P_PLL4, 4, 1,  40 },
-	{  4096000, P_PLL4, 4, 1,  30 },
-	{  6144000, P_PLL4, 4, 1,  20 },
-	{  8192000, P_PLL4, 4, 1,  15 },
-	{ 12288000, P_PLL4, 4, 1,  10 },
-	{ 24576000, P_PLL4, 4, 1,   5 },
-	{ 27000000, P_CXO,  1, 0,   0 },
-	{ }
-};
-
-static struct freq_tbl clk_tbl_pcm_393[] = {
-	{   256000, P_PLL4, 4, 1, 384 },
-	{   512000, P_PLL4, 4, 1, 192 },
-	{   768000, P_PLL4, 4, 1, 128 },
-	{  1024000, P_PLL4, 4, 1,  96 },
-	{  1536000, P_PLL4, 4, 1,  64 },
-	{  2048000, P_PLL4, 4, 1,  48 },
-	{  3072000, P_PLL4, 4, 1,  32 },
-	{  4096000, P_PLL4, 4, 1,  24 },
-	{  6144000, P_PLL4, 4, 1,  16 },
-	{  8192000, P_PLL4, 4, 1,  12 },
-	{ 12288000, P_PLL4, 4, 1,   8 },
-	{ 24576000, P_PLL4, 4, 1,   4 },
-	{ 27000000, P_CXO,  1, 0,   0 },
-	{ }
-};
-
-static struct clk_rcg pcm_src = {
-	.ns_reg = 0x54,
-	.md_reg = 0x58,
-	.mn = {
-		.mnctr_en_bit = 8,
-		.mnctr_reset_bit = 7,
-		.mnctr_mode_shift = 5,
-		.n_val_shift = 16,
-		.m_val_shift = 16,
-		.width = 16,
-	},
-	.p = {
-		.pre_div_shift = 3,
-		.pre_div_width = 2,
-	},
-	.s = {
-		.src_sel_shift = 0,
-		.parent_map = lcc_cxo_pll4_map,
-	},
-	.freq_tbl = clk_tbl_pcm_393,
-	.clkr = {
-		.enable_reg = 0x54,
-		.enable_mask = BIT(9),
-		.hw.init = &(struct clk_init_data){
-			.name = "pcm_src",
-			.parent_names = lcc_cxo_pll4,
-			.num_parents = 2,
-			.ops = &clk_rcg_ops,
-			.flags = CLK_SET_RATE_GATE,
-		},
-	},
-};
-
-static struct clk_branch pcm_clk_out = {
-	.halt_reg = 0x5c,
-	.halt_bit = 0,
-	.halt_check = BRANCH_HALT_ENABLE,
-	.clkr = {
-		.enable_reg = 0x54,
-		.enable_mask = BIT(11),
-		.hw.init = &(struct clk_init_data){
-			.name = "pcm_clk_out",
-			.parent_names = (const char *[]){ "pcm_src" },
-			.num_parents = 1,
-			.ops = &clk_branch_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-static struct clk_regmap_mux pcm_clk = {
-	.reg = 0x54,
-	.shift = 10,
-	.width = 1,
-	.clkr = {
-		.hw.init = &(struct clk_init_data){
-			.name = "pcm_clk",
-			.parent_names = (const char *[]){
-				"pcm_clk_out",
-				"pcm_codec_clk",
-			},
-			.num_parents = 2,
-			.ops = &clk_regmap_mux_closest_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-static struct clk_rcg slimbus_src = {
-	.ns_reg = 0xcc,
-	.md_reg = 0xd0,
-	.mn = {
-		.mnctr_en_bit = 8,
-		.mnctr_reset_bit = 7,
-		.mnctr_mode_shift = 5,
-		.n_val_shift = 24,
-		.m_val_shift = 8,
-		.width = 8,
-	},
-	.p = {
-		.pre_div_shift = 3,
-		.pre_div_width = 2,
-	},
-	.s = {
-		.src_sel_shift = 0,
-		.parent_map = lcc_cxo_pll4_map,
-	},
-	.freq_tbl = clk_tbl_aif_osr_393,
-	.clkr = {
-		.enable_reg = 0xcc,
-		.enable_mask = BIT(9),
-		.hw.init = &(struct clk_init_data){
-			.name = "slimbus_src",
-			.parent_names = lcc_cxo_pll4,
-			.num_parents = 2,
-			.ops = &clk_rcg_ops,
-			.flags = CLK_SET_RATE_GATE,
-		},
-	},
-};
-
-static const char * const lcc_slimbus_parents[] = {
-	"slimbus_src",
-};
-
-static struct clk_branch audio_slimbus_clk = {
-	.halt_reg = 0xd4,
-	.halt_bit = 0,
-	.halt_check = BRANCH_HALT_ENABLE,
-	.clkr = {
-		.enable_reg = 0xcc,
-		.enable_mask = BIT(10),
-		.hw.init = &(struct clk_init_data){
-			.name = "audio_slimbus_clk",
-			.parent_names = lcc_slimbus_parents,
-			.num_parents = 1,
-			.ops = &clk_branch_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-static struct clk_branch sps_slimbus_clk = {
-	.halt_reg = 0xd4,
-	.halt_bit = 1,
-	.halt_check = BRANCH_HALT_ENABLE,
-	.clkr = {
-		.enable_reg = 0xcc,
-		.enable_mask = BIT(12),
-		.hw.init = &(struct clk_init_data){
-			.name = "sps_slimbus_clk",
-			.parent_names = lcc_slimbus_parents,
-			.num_parents = 1,
-			.ops = &clk_branch_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-static struct clk_regmap *lcc_mdm9615_clks[] = {
-	[PLL4] = &pll4.clkr,
-	[MI2S_OSR_SRC] = &mi2s_osr_src.clkr,
-	[MI2S_OSR_CLK] = &mi2s_osr_clk.clkr,
-	[MI2S_DIV_CLK] = &mi2s_div_clk.clkr,
-	[MI2S_BIT_DIV_CLK] = &mi2s_bit_div_clk.clkr,
-	[MI2S_BIT_CLK] = &mi2s_bit_clk.clkr,
-	[PCM_SRC] = &pcm_src.clkr,
-	[PCM_CLK_OUT] = &pcm_clk_out.clkr,
-	[PCM_CLK] = &pcm_clk.clkr,
-	[SLIMBUS_SRC] = &slimbus_src.clkr,
-	[AUDIO_SLIMBUS_CLK] = &audio_slimbus_clk.clkr,
-	[SPS_SLIMBUS_CLK] = &sps_slimbus_clk.clkr,
-	[CODEC_I2S_MIC_OSR_SRC] = &codec_i2s_mic_osr_src.clkr,
-	[CODEC_I2S_MIC_OSR_CLK] = &codec_i2s_mic_osr_clk.clkr,
-	[CODEC_I2S_MIC_DIV_CLK] = &codec_i2s_mic_div_clk.clkr,
-	[CODEC_I2S_MIC_BIT_DIV_CLK] = &codec_i2s_mic_bit_div_clk.clkr,
-	[CODEC_I2S_MIC_BIT_CLK] = &codec_i2s_mic_bit_clk.clkr,
-	[SPARE_I2S_MIC_OSR_SRC] = &spare_i2s_mic_osr_src.clkr,
-	[SPARE_I2S_MIC_OSR_CLK] = &spare_i2s_mic_osr_clk.clkr,
-	[SPARE_I2S_MIC_DIV_CLK] = &spare_i2s_mic_div_clk.clkr,
-	[SPARE_I2S_MIC_BIT_DIV_CLK] = &spare_i2s_mic_bit_div_clk.clkr,
-	[SPARE_I2S_MIC_BIT_CLK] = &spare_i2s_mic_bit_clk.clkr,
-	[CODEC_I2S_SPKR_OSR_SRC] = &codec_i2s_spkr_osr_src.clkr,
-	[CODEC_I2S_SPKR_OSR_CLK] = &codec_i2s_spkr_osr_clk.clkr,
-	[CODEC_I2S_SPKR_DIV_CLK] = &codec_i2s_spkr_div_clk.clkr,
-	[CODEC_I2S_SPKR_BIT_DIV_CLK] = &codec_i2s_spkr_bit_div_clk.clkr,
-	[CODEC_I2S_SPKR_BIT_CLK] = &codec_i2s_spkr_bit_clk.clkr,
-	[SPARE_I2S_SPKR_OSR_SRC] = &spare_i2s_spkr_osr_src.clkr,
-	[SPARE_I2S_SPKR_OSR_CLK] = &spare_i2s_spkr_osr_clk.clkr,
-	[SPARE_I2S_SPKR_DIV_CLK] = &spare_i2s_spkr_div_clk.clkr,
-	[SPARE_I2S_SPKR_BIT_DIV_CLK] = &spare_i2s_spkr_bit_div_clk.clkr,
-	[SPARE_I2S_SPKR_BIT_CLK] = &spare_i2s_spkr_bit_clk.clkr,
-};
-
-static const struct regmap_config lcc_mdm9615_regmap_config = {
-	.reg_bits	= 32,
-	.reg_stride	= 4,
-	.val_bits	= 32,
-	.max_register	= 0xfc,
-	.fast_io	= true,
-};
-
-static const struct qcom_cc_desc lcc_mdm9615_desc = {
-	.config = &lcc_mdm9615_regmap_config,
-	.clks = lcc_mdm9615_clks,
-	.num_clks = ARRAY_SIZE(lcc_mdm9615_clks),
-};
-
-static const struct of_device_id lcc_mdm9615_match_table[] = {
-	{ .compatible = "qcom,lcc-mdm9615" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, lcc_mdm9615_match_table);
-
-static int lcc_mdm9615_probe(struct platform_device *pdev)
-{
-	u32 val;
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &lcc_mdm9615_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Use the correct frequency plan depending on speed of PLL4 */
-	regmap_read(regmap, 0x4, &val);
-	if (val == 0x12) {
-		slimbus_src.freq_tbl = clk_tbl_aif_osr_492;
-		mi2s_osr_src.freq_tbl = clk_tbl_aif_osr_492;
-		codec_i2s_mic_osr_src.freq_tbl = clk_tbl_aif_osr_492;
-		spare_i2s_mic_osr_src.freq_tbl = clk_tbl_aif_osr_492;
-		codec_i2s_spkr_osr_src.freq_tbl = clk_tbl_aif_osr_492;
-		spare_i2s_spkr_osr_src.freq_tbl = clk_tbl_aif_osr_492;
-		pcm_src.freq_tbl = clk_tbl_pcm_492;
-	}
-	/* Enable PLL4 source on the LPASS Primary PLL Mux */
-	regmap_write(regmap, 0xc4, 0x1);
-
-	return qcom_cc_really_probe(pdev, &lcc_mdm9615_desc, regmap);
-}
-
-static struct platform_driver lcc_mdm9615_driver = {
-	.probe		= lcc_mdm9615_probe,
-	.driver		= {
-		.name	= "lcc-mdm9615",
-		.of_match_table = lcc_mdm9615_match_table,
-	},
-};
-module_platform_driver(lcc_mdm9615_driver);
-
-MODULE_DESCRIPTION("QCOM LCC MDM9615 Driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:lcc-mdm9615");
diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index 3926184cc91b..5e2465f73722 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -23,6 +23,10 @@
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
 
+struct clk_parent_data pxo_parent_data = {
+	.fw_name = "pxo", .name = "pxo_board",
+};
+
 static struct clk_pll pll4 = {
 	.l_reg = 0x4,
 	.m_reg = 0x8,
@@ -33,9 +37,7 @@ static struct clk_pll pll4 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll4",
-		.parent_data = (const struct clk_parent_data[]){
-			{ .fw_name = "pxo", .name = "pxo_board" },
-		},
+		.parent_data = &pxo_parent_data,
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -51,7 +53,7 @@ static const struct parent_map lcc_pxo_pll4_map[] = {
 	{ P_PLL4, 2 }
 };
 
-static const struct clk_parent_data lcc_pxo_pll4[] = {
+static struct clk_parent_data lcc_pxo_pll4[] = {
 	{ .fw_name = "pxo", .name = "pxo_board" },
 	{ .fw_name = "pll4_vote", .name = "pll4_vote" },
 };
@@ -444,6 +446,7 @@ static const struct qcom_cc_desc lcc_msm8960_desc = {
 static const struct of_device_id lcc_msm8960_match_table[] = {
 	{ .compatible = "qcom,lcc-msm8960" },
 	{ .compatible = "qcom,lcc-apq8064" },
+	{ .compatible = "qcom,lcc-mdm9615" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lcc_msm8960_match_table);
@@ -453,6 +456,14 @@ static int lcc_msm8960_probe(struct platform_device *pdev)
 	u32 val;
 	struct regmap *regmap;
 
+	/* patch for the cxo <-> pxo difference */
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,lcc-mdm9615")) {
+		pxo_parent_data.fw_name = "cxo";
+		pxo_parent_data.name = "cxo_board";
+		lcc_pxo_pll4[0].fw_name = "cxo";
+		lcc_pxo_pll4[0].name = "cxo_board";
+	}
+
 	regmap = qcom_cc_map(pdev, &lcc_msm8960_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
-- 
2.39.2

