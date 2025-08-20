Return-Path: <linux-arm-msm+bounces-69942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 754CEB2D957
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F01C0188D568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CCB2DF3EA;
	Wed, 20 Aug 2025 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fmBEwbZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2112D94BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755683372; cv=none; b=I/kzo90V7iXYLDEBWmKZ/OB8hyiUwUL8DO22vZWvv9skQZs48ChQWKc+u33U3vZ/F0NC22mhJU6kNVigGYiE2CQuER49GpUnJIMP+Hm8VmJ2lu+FAxUJ68XmF5pGbLSIHcCdkSf6PAFgK2gxdNkzaMprEQaLgasPVgTq2aiuX6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755683372; c=relaxed/simple;
	bh=nEvJ4fFaaqSqFMmRjXbKxL85MI6XU0ukTu5GgPzmGE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U83jb9+u0Po93586xYW9lOyl6gA0+qzDCVd0mhuO+THfs3WFJ1MagYqoQ6riHewIPk0Il8Y2oyDiP1VMZ8ywk+bg9QUz7dKGZQTfMdvj5t3K8y6y5wBIurncXzf0pUMoF4ish3TpIp/7bUck5WePw8Vp9Zwrb8Cvkm8pBDf9oys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fmBEwbZW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9ba300cb9so507845f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755683366; x=1756288166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8iJCD4F4YaOtpMuC3qUN5sdv808v3nzUKz0MmsoLAk=;
        b=fmBEwbZW56Jvu64yKd+0DkniHd70zVzh4qmjQbTMmzjZrKKYs9cHFT5CT/lbz4GRH0
         mFESEGKHlCGX1mwN6E9BMgn6bF/zeqQiyMVeJWxJVOewM7vG4N4gjwhc+Vij5b10/VsR
         B2KNnlWILjVYKZgT70Q4wIod71ELXIYMceEhhTQgJZWZ9mM5G9S2phT88JKcnZbXiRgS
         juiAj8YRXRXgGbRqRbRLFfNkQ6KNEXthtcJlt5W/GPYMRUjmwFy4VV6fr5pTN1bHny/X
         KSYhwfnZ9K0zs28HH/B+tc+/jP6REVECZ3Od5EgsZBF+DC3FCHYxrz4v4fITBmNR5L1N
         zbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755683366; x=1756288166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8iJCD4F4YaOtpMuC3qUN5sdv808v3nzUKz0MmsoLAk=;
        b=roHWZ3S92GVTLXGR+pRRyqY6ao/gz7iWTXGwgomNZ5NzupS5iXn8UUmTltfxVI+RtZ
         LSegFRJEL4JTSrlbql9onOP6KKUjHKBSEQIJGfg68yqq3zpINBz4yGEWQpvMhZ+mMCsw
         VptxLNMTLCvizi5QnxVU9rPgYSvYojqrsB6oqaZZwIIzzOiECKXEhWsxl3UfO9O1ghg4
         o/rtfNXQVmMsa8V2GQH60VvKqPUfi0tbxXLFxEkZxJUbL/hQg635Rp/7KQrPGWyBfdvP
         d4FMyGigBM8/H8XPg2Mq38/YB9nLHNSHVvd3/DOTTY4wkaJgyOC/Pw8tmP9TezoeR4Ks
         OmmQ==
X-Gm-Message-State: AOJu0YyctojmFtzpKYfE/SRDykc9l7Sg3XquGAFL5m10vlWLV/QACSL2
	paGewHmNC6HB7djt5oUEH14Ki33dKIku3ixgPaFGyFYjmgoX1mbFys3YrOeHT1jDvU0=
