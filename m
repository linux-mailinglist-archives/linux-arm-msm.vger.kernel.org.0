Return-Path: <linux-arm-msm+bounces-48787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C6A3EB12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AB6D7A2CF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB441F0E4E;
	Fri, 21 Feb 2025 03:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJIXdnMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F81EC011
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107182; cv=none; b=pcZtkr581eKAtPYwcdFGeY9GJuHBtiV1NfKz4JTYtG3PtSZFrqFrreNCbd0Qkv2lZx0NRhhuHqsMNGOukcd7jora8O1jFLupz4Qjs+O1bOlfk4tKpNWoOT+PR6QBEqj0AV9dP4Z3ODMr5BqUcDpS2FYWmiolh6S3uWPuJ7WevHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107182; c=relaxed/simple;
	bh=b6PLMBw7yyw15o3VEzosQAWxFJYLV5zXvl5ZUGHocbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tTti31abUzCCBl7fnr9/y9vdBVr1zAaaDSQkOJdyC0nCrKTSrZaemc89Cuhuc9iGvcdpDf2s9WTjlpNogFcBbeZ/vnvwcwqf8XJlHRBKXbxbDPWBjIK0g00iHSlyJKjxbNRiJBP7+hWt9ClUwI76ZkpSj8af1bGxNum0cimue/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJIXdnMh; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30a303a656aso16302061fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 19:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740107178; x=1740711978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hf+01lWdYqM6cH2pf9TEQebVcTlfAkpm0nesnJVjo8c=;
        b=fJIXdnMhnFFRD7MiHalQg29wbAstLuu+0VUc2u1aA4KK0VsZnW/SLBt8863ph6InV2
         NNHIAucXAgzm2mjTCAzpLlN/RY7s8XrYO9EoRhjYAzSoCGsG8T4QNj+o6a/1IGrh4wYT
         m8WlfKRJfTMl4KRnBziHHLYynqtQH1yducUjdHdimnHCks/lnfDW1NuHOarolN+7Rzj0
         x7Vartn/NCd0MRKfwgUuof1vtkYtV/IMbONd8F0Elrb2ai4x331mMD3UsovnmQrDvCqw
         nRUDRUkEA7PoZf02CKEN9MZ0y4KqgjGkCVH5Rm/q0nethq21sqD+ztflzSLJgcTpl7aP
         Zy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740107178; x=1740711978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hf+01lWdYqM6cH2pf9TEQebVcTlfAkpm0nesnJVjo8c=;
        b=O1iYu1+uD4QBDm6daKpNPS9OGbYQkvbnh7NSxaGZIEWdrE6DHNp/9NwoOxS1V5Kjp+
         EcVTrDGijIyQgg9eznAzv6PBZGfC4FHVz9KVne+mkEos7zOaEizaBezihl+bDSZOpzy6
         7VwSh9MNTId9R+UOCHFzrySJl4jouuy019TY5VYfytlF5IB6Bw8zEwCK8h3SdHH6qo9v
         YIM+unMZd/gDM5f4T5UemNz/HjfhZhklGy5NHdMPwzydWVgG5IfCQ9uC/AG2rkIvsCeP
         IHnbHJdjNJus8cgtLeRYJJYl/9K5PTApWPv4aWuQpo2/kz94zrsxG8Xz2yhHGZbOK+JE
         DJ0w==
X-Forwarded-Encrypted: i=1; AJvYcCWl0uuHlBfT1bcC+NAj7d4yIh15qoYoTdjV8r9N5wvu4Td/yK2H21iETPxHfnR1gFlbE9UxKHg/WnsGr7qW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxj/54tYfM0R6EzXNbpEooKv07ASBxCG9PePNRExDvxxKu3zS9
	lkn9fcUBzYFmKUStLMHrCMyRPFLe8QzmZtfclkDQPYszp8ZSKEhjpamp+6sjr8o=
X-Gm-Gg: ASbGncvRrIOcb+oYU7Nokr3Khjf/5X7IyKxETMHdq85oSjgjz6XNmjVQen0yc9bI1SY
	rVBEDIxWC09uFh5DtQ0z1NZoALpppPcDfzomFuKdvhDhW6WwbZe4qpP/EGWh3lSTwEyI7T6w13h
	x/XdO7XgTprfVLZ3Vx9sUBD96cVUiMjkSh5TcohXFa3FBzCS2Kyy14PLnBff6ghBVeZSTBza446
	vEhYu4ff5rTa0hJlfRmu+aVaa1KQybpGDc7/LN9IThu9vN0PQjB4uQ9H09kXy/Ncfpx1fB8xpkL
	mvGPMps7fQjRJM8YOEX/iWUXwWlrGKefWHf12TIh3k3nQP1z/97jzPZmgEw+ZkgCJw85Aw==
