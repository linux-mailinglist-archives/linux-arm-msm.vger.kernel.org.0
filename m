Return-Path: <linux-arm-msm+bounces-34248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE91D99C2E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE3DD282117
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 08:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E887F1534FB;
	Mon, 14 Oct 2024 08:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htxK+5VX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F90142E6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 08:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728893989; cv=none; b=emIxA4mY8RxmaFMqAZ7LyaZIJvWS3jPZFzgNtWmirYrIdvgNxEscMcLZ72V3BvAK8zKtZC944CTph/IoZGvPedBHP5NjlGljGwyyUqSHfOL607TJ7tcMuPNrV4EyKwdOkWHxiIACh0v6rsCytPtMjBc7iQOmyy8CVeaaBw5pLGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728893989; c=relaxed/simple;
	bh=4VkCpW8QDcAjyN11pnkcHCM7wZTUs/xHfXdy554thg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1KwVTg3iBwVQMMypIwa99JeKBEmtOVM8O3DgqvtXu0cSIRsBYPnvZkdmtpg0Tq+5BWfB2JOOuAxLTJHSvcCt3vSa7yQrSr6nTt8JE2qXZeDkyJ6of+rjW/IVryEX1pou3uJi2Zww2SlFU6PtMdAEIpK1uZ7ZoIjeuaReK8WSPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htxK+5VX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so2892257f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728893986; x=1729498786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Pr5xKcTInMzCbHb8CZQ01ukvXjYk9ophuY57YiAzNc=;
        b=htxK+5VXiJocwNFNg+uOJ4Am56b47V4y22hr4oyAUNyWaZE7VVyiz6adpnLGKTx7pQ
         HIe3VESuZOaqtw4hlmHd01upDrRNQO/rsg1fsuFQVNuUvEMF4K5KmxxirbD/ErZB1Ig6
         lP/gZhY7F9iZCtDp9MXy2gQ9uNDzdEPPihUz4zS1YiF7+UnwMfNBeFwDQxbCFWbtLc4F
         THPxh36sYfF0qNe49iZCU+ZouxSrJg6CGPYO+T86zyjRI84QTrd9j+pu/3tUoFTclV3D
         e1iQpLDDbJOqR9fqVqPs21COuQPlswrNcK+RIQIPRgGoK2QH9KNjwlnM5sCOG1DdK/5u
         Ud1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728893986; x=1729498786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Pr5xKcTInMzCbHb8CZQ01ukvXjYk9ophuY57YiAzNc=;
        b=USBPsQy3zV7oGFAaPyWA/7OgERdXbQvO5OA6ShZp12dmcJGB5degVXsc3SsQP866Wa
         +hu37F+eMvtEmOsDJ5yxmDenrH0ldRY5bMdJBNk2mbCBEtNjT5z+Emu9Cr+Mx1txLuA+
         xVuyJDsOponZKkUo7DcxmxvEmIPE/gpDPDW0unPk/HefolWn/GqIMhLwk+IFLiDHBckA
         hdzvSFcHk++HQ4dJY4gdeWkAPZIVWTwnvEjfJR4oWC/GmBlxyjlfhmIJD3dS7O0EJ7lm
         X/t6SLC8LDqnlpVBOiypkxKctlC4UsH5PiHUQFMeRlkNoHxh16TSjU2gESG7vmH6peXL
         fcsg==
X-Forwarded-Encrypted: i=1; AJvYcCU+jdT0+1qiCGQFPcRLb0K9MhsLt/Eni1pU1qmT/o2e2DukwQg6Fe53Ooq9IeOWNRzesVtQ+Xk3S53XAfqG@vger.kernel.org
X-Gm-Message-State: AOJu0YxSiqxX8dAIXmv0l6J7Igz3OElKuQbfC2DSGw66vLJI1/b+FnOh
	z8xZ0pInaNQiW5lu7VRmKBTGfQdfmFNodK7K5REmEcW8Cf5EPfD86uKWNmAcGd4=
