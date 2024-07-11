Return-Path: <linux-arm-msm+bounces-25952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD23992E548
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84BE0281818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB8215B0E5;
	Thu, 11 Jul 2024 10:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SG716DhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4116915A86E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720695542; cv=none; b=b5D/GtuhVnepEMS7SSKa5+jtob0bzzBy8wzzzJjVqHVaxcQYQvPrRMmzzWQawr0z8mu4QRwAfbP/06UAqZUDmZqgtXPNvfWLPH+V8KBT3o96lkrkRF9Ykz77G6ZFRQgY7bVhHrSi6jYF6rNU8jgmetcUfJiDBAudnOu6gIi/XGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720695542; c=relaxed/simple;
	bh=o5wmjjrS0U5dVav+92IGsPmpYlccYdlL2eO7w6/h1Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qN7hVBHxOAET+2h1hblOb5fjSYcHXLyTljyBHGv2NUv53zK1xg8fxXGOZnCkdmUAOUX00uM/NEo+MFcb1IsonOyPtpvuDItOu6RhwBR793YH8wqQP+0ppbsYceng6LgGvA9Q36NbPrZSJuAsPo3e2PoFhwgJTXUsGsLuxu4O8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SG716DhI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ea79e689eso1062346e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720695538; x=1721300338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRZQkTNZjsLuCasezyPCrKEKVyWJYvPN1YmP0VrOd88=;
        b=SG716DhIHjeLqUlxd2Jrb8PMwMyLy35/YtjCIkqJEo20XUydBVFKJiS6nQ5p33WQY5
         bR4IOeICAgXAqoDosa/MA0rOJbFPZXwFuYDlAtTe0DwcflYFGWBz5YY5IDzj6jL7T7eF
         wYXy1oHyep6R2/qlJ0CM1mbFA0x9LMGfo7P2PxgoWyQEO7wpNlJsYXZpHVbfHfGRSbRZ
         njjOUwxLBt7qQYeyoVfwVvoPIocKsUGWHE9uib130QoBx2+eS2FgJpddHt8/I5zCkWVl
         OLD1ZN6+0wd1gRZ0qrvYcSVj9avFoehnN611PY+qhGZjMHm4OmU8uRlgoMmHpVuCtC7Y
         HPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720695538; x=1721300338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRZQkTNZjsLuCasezyPCrKEKVyWJYvPN1YmP0VrOd88=;
        b=WnXxJoVSbBucvbTdJr9bCN0GxncRKrW1S5MIvIa+hEmUh+ivFxLwlXC5xwA/8OpPpR
         Nunv/VQISVL5RMioexjgHLhb6yNzOvSU5N+rRidiBqeyib4Q4519HKNXEkKncSjlesjh
         Ip5MU0zmhlmmRbIP3GmNc1gdGP1O3zBZ1swtnG99i5C9i0okl6+IFTRbyA8aihWQ/DH3
         +/jMxzik5YhSQjqMtjZMFCAnSl9wqpz+kKJySw2TGVDJQL6aOP2ThsZ0J63+G47amyyU
         etly51AE2eTeVsJRv/fbpcuv4C2fb4/l7S/TKNZkvf10mfASrL8cQLkCFtSy0Tlebmv9
         nBZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3/6mUdlNhDPlBWr3vqRcqZ2AjDb1R6kDt0PAnPR1qQv+92QSuIWadZBdogZtLEXJY1l7YpJaWBKQjrk1vLCTtmJyGz98Q4CNTgFCVOg==
X-Gm-Message-State: AOJu0YySZxZxNDjBGC3E1wFWYOJlYu1YKEDqQVupJmnO2c4RqhyeZfEe
	59mWF4/T9alBDHWz+Txf3RYVcWxPU90OFNRDNUfU8nyNct81MVyIEZXtzOkMick=
X-Google-Smtp-Source: AGHT+IEF9wvlnvvFUWUZi8NqcwbGeBGoD4ZWjsTKI8p5uJ3qILXRhPu+GBSzmLrXexXHZQDnIDl5yA==
X-Received: by 2002:a19:7508:0:b0:52c:e1cd:39bd with SMTP id 2adb3069b0e04-52eb9991e39mr5920243e87.13.1720695538187;
        Thu, 11 Jul 2024 03:58:58 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a871f2fsm244209966b.202.2024.07.11.03.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:58:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 11 Jul 2024 12:58:46 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100: Fix up hex style
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-topic-hhh-v1-1-a1b6b716685f@linaro.org>
References: <20240711-topic-hhh-v1-0-a1b6b716685f@linaro.org>
In-Reply-To: <20240711-topic-hhh-v1-0-a1b6b716685f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720695535; l=7801;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=o5wmjjrS0U5dVav+92IGsPmpYlccYdlL2eO7w6/h1Rg=;
 b=i+fqq4StFGLGiBh/G+E0+LqkhN/ESlSwCL/bSutssHNRPLAZG7ZEtd+nRnsVwp4vH46sbXvvU
 7tI+HWFYAmSAY5s5dQ7elGkanILMtmFdUsT1bxNY37doY18QKraBdcm
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Adhere to the convention: pad the addresses to 8 hex digits and use
lowercase letters.

