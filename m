Return-Path: <linux-arm-msm+bounces-7863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E083713E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 19:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AF752879B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39700495E3;
	Mon, 22 Jan 2024 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bzOYzRYo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468C5495DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705947728; cv=none; b=Am5U+x9cK+83vPjkLr5BXc4w68W14PoIlbTaMivfFHwZOHCxZyu9UktF3SWXLGUkBUWXJZIx6yt6L44i5koLwHt+4cuxFfAge21uBDADeDTKH2zyUaf2ETvsg7uXBw4Sp5U2uetbhheJv/fCgrX3oeF2z4KZbpP1xQckhM2Zbpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705947728; c=relaxed/simple;
	bh=LSfDWHWDoPCY7i+S7OjpOzqOfKjn9AL5nhhPZhwbX2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k2mvubLSY4/fo0FYUOJ4/x9mkMDZ8vqvURD8BEQY3wDU6IULFP/ipfdLDE95aw8tprP8Kf0Q08NQqz3fCqkRtlerc773xJtYY0CI20oGd9iMW+tr7Wvf2T3XN12oLavcimL78sSUA5DCBttKqdTpE9hdXqgZCtrjc3byS/v/jOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bzOYzRYo; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3387ef9fc62so3316445f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705947724; x=1706552524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hD656VMGPdcFDqM7HQuNuxK5UnGwzOpStyHwjoITBkk=;
        b=bzOYzRYoeyI+MgpjLPj8b1bp5Jo9qQ2KYzVX59nX4fAK7RY0jXPwKleBgemYgvkma7
         0LyUxoKsQRGqDoF5jiwboF6bd2dsLbBX/hKdQOUfp12E7qgtwNBnBfOWIrLknja2tEpt
         0uGxUGEPFx1NjmkazYiyi8YmAebD+SUfEBJoSCDdM8EMxA4tXQfs9j2AzV1Mws6Ymio3
         DYMk9cxnuIZykpLDaPseOaso3I1/2K1poQOGqtS406nzoutvv48ky3R8id0Plr3Npj9U
         vbJuOwIC27p5/1V4bUMNGV0Z7Vm27i5WjltKOLDXf0y94QFNdzSqHv2A6HQfa6KMXcUa
         vmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705947724; x=1706552524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hD656VMGPdcFDqM7HQuNuxK5UnGwzOpStyHwjoITBkk=;
        b=R11GXBI44mj5qrocDlfhmo7KOukEMP7jWXTEXpgNQR/h/sbc+itF2w5LJfT4JlNJYT
         KtBEVD+QuVMXi1bAl63WksNOkrM4j01Oeqtr6utdB9A9glQh8PiAo+BAidh6D/oxTZCs
         AaUFHYSBIvUAFNokIGRs30sZ0Mf0IPSr4IHVHY/6n6QZpkD2n8h0kVNyojhYus2sdCAN
         QrTv7rf213HpPfebPW3gGlgmHigjI2v9yrd88+3BOn+T5BKq8ZQpL/qKHO6EYjClfBBB
         BsbADtk4eSwSveLr1XNPoI4CTQSWlVsbaWnyW3gS33iPk+e/JMgqye8qhTmOx4Y1x1nY
         vbPw==
X-Gm-Message-State: AOJu0YxVxBL2Db1GXqfUO1M7sPGus9UQU/k+oicgJelljuePKUo/OR+E
	f1vuNNR6ifF46VbkFP5eGJWP782vC6lUIFIXPR2aahL/TljGapjRCNSL9IZfrQs=
X-Google-Smtp-Source: AGHT+IFxPoSiMcT4/JEGmI8dgXHEZUwZ8JMZUzniN5YAJO4EACKAzrcTf8uSlRJa/3r9rq6pgPrVWw==
X-Received: by 2002:a5d:4605:0:b0:336:7794:4b9a with SMTP id t5-20020a5d4605000000b0033677944b9amr2702554wrq.33.1705947724291;
        Mon, 22 Jan 2024 10:22:04 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:92a0:6172:d229:1898])
        by smtp.gmail.com with ESMTPSA id cp9-20020a056000400900b003392ded41c7sm5026003wrb.39.2024.01.22.10.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 10:22:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
