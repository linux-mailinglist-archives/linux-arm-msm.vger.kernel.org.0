Return-Path: <linux-arm-msm+bounces-89425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C33D1D3306F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D352E311F0B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FAF397ABF;
	Fri, 16 Jan 2026 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cJEbdhGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F253E394493
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575059; cv=none; b=Q7l4f6iN65PpCvPEJuyT0MURlCLepDdj531kzfrbLBcxzrTH/7OHUxFfSkFgVaFYAe4QPryWc4jcScUd/PoOmIBU9qTJKDee3M6m6y4tgyeF9V1WLLrmzamrUCCM+xDELosQFNQwmr157yMV3jHT3rHWC7fB6GUnGUmQuYUVl8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575059; c=relaxed/simple;
	bh=ECsvfV6QjoeNkmRwISP9U3VOBdhyVRqc0C5tYiyxtrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WeUCsAqZBmJ2jsEvWwGSGXawTkhNafV1nkxzihbWkRYAIUnvMCbpiu8sUi7M+CaJW7FHgiwLIf0GIH8/zByla0LrTcn2f0e/Tj2nDEgUvmrdGgrr+oXLpa+xY/y3lDYJTc0MjeAfvA7tRT5oaGVew4oGzUhq7httGPLzAfFiUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cJEbdhGH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-655ae329d6bso1322936a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575054; x=1769179854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTdhlSQh9bgg1HQ8ddUGd/f3OaTyJXLPCOZMlEFvb88=;
        b=cJEbdhGHH6rxy3wFK9xhsc8KeJo9SeDaEyRWz2v7hb16lEPBaJadWBvfmWmzeYf422
         qyYgCba9F+SVxSKre2PK+WlgVBcDEMKTkjglfXHb0hRcUJlKsxXiQ+i3v6wTMMa19ubO
         NMZnBQXuhfDtVimOUeeqdDwLyANbHuu69lt91AXs3jp5pNXPHfW0oAdSJYhKm5kYJ6wh
         ddsr5TNu1WgYMLokkLzPRj1NI3E868nANpmLOxsRbH3X6DrRslJBRYcA98gz6yYdHqMP
         uCebs3Ck/C2xvAzCcWf8TDtL5bkNZm+bnX/FJDzqwK6JS673AfF18FUzrwXKeGhN0Rbb
         JXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575054; x=1769179854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTdhlSQh9bgg1HQ8ddUGd/f3OaTyJXLPCOZMlEFvb88=;
        b=OoAd1fITMatYzLo6UUlxi/GpvKpZ5j+wuWxtBLIGyb3DT+ZNXTcA1sVyjE89KaQJAh
         /vHWSasash+8Ysk2ICFLxlbuoXFfuMz82My1gcbfYofybWPQ1B1EXRUil76n+1oJH71/
         +W6CYMhho8teARWwzwP8H4TpVJ7UyNUGbpWvjCiJq0kbkMfSaKIC+k+nUVGS9f6LMkFY
         BJK7DawFhgFp5R45Ai4Y0sM9ipGGgvL7REy1yGhoAiPUQvYl9+KrubqAlaz0s2GY5b6M
         xZzU7PLvsNQzDiD5xLdSt+pfxmzwKb11wuTWBrwI41qrKq1WDK1XB/tDujCtS+wozJ3L
         Du+w==
X-Forwarded-Encrypted: i=1; AJvYcCVIRl/HsTq2gj18LrZQlkrOTuKYUrOWiF4gfezBGKsbuKPCDlqeoGSIrxrcmAfI7clsxFGSzksRHA7FvFy/@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqW6dYJgXpHQbF9alCmHBd5UvFRCMTkXldQT6lCC1Z+dns0NM
	CryCXh4yuNhgtW88tbmI4XR1fE9/ESEI/TLLhNgP3p24aNSpGDlug4qdQPjvoCqQB3c=
