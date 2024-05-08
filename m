Return-Path: <linux-arm-msm+bounces-19511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AF08C021E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 18:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A22B2B25F25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C4812F592;
	Wed,  8 May 2024 16:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyHULeGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18DC12EBC8;
	Wed,  8 May 2024 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715186120; cv=none; b=ZMTPrh4LdvBZ3eLKTVMdXy9dj+Ag6E5UEHGX80LugvY8QOFze+CLuDFtcvY8Dh1M7HqhXAXm+OgGBaCAVv84CYkJe5LOKDE1RgR8cmNhQ8EzeAIhlCK+lVkYzXcxOCG6b5Jb3PhKO/5ernIpcWnvz4Z8nASK0mrVdt2SlWBri7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715186120; c=relaxed/simple;
	bh=p2jmm4729HB53dmFu4k/Ax2YWeZKZLw2DspO4X6ORiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rnpl/R/7+l8/9tSe0pWCf3d7fXCrNUVCX2xwlrGydEy0OnBd2Dp5A/O/WI0QGxyNgf94NASKPnQP8Jxlf4AaTWDOMAE0r/myxYMKtznZzxAvhh+kx6yVS/TD1z2Z9yoOS+IOW7KKV02Bft2MUN0ozHigtyy7D1k0NVCpJI2ihes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyHULeGH; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e3f6166e4aso45675671fa.1;
        Wed, 08 May 2024 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715186116; x=1715790916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWPsfhn7Vt6WMq6q4SL3RHvZRCok3i/hh0ou8ag5ZLU=;
        b=HyHULeGH18y8T/pxd9dHsaQMZMYi0DKq6G9/gvnth+tRMSqr1rC7MXccnW1a3mdpjk
         yRQArw2ErAtqQWGpxPSysvcPnm9N5zXQ+Snvj+TunCkMZc91YkyqFqdoDJZi4G0VJBwK
         oFcdD6o9FS0vYunPH2ulT8PMZt3qqjxOJwXhrfg2dOI3O07tqlOpmFBoFSW8CbOVLhh3
         m4SxptvMUiEXLKZLrd2jR+Y4AnDle5KOW/O5q6KdZZEnjrVAzd6qNZUHvHx7Bcs9Gadj
         6LOMU6MsOixQDUjLj2WJ7KEgVmEeaPDcrS1gDOEOAlbvSbWOUDGNKDgC8GfJRvaHsKva
         oEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715186116; x=1715790916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWPsfhn7Vt6WMq6q4SL3RHvZRCok3i/hh0ou8ag5ZLU=;
        b=Ei14u0U46k1ePHDQxZ5GDoBCcCveZfptioMCSVuQEBSiaAuQb9bJYoPjF3qRlo2ZAX
         lVIDDJTP1r6F8ybdEzdk0G+ROonUcVtqlAUyD9d6FV8xJb0iIvTbl2dVjFPq8A3H1SzO
         1xHxHRZG1E60BcERJVIEwojVKD55B4j73neBQc6UC1zhAp1IY9y4daofAE8BoDbUwQKf
         isjMQWnB9SW4lF34T9zlv5ek3RQRNmchuySeSZy68lcOGqSHqrOTUlP/yDve4cnFdH7Z
         rhN3AyInEgxBH81LFFnIEZ2/k9dZ7zVken+NmzLUJ36VEizXwe7pPQ4H2V7QxJxZF0Fo
         rUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLEPMyWZ1kBZ3W2137oGV0VQGUrQmJzLMYdcdlQBxCmG6sMU71UjG8pceMVJp73PLws3jgOmjVrS3vXDfKP0mJO1wIg0zoSvgU/64V5FFCJqAtLKYrXdu5VHiMrhODmQdu0nrjEQzIVTfzDvSZis9fSEAmrDRVL+qevxP9K3z1MuwmjPrO3Eo=
X-Gm-Message-State: AOJu0YyYNw/Nf24GQ7DN03soVaPq3I2CGkIs0G+vYnDzI+9DaE3nrs2R
	4jm2JJyGqhZ8X+o+0xC41g2cHGCLKTkBzXUxSBejbPcCreuSh9fzTzbmZQks
X-Google-Smtp-Source: AGHT+IFe0an6f5G+h1KHV+hUqlaDzL7s31WA02c4gUifFTLbuAku9YVpadhrrcm3shqXanvEDdWLJg==
X-Received: by 2002:a2e:b00e:0:b0:2e0:83a9:e385 with SMTP id 38308e7fff4ca-2e446d831c5mr24929321fa.6.1715186116100;
        Wed, 08 May 2024 09:35:16 -0700 (PDT)