X-Google-Smtp-Source: AGHT+IFIkUTVECcUanvIgEQylzLf9cAeuyCvSYP0ViEN5AYii2FSHeNuyGSW+Wo3XvGPACfY4hAK+Q==
X-Received: by 2002:a2e:9dd1:0:b0:302:22e6:5f8 with SMTP id 38308e7fff4ca-30a5b1a0abbmr2867681fa.22.1740107177715;
        Thu, 20 Feb 2025 19:06:17 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2be45876sm16021071fa.68.2025.02.20.19.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 19:06:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Feb 2025 05:06:04 +0200
Subject: [PATCH v2 5/6] arm64: dts: qcom: sar2130p: add PCIe EP device
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-sar2130p-pci-v2-5-cc87590ffbeb@linaro.org>
References: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
In-Reply-To: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2669;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b6PLMBw7yyw15o3VEzosQAWxFJYLV5zXvl5ZUGHocbU=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnt+2b+vvnC24YRd+vl6st9IhT/q4OakLKzn3F1
 t8d/ehBxPaJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7ftmwAKCRAU23LtvoBl
 uAF/EACctPzzgaDqLQSaaREFQA19W77YUO8fSLwo3g+BSjaRWIwdGGBwAYYblO6NDQbrbFBLBeR
 8eF7IJ8kUlXvnyu4KSXXIgnDBBz/WLUuMTMRnpceYGLb6tyTDwD0Xud9/6KLl4MUSMPB1wEAZuq
 46ejpKeBjz+WebjjgGHhJBTJENBluVHXQxAmY775Xz4kzri80ApF2jPAp+r01yDYx3/pT9x+ssa
 WjwgRG5QcB9Bk6RL4HtvK67DeDuIOmlcNr/LiByWzyHdCjKGciVB4wU+rmOeQqX1OVrHR8nN17E
 RGpX+V/T/aTMo5brQIb7qpppdLjQYIbqavISKKvkffR9xNsNJoMC+qfXrfsGWeSTW+WJB6gYagz
 83JFjAlhFRv020J13Xo37JZih7UakHZqu+OPRTLv037h5WCuMsGpI9S4RwzMrmqr3eQmVvCqi31
 mi7tozjx5CIq01SxleumvS+dGtxZEgmMg8i50tUkYZZkoB6piCFSpGjhESpdIMoMqBzJPB/Zdqr
 lWJwJvnj7ZuvqyNWkmNgwglr5yzaL+JxPo7VVpjmPaiDRzKSzMd85Rr2JV+55MC18H3REqLbJlW
 uIgAW70fhj9sjmdql0B0oJ49fFyXkTnkckt4NRoNfGMJSpRpui/adCnNj5hMuLxlsJ/Jnv8p+MY
 zcyXB9UJ+LWiNjg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the Qualcomm AR2 Gen1 platform the second PCIe host can be used
either as an RC or as an EP device. Add device node for the PCIe EP.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index dd832e6816be85817fd1ecc853f8d4c800826bc4..b45e9e2ae0357bd0c7d719eaf4fc1faa1cf913f2 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1474,6 +1474,67 @@ pcie@0 {
 			};
 		};
 
+		pcie1_ep: pcie-ep@1c08000 {
+			compatible = "qcom,sar2130p-pcie-ep";
+			reg = <0x0 0x01c08000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf1d>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x1000>,
+			      <0x0 0x40200000 0x0 0x1000000>,
+			      <0x0 0x01c0b000 0x0 0x1000>,
+			      <0x0 0x40002000 0x0 0x2000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "addr_space",
+				    "mmio",
+				    "dma";
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
+				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>,
+				 <&gcc GCC_QMIP_PCIE_AHB_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ddrss_sf_tbu",
+				      "aggre_noc_axi",
+				      "cnoc_sf_axi",
+				      "qmip_pcie_ahb";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global",
+					  "doorbell",
+					  "dma";
+
+			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+			iommus = <&apps_smmu 0x1e00 0x1>;
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc PCIE_1_GDSC>;
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+
+			num-lanes = <2>;
+
+			status = "disabled";
+		};
+
 		pcie1_phy: phy@1c0e000 {
 			compatible = "qcom,sar2130p-qmp-gen3x2-pcie-phy";
 			reg = <0x0 0x01c0e000 0x0 0x2000>;

-- 
2.39.5


