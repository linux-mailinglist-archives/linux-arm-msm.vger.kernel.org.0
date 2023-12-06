Return-Path: <linux-arm-msm+bounces-3562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE8580715C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 14:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04F93B20E67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE32241F4;
	Wed,  6 Dec 2023 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZm1jy6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F2ED4B
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 05:56:03 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so4430030a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 05:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701870963; x=1702475763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMcdBBTymYQ8stxAZh+Gyr3gy2kz6BQdvacn2e0KAuc=;
        b=FZm1jy6R9b7FaG1Dj/li5/k1MrCoGQkOcYDv7mWEcCCTcKGb6dFc/8iA5L8N5b6Dqd
         TUH4DiijXBdpqwLqzaEKVIxpvjbbGeTVWp+8bzIiWqLXuQzNIJRhGHZiNbMQPbPvTHkb
         S3thVMRjLp7iAocyMyudR2aeCwWwBPvlrYu7KbE3Ig106OCIRwrhJ+vw/TD/itAxBLU+
         f2OzzF1C2zIykwetkRZjJkH7iW1NVd7ZEVkJFXP97Tfi1hrj/E0PA4xBoJB1NHyDup8w
         dZaH5a0HdkAEiGfespGUpomla3i2xJ7UHmrQdA1PB+ZeXCNcyjVaDZlAL9YoNYuWGDYf
         Iz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870963; x=1702475763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMcdBBTymYQ8stxAZh+Gyr3gy2kz6BQdvacn2e0KAuc=;
        b=hX5CalLJPy0omCp80BYJHXll1i/ZY2cMUCZgeIyhOwrh+ZM1uCXFfrqYhwaCyfe5Uw
         Mv3++x+injR3NOzHrKjgIQk2MOfE2YSi1jc36+oa/CfgWAmqIitER8ArrEtgXf34Gd9c
         EBAmmgVAnuekc4My0KXbZgZ9rIM1RpcAfnDMWTNafIf5ZbQ6MxHlUeitZFAE/8keXaGj
         leUN7UXYZNqU5xoM/YbJfgJL4DfjGTVyUiZ/nqn5q3p/EhHAJK4LFj9eRygxjrgpBLGX
         2MYaNkuLVRCBKPDyrHnK+CKU1zkgR6oQbv4K/HvAu9nJRr0KtNUbnot3R3U7Jfto947D
         +BNA==
X-Gm-Message-State: AOJu0YyI/kZVMZM6QZ0c0SqTkoDgZfFpUpUnUga3LfB4yPQrjO9J6PDp
	vhT9EJQ62/SddOyo8Q6/4SHS
X-Google-Smtp-Source: AGHT+IFHOkCfVcExD7sFwmqv99wGXtv9rHvT6/OVtDO4Tqoy5/cgyA2L9FrWJr6EOEwnQPhtZNpozQ==
X-Received: by 2002:a05:6a21:3284:b0:18f:97c:8a17 with SMTP id yt4-20020a056a21328400b0018f097c8a17mr1056693pzb.66.1701870963025;
        Wed, 06 Dec 2023 05:56:03 -0800 (PST)
Received: from localhost.localdomain ([117.202.188.104])
        by smtp.gmail.com with ESMTPSA id n38-20020a056a000d6600b006ce91cdb1c4sm1366056pfv.188.2023.12.06.05.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:01 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	konrad.dybcio@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: Use "pcie" as the node name instead of "pci"
Date: Wed,  6 Dec 2023 19:25:39 +0530
Message-Id: <20231206135540.17068-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206135540.17068-1-manivannan.sadhasivam@linaro.org>
References: <20231206135540.17068-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qcom SoCs doesn't support the legacy PCI, but only PCIe. So use the correct
node name for the controller instances.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 8 ++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 6 +++---
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 4 ++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi  | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi  | 4 ++--
 13 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index e59b9df96c7e..c649744e8751 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -731,7 +731,7 @@ qrtr_requests {
 			};
 		};
 
