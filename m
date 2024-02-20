Return-Path: <linux-arm-msm+bounces-11950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74085CBC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 00:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40CCF285933
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0E5154455;
	Tue, 20 Feb 2024 23:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P23I9IZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC2C15444E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708470446; cv=none; b=clBGssgFIPAWFeG2V8p6D6L/+0sI0aN3ttxxowMUoCDuIJ0K/e4qZO0a0foydsz6F2JFUGlyVa/Jkhr65Ipou7/6yjHy/JPTmp3H4MqoH7oyiv3MxcxSrvfG8sD55M/Wq3zllpgsDS9Pr/G9SpaSLCX9VnHRFfIVnWymdUZ1qec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708470446; c=relaxed/simple;
	bh=IYip2Wx7dk5gwWQ/fUsW18KvKvQrghN4e6MTBS3JgIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dP5ZRFZr/EVx+WUneF5HHZphG87jSKdayNljTewhGb4NSKnAxPrRzdwOTrsmauuipOTN5mvf5bIl9ZKHWhes3GTIerXT8UtVOWPPHd6xnQTkefukc3PcLoNo1u4mxnLdnLHjkCUa1umSRqJnOwvblIHMok7dB9b643+CM9P0ovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P23I9IZG; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d208d0b282so81035761fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 15:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708470442; x=1709075242; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTY2PI/F0z9kRH62MCu7NJkhk16ZMim814nwwpVNCeA=;
        b=P23I9IZGDJglWkPLifUtayKHcNumn4ZZzeNJhH2AXx31dyycpfEmqjAN74vHuJH0dW
         8ydtUnf6Bfz9Skk72X0Vw+MzOAJHXKZSlwVd8KSNiUjXzbXaNli1OgPBAh0ldM4UNNcj
         PsnxrOiTzEdWvlYqAch5lDkt+kskcJ3+8Pea0ORxEjDCFoSebUzRHgP5RZvR7EgbAVoO
         Tvz/cFDs4UpgmdPWG9j7xkDK5kkWlH9qh50s2+v/+AYfsOFsIsnVQICUJ90u9q4HIipB
         qj2jgVnIq5MX1lHywY05vzDtRxB1NYlZPrj2xMKDheFhSpIb9rZvXCN3Oy4ouUMjtiqp
         M/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708470442; x=1709075242;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTY2PI/F0z9kRH62MCu7NJkhk16ZMim814nwwpVNCeA=;
        b=I3OtoBbrGWbkcIvOkNRo11I3Ap4cI/LhZW3ObkkrBPPstLgWvVqcbH2sCwTdyg28nB
         oxpKy+FQcPYBe6+NFExPIUNPnO8OSXjRLVxFlrC9fVXfQAVYaN2OjFHVZaH3WNT5+u7c
         NqioZZEJBEU3fL2fmPil0bVNYpLo1lopf7q95l7AfIUd0oR2AMOZxEy4hYpjQOAd/+T1
         oKlO1Q7LjDs7Jmi/EEP9Tj6Ni1m9G0HvK6zZTGWizrOjXElx3CiOs8Tr6qMSZRtBlHwI
         M8D2v22kZ1QfV9+1gE8VNipwssali+SnesbZ+fZNrj7o69hSWI0Twyfh6k/i9FUGXxqH
         bjgQ==
X-Gm-Message-State: AOJu0Ywd7VA8HYnwxmda/2y6iiRHN7yzZ8RN288VQlr1Wld9tcUyM41i
	Da0a45iHNQftHnCQq+eo2vorJv/j+79aPLHi5atwtsRF/L8LoFKcnRtUU1yJXcc=
X-Google-Smtp-Source: AGHT+IHCkci+hhbYEL40QKZfMzcDSV/2LblGkBpAuplfcTIs2OorTZALGn8KjIfBLhnF926yHaZh+w==
X-Received: by 2002:a05:6512:3890:b0:512:9857:34f3 with SMTP id n16-20020a056512389000b00512985734f3mr8089569lft.39.1708470442512;
        Tue, 20 Feb 2024 15:07:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512024400b00512be5256f5sm608835lfo.282.2024.02.20.15.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 15:07:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:07:21 +0200