X-Google-Smtp-Source: AGHT+IGTRwN+f76A9WzqvosdEAiZdB/qwWsKiJOAckCa/UM14JgEkadN2d8lFMi7zwj2YQZBbMZhFA==
X-Received: by 2002:a5d:530a:0:b0:37d:377d:c7b0 with SMTP id ffacd0b85a97d-37d5519d618mr7757811f8f.18.1728893986090;
        Mon, 14 Oct 2024 01:19:46 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd04asm10715752f8f.27.2024.10.14.01.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:19:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 14 Oct 2024 11:19:24 +0300
Subject: [PATCH v2 1/3] arm64: dts: qcom: x1e80100: Describe the SDHC
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-x1e80100-qcp-sdhc-v2-1-868e70a825e0@linaro.org>
References: <20241014-x1e80100-qcp-sdhc-v2-0-868e70a825e0@linaro.org>
In-Reply-To: <20241014-x1e80100-qcp-sdhc-v2-0-868e70a825e0@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3660; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4VkCpW8QDcAjyN11pnkcHCM7wZTUs/xHfXdy554thg0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnDNQatl0+ZaxhTK6HrIKFMggJRViZ3svgxsFMs
 wG+/0xQq6KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZwzUGgAKCRAbX0TJAJUV
 Vnb9D/9vZhhnQGk3sjlZ48o7ve71Lc1FSN3Gyzt2CF8GgV/NQXnb4PUJ6A2EltVC08EUIzZe4/H
 HE1FIA5YXf5WWm7oWs8yeSF+pk95qZemVeq4hBBm2eaxEmpXotHaCiqWFUXB5/XvDYr9JXQbm8S
 fW0mXcjlyZhIj74XW94KIRKvUJAXFjuhpiVNzDQCf2ffYf4UZb5YlMD2V9M7gG7b+xf1YDfL14c
 2h612YmPx+Xq4ClKSI9Nl4W5CO8R1KfCVcxbBmI6por3uBiFakAVASfeYbWkM+0aartN74GCtm3
 N8lknpdsqLfLJQiX5lrcRCnoBj8ct5NtTd7Sqiw/qw6+AK0df5p+44AXT2ruyvyh6cdOo/MIe9Q
 qsxlOnMEfPV8RKhpTzWeepTYPB5AmJYjiYjhJ19oi6u4Y14na6fHf2+Wlm8REc9YrekvN+YSWTc
 d43Vni9tlxluSiH4cT+cR1AzFA9eiWSuM1uQc22lzmejZbGjZ6d8HvUavFZ1IKhbdXgxccNd+z/
 D6pT1hstMjS5TZzdWGzU2kUUmH56NtxZcFDCiMLrghqh9EBFqy84Vw+D/pBsuCzhoprfqV/+zVG
 cnTHk8DTm04Mc8QNmWRAVNcW0lGUJs5a0d0NAMEEIvIsZbbYnrpLLgkvzQlcvJuRDeKxRmdwf8m
 NtbX3Rdth9pCGvQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Describe the two SHDC v5 controllers found on x1e80100 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 102 +++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 0e6802c1d2d8375987c614ec69c440e2f38d25c6..2d0befd6ba0ea11fdf2305d23c0cd8743de303dc 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3887,6 +3887,108 @@ lpass_lpicx_noc: interconnect@7430000 {
 			#interconnect-cells = <2>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,x1e80100-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08804000 0 0x1000>;
+
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "core", "xo";
+			iommus = <&apps_smmu 0x520 0>;
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
+			bus-width = <4>;
+			dma-coherent;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmhpd_opp_min_svs>;
+				};
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
+		sdhc_4: mmc@8844000 {
+			compatible = "qcom,x1e80100-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08844000 0 0x1000>;
+
+			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC4_AHB_CLK>,
+				 <&gcc GCC_SDCC4_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "core", "xo";
+			iommus = <&apps_smmu 0x160 0>;
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc4_opp_table>;
+
+			interconnects = <&aggre2_noc MASTER_SDCC_4 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_4 0>;
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
+			bus-width = <4>;
+			dma-coherent;
+
+			status = "disabled";
+
+			sdhc4_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmhpd_opp_min_svs>;
+				};
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		usb_2_hsphy: phy@88e0000 {
 			compatible = "qcom,x1e80100-snps-eusb2-phy",
 				     "qcom,sm8550-snps-eusb2-phy";

-- 
2.34.1