Received: from localhost.localdomain (bzb212.neoplus.adsl.tpnet.pl. [83.30.47.212])
        by smtp.gmail.com with ESMTPSA id kt1-20020a170906aac100b00a52295e014bsm7820894ejb.92.2024.05.08.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 09:35:15 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] arm64: dts: qcom: msm8976: Add MDSS nodes
Date: Wed,  8 May 2024 18:34:35 +0200
Message-Id: <20240508163455.8757-3-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240508163455.8757-1-a39.skl@gmail.com>
References: <20240508163455.8757-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MDSS nodes to support displays on MSM8976 SoC.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 280 +++++++++++++++++++++++++-
 1 file changed, 276 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 8bdcc1438177..b26c35796928 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -785,10 +785,10 @@ gcc: clock-controller@1800000 {
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>;
+				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi1_phy 0>;
 			clock-names = "xo",
 				      "xo_a",
 				      "dsi0pll",
@@ -808,6 +808,278 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x30000>;
 		};
 
+		mdss: display-subsystem@1a00000 {
+			compatible = "qcom,mdss";
+
+			reg = <0x01a00000 0x1000>,
+			      <0x01ab0000 0x3000>;
+			reg-names = "mdss_phys", "vbif_phys";
+
+			power-domains = <&gcc MDSS_GDSC>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "vsync",
+				      "core";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@1a01000 {
+				compatible = "qcom,msm8976-mdp5", "qcom,mdp5";
+				reg = <0x01a01000 0x89000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_VSYNC_CLK>,
+					 <&gcc GCC_MDP_TBU_CLK>,
+					 <&gcc GCC_MDP_RT_TBU_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync",
+					      "tbu",
+					      "tbu_rt";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&gcc MDSS_GDSC>;
+
+				iommus = <&apps_iommu 22>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_mdp5_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_mdp5_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-177780000 {
+						opp-hz = /bits/ 64 <177780000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-320000000 {
+						opp-hz = /bits/ 64 <320000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+
+					opp-360000000 {
+						opp-hz = /bits/ 64 <360000000>;
+						required-opps = <&rpmpd_opp_turbo>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@1a94000 {
+				compatible = "qcom,msm8976-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x01a94000 0x300>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE0_CLK>,
+					 <&gcc GCC_MDSS_PCLK0_CLK>,
+					 <&gcc GCC_MDSS_ESC0_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+
+				assigned-clocks = <&gcc GCC_MDSS_BYTE0_CLK_SRC>,
+						  <&gcc GCC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>,
+							 <&mdss_dsi0_phy 1>;
+
+				phys = <&mdss_dsi0_phy>;
+
+				operating-points-v2 = <&dsi0_opp_table>;
+				power-domains = <&gcc MDSS_GDSC>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&mdss_mdp5_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				dsi0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-125000000 {
+						opp-hz = /bits/ 64 <125000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-161250000 {
+						opp-hz = /bits/ 64 <161250000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi1: dsi@1a96000 {
+				compatible = "qcom,msm8976-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x01a96000 0x300>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE1_CLK>,
+					 <&gcc GCC_MDSS_PCLK1_CLK>,
+					 <&gcc GCC_MDSS_ESC1_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+
+				assigned-clocks = <&gcc GCC_MDSS_BYTE1_CLK_SRC>,
+						  <&gcc GCC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>,
+							 <&mdss_dsi1_phy 1>;
+
+				phys = <&mdss_dsi1_phy>;
+
+				operating-points-v2 = <&dsi0_opp_table>;
+				power-domains = <&gcc MDSS_GDSC>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&mdss_mdp5_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@1a94a00 {
+				compatible = "qcom,dsi-phy-28nm-hpm-fam-b";
+				reg = <0x01a94a00 0xd4>,
+				      <0x01a94400 0x280>,
+				      <0x01a94b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss_dsi1_phy: phy@1a96a00 {
+				compatible = "qcom,dsi-phy-28nm-hpm-fam-b";
+				reg = <0x01a96a00 0xd4>,
+				      <0x01a96400 0x280>,
+				      <0x01a96b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
 		apps_iommu: iommu@1ee0000 {
 			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
 			reg = <0x01ee0000 0x3000>;
-- 
2.44.0


