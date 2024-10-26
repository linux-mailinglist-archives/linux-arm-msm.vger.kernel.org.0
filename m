Return-Path: <linux-arm-msm+bounces-36029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 277FA9B1983
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46B281C20DD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 15:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1FB1D9A52;
	Sat, 26 Oct 2024 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkBdM91P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147441D95B0
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957646; cv=none; b=VVGQ1QQDsHSs5Z+Y4vl3j0/H9W+qiQb2T5c5lBwYO6f6jNmAt2UHzpLvpvETKxW94VSxq/ModDirURXo2YkyWZKQaa6+zSjWjbA35RVhVHWxDKInZJApTeNuDCK1FBu2HonbS7SWDN7xsEE88CnP/10nPG6bwW1lVTBHQQialzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957646; c=relaxed/simple;
	bh=R2XkeFMnY0AjsGKXPK3B1naOIoaPvO0i7z+qzjzFpa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ToaJzZkFB3L99RpezJSznGkLaLezhR/4kcXTgiQPRR/3xtcsK+6NeVApzHSl93JDpmO0bGSWtG/zJEhV78VxB4rvuZAOlvHAwEwVK9KAS24KJvY68MFatd7aa3ipwxK+cuJ9WSydXAmCztrMchRVKrCMGZoGJ2ZwV56/JNAknUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkBdM91P; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so30115011fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729957642; x=1730562442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef/t7amGJ7V2Yr0hBMFyJSXb1urInybmc74/xsHCZk0=;
        b=NkBdM91PELNrYv4p6aERb+teKLQzniQYudst0abzAy2Cb1GIkcvh2Tii0eoPJdmZC9
         og0odrs5L6QQ/U1efhznCGrDBb7FWXzlSn0N4zsH7yB1S3SjUvIAixCqvn9+P3Tq4exA
         CJNjMx60r7057c5IlKptoy3bRRqU7z3+57Ww3W5s/nRhtsIqOMOo7HmCStunA+H6vkEa
         RKP0bXCpFIIoto+66MznHoOR9/C00I6izyk0S6GX2Jx3eC3d2PNIoQ0dBnE3TtEhUlYC
         og9aoPSrjRH85QRoggNi1AJs1TeIelPR/lXU1Ixj82SeUvx3dcbuWRqgiGyPUmUd6aTF
         MsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957642; x=1730562442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ef/t7amGJ7V2Yr0hBMFyJSXb1urInybmc74/xsHCZk0=;
        b=u35a0hdEY4qqMwwCLut3dzTACrbWcYeZl/tYYgN5TqisZyz8RwtOb1DgPXmhc76nO7
         rLsQh5S7FIPMn3xD8rXmeakBpdjgCVFwfxw/R7C+V78PMDzpTxR+V46RsU6ubHlRk+9Q
         hLUzayq+H6kcd5diKCS/LFNNM0SzXGMJKNooPiY2PvFFSuoAJBOC1dQY7BrsJORRm2Dg
         jswfqW/cvGom3BDqJlbQKsXiTtu8axQO/iVHqfpvQJYo/HYC+4QIj90FIx5FSdBCRdMw
         WGbsUctd9jLrMDlqmOfo3nt9kLb3hkLgTHujfhO+gc91/KKxHRQwnS9fzBQ6BUWp/D28
         LCAg==
X-Gm-Message-State: AOJu0YwPdiBvAEXCdQ6Elc0pIKDkg5GkPfO1AbAVRD6UzApX+FJ7jOJq
	mbqCtVYgt/KnJttEcrjuZe7jfgfsHWrwqy2uU3iT5by46LvNgHMsuLHrGNX14io=
X-Google-Smtp-Source: AGHT+IGrtiC2PzRvq+Xo5f57u+gkLRqYno7iZcLwvfX9lkOwYpR0m7ZwtlHzwU2D/X6R1HiS+kK9Dw==
X-Received: by 2002:a05:6512:3f0c:b0:536:568f:c5ed with SMTP id 2adb3069b0e04-53b347c0cfcmr1379832e87.1.1729957642265;
        Sat, 26 Oct 2024 08:47:22 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c7cf4sm532188e87.184.2024.10.26.08.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:47:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Oct 2024 18:47:08 +0300
