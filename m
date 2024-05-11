Return-Path: <linux-arm-msm+bounces-19745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2149D8C345E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 00:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC25B28119F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 22:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E664597A;
	Sat, 11 May 2024 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPyC1yxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD06924B26
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 22:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715465054; cv=none; b=SE16ISXA7n5gexMa+Dot1b4/+fbODm7rXzUw4Ly3tn//ZakZZBVZcMIiUBllnOBLql/xEXQj+5jPcNrVaM0qbYRzDGHaTeEcSK3JZs4IMLfejHcWR7/BAUeh9nceBqYsxbLuW1b7Q0YAjJma4Gy5971hREFOyBASU1xXycmFPEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715465054; c=relaxed/simple;
	bh=Jwd9rhQ0JDu40ZBPuVk2gO1cB7XlxbXe5F6OjmzPxEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLYog9eOk835tjSLV0ZKPJj7e6iYlVlOIDyHetJBcb2ow+VsO7MtsUE2LXcIfetwXtpK/VPNxBdxLa8WJg20lmy3ETsPmqAfkD1L93813fov4HF2JJO3ZudsJmoCAU5MSga7aBlEwWlOoDOD6GVug9mkdFJJ1IK58z8tsVpOd/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPyC1yxJ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2dcc8d10d39so36321231fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 15:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715465051; x=1716069851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSQqghrOzDlNbI6LKWKOXhmUUiNK2fY2zBkeOHld4FE=;
        b=mPyC1yxJPMutYjZ8kHgcK7rtLDfOp5/jKrfXj68qISa+ZmDwZ7nWjv8AwrnT7qW70M
         nAk9DiQb+6Wl0qD8G8erAHYWV6U2zFiJYoAkhgCCP6EFpohH+bnSsR3In2uuf++sWUBi
         dWic8MiNLKyWmjvPEWufcsIdiJdjqPgDCCmgKJnwlI2gsAsnxmtrkK7oL56noZhv3cQ7
         kLvhiNtTvkAS8MKtnJvwyEckuj50KaRX9TwEQVTJbp4PnlVFwPWexyQuHXmJBhlRZS4v
         Apo/rHDle6hCFxNdr5N8hof/9Ph7aW28eHEF4bZtzWJXTdqmEzUlvkgYUW1QJW5JdD4s
         CfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715465051; x=1716069851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSQqghrOzDlNbI6LKWKOXhmUUiNK2fY2zBkeOHld4FE=;
        b=L0kyxqHuGL3jzYmujQAempmmBgdrV6vC5OaWjx64FCN+f8LdCeTDauqyaT2fCpWnOl
         Bq7QSDNNohSIdMHjS3B2CsIXraNx2qo9vW48oxhEweVt/mLdRKDh3xUJnQe7a0it5Aci
         tCk1Imq+wDfGut6mS/A/NAzcFuGbXLGLmrJx4KhyyYV35d7Olrzf3ieGJWLKu5tOGa3P
         WZYme0LL8m8pK2G1Q3W/tBvcb1/Aqzwt8crhSV8wPBOtdWOTs4G++pgN1OTWN2PRleKa
         TaFu9ICabbWE3kkSKf2izXny/UZklgkLPXRvUW11RShiz6pGU85Ql82pcxOjmLbK8FeE
         I68A==
X-Gm-Message-State: AOJu0YyMW2xsR09UX8h6Y5aox59YrF57VnYxiHiEwvJEf8uB8oJP+O8l
	NAXpFTJOz2i7ffhllcxEWUimWqAZubarNAEu8ndYIAz5+fSpuQc20ry679Iun68=
X-Google-Smtp-Source: AGHT+IEWIufQzwQM3cLRDr0gwKShoFgTIlNkdFnjWi1f0BhMJGc1z+z1PydMCV5C9hrPteXgv19Dyg==
X-Received: by 2002:a05:6512:3b20:b0:51d:2eba:614 with SMTP id 2adb3069b0e04-5220fe7a025mr4864617e87.53.1715465050938;
        Sat, 11 May 2024 15:04:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d878fsm1123875e87.206.2024.05.11.15.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 15:04:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 01:04:08 +0300
Subject: [PATCH v4 2/9] arm64: dts: qcom: sc8180x: correct dispcc clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-typec-fix-sm8250-v4-2-ad153c747a97@linaro.org>
References: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
In-Reply-To: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Jwd9rhQ0JDu40ZBPuVk2gO1cB7XlxbXe5F6OjmzPxEg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP+tX6+qiXkBU0JXiWCdi7IxJlyO8ZsvLk4cU1
 HGuVvpquWeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/rVwAKCRCLPIo+Aiko
 1Uz9B/wN/QlD9xubscmi2AT7q1HuAaHjNh11kLWGTwSK9za8pxSJW0O6M+LGibWZ37HQMFMto3h
 9EbExutNm0oiYMmk7FhIu95e9Wg17c/GQN+/CwYKy8SNKIISCf2Cpq4/n+FgQd5B2RJ7NolqmAy
 hmjR2TEElD7KGmPQdtt+1rgSM+OHFxqeSIRPvqTSnPaTrum/rWZAF1rN0kwJffueb2kdNFtvbY5
 tDnns93Xq8XMFmnmSNQyuYLtdhPeOj/XEttodJMQ/UOthp96zS35fUWP4h0ueNcdCa4r0tCm3hq
 uUcKaZ4QHByxKdwcVI04akyLjRIQx0DlEQpFftIvsu/UaGhj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Correct the clocks being used by the display clock controller on the
SC8180X platform (to match the schema):
- Drop the sleep clock
- Add DSI clocks
- Reorder eDP / DP clocks

This changes the order of clocks, however it should be noted that the
clock list was neither correct nor followed the schema beforehand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 067712310560..b92b6fb73057 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3308,21 +3308,27 @@ dispcc: clock-controller@af00000 {
 			compatible = "qcom,sc8180x-dispcc";
 			reg = <0 0x0af00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&sleep_clk>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi1_phy 0>,
+				 <&mdss_dsi1_phy 1>,
 				 <&usb_prim_dpphy 0>,
 				 <&usb_prim_dpphy 1>,
-				 <&usb_sec_dpphy 0>,
-				 <&usb_sec_dpphy 1>,
 				 <&edp_phy 0>,
-				 <&edp_phy 1>;
+				 <&edp_phy 1>,
+				 <&usb_sec_dpphy 0>,
+				 <&usb_sec_dpphy 1>;
 			clock-names = "bi_tcxo",
-				      "sleep_clk",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
 				      "dp_phy_pll_link_clk",
 				      "dp_phy_pll_vco_div_clk",
-				      "dptx1_phy_pll_link_clk",
-				      "dptx1_phy_pll_vco_div_clk",
 				      "edp_phy_pll_link_clk",
-				      "edp_phy_pll_vco_div_clk";
+				      "edp_phy_pll_vco_div_clk",
+				      "dptx1_phy_pll_link_clk",
+				      "dptx1_phy_pll_vco_div_clk";
 			power-domains = <&rpmhpd SC8180X_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;

-- 
2.39.2