X-Gm-Gg: ASbGnctilCREt5Mh9R5EnFyfHluBrUbV+wE9/MfsWa4MGdqfbj6cCTe21oUeB6Dd60Q
	jGpOQVaSkfrm35Wsz7kfvXgAnCE8hwjJo/nARz/b5+SaXIBv5ciSEwXNUUKn4masYDEoPkns36v
	cgNpTEW6/U3NwLjMkygfj+YJxtZAtqD1y3pvM8MV+ndjoUbEunCM8d1IdOeZC1IVJlYoOmTvfWq
	Lk4mGHiScck4GDgmI81lpMzXAADs+JrY/rODs+plNI9sIoGBMKCF9b6gRslBXw7+8p33Qrt9Lfq
	WV3pwneGlmz+nDC+TNpo2Fr1t9mK8p2zZEbfg7T0ao8QdFjvC+JmS2+ldKaxqAB3Oia1jUU9fJq
	O4H6vmO88S+XLxtgPXY0SwxxVtP/9h40eCQkXPMF+Mk8=
X-Google-Smtp-Source: AGHT+IF3zk/h+cu+ZqDpwaMS/1TLj2U6KenkheAgX7Nt2Z7bt2CEJutn9OYeQEo6YHmQagoLlekbWA==
X-Received: by 2002:a05:6000:24c6:b0:3b7:8071:f902 with SMTP id ffacd0b85a97d-3c3147b501cmr1693483f8f.13.1755683366431;
        Wed, 20 Aug 2025 02:49:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0754f3b7esm6721228f8f.30.2025.08.20.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:49:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 20 Aug 2025 11:49:22 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sm8550: switch to interrupt-cells 4
 to add PPI partitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-topic-sm8550-upstream-pmu-ppi-4-cells-v1-1-a8915672e996@linaro.org>
References: <20250820-topic-sm8550-upstream-pmu-ppi-4-cells-v1-0-a8915672e996@linaro.org>
In-Reply-To: <20250820-topic-sm8550-upstream-pmu-ppi-4-cells-v1-0-a8915672e996@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=52745;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nEvJ4fFaaqSqFMmRjXbKxL85MI6XU0ukTu5GgPzmGE4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopZokeMmfn+NE8knc5DgBjuxPWdu0mXZNksx6m0RN
 qyHyGbSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKWaJAAKCRB33NvayMhJ0Y8kD/
 9QoJFhEXR3YxOnB2TbSbx0qmzLe0hdvZ/RYE1UboVE6R2Qms0wClo5nFyEYo9l60z+SigqsEUSuE1g
 hsV+jVsSpKLsMB1DcqteGl+lPekr3dSqTZZBLQs6xtjMYgyXCpPEyeC5cEir38dVa1VHQLOjjEif9n
 afNW7VbVW9Ih82qghDr6PpYruBV984c0ocnSvoenhadeuyyxq4howpvQvL0WaMbQ2NmvXvS58iNfqE
 1dQ7XDjHAPfkeaaE0GxBguqdcfWzXXTlBo0CCAKlJTg9jt8yXkolwlp/pw85P+M8eA/YUNnXENp7IV
 bejbh7WAqlB0BmpT4vbqpyndI2D/aSuYtBHe+SUZV8B1HhtH5h4KpnBI2PGmjtt7PW1gSKqMr2kDZG
 e2P2gdt4FfE/gbrlrfUlWaZCJgJ1+kuFWw8hWpKW4jaOix/we+AWFwBNmSBNqLJbGrgD7X1ZwO9v3J
 aqcG5VjZJOrey3vauMfK0Ld27wETTA0zbGSuRuAY1dOwVz9Q3om57OtdG5C48V4rz0LvxmcIes/TF1
 P4Anpodl6dY5+ckTtTBkY6kk4s+G5Bn9hzAASEoV2tk2c7REeP0NKhjZFlR1Lqtju5boQNB42P3BM1
 dMZxFLDSLYngH1C7mq/lSX78RmlXsNy8939ellbl/gSp0mGh6NG/jnATXg+Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