Subject: [PATCH v4 10/11] clk: qcom: dispcc-sm8550: enable support for
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-sar2130p-clocks-v4-10-37100d40fadc@linaro.org>
References: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
In-Reply-To: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3580;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=R2XkeFMnY0AjsGKXPK3B1naOIoaPvO0i7z+qzjzFpa0=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHQ75UNNt3IsZEqhnQhPQYdFz+SI/9U3EO48P/
 q5/SvppIYCJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx0O+QAKCRAU23LtvoBl
 uMvjD/4kENC/2AvoMLZrauD8BKfxW6bBRTZ58ruHqtsnnx7zPhRs3YqK420jotpzjWNoeT7tTO0
 UBWzUaluSEE1YIFT7uKXiOTTEhWBgkftNkB71NeI/bZJ7dXrVVDiE3cw2FmegadHhx15IcTP4VM
 LgMqyq76Y19MzHc27tKRD3hAT+PKQ+nLxDRH6q4yXoT1zr/8TQ0anV9ZHVJMG3SO4jN1cAPGQkA
 Es+Rof8JkNfCgqqCFuAEzoZ7difacj+XLg5BlUqBXtW4c2v/5hatWOm5bnYwYBWAiRM9uU3YaBg
 BuBRcO9skVPKQHY6+KzXEbg8tgeR0dkkNfqpqtH56lJUXV7Tlk8cI2iTH409ZjDtHKV4ngeFfUM
 wOKdG3Lr90ObbltSfLsnJn/rHIBba5/SpYN59PCc+5Mb0gyPCg0PhO26PlOmIBSNED3bTn/GKav
 kNNDaSiZ2Vt9asFRzqPm57Djk58QN0gL7kEiQTNx3HdJ/Df8r6zN5rYwaNpGVMBOXi9dEg4ovVK
 iMcHXl3RLD6L+UhvtWKKzcSza/B+x2tPbgX4MyiMJsydDyafgFlhEsY5nfdfAbYqySFt3hZceMV
 096DVZOj/KC7sYuhS9y6kb8KNlFsua9Em5PDo5TVBV+WPBm/p3dQLPOYL/q1PLxRZF/pQrSXo2D
 IYdisV4ijvEed1g==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The display clock controller on SAR2130P is very close to the clock
controller on SM8550 (and SM8650). Reuse existing driver to add support
for the controller on SAR2130P.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/Kconfig         |  4 ++--
 drivers/clk/qcom/dispcc-sm8550.c | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 0cb5d5a052744761c95a5c72047cd322ddb8e0fc..77a4139d222ec7dea87d63b24896324973e4838b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -988,10 +988,10 @@ config SM_DISPCC_8450
 config SM_DISPCC_8550
 	tristate "SM8550 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	depends on SM_GCC_8550 || SM_GCC_8650
+	depends on SM_GCC_8550 || SM_GCC_8650 || SAR_GCC_2130P
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
-	  SM8550 or SM8650 devices.
+	  SAR2130P, SM8550 or SM8650 devices.
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 7f9021ca0ecb0ef743a40bed1bb3d2cbcfa23dc7..e41d4104d77021cae6438886bcb7015469d86a9f 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -75,7 +75,7 @@ static struct pll_vco lucid_ole_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
-static const struct alpha_pll_config disp_cc_pll0_config = {
+static struct alpha_pll_config disp_cc_pll0_config = {
 	.l = 0xd,
 	.alpha = 0x6492,
 	.config_ctl_val = 0x20485699,
@@ -106,7 +106,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 	},
 };
 
-static const struct alpha_pll_config disp_cc_pll1_config = {
+static struct alpha_pll_config disp_cc_pll1_config = {
 	.l = 0x1f,
 	.alpha = 0x4000,
 	.config_ctl_val = 0x20485699,
@@ -594,6 +594,13 @@ static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src_sar2130p[] = {
+	F(200000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(325000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(514000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
 static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src_sm8650[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(85714286, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
@@ -1750,6 +1757,7 @@ static struct qcom_cc_desc disp_cc_sm8550_desc = {
 };
 
 static const struct of_device_id disp_cc_sm8550_match_table[] = {
+	{ .compatible = "qcom,sar2130p-dispcc" },
 	{ .compatible = "qcom,sm8550-dispcc" },
 	{ .compatible = "qcom,sm8650-dispcc" },
 	{ }
@@ -1780,6 +1788,12 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
 		disp_cc_mdss_mdp_clk_src.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src_sm8650;
 		disp_cc_mdss_dptx1_usb_router_link_intf_clk.clkr.hw.init->parent_hws[0] =
 			&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw;
+	} else if (of_device_is_compatible(pdev->dev.of_node, "qcom,sar2130p-dispcc")) {
+		disp_cc_pll0_config.l = 0x1f;
+		disp_cc_pll0_config.alpha = 0x4000;
+		disp_cc_pll0_config.user_ctl_val = 0x1;
+		disp_cc_pll1_config.user_ctl_val = 0x1;
+		disp_cc_mdss_mdp_clk_src.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src_sar2130p;
 	}
 
 	clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);

-- 
2.39.5


