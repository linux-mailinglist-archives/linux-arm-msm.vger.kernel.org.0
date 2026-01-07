Return-Path: <linux-arm-msm+bounces-87808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A5CFC86D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 09:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D904630C2B67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 08:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337E4289376;
	Wed,  7 Jan 2026 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="A4/y5f6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF70284672
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773192; cv=none; b=pkV6cOKrtffHc++4239U3Y5UnBq2wQQ7MW/84xEd8yZH6lA8Yg0Q4PwwjArP3ogUTXZTgh2i8KtHjtLSuBrGPU3Q/C1ZQkvHoBntg1rIZasZR2jC3wMD7pJI32zVUwcbc1PkOCLo1jXK9txARmhW2VBntOJTrKQqNH2IMGPpkhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773192; c=relaxed/simple;
	bh=ZqBIugg5K7/ysfpKey8yK6cRDkhGfiVM24dyT/kjpXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmy/E+rY9B3qbev8eBDGFpjWEwBRl6DMqLieGoLIV94l2yLfZ5hOYA7kx8XHW2dL3h3Y74lCwYrqwwUmSkSpoRNpvVI4k+N2K5mBImlk+bvgo5+umMabX/cGrvtymnVrZOMb/9sLUiRvR1fwy83z3jTnprZK58bZe7bB0cYE9hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=A4/y5f6a; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b560e425eso2392903a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 00:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767773183; x=1768377983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4RvfqlwGsUfw8nkyrkO8zG6AiaNNt3piIyxZCLBKwM=;
        b=A4/y5f6aH1h3eh7GFKKIOWzPstJw1gJb9OQCynzoTI/m+gGpTwREvSq1pPiS2JF3tp
         HxXqRjnOyjB880aCuyATS8X3GTrgDd8itY6t2UPhFh9Qx4TL+AtQVjPLrv/tnlBVjOv2
         6sbXIhXf/5hqOuivBEfpQVmaz0jdk3XmhVEN4OuTQR9/1uLqHXPD6DSg+pfrI2vKcqQU
         gzuW4jx1QXB/I2bUK27cX/pWuyYbGXiRWVmi+2mMZ17hS8TK3f2tlaBijJjEluLnwIrr
         MKCMM4bFkg1po/Htoo6lIDmXa0rAcq8w3X4xhs7n0tqTurzRhR31LBHGWPhv2E9U57aq
         SaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773183; x=1768377983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O4RvfqlwGsUfw8nkyrkO8zG6AiaNNt3piIyxZCLBKwM=;
        b=Ah8wXdJjqbaB8URu9hBP8TCPQ7lwsmgFJhWhR0VWGwsY82z4+XUyu1vWKNPyijQPWz
         KuABMDulDlFyN6TXPano37Nnjccs4ZrjDCxEn89HXnSyrzv5A2lFMoSKZr6gi0fpVveh
         eu9ZSFoLzPB5GN6rhxVV6TPxOqUbBmWUT/bpE0SAKuKaYMpn53uDy1+c1k1MgVdsMBWY
         x1H4+C0wwW7z342OjQUL/5Ic1JLHaVxEEjVy0vN7t/FPmC5/f729qJArnn/iwKo4227m
         //ciHemTpE+G6ZTytwsywb9Fu/S+X2VAt/ONhapfXmHt2W8ISsIENq9lKTztiyqY5576
         k0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjRBRdvM+pCoAonu+a4F9eQ/nVtMdbw5qFAzijl/2yTzm86N4mN3rBXncc0ezg+eq7LwvFT78UpCc7rgNf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+NVND3psw/XxQozkXVw+aRfNkYKVcBIDJpXZQ1fPvFvBxiUx3
	S6Msls+eva/0aNg6JoCq20DJ8cFdB7dZS4bSbc3UPHiXA6MwXFizxbqLZTmb8RuRQgs=
X-Gm-Gg: AY/fxX7mPxqaRvmDRzFeKLgE1aOl22UYFrNUHfa/inIpQKQTfwM/JAejDoKfHxTDGgC
	8SjoRlkcUdaOqV6W2cqJXMq1YWkLTVVkKNc76OJPy8PARKvenMK3d8LwaYanNDJzfUwn0L9K9I5
	iXucnS7GUdxZjhY3eyaflT2N8ZiqdQfLh5IFofPR1FxnZAzCFaGsDObGCoft9bjn8i7Y3OSV7ac
	K0MgpKCX1YwWYg0O0TMW8wmdFSaw55R7sakOAbTyo3USmcm4iN4xGwdfSEJXtCAD5dDenACxZyJ
	Eu9OFoio2adnX9yX7N21sbdF80jOVa8SLVFMAFAXycfXStBm2XP0hnYWdByWIdu44JQnnfi1yaj
	uSHRntozK6Y81/f8rs6opycsy1/lImrBZWZgAcNY0efR9lDTQKNtHOm/GfXyLPr+beuXIsBv1pZ
	3S8si6QyfGVE4Rdmo905p/b216xw==
X-Google-Smtp-Source: AGHT+IFco/AIFD5fqL2upehjsvFAsI3pjosHbxzjhLr008+cfjzyFgmWnzpdlEcgUXZJ8GeoC7fn5g==
X-Received: by 2002:a05:6402:270a:b0:647:54ba:6c42 with SMTP id 4fb4d7f45d1cf-65097dcd9fdmr1486656a12.4.1767773183403;
        Wed, 07 Jan 2026 00:06:23 -0800 (PST)
Received: from [192.168.224.78] ([213.208.157.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm3941299a12.33.2026.01.07.00.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:06:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 Jan 2026 09:05:55 +0100
Subject: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
In-Reply-To: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767773155; l=4338;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZqBIugg5K7/ysfpKey8yK6cRDkhGfiVM24dyT/kjpXc=;
 b=4+q92hc4E5FncGMKXsvkFnr2XdU5Xsgch8jTz/DF/1zlb/Wzyqfx0gA19Q1ogrwRzX+vA/MOD
 Yvr2gqnsc1bBsIUyHwoTXp+p5tIBk9+GgMO7OqsLvlXU+7p6sJBpG5N
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the nodes for the UFS PHY and UFS host controller, along with the
ICE used for UFS.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 127 +++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..0f69deabb60c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -797,9 +797,9 @@ gcc: clock-controller@100000 {
 				 <&sleep_clk>,
 				 <0>, /* pcie_0_pipe_clk */
 				 <0>, /* pcie_1_pipe_clk */
-				 <0>, /* ufs_phy_rx_symbol_0_clk */
-				 <0>, /* ufs_phy_rx_symbol_1_clk */
-				 <0>, /* ufs_phy_tx_symbol_0_clk */
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
 
 			#clock-cells = <1>;
@@ -1151,6 +1151,127 @@ aggre2_noc: interconnect@1700000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		ufs_mem_phy: phy@1d80000 {
+			compatible = "qcom,milos-qmp-ufs-phy";
+			reg = <0x0 0x01d80000 0x0 0x2000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&tcsr TCSR_UFS_CLKREF_EN>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
+			reg = <0x0 0x01d84000 0x0 0x3000>;
+
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_cfg SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			operating-points-v2 = <&ufs_opp_table>;
+
+			iommus = <&apps_smmu 0x60 0>;
+
+			lanes-per-direction = <2>;
+			qcom,ice = <&ice>;
+
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+
+			#reset-cells = <1>;
+
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <300000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		ice: crypto@1d88000 {
+			compatible = "qcom,milos-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.52.0