to interrupt-cells = <4> in the GIC node to allow adding an interrupt
partition map phandle as the 4th cell value for GIC_PPI interrupts.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 580 +++++++++++++++++------------------
 1 file changed, 290 insertions(+), 290 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 38d139d1dd4a994287c03d064ca01d59a11ac771..2ebe02e2ca8c03ac9b987af720c7ebe1cd63afec 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -399,22 +399,22 @@ memory@a0000000 {
 
 	pmu-a510 {
 		compatible = "arm,cortex-a510-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 
 	pmu-a710 {
 		compatible = "arm,cortex-a710-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 
 	pmu-a715 {
 		compatible = "arm,cortex-a715-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 
 	pmu-x3 {
 		compatible = "arm,cortex-x3-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 
 	psci {
@@ -842,7 +842,7 @@ gcc: clock-controller@100000 {
 		ipcc: mailbox@408000 {
 			compatible = "qcom,sm8550-ipcc", "qcom,ipcc";
 			reg = <0 0x00408000 0 0x1000>;
-			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
 			#mbox-cells = <2>;
@@ -852,18 +852,18 @@ gpi_dma2: dma-controller@800000 {
 			compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
 			#dma-cells = <3>;
 			reg = <0 0x00800000 0 0x60000>;
-			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH 0>;
 			dma-channels = <12>;
 			dma-channel-mask = <0x3e>;
 			iommus = <&apps_smmu 0x436 0>;
@@ -891,7 +891,7 @@ i2c8: i2c@880000 {
 				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c8_data_clk>;
-				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -914,7 +914,7 @@ spi8: spi@880000 {
 				reg = <0 0x00880000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
-				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -941,7 +941,7 @@ i2c9: i2c@884000 {
 				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c9_data_clk>;
-				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -964,7 +964,7 @@ spi9: spi@884000 {
 				reg = <0 0x00884000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
-				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -991,7 +991,7 @@ i2c10: i2c@888000 {
 				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c10_data_clk>;
-				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1014,7 +1014,7 @@ spi10: spi@888000 {
 				reg = <0 0x00888000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
-				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1041,7 +1041,7 @@ i2c11: i2c@88c000 {
 				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c11_data_clk>;
-				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1064,7 +1064,7 @@ spi11: spi@88c000 {
 				reg = <0 0x0088c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
-				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1091,7 +1091,7 @@ i2c12: i2c@890000 {
 				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c12_data_clk>;
-				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1114,7 +1114,7 @@ spi12: spi@890000 {
 				reg = <0 0x00890000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
-				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1141,7 +1141,7 @@ i2c13: i2c@894000 {
 				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c13_data_clk>;
-				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1164,7 +1164,7 @@ spi13: spi@894000 {
 				reg = <0 0x00894000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
-				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1191,7 +1191,7 @@ uart14: serial@898000 {
 				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart14_default>, <&qup_uart14_cts_rts>;
-				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -1209,7 +1209,7 @@ i2c15: i2c@89c000 {
 				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c15_data_clk>;
-				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1232,7 +1232,7 @@ spi15: spi@89c000 {
 				reg = <0 0x0089c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
-				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
@@ -1271,7 +1271,7 @@ i2c_hub_0: i2c@980000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c0_data_clk>;
-				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1292,7 +1292,7 @@ i2c_hub_1: i2c@984000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c1_data_clk>;
-				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1313,7 +1313,7 @@ i2c_hub_2: i2c@988000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c2_data_clk>;
-				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1334,7 +1334,7 @@ i2c_hub_3: i2c@98c000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c3_data_clk>;
-				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1355,7 +1355,7 @@ i2c_hub_4: i2c@990000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c4_data_clk>;
-				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1376,7 +1376,7 @@ i2c_hub_5: i2c@994000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c5_data_clk>;
-				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1397,7 +1397,7 @@ i2c_hub_6: i2c@998000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c6_data_clk>;
-				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1418,7 +1418,7 @@ i2c_hub_7: i2c@99c000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c7_data_clk>;
-				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1439,7 +1439,7 @@ i2c_hub_8: i2c@9a0000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c8_data_clk>;
-				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1460,7 +1460,7 @@ i2c_hub_9: i2c@9a4000 {
 					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&hub_i2c9_data_clk>;
-				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1478,18 +1478,18 @@ gpi_dma1: dma-controller@a00000 {
 			compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
 			#dma-cells = <3>;
 			reg = <0 0x00a00000 0 0x60000>;
-			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH 0>;
 			dma-channels = <12>;
 			dma-channel-mask = <0x1e>;
 			iommus = <&apps_smmu 0xb6 0>;
@@ -1520,7 +1520,7 @@ i2c0: i2c@a80000 {
 				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c0_data_clk>;
-				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1543,7 +1543,7 @@ spi0: spi@a80000 {
 				reg = <0 0x00a80000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
-				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1570,7 +1570,7 @@ i2c1: i2c@a84000 {
 				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c1_data_clk>;
-				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1593,7 +1593,7 @@ spi1: spi@a84000 {
 				reg = <0 0x00a84000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
-				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1620,7 +1620,7 @@ i2c2: i2c@a88000 {
 				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c2_data_clk>;
-				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1643,7 +1643,7 @@ spi2: spi@a88000 {
 				reg = <0 0x00a88000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
-				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1670,7 +1670,7 @@ i2c3: i2c@a8c000 {
 				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c3_data_clk>;
-				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1693,7 +1693,7 @@ spi3: spi@a8c000 {
 				reg = <0 0x00a8c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
-				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1720,7 +1720,7 @@ i2c4: i2c@a90000 {
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c4_data_clk>;
-				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1743,7 +1743,7 @@ spi4: spi@a90000 {
 				reg = <0 0x00a90000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
-				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1770,7 +1770,7 @@ i2c5: i2c@a94000 {
 				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c5_data_clk>;
-				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -1793,7 +1793,7 @@ spi5: spi@a94000 {
 				reg = <0 0x00a94000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
-				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1820,7 +1820,7 @@ i2c6: i2c@a98000 {
 				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c6_data_clk>;
-				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -1843,7 +1843,7 @@ spi6: spi@a98000 {
 				reg = <0 0x00a98000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
-				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
@@ -1870,7 +1870,7 @@ uart7: serial@a9c000 {
 				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart7_default>;
-				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH 0>;
 				interconnect-names = "qup-core", "qup-config";
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
@@ -1961,15 +1961,15 @@ pcie0: pcie@1c00000 {
 			linux,pci-domain = <0>;
 			num-lanes = <2>;
 
-			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -1981,10 +1981,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH 0>, /* int_a */
+					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH 0>, /* int_b */
+					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH 0>, /* int_c */
+					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH 0>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
@@ -2122,15 +2122,15 @@ pcie1: pcie@1c08000 {
 			linux,pci-domain = <1>;
 			num-lanes = <2>;
 
-			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -2142,10 +2142,10 @@ pcie1: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH 0>, /* int_a */
+					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH 0>, /* int_b */
+					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH 0>, /* int_c */
+					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH 0>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
@@ -2280,7 +2280,7 @@ pcie1_phy: phy@1c0e000 {
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
-			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
 			#dma-cells = <1>;
 			qcom,ee = <0>;
 			qcom,num-ees = <4>;
@@ -2327,7 +2327,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8550-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;
-			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
 			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
@@ -2440,7 +2440,7 @@ gpu: gpu@3d00000 {
 				    "cx_mem",
 				    "cx_dbgc";
 
-			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
 
 			iommus = <&adreno_smmu 0 0x0>,
 				 <&adreno_smmu 1 0x0>;
@@ -2521,8 +2521,8 @@ gmu: gmu@3d6a000 {
 			      <0x0 0x0b280000 0x0 0x10000>;
 			reg-names = "gmu", "rscc", "gmu_pdc";
 
-			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "hfi", "gmu";
 
 			clocks = <&gpucc GPU_CC_AHB_CLK>,
@@ -2583,32 +2583,32 @@ adreno_smmu: iommu@3da0000 {
 			reg = <0x0 0x03da0000 0x0 0x40000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
-			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
 				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
 				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
@@ -2633,8 +2633,8 @@ ipa: ipa@3f40000 {
 				    "ipa-shared",
 				    "gsi";
 
-			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
-					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING 0>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0>,
 					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ipa",
@@ -2666,7 +2666,7 @@ remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8550-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x10000>;
 
-			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING 0>,
 					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -2854,7 +2854,7 @@ lpass_wsa2macro: codec@6aa0000 {
 		swr3: soundwire@6ab0000 {
 			compatible = "qcom,soundwire-v2.0.0";
 			reg = <0 0x06ab0000 0 0x10000>;
-			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&lpass_wsa2macro>;
 			clock-names = "iface";
 			label = "WSA2";
@@ -2898,7 +2898,7 @@ lpass_rxmacro: codec@6ac0000 {
 		swr1: soundwire@6ad0000 {
 			compatible = "qcom,soundwire-v2.0.0";
 			reg = <0 0x06ad0000 0 0x10000>;
-			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&lpass_rxmacro>;
 			clock-names = "iface";
 			label = "RX";
@@ -2956,7 +2956,7 @@ lpass_wsamacro: codec@6b00000 {
 		swr0: soundwire@6b10000 {
 			compatible = "qcom,soundwire-v2.0.0";
 			reg = <0 0x06b10000 0 0x10000>;
-			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&lpass_wsamacro>;
 			clock-names = "iface";
 			label = "WSA";
@@ -2986,8 +2986,8 @@ swr0: soundwire@6b10000 {
 		swr2: soundwire@6d30000 {
 			compatible = "qcom,soundwire-v2.0.0";
 			reg = <0 0x06d30000 0 0x10000>;
-			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "core", "wakeup";
 			clocks = <&lpass_txmacro>;
 			clock-names = "iface";
@@ -3169,8 +3169,8 @@ sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8550-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
 
-			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "hc_irq", "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
@@ -3225,7 +3225,7 @@ iris: video-codec@aa00000 {
 			compatible = "qcom,sm8550-iris";
 
 			reg = <0 0x0aa00000 0 0xf0000>;
-			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
 
 			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
 					<&videocc VIDEO_CC_MVS0_GDSC>,
@@ -3317,7 +3317,7 @@ videocc: clock-controller@aaf0000 {
 		cci0: cci@ac15000 {
 			compatible = "qcom,sm8550-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac15000 0 0x1000>;
-			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING 0>;
 			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,
@@ -3350,7 +3350,7 @@ cci0_i2c1: i2c-bus@1 {
 		cci1: cci@ac16000 {
 			compatible = "qcom,sm8550-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac16000 0 0x1000>;
-			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING 0>;
 			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,
@@ -3376,7 +3376,7 @@ cci1_i2c0: i2c-bus@0 {
 		cci2: cci@ac17000 {
 			compatible = "qcom,sm8550-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac17000 0 0x1000>;
-			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING 0>;
 			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,
@@ -3521,24 +3521,24 @@ camss: isp@acb7000 {
 				      "vfe_lite_cphy_rx",
 				      "vfe_lite_csid";
 
-			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 602 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING 0>;
 			interrupt-names = "csid0",
 					  "csid1",
 					  "csid2",
@@ -3635,7 +3635,7 @@ mdss: display-subsystem@ae00000 {
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
-			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
@@ -4107,9 +4107,9 @@ usb_1: usb@a600000 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
 					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
@@ -4192,8 +4192,8 @@ tsens0: thermal-sensor@c271000 {
 			reg = <0 0x0c271000 0 0x1000>, /* TM */
 			      <0 0x0c222000 0 0x1000>; /* SROT */
 			#qcom,sensors = <16>;
-			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
@@ -4203,8 +4203,8 @@ tsens1: thermal-sensor@c272000 {
 			reg = <0 0x0c272000 0 0x1000>, /* TM */
 			      <0 0x0c223000 0 0x1000>; /* SROT */
 			#qcom,sensors = <16>;
-			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
@@ -4214,8 +4214,8 @@ tsens2: thermal-sensor@c273000 {
 			reg = <0 0x0c273000 0 0x1000>, /* TM */
 			      <0 0x0c224000 0 0x1000>; /* SROT */
 			#qcom,sensors = <16>;
-			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
@@ -4259,7 +4259,7 @@ spmi_bus: spmi@c400000 {
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,sm8550-tlmm";
 			reg = <0 0x0f100000 0 0x300000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH 0>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -4953,103 +4953,103 @@ apps_smmu: iommu@15000000 {
 			reg = <0 0x15000000 0 0x100000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
-			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH 0>;
 			dma-coherent;
 		};
 
@@ -5058,11 +5058,11 @@ intc: interrupt-controller@17100000 {
 			reg = <0 0x17100000 0 0x10000>,		/* GICD */
 			      <0 0x17180000 0 0x200000>;	/* GICR * 8 */
 			ranges;
-			#interrupt-cells = <3>;
+			#interrupt-cells = <4>;
 			interrupt-controller;
 			#redistributor-regions = <1>;
 			redistributor-stride = <0 0x40000>;
-			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW 0>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 
@@ -5085,49 +5085,49 @@ frame@17421000 {
 				reg = <0x17421000 0x1000>,
 				      <0x17422000 0x1000>;
 				frame-number = <0>;
-				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
 			};
 
 			frame@17423000 {
 				reg = <0x17423000 0x1000>;
 				frame-number = <1>;
-				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
 				status = "disabled";
 			};
 
 			frame@17425000 {
 				reg = <0x17425000 0x1000>;
 				frame-number = <2>;
-				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
 				status = "disabled";
 			};
 
 			frame@17427000 {
 				reg = <0x17427000 0x1000>;
 				frame-number = <3>;
-				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
 				status = "disabled";
 			};
 
 			frame@17429000 {
 				reg = <0x17429000 0x1000>;
 				frame-number = <4>;
-				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
 				status = "disabled";
 			};
 
 			frame@1742b000 {
 				reg = <0x1742b000 0x1000>;
 				frame-number = <5>;
-				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
 				status = "disabled";
 			};
 
 			frame@1742d000 {
 				reg = <0x1742d000 0x1000>;
 				frame-number = <6>;
-				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
 				status = "disabled";
 			};
 		};
@@ -5140,9 +5140,9 @@ apps_rsc: rsc@17a00000 {
 			      <0 0x17a20000 0 0x10000>,
 			      <0 0x17a30000 0 0x10000>;
 			reg-names = "drv-0", "drv-1", "drv-2", "drv-3";
-			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>;
 			qcom,tcs-offset = <0xd00>;
 			qcom,drv-id = <2>;
 			qcom,tcs-config = <ACTIVE_TCS    3>, <SLEEP_TCS     2>,
@@ -5239,9 +5239,9 @@ cpufreq_hw: cpufreq@17d91000 {
 			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
 			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
 			clock-names = "xo", "alternate";
-			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1", "dcvsh-irq-2";
 			#freq-domain-cells = <1>;
 			#clock-cells = <1>;
@@ -5250,7 +5250,7 @@ cpufreq_hw: cpufreq@17d91000 {
 		pmu@24091000 {
 			compatible = "qcom,sm8550-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0 0x24091000 0 0x1000>;
-			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>;
 			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 
@@ -5300,7 +5300,7 @@ opp-8 {
 		pmu@240b6400 {
 			compatible = "qcom,sm8550-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0 0x240b6400 0 0x600>;
-			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH 0>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
 
@@ -5356,7 +5356,7 @@ system-cache-controller@25000000 {
 				    "llcc3_base",
 				    "llcc_broadcast_base",
 				    "llcc_broadcast_and_base";
-			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
 		nsp_noc: interconnect@320c0000 {
@@ -5370,7 +5370,7 @@ remoteproc_cdsp: remoteproc@32300000 {
 			compatible = "qcom,sm8550-cdsp-pas";
 			reg = <0x0 0x32300000 0x0 0x10000>;
 
-			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING 0>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -6552,9 +6552,9 @@ trip-point2 {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
 	};
 };

-- 
2.34.1