Compile tested, no difference.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 78 +++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 7bca5fcd7d52..919500f562c3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -1979,7 +1979,7 @@ qupv3_0: geniqup@bc0000 {
 
 			i2c0: i2c@b80000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0 0xb80000 0 0x4000>;
+				reg = <0 0x00b80000 0 0x4000>;
 
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 
@@ -2144,7 +2144,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 
 			spi2: spi@b88000 {
 				compatible = "qcom,geni-spi";
-				reg = <0 0xb88000 0 0x4000>;
+				reg = <0 0x00b88000 0 0x4000>;
 
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 
@@ -2243,7 +2243,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 
 			i2c4: i2c@b90000 {
 				compatible = "qcom,geni-i2c";
-				reg = <0 0xb90000 0 0x4000>;
+				reg = <0 0x00b90000 0 0x4000>;
 
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 
@@ -2772,7 +2772,7 @@ usb_1_ss2_qmpphy_dp_in: endpoint {
 
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,x1e80100-cnoc-main";
-			reg = <0 0x1500000 0 0x14400>;
+			reg = <0 0x01500000 0 0x14400>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2781,7 +2781,7 @@ cnoc_main: interconnect@1500000 {
 
 		config_noc: interconnect@1600000 {
 			compatible = "qcom,x1e80100-cnoc-cfg";
-			reg = <0 0x1600000 0 0x6600>;
+			reg = <0 0x01600000 0 0x6600>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2790,7 +2790,7 @@ config_noc: interconnect@1600000 {
 
 		system_noc: interconnect@1680000 {
 			compatible = "qcom,x1e80100-system-noc";
-			reg = <0 0x1680000 0 0x1c080>;
+			reg = <0 0x01680000 0 0x1c080>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2799,7 +2799,7 @@ system_noc: interconnect@1680000 {
 
 		pcie_south_anoc: interconnect@16c0000 {
 			compatible = "qcom,x1e80100-pcie-south-anoc";
-			reg = <0 0x16c0000 0 0xd080>;
+			reg = <0 0x016c0000 0 0xd080>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2808,7 +2808,7 @@ pcie_south_anoc: interconnect@16c0000 {
 
 		pcie_center_anoc: interconnect@16d0000 {
 			compatible = "qcom,x1e80100-pcie-center-anoc";
-			reg = <0 0x16d0000 0 0x7000>;
+			reg = <0 0x016d0000 0 0x7000>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2817,7 +2817,7 @@ pcie_center_anoc: interconnect@16d0000 {
 
 		aggre1_noc: interconnect@16e0000 {
 			compatible = "qcom,x1e80100-aggre1-noc";
-			reg = <0 0x16E0000 0 0x14400>;
+			reg = <0 0x016e0000 0 0x14400>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2826,7 +2826,7 @@ aggre1_noc: interconnect@16e0000 {
 
 		aggre2_noc: interconnect@1700000 {
 			compatible = "qcom,x1e80100-aggre2-noc";
-			reg = <0 0x1700000 0 0x1c400>;
+			reg = <0 0x01700000 0 0x1c400>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2835,7 +2835,7 @@ aggre2_noc: interconnect@1700000 {
 
 		pcie_north_anoc: interconnect@1740000 {
 			compatible = "qcom,x1e80100-pcie-north-anoc";
-			reg = <0 0x1740000 0 0x9080>;
+			reg = <0 0x01740000 0 0x9080>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2844,7 +2844,7 @@ pcie_north_anoc: interconnect@1740000 {
 
 		usb_center_anoc: interconnect@1750000 {
 			compatible = "qcom,x1e80100-usb-center-anoc";
-			reg = <0 0x1750000 0 0x8800>;
+			reg = <0 0x01750000 0 0x8800>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2853,7 +2853,7 @@ usb_center_anoc: interconnect@1750000 {
 
 		usb_north_anoc: interconnect@1760000 {
 			compatible = "qcom,x1e80100-usb-north-anoc";
-			reg = <0 0x1760000 0 0x7080>;
+			reg = <0 0x01760000 0 0x7080>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2862,7 +2862,7 @@ usb_north_anoc: interconnect@1760000 {
 
 		usb_south_anoc: interconnect@1770000 {
 			compatible = "qcom,x1e80100-usb-south-anoc";
-			reg = <0 0x1770000 0 0xf080>;
+			reg = <0 0x01770000 0 0xf080>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -2871,7 +2871,7 @@ usb_south_anoc: interconnect@1770000 {
 
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,x1e80100-mmss-noc";
-			reg = <0 0x1780000 0 0x5B800>;
+			reg = <0 0x01780000 0 0x5B800>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -3337,7 +3337,7 @@ gem_noc: interconnect@26400000 {
 
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,x1e80100-nsp-noc";
-			reg = <0 0x320C0000 0 0xE080>;
+			reg = <0 0x320C0000 0 0xe080>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -3671,7 +3671,7 @@ data-pins {
 
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,x1e80100-lpass-ag-noc";
-			reg = <0 0x7e40000 0 0xE080>;
+			reg = <0 0x07e40000 0 0xe080>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -3680,7 +3680,7 @@ lpass_ag_noc: interconnect@7e40000 {
 
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,x1e80100-lpass-lpiaon-noc";
-			reg = <0 0x7400000 0 0x19080>;
+			reg = <0 0x07400000 0 0x19080>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -3689,7 +3689,7 @@ lpass_lpiaon_noc: interconnect@7400000 {
 
 		lpass_lpicx_noc: interconnect@7430000 {
 			compatible = "qcom,x1e80100-lpass-lpicx-noc";
-			reg = <0 0x7430000 0 0x3A200>;
+			reg = <0 0x07430000 0 0x3A200>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -4202,11 +4202,11 @@ opp-575000000 {
 
 			mdss_dp0: displayport-controller@ae90000 {
 				compatible = "qcom,x1e80100-dp";
-				reg = <0 0xae90000 0 0x200>,
-				      <0 0xae90200 0 0x200>,
-				      <0 0xae90400 0 0x600>,
-				      <0 0xae91000 0 0x400>,
-				      <0 0xae91400 0 0x400>;
+				reg = <0 0x0ae90000 0 0x200>,
+				      <0 0x0ae90200 0 0x200>,
+				      <0 0x0ae90400 0 0x600>,
+				      <0 0x0ae91000 0 0x400>,
+				      <0 0x0ae91400 0 0x400>;
 
 				interrupts-extended = <&mdss 12>;
 
@@ -4285,11 +4285,11 @@ opp-810000000 {
 
 			mdss_dp1: displayport-controller@ae98000 {
 				compatible = "qcom,x1e80100-dp";
-				reg = <0 0xae98000 0 0x200>,
-				      <0 0xae98200 0 0x200>,
-				      <0 0xae98400 0 0x600>,
-				      <0 0xae99000 0 0x400>,
-				      <0 0xae99400 0 0x400>;
+				reg = <0 0x0ae98000 0 0x200>,
+				      <0 0x0ae98200 0 0x200>,
+				      <0 0x0ae98400 0 0x600>,
+				      <0 0x0ae99000 0 0x400>,
+				      <0 0x0ae99400 0 0x400>;
 
 				interrupts-extended = <&mdss 13>;
 
@@ -4368,11 +4368,11 @@ opp-810000000 {
 
 			mdss_dp2: displayport-controller@ae9a000 {
 				compatible = "qcom,x1e80100-dp";
-				reg = <0 0xae9a000 0 0x200>,
-				      <0 0xae9a200 0 0x200>,
-				      <0 0xae9a400 0 0x600>,
-				      <0 0xae9b000 0 0x400>,
-				      <0 0xae9b400 0 0x400>;
+				reg = <0 0x0ae9a000 0 0x200>,
+				      <0 0x0ae9a200 0 0x200>,
+				      <0 0x0ae9a400 0 0x600>,
+				      <0 0x0ae9b000 0 0x400>,
+				      <0 0x0ae9b400 0 0x400>;
 
 				interrupts-extended = <&mdss 14>;
 
@@ -4450,11 +4450,11 @@ opp-810000000 {
 
 			mdss_dp3: displayport-controller@aea0000 {
 				compatible = "qcom,x1e80100-dp";
-				reg = <0 0xaea0000 0 0x200>,
-				      <0 0xaea0200 0 0x200>,
-				      <0 0xaea0400 0 0x600>,
-				      <0 0xaea1000 0 0x400>,
-				      <0 0xaea1400 0 0x400>;
+				reg = <0 0x0aea0000 0 0x200>,
+				      <0 0x0aea0200 0 0x200>,
+				      <0 0x0aea0400 0 0x600>,
+				      <0 0x0aea1000 0 0x400>,
+				      <0 0x0aea1400 0 0x400>;
 
 				interrupts-extended = <&mdss 15>;
 

-- 
2.45.2