Date: Mon, 22 Jan 2024 19:21:58 +0100
Message-Id: <20240122182158.69183-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm limiting the audience of this compared to the PCI power sequencing
series as I wanted to run the DT part by the maintainers before I commit
to a doomed effort.

Here is the DT representation of the QCA6390's PMU with its inputs and
outputs. If I were to implement the pwrseq framework that would be able
to assign the relevant pwrseq data to the consumer based on the actual
regulators and not abstract bt-pwrseq or wlan-pwrseq properties - would
that fly with you?

We'd need to deprecate the existing BT bindings but unfortunately they
are already described as consuming the host PMIC regulators in bindings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 129 +++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |  10 ++
 2 files changed, 128 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index cd0db4f31d4a..c9b1600c57ef 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -108,6 +108,88 @@ lt9611_3v3: lt9611-3v3 {
 		regulator-always-on;
 	};
 
+	qca6390_pmu: pmu@0 {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa1-supply = <&vreg_s2f_0p95>;
+		vddrfa2-supply = <&vreg_s8c_1p3>;
+		vddrfa3-supply = <&vreg_s5a_1p9>;
+		vddpcie1-supply = <&vreg_s8c_1p3>;
+		vddpcie2-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+		wifi-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+				regulator-min-microvolt = <760000>;
+				regulator-max-microvolt = <840000>;
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+				regulator-min-microvolt = <540000>;
+				regulator-max-microvolt = <840000>;
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator_name = "vreg_pmu_wlcx_0p8";
+				regulator-min-microvolt = <760000>;
+				regulator-max-microvolt = <840000>;
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <890000>;
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <890000>;
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+				regulator-min-microvolt = <760000>;
+				regulator-max-microvolt = <840000>;
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+				regulator-min-microvolt = <1187000>;
+				regulator-max-microvolt = <1313000>;
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator_name = "vreg_pmu_rfa_1p7";
+				regulator-min-microvolt = <1710000>;
+				regulator-max-microvolt = <1890000>;
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator_name = "vreg_pmu_pcie_0p9";
+				regulator-min-microvolt = <870000>;
+				regulator-max-microvolt = <970000>;
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator_name = "vreg_pmu_pcie_1p8";
+				regulator-min-microvolt = <1710000>;
+				regulator-max-microvolt = <1890000>;
+			};
+		};
+	};
+
 	thermal-zones {
 		conn-thermal {
 			polling-delay-passive = <0>;
@@ -734,6 +816,24 @@ &pcie0_phy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa2-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie1 {
 	status = "okay";
 };
@@ -1303,6 +1403,14 @@ sdc2_card_det_n: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	wlan_en_state: wlan-default-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
 };
 
 &uart6 {
@@ -1311,17 +1419,16 @@ &uart6 {
 	bluetooth {
 		compatible = "qcom,qca6390-bt";
 
-		pinctrl-names = "default";
-		pinctrl-0 = <&bt_en_state>;
-
-		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
-
-		vddio-supply = <&vreg_s4a_1p8>;
-		vddpmu-supply = <&vreg_s2f_0p95>;
-		vddaon-supply = <&vreg_s6a_0p95>;
-		vddrfa0p9-supply = <&vreg_s2f_0p95>;
-		vddrfa1p3-supply = <&vreg_s8c_1p3>;
-		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa2-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1-supply = <&vreg_pmu_pcie_1p8>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 760501c1301a..fef9c314ce55 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2197,6 +2197,16 @@ pcie0: pcie@1c00000 {
 			dma-coherent;
 
 			status = "disabled";
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie0_phy: phy@1c06000 {
-- 
2.40.1


