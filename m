Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C55E44F0BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 03:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbhKMCFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 21:05:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbhKMCFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 21:05:41 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D96DC06127A
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 18:02:49 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id l22so26660165lfg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 18:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NgoOuhfAl73jFFXXd4eaI5MvCReNuIWxc1PVQIO0ZGo=;
        b=oc7RZCHnIe0INZashmKH2w3BjYqr5Fr3r3FtbVwubCxGrzVKnPy2Rv7K6PfHOzJo/r
         sM6u04KOqT2TsjBa6gOa/YLcLQhrNDkk394Y/s7yqDu2jpztfbf2M1m5KXFwDSqZV/Rq
         MA0MLsvgCfg8bwAfCBWSLPAZjeUiPmjgcqMeje02C4GoUDKeXCC0zu6yjQMplTlhxt4x
         IUoKT81CB1Iv+2BoINijAtlGDjlEUfc2t3gCLGLLOQu00O8Y2CFDvVqZzCRrvRbHHnvd
         3HJldIK0FJAt5+EHUb8/8nLA7zzwZAaoi1cOMRqX7q9WAz5i4CiHaKzl2pGeGLc+NKsN
         Zr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NgoOuhfAl73jFFXXd4eaI5MvCReNuIWxc1PVQIO0ZGo=;
        b=XF7TmTPaNMvhfmSy9aip+K7nbfIlkeYfU0EuTeNNrnTNzr2w/Z08BqbanOS3jAu23X
         Ebqou3i515ZO9K3LOFTWhiYQjPRNasRmjygoJKYIpeJnXjxHYnte2Y0oACgusPybGxIk
         3VJv/3V3hcuLlVy4ev0cL2THiA+4KcYUSyXJ4OeaflaCXSrJXbQU0meKwANkwVZxnuE7
         YfaDwLJUW/pD0LndS3O3i6a4Akq5c6km65kXwCpXxHaLF+KkEvhcSF5bwxMc19FNpQZi
         BBpHc5RxYNlefM2qprS/CFyvIyxYvhcgQpNqFTrP7atKsyjoGpBibv06o2jkR9XaQUUa
         xspQ==
X-Gm-Message-State: AOAM531dDdNs9e9aLwznHxT0CQe3S8RdOwbb1h3V7k6YfTgyoFk6mlWL
        Nq2R3H7n6nHRsEqToX58ROMhhA==
X-Google-Smtp-Source: ABdhPJwf2Ts03q0OZZvu7iDxFC0RUt3MsLGPBU5hrYS3uaNiCtPRcnCwqIaWNsTxqVYozJiyS6+/rg==
X-Received: by 2002:a05:6512:12c4:: with SMTP id p4mr8900521lfg.278.1636768967281;
        Fri, 12 Nov 2021 18:02:47 -0800 (PST)
Received: from PackardBell ([82.160.139.10])
        by smtp.googlemail.com with ESMTPSA id j20sm686185ljg.104.2021.11.12.18.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 18:02:46 -0800 (PST)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 6d921332;
        Sat, 13 Nov 2021 02:02:43 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 2/2] clk: qcom: Add MSM8226 Multimedia Clock Controller support