Subject: [PATCH] Revert "arm64: dts: qcom: msm8996: Hook up MPM"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-msm8996-revert-mpm-v1-1-cdca9e30c9b4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKgw1WUC/x2MywqAIBAAf0X23IIuYY9fiQ6WW+3BCo0Iwn9PO
 g7MzAuJo3CCXr0Q+ZYkx17AVArmze0ro/jCQJpqTWQwpNB2ncUic7wwnAEbPxmmicnWDkp4Rl7
 k+afDmPMHdZyEQmQAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IYip2Wx7dk5gwWQ/fUsW18KvKvQrghN4e6MTBS3JgIw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1TCpvVMA8uCTE0dSRzFoL+QHiDa3HJHrtKXhE
 +b0E7CQUYCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdUwqQAKCRCLPIo+Aiko
 1VOcCACCV0n75HBY5AGl3LCDV37vif9Kn4Llf+c5BkSrVVk7QY9HD5fOJm2a/AxgZcLHd9Tj+Wb
 LmC4WgfozGqRvZfPIiIXhZXDeIF73pR4LYhUKhbjYuzdJEd7z43JnS1WGAfmVrkh8o0bYh/rgtS
 MizzpSFSG5YVM+LF8gq/l+aVtl39iQBVOPnjlvQZPKp+1UAr07yZMZ8EtwhYEjxfd5Ig6d2dCp5
 DqfiOOQUqlWHmt1jzERHZ72/NoJBmRfM3W4zPNXW26Gp1CAkzcT/HhniemIwE2wTkCGvVI8z/qs
 xk0Ae6bbL6b8b1GkMYR/vd1ywHUuufIteqFvVcghsBTGPnID
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Commit 09896da07315 ("arm64: dts: qcom: msm8996: Hook up MPM") has
hooked up the MPM irq chip on the MSM8996 platform. However this causes
my Dragonboard 820c crash during bootup (usually when probing IOMMUs).
Revert the offending commit for now. Quick debug shows that making
tlmm's wakeup-parent point to the MPM is enough to trigger the crash.

Fixes: 09896da07315 ("arm64: dts: qcom: msm8996: Hook up MPM")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 39 ++++++-----------------------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index dddb07f774b4..80d83e01bb4d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -457,25 +457,6 @@ modem_etm_out_funnel_in2: endpoint {
 		};
 	};
 
-	mpm: interrupt-controller {
-		compatible = "qcom,mpm";
-		qcom,rpm-msg-ram = <&apss_mpm>;
-		interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
-		mboxes = <&apcs_glb 1>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		#power-domain-cells = <0>;
-		interrupt-parent = <&intc>;
-		qcom,mpm-pin-count = <96>;
-		qcom,mpm-pin-map = <2 184>,  /* TSENS1 upper_lower_int */
-				   <52 243>, /* DWC3_PRI ss_phy_irq */
-				   <79 347>, /* DWC3_PRI hs_phy_irq */
-				   <80 352>, /* DWC3_SEC hs_phy_irq */
-				   <81 347>, /* QUSB2_PHY_PRI DP+DM */
-				   <82 352>, /* QUSB2_PHY_SEC DP+DM */
-				   <87 326>; /* SPMI */
-	};
-
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -765,15 +746,8 @@ pciephy_2: phy@3000 {
 		};
 
 		rpm_msg_ram: sram@68000 {
-			compatible = "qcom,rpm-msg-ram", "mmio-sram";
+			compatible = "qcom,rpm-msg-ram";
 			reg = <0x00068000 0x6000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x00068000 0x7000>;
-
-			apss_mpm: sram@1b8 {
-				reg = <0x1b8 0x48>;
-			};
 		};
 
 		qfprom@74000 {
@@ -856,8 +830,8 @@ tsens1: thermal-sensor@4ad000 {
 			reg = <0x004ad000 0x1000>, /* TM */
 			      <0x004ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
-			interrupts-extended = <&mpm 2 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
@@ -1363,7 +1337,6 @@ tlmm: pinctrl@1010000 {
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			gpio-ranges = <&tlmm 0 0 150>;
-			wakeup-parent = <&mpm>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -1891,7 +1864,7 @@ spmi_bus: spmi@400f000 {
 			      <0x0400a000 0x002100>;
 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
 			interrupt-names = "periph_irq";
-			interrupts-extended = <&mpm 87 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ee = <0>;
 			qcom,channel = <0>;
 			#address-cells = <2>;
@@ -3052,8 +3025,8 @@ usb3: usb@6af8800 {
 			#size-cells = <1>;
 			ranges;
 
-			interrupts-extended = <&mpm 79 IRQ_TYPE_LEVEL_HIGH>,
-					      <&mpm 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hs_phy_irq", "ss_phy_irq";
 
 			clocks = <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,

---
base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
change-id: 20240221-msm8996-revert-mpm-7db1e2be264a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