-		pcie0: pci@20000000 {
+		pcie0: pcie@20000000 {
 			compatible = "qcom,pcie-ipq6018";
 			reg = <0x0 0x20000000 0x0 0xf1d>,
 			      <0x0 0x20000f20 0x0 0xa8>,
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 2f275c84e566..c6a96d8c9856 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -781,7 +781,7 @@ frame@b128000 {
 			};
 		};
 
-		pcie1: pci@10000000 {
+		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq8074";
 			reg = <0x10000000 0xf1d>,
 			      <0x10000f20 0xa8>,
@@ -842,7 +842,7 @@ IRQ_TYPE_LEVEL_HIGH>, /* int_c */
 			status = "disabled";
 		};
 
-		pcie0: pci@20000000 {
+		pcie0: pcie@20000000 {
 			compatible = "qcom,pcie-ipq8074-gen3";
 			reg = <0x20000000 0xf1d>,
 			      <0x20000f20 0xa8>,
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index b485bf925ce6..b6a3e6afaefd 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -933,7 +933,7 @@ anoc2_smmu: iommu@16c0000 {
 				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-msm8998", "qcom,pcie-msm8996";
 			reg = <0x01c00000 0x2000>,
 			      <0x1b000000 0xf1d>,
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 2721f32dfb71..6ac64ce9bb68 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1461,7 +1461,7 @@ glink-edge {
 			};
 		};
 
-		pcie: pci@10000000 {
+		pcie: pcie@10000000 {
 			compatible = "qcom,pcie-qcs404";
 			reg = <0x10000000 0xf1d>,
 			      <0x10000f20 0xa8>,
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index b6a93b11cbbd..d73fc3983709 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2409,7 +2409,7 @@ arch_timer: timer {
 			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	pcie0: pci@1c00000{
+	pcie0: pcie@1c00000{
 		compatible = "qcom,pcie-sa8775p";
 		reg = <0x0 0x01c00000 0x0 0x3000>,
 		      <0x0 0x40000000 0x0 0xf20>,
@@ -2509,7 +2509,7 @@ pcie0_phy: phy@1c04000 {
 		status = "disabled";
 	};
 
-	pcie1: pci@1c10000{
+	pcie1: pcie@1c10000{
 		compatible = "qcom,pcie-sa8775p";
 		reg = <0x0 0x01c10000 0x0 0x3000>,
 		      <0x0 0x60000000 0x0 0xf20>,
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 66f1eb83cca7..fb5e735247e7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2126,7 +2126,7 @@ wifi: wifi@17a10040 {
 			qcom,smem-state-names = "wlan-smp2p-out";
 		};
 
-		pcie1: pci@1c08000 {
+		pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sc7280";
 			reg = <0 0x01c08000 0 0x3000>,
 			      <0 0x40000000 0 0xf1d>,
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a34f438ef2d9..8bcc8c0bb0d0 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1684,7 +1684,7 @@ mmss_noc: interconnect@1740000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-sc8180x";
 			reg = <0 0x01c00000 0 0x3000>,
 			      <0 0x60000000 0 0xf1d>,
@@ -1781,7 +1781,7 @@ pcie0_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie3: pci@1c08000 {
+		pcie3: pcie@1c08000 {
 			compatible = "qcom,pcie-sc8180x";
 			reg = <0 0x01c08000 0 0x3000>,
 			      <0 0x40000000 0 0xf1d>,
@@ -1879,7 +1879,7 @@ pcie3_phy: phy@1c0c000 {
 			status = "disabled";
 		};
 
-		pcie1: pci@1c10000 {
+		pcie1: pcie@1c10000 {
 			compatible = "qcom,pcie-sc8180x";
 			reg = <0 0x01c10000 0 0x3000>,
 			      <0 0x68000000 0 0xf1d>,
@@ -1977,7 +1977,7 @@ pcie1_phy: phy@1c16000 {
 			status = "disabled";
 		};
 
-		pcie2: pci@1c18000 {
+		pcie2: pcie@1c18000 {
 			compatible = "qcom,pcie-sc8180x";
 			reg = <0 0x01c18000 0 0x3000>,
 			      <0 0x70000000 0 0xf1d>,
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf5e6eb9d313..cb3bfd262851 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2306,7 +2306,7 @@ opp-4 {
 			};
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-sdm845";
 			reg = <0 0x01c00000 0 0x2000>,
 			      <0 0x60000000 0 0xf1d>,
@@ -2405,7 +2405,7 @@ pcie0_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie1: pci@1c08000 {
+		pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sdm845";
 			reg = <0 0x01c08000 0 0x2000>,
 			      <0 0x40000000 0 0xf1d>,
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 97623af13464..43d56968a382 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1824,7 +1824,7 @@ dma@10a2000 {
 			      <0x0 0x010ad000 0x0 0x3000>;
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-sm8150";
 			reg = <0 0x01c00000 0 0x3000>,
 			      <0 0x60000000 0 0xf1d>,
@@ -1915,7 +1915,7 @@ pcie0_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie1: pci@1c08000 {
+		pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sm8150";
 			reg = <0 0x01c08000 0 0x3000>,
 			      <0 0x40000000 0 0xf1d>,
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index be970472f6c4..c1b7f9620ec6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2123,7 +2123,7 @@ mmss_noc: interconnect@1740000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-sm8250";
 			reg = <0 0x01c00000 0 0x3000>,
 			      <0 0x60000000 0 0xf1d>,
@@ -2227,7 +2227,7 @@ pcie0_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie1: pci@1c08000 {
+		pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sm8250";
 			reg = <0 0x01c08000 0 0x3000>,
 			      <0 0x40000000 0 0xf1d>,
@@ -2328,7 +2328,7 @@ pcie1_phy: phy@1c0e000 {
 			status = "disabled";
 		};
 
-		pcie2: pci@1c10000 {
+		pcie2: pcie@1c10000 {
 			compatible = "qcom,pcie-sm8250";
 			reg = <0 0x01c10000 0 0x3000>,
 			      <0 0x64000000 0 0xf1d>,
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index b46236235b7f..f4b8439200f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1498,7 +1498,7 @@ mmss_noc: interconnect@1740000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-sm8350";
 			reg = <0 0x01c00000 0 0x3000>,
 			      <0 0x60000000 0 0xf1d>,
@@ -1591,7 +1591,7 @@ pcie0_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie1: pci@1c08000 {
+		pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sm8350";
 			reg = <0 0x01c08000 0 0x3000>,
 			      <0 0x40000000 0 0xf1d>,
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 1783fa78bdbc..44a61fa2cc49 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1739,7 +1739,7 @@ spi14: spi@a98000 {
 			};
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-sm8450-pcie0";
 			reg = <0 0x01c00000 0 0x3000>,
 			      <0 0x60000000 0 0xf1d>,
@@ -1848,7 +1848,7 @@ pcie0_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie1: pci@1c08000 {
+		pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sm8450-pcie1";
 			reg = <0 0x01c08000 0 0x3000>,
 			      <0 0x40000000 0 0xf1d>,
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 7b9ddde0b2c9..baa8540868a4 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1677,7 +1677,7 @@ mmss_noc: interconnect@1780000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-sm8550";
 			reg = <0 0x01c00000 0 0x3000>,
@@ -1768,7 +1768,7 @@ pcie0_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie1: pci@1c08000 {
+		pcie1: pcie@1c08000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-sm8550";
 			reg = <0x0 0x01c08000 0x0 0x3000>,
-- 
2.25.1


