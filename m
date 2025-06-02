Return-Path: <linux-arm-msm+bounces-60031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C626ACA9B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 09:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44CE83A54E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 07:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F1E1A238F;
	Mon,  2 Jun 2025 07:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTrGvzpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C874C1A238E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 07:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748848307; cv=none; b=arX44hWThg4cBNrrYPIgWjZAXvUNu+baWQmLIvATBGDdr3vCg/riPYwKZaNm7Y6OVkxhhVg6SkbhfUwgFlHcdZSFvQZ9l+ZPkMuCWQwQS8mi9YviS8WS4U6rKU3IVp3CIrSmgJ/+hADRQKxyZChVrKj5jZDAnRDsQKSOsnDQr/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748848307; c=relaxed/simple;
	bh=cu1sXjgaDULmicmQwddWkrNWtnsOpukyMF6L94/zDIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OGaDfckmmbaWGc5UQlDBPW3aVDarQAC2hXnE49Hk7RuUN5bq9U7DFBAroRboyzSiSVcInz3RUEOZbXqmsR2onMsNhsZgeE7G3Ajb68biXuucamKNB3LY87mrKWemwjrcNwlZZjJ+YHXn+4vVaagkQJ+xnRw6dHfY2OTiSMFre4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTrGvzpQ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73972a54919so3391370b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 00:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748848304; x=1749453104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKULbz2N9vJKRfwolVzqK3QqjstwBOVNVYHvvznhShY=;
        b=HTrGvzpQBAnkoZiYILxhbi4gqUgM73vB/BYMZjHb7t+CdCSCp0PTVCGjEzkDVzcO0L
         UPNLZJxu2IyWN3i4RJgiOHaXvUty4+NgFf1slM/n3gpbtlpV0Agnfnedl0Kq14kHn2D8
         gUJ3xrQF2bQeLTBa30zpamemVhhnIai2kh3rtK7LyM2QE3JFsXRUKeiqX1Q924dp7rDR
         wp9L9O3gCFSJK/bjAzRiYbNOjy2RxRaK6f0VyRqzCwgu94+JGf9rWPpI8JUukN9SBL3z
         JJ6Y2Q+xIbhPKx4lAgNz3V4Uxy91nXmc3BNy7dX9OOVV5Zds9moJCRRcU8IBT1nigJqW
         sVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748848304; x=1749453104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKULbz2N9vJKRfwolVzqK3QqjstwBOVNVYHvvznhShY=;
        b=jaYX257dRbVkVFh1fcjeuNVCfTn1Re3M3pwwBqjoU+58QIGL2ytyj2l63oIqLZUmp4
         orw8hyYzkFEQE+wjBnhBKB6PQlBLl5elkG4x9QD/WqsLFvowMpc7ZPQZpWSy6nfLJ+Zq
         0JxD6j3N6ZR8s5dJ9zNE/qFYy1geh3Th5McWaEXMUTxNjZJKX92l73BtpihF1NPBVrUs
         x6sBK7JPmgt2++5/Qe9F3Y3TcWI7EfesvEDd3Y4gQc5yhcKk9HKbtyMULguuL8bNucE0
         Y5SmXCXvgEM/shuXddqaZa2Gxangi0Ur52C2j0Nq67tUtam0zBjLPGm4dBIEALIWYJsU
         jFEQ==
X-Gm-Message-State: AOJu0YzYk1Q5ZV4anyRhHYX239ZDrN6DJfWpKKDjsxTJRQUS1pOZ3M0S
	gzHJeLFTKqw4/65jOnZxmHEJypICLJBxc3ROWy8zpNjXkKqaaNkW+7NPCEsMNYxfoJY=
X-Gm-Gg: ASbGncsI9Sgry5bnG7jTaWZzMkC+FvigwCFzHhzIDQV3rDg8BfVnJ0lC9NQPgU425Nc
	EI2L3GG3hH45Lx09IvGuyc1eAihNCMG4ADImQchNIUGqOf43+HH6TwF2jKzD4KkbNOJnKHeM70D
	VLILOre5WKaOzCXIA7FwSylcLVdEPNc5YTfZxBTgfHkk7xhnT579Mfa3AckOBunT1VuaUVhJoiA
	nzEG6WdSQt3J0HHBgpPXGQ/rNPnj4BiYPrkci4hTNLHN5NHh5YPsmoPa64UAKT5mA7eFiL6PwjQ
	WHFWjYrrfTtl6tl8byMmnBXXXezjTQn9xO4lGn+czRjFNH7c2DfCkL0uofDLcjfE7lCeKoFJDwm
	OBHOHN29p2S48pH02mpdFZsdbB4nSvGzv8IplrRkpyaEfg1gmRPjXmoRKGwI3tSb0IAgFNApUj+
	B5
X-Google-Smtp-Source: AGHT+IEVUy7TEEgvPiHGwawsdCu6+eHSS7DG3uSNKI9//edvRjMe3HaRTn0dGu9uYvjKvBAF3ZgG/A==
X-Received: by 2002:a05:6a00:4b13:b0:73f:ff25:90b3 with SMTP id d2e1a72fcca58-747d1ae2c64mr11603812b3a.24.1748848303729;
        Mon, 02 Jun 2025 00:11:43 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-229-131-224.ap-southeast-1.compute.amazonaws.com. [13.229.131.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab785sm7161662b3a.56.2025.06.02.00.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 00:11:43 -0700 (PDT)
From: binarycraft007 <elliot.huang.signed@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	binarycraft007 <elliot.huang.signed@gmail.com>
Subject: [PATCH 1/1] arm64: dts: qcom: support sound on Asus Vivobook S15
Date: Mon,  2 Jun 2025 15:09:29 +0800
Message-ID: <20250602070929.41575-1-elliot.huang.signed@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds sound support for vivobook s15, tested:
- 2 speakers.
- 2 dmics
- headset with mic(distorted).

Signed-off-by: binarycraft007 <elliot.huang.signed@gmail.com>
---
 .../dts/qcom/x1e80100-asus-vivobook-s15.dts   | 202 ++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 71b2cc6..cce2460 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -23,6 +23,32 @@ aliases {
 		serial1 = &uart14;
 	};
 
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9385-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-0 = <&hall_int_n_default>;
@@ -105,6 +131,88 @@ pmic_glink_ss1_ss_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-ASUS-Vivobook-S15";
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS3",
+				"VA DMIC1", "MIC BIAS3",
+				"VA DMIC0", "VA MIC BIAS3",
+				"VA DMIC1", "VA MIC BIAS3",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 1>, <&swr2 1>,
+					    <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 0>, <&swr1 0>,
+					    <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";
@@ -290,6 +398,13 @@ vreg_bob2: bob2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l2b_3p0: ldo2 {
 			regulator-name = "vreg_l2b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -304,6 +419,14 @@ vreg_l4b_1p8: ldo4 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l12b_1p2: ldo12 {
+			regulator-name = "vreg_l12b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
 		vreg_l13b_3p0: ldo13 {
 			regulator-name = "vreg_l13b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -586,6 +709,24 @@ &i2c7 {
 	/* PS8830 USB4 Retimer? @ 0x8 */
 };
 
+&lpass_tlmm {
+	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &mdss {
 	status = "okay";
 };
@@ -742,6 +883,59 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&swr0 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Left Speaker */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Right Speaker */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9385 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9385 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
@@ -849,6 +1043,14 @@ tpad_default: tpad-default-state {
 		bias-disable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
 	wcn_bt_en: wcn-bt-en-state {
 		pins = "gpio116";
 		function = "gpio";
-- 
2.49.0