X-Gm-Gg: AY/fxX4wWU64reP5wpaKNzwa38oRwa7sVfEKvI+60h3lR/ZDsxvkwVmGN6JJ690Nm8n
	PzKOfMNjK+UjQBRQD15yoe+jrYdbYA91G4xR2s7DxHKfLx0E2JzqUsYShXBgM3QlYrQr6Krkn4c
	2UL9klWo/x/ngmLF83DRNqlfBIBWm7SUG5ekKfi6NWPVTEtUZCkNeo4lfjokZ38QOPro9SNUqC8
	S7FMBr3IPTrfXYW0i33enWzLUg7G680WXP51bWua4mofr3GtoQ1kdMAS40XCs+r2QGk770P3Ero
	1C5j85TirL8CcIkevY0JN2GEbsbSYmWteYqlXdnof6Pn6qAQdCxrWmufC2VsKNKj/sneYi4D5HF
	z9yPIgZfu0fIyIIgk2Sn6XsekpnvjQYVImeCKEjIgRTr5zUpOjIObV8MZsNmJQrY2/YKNbITaSm
	PgcFuXEYaxxgsjKNk9j1cKxOrius3WY/2/bd6AAnMVmHwta/UF5oQbkqnynMAXejX9
X-Received: by 2002:a17:907:c1d:b0:b87:205c:1aa7 with SMTP id a640c23a62f3a-b8796b7933cmr215966066b.44.1768575054091;
        Fri, 16 Jan 2026 06:50:54 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm2699427a12.10.2026.01.16.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:50:53 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 15:50:50 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768575048; l=5608;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ECsvfV6QjoeNkmRwISP9U3VOBdhyVRqc0C5tYiyxtrY=;
 b=7lXxhGjRCr8WtGvgaxkho7Yp5VCGBVEM1BfXLvX3i4NOkj71PFC7pJhHndMs9D7l76s8W1jyk
 JCu5+QRmj+eC4ATaX1KTJhRG/53uz8hwmtEGWI8EctBQWPPiQRLie0C
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
parts.

Thanks to Alexander Koskovich for helping with the bringup, adding
'clocks' to the PMU node to make Bluetooth work.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 52895dd9e4fa..cbe1507b0aaa 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -24,6 +24,7 @@ / {
 
 	aliases {
 		serial0 = &uart5;
+		serial1 = &uart11;
 	};
 
 	gpio-keys {
@@ -215,6 +216,67 @@ trip1 {
 			};
 		};
 	};
+
+	wcn6750-pmu {
+		compatible = "qcom,wcn6750-pmu"; /* WCN6755 */
+
+		vddaon-supply = <&vreg_s3b>;
+		vddasd-supply = <&vreg_l7b>;
+		vddpmu-supply = <&vreg_s3b>;
+		vddrfa0p8-supply = <&vreg_s3b>;
+		vddrfa1p2-supply = <&vreg_s2b>;
+		vddrfa1p7-supply = <&vreg_s1b>;
+		vddrfa2p2-supply = <&vreg_s1j>;
+
+		bt-enable-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		pinctrl-0 = <&bluetooth_enable_default>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -690,6 +752,39 @@ &pon_resin {
 	status = "okay";
 };
 
+&qup_uart11_cts {
+	/*
+	 * Configure a bias-bus-hold on CTS to lower power
+	 * usage when Bluetooth is turned off. Bus hold will
+	 * maintain a low power state regardless of whether
+	 * the Bluetooth module drives the pin in either
+	 * direction or leaves the pin fully unpowered.
+	 */
+	bias-bus-hold;
+};
+
+&qup_uart11_rts {
+	/* We'll drive RTS, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart11_rx {
+	/*
+	 * Configure a pull-up on RX. This is needed to avoid
+	 * garbage data when the TX pin of the Bluetooth module is
+	 * in tri-state (module powered off or not driving the
+	 * signal yet).
+	 */
+	bias-pull-up;
+};
+
+&qup_uart11_tx {
+	/* We'll drive TX, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -748,6 +843,59 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	qup_uart11_sleep_cts: qup-uart11-sleep-cts-state {
+		pins = "gpio48";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart11_sleep_rts: qup-uart11-sleep-rts-state {
+		pins = "gpio49";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart11_sleep_tx: qup-uart11-sleep-tx-state {
+		pins = "gpio50";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart11_sleep_rx: qup-uart11-sleep-rx-state {
+		pins = "gpio51";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio53";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -767,6 +915,32 @@ &uart5 {
 	status = "okay";
 };
 
+&uart11 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
+			      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 =  <&qup_uart11_sleep_cts>,
+		     <&qup_uart11_sleep_rts>,
+		     <&qup_uart11_sleep_tx>,
+		     <&qup_uart11_sleep_rx>;
+	pinctrl-names = "default",
+			"sleep";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6750-bt"; /* WCN6755 */
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 

-- 
2.52.0