Date:   Sat, 13 Nov 2021 02:58:44 +0100
Message-Id: <20211113015844.92762-2-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211113015844.92762-1-bartosz.dudziak@snejp.pl>
References: <20211113015844.92762-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Modify the existing MSM8974 multimedia clock controller driver to
support the MMCC found on MSM8226 based devices. This should allow most
multimedia device drivers to probe and control their clocks.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 drivers/clk/qcom/mmcc-msm8974.c | 206 +++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index a1552b677..e890a23c2 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -257,6 +257,18 @@ static struct clk_rcg2 mmss_ahb_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_mmss_axi_clk_msm8226[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(37500000, P_GPLL0, 16, 0, 0),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	F(75000000, P_GPLL0, 8, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(150000000, P_GPLL0, 4, 0, 0),
+	F(200000000, P_MMPLL0, 4, 0, 0),
+	F(266666666, P_MMPLL0, 3, 0, 0),
+	{ }
+};
+
 static struct freq_tbl ftbl_mmss_axi_clk[] = {
 	F( 19200000, P_XO, 1, 0, 0),
 	F( 37500000, P_GPLL0, 16, 0, 0),
@@ -364,6 +376,23 @@ static struct clk_rcg2 csi3_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_camss_vfe_vfe0_clk_msm8226[] = {
+	F(37500000, P_GPLL0, 16, 0, 0),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	F(60000000, P_GPLL0, 10, 0, 0),
+	F(80000000, P_GPLL0, 7.5, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(109090000, P_GPLL0, 5.5, 0, 0),
+	F(133330000, P_GPLL0, 4.5, 0, 0),
+	F(150000000, P_GPLL0, 4, 0, 0),
+	F(200000000, P_GPLL0, 3, 0, 0),
+	F(228570000, P_MMPLL0, 3.5, 0, 0),
+	F(266670000, P_MMPLL0, 3, 0, 0),
+	F(320000000, P_MMPLL0, 2.5, 0, 0),
+	F(400000000, P_MMPLL0, 2, 0, 0),
+	{ }
+};
+
 static struct freq_tbl ftbl_camss_vfe_vfe0_1_clk[] = {
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(50000000, P_GPLL0, 12, 0, 0),
@@ -407,6 +436,18 @@ static struct clk_rcg2 vfe1_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_mdss_mdp_clk_msm8226[] = {
+	F(37500000, P_GPLL0, 16, 0, 0),
+	F(60000000, P_GPLL0, 10, 0, 0),
+	F(75000000, P_GPLL0, 8, 0, 0),
+	F(92310000, P_GPLL0, 6.5, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(133330000, P_MMPLL0, 6, 0, 0),
+	F(177780000, P_MMPLL0, 4.5, 0, 0),
+	F(200000000, P_MMPLL0, 4, 0, 0),
+	{ }
+};
+
 static struct freq_tbl ftbl_mdss_mdp_clk[] = {
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(60000000, P_GPLL0, 10, 0, 0),
@@ -513,6 +554,14 @@ static struct clk_rcg2 pclk1_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_venus0_vcodec0_clk_msm8226[] = {
+	F(66700000, P_GPLL0, 9, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(133330000, P_MMPLL0, 6, 0, 0),
+	F(160000000, P_MMPLL0, 5, 0, 0),
+	{ }
+};
+
 static struct freq_tbl ftbl_venus0_vcodec0_clk[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
@@ -593,6 +642,13 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_camss_mclk0_3_clk_msm8226[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 5, 1, 5),
+	F(66670000, P_GPLL0, 9, 0, 0),
+	{ }
+};
+
 static struct freq_tbl ftbl_camss_mclk0_3_clk[] = {
 	F(4800000, P_XO, 4, 0, 0),
 	F(6000000, P_GPLL0, 10, 1, 10),
@@ -705,6 +761,15 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_camss_vfe_cpp_clk_msm8226[] = {
+	F(133330000, P_GPLL0, 4.5, 0, 0),
+	F(150000000, P_GPLL0, 4, 0, 0),
+	F(266670000, P_MMPLL0, 3, 0, 0),
+	F(320000000, P_MMPLL0, 2.5, 0, 0),
+	F(400000000, P_MMPLL0, 2, 0, 0),
+	{ }
+};
+
 static struct freq_tbl ftbl_camss_vfe_cpp_clk[] = {
 	F(133330000, P_GPLL0, 4.5, 0, 0),
 	F(266670000, P_MMPLL0, 3, 0, 0),
@@ -2366,6 +2431,116 @@ static struct gdsc oxilicx_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
+static struct clk_regmap *mmcc_msm8226_clocks[] = {
+	[MMSS_AHB_CLK_SRC] = &mmss_ahb_clk_src.clkr,
+	[MMSS_AXI_CLK_SRC] = &mmss_axi_clk_src.clkr,
+	[MMPLL0] = &mmpll0.clkr,
+	[MMPLL0_VOTE] = &mmpll0_vote,
+	[MMPLL1] = &mmpll1.clkr,
+	[MMPLL1_VOTE] = &mmpll1_vote,
+	[CSI0_CLK_SRC] = &csi0_clk_src.clkr,
+	[CSI1_CLK_SRC] = &csi1_clk_src.clkr,
+	[VFE0_CLK_SRC] = &vfe0_clk_src.clkr,
+	[MDP_CLK_SRC] = &mdp_clk_src.clkr,
+	[JPEG0_CLK_SRC] = &jpeg0_clk_src.clkr,
+	[PCLK0_CLK_SRC] = &pclk0_clk_src.clkr,
+	[VCODEC0_CLK_SRC] = &vcodec0_clk_src.clkr,
+	[CCI_CLK_SRC] = &cci_clk_src.clkr,
+	[CAMSS_GP0_CLK_SRC] = &camss_gp0_clk_src.clkr,
+	[CAMSS_GP1_CLK_SRC] = &camss_gp1_clk_src.clkr,
+	[MCLK0_CLK_SRC] = &mclk0_clk_src.clkr,
+	[MCLK1_CLK_SRC] = &mclk1_clk_src.clkr,
+	[CSI0PHYTIMER_CLK_SRC] = &csi0phytimer_clk_src.clkr,
+	[CSI1PHYTIMER_CLK_SRC] = &csi1phytimer_clk_src.clkr,
+	[CPP_CLK_SRC] = &cpp_clk_src.clkr,
+	[BYTE0_CLK_SRC] = &byte0_clk_src.clkr,
+	[ESC0_CLK_SRC] = &esc0_clk_src.clkr,
+	[VSYNC_CLK_SRC] = &vsync_clk_src.clkr,
+	[CAMSS_CCI_CCI_AHB_CLK] = &camss_cci_cci_ahb_clk.clkr,
+	[CAMSS_CCI_CCI_CLK] = &camss_cci_cci_clk.clkr,
+	[CAMSS_CSI0_AHB_CLK] = &camss_csi0_ahb_clk.clkr,
+	[CAMSS_CSI0_CLK] = &camss_csi0_clk.clkr,
+	[CAMSS_CSI0PHY_CLK] = &camss_csi0phy_clk.clkr,
+	[CAMSS_CSI0PIX_CLK] = &camss_csi0pix_clk.clkr,
+	[CAMSS_CSI0RDI_CLK] = &camss_csi0rdi_clk.clkr,
+	[CAMSS_CSI1_AHB_CLK] = &camss_csi1_ahb_clk.clkr,
+	[CAMSS_CSI1_CLK] = &camss_csi1_clk.clkr,
+	[CAMSS_CSI1PHY_CLK] = &camss_csi1phy_clk.clkr,
+	[CAMSS_CSI1PIX_CLK] = &camss_csi1pix_clk.clkr,
+	[CAMSS_CSI1RDI_CLK] = &camss_csi1rdi_clk.clkr,
+	[CAMSS_CSI_VFE0_CLK] = &camss_csi_vfe0_clk.clkr,
+	[CAMSS_GP0_CLK] = &camss_gp0_clk.clkr,
+	[CAMSS_GP1_CLK] = &camss_gp1_clk.clkr,
+	[CAMSS_ISPIF_AHB_CLK] = &camss_ispif_ahb_clk.clkr,
+	[CAMSS_JPEG_JPEG0_CLK] = &camss_jpeg_jpeg0_clk.clkr,
+	[CAMSS_JPEG_JPEG_AHB_CLK] = &camss_jpeg_jpeg_ahb_clk.clkr,
+	[CAMSS_JPEG_JPEG_AXI_CLK] = &camss_jpeg_jpeg_axi_clk.clkr,
+	[CAMSS_MCLK0_CLK] = &camss_mclk0_clk.clkr,
+	[CAMSS_MCLK1_CLK] = &camss_mclk1_clk.clkr,
+	[CAMSS_MICRO_AHB_CLK] = &camss_micro_ahb_clk.clkr,
+	[CAMSS_PHY0_CSI0PHYTIMER_CLK] = &camss_phy0_csi0phytimer_clk.clkr,
+	[CAMSS_PHY1_CSI1PHYTIMER_CLK] = &camss_phy1_csi1phytimer_clk.clkr,
+	[CAMSS_TOP_AHB_CLK] = &camss_top_ahb_clk.clkr,
+	[CAMSS_VFE_CPP_AHB_CLK] = &camss_vfe_cpp_ahb_clk.clkr,
+	[CAMSS_VFE_CPP_CLK] = &camss_vfe_cpp_clk.clkr,
+	[CAMSS_VFE_VFE0_CLK] = &camss_vfe_vfe0_clk.clkr,
+	[CAMSS_VFE_VFE_AHB_CLK] = &camss_vfe_vfe_ahb_clk.clkr,
+	[CAMSS_VFE_VFE_AXI_CLK] = &camss_vfe_vfe_axi_clk.clkr,
+	[MDSS_AHB_CLK] = &mdss_ahb_clk.clkr,
+	[MDSS_AXI_CLK] = &mdss_axi_clk.clkr,
+	[MDSS_BYTE0_CLK] = &mdss_byte0_clk.clkr,
+	[MDSS_ESC0_CLK] = &mdss_esc0_clk.clkr,
+	[MDSS_MDP_CLK] = &mdss_mdp_clk.clkr,
+	[MDSS_MDP_LUT_CLK] = &mdss_mdp_lut_clk.clkr,
+	[MDSS_PCLK0_CLK] = &mdss_pclk0_clk.clkr,
+	[MDSS_VSYNC_CLK] = &mdss_vsync_clk.clkr,
+	[MMSS_MISC_AHB_CLK] = &mmss_misc_ahb_clk.clkr,
+	[MMSS_MMSSNOC_AHB_CLK] = &mmss_mmssnoc_ahb_clk.clkr,
+	[MMSS_MMSSNOC_BTO_AHB_CLK] = &mmss_mmssnoc_bto_ahb_clk.clkr,
+	[MMSS_MMSSNOC_AXI_CLK] = &mmss_mmssnoc_axi_clk.clkr,
+	[MMSS_S0_AXI_CLK] = &mmss_s0_axi_clk.clkr,
+	[OCMEMCX_AHB_CLK] = &ocmemcx_ahb_clk.clkr,
+	[OXILI_OCMEMGX_CLK] = &oxili_ocmemgx_clk.clkr,
+	[OXILI_GFX3D_CLK] = &oxili_gfx3d_clk.clkr,
+	[OXILICX_AHB_CLK] = &oxilicx_ahb_clk.clkr,
+	[OXILICX_AXI_CLK] = &oxilicx_axi_clk.clkr,
+	[VENUS0_AHB_CLK] = &venus0_ahb_clk.clkr,
+	[VENUS0_AXI_CLK] = &venus0_axi_clk.clkr,
+	[VENUS0_VCODEC0_CLK] = &venus0_vcodec0_clk.clkr,
+};
+
+static const struct qcom_reset_map mmcc_msm8226_resets[] = {
+	[SPDM_RESET] = { 0x0200 },
+	[SPDM_RM_RESET] = { 0x0300 },
+	[VENUS0_RESET] = { 0x1020 },
+	[MDSS_RESET] = { 0x2300 },
+};
+
+static struct gdsc *mmcc_msm8226_gdscs[] = {
+	[VENUS0_GDSC] = &venus0_gdsc,
+	[MDSS_GDSC] = &mdss_gdsc,
+	[CAMSS_JPEG_GDSC] = &camss_jpeg_gdsc,
+	[CAMSS_VFE_GDSC] = &camss_vfe_gdsc,
+};
+
+static const struct regmap_config mmcc_msm8226_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x5104,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc mmcc_msm8226_desc = {
+	.config = &mmcc_msm8226_regmap_config,
+	.clks = mmcc_msm8226_clocks,
+	.num_clks = ARRAY_SIZE(mmcc_msm8226_clocks),
+	.resets = mmcc_msm8226_resets,
+	.num_resets = ARRAY_SIZE(mmcc_msm8226_resets),
+	.gdscs = mmcc_msm8226_gdscs,
+	.num_gdscs = ARRAY_SIZE(mmcc_msm8226_gdscs),
+};
+
 static struct clk_regmap *mmcc_msm8974_clocks[] = {
 	[MMSS_AHB_CLK_SRC] = &mmss_ahb_clk_src.clkr,
 	[MMSS_AXI_CLK_SRC] = &mmss_axi_clk_src.clkr,
@@ -2569,23 +2744,44 @@ static const struct qcom_cc_desc mmcc_msm8974_desc = {
 };
 
 static const struct of_device_id mmcc_msm8974_match_table[] = {
-	{ .compatible = "qcom,mmcc-msm8974" },
+	{ .compatible = "qcom,mmcc-msm8226", .data = &mmcc_msm8226_desc },
+	{ .compatible = "qcom,mmcc-msm8974", .data = &mmcc_msm8974_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mmcc_msm8974_match_table);
 
+static void msm8226_clock_override(void)
+{
+	mmss_axi_clk_src.freq_tbl = ftbl_mmss_axi_clk_msm8226;
+	vfe0_clk_src.freq_tbl = ftbl_camss_vfe_vfe0_clk_msm8226;
+	mdp_clk_src.freq_tbl = ftbl_mdss_mdp_clk_msm8226;
+	vcodec0_clk_src.freq_tbl = ftbl_venus0_vcodec0_clk_msm8226;
+	mclk0_clk_src.freq_tbl = ftbl_camss_mclk0_3_clk_msm8226;
+	mclk1_clk_src.freq_tbl = ftbl_camss_mclk0_3_clk_msm8226;
+	cpp_clk_src.freq_tbl = ftbl_camss_vfe_cpp_clk_msm8226;
+}
+
 static int mmcc_msm8974_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	const struct of_device_id *match;
+
+	match = of_match_device(mmcc_msm8974_match_table, &pdev->dev);
+	if (!match)
+		return -ENODEV;
 
-	regmap = qcom_cc_map(pdev, &mmcc_msm8974_desc);
+	regmap = qcom_cc_map(pdev, match->data);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	clk_pll_configure_sr_hpm_lp(&mmpll1, regmap, &mmpll1_config, true);
-	clk_pll_configure_sr_hpm_lp(&mmpll3, regmap, &mmpll3_config, false);
+	if (match->data == &mmcc_msm8974_desc) {
+		clk_pll_configure_sr_hpm_lp(&mmpll1, regmap, &mmpll1_config, true);
+		clk_pll_configure_sr_hpm_lp(&mmpll3, regmap, &mmpll3_config, false);
+	} else {
+		msm8226_clock_override();
+	}
 
-	return qcom_cc_really_probe(pdev, &mmcc_msm8974_desc, regmap);
+	return qcom_cc_really_probe(pdev, match->data, regmap);
 }
 
 static struct platform_driver mmcc_msm8974_driver = {
-- 
2.25.1

