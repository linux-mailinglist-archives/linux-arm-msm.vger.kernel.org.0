Return-Path: <linux-arm-msm+bounces-21760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FF88FCE92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0AF01C24AED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438F219CCEC;
	Wed,  5 Jun 2024 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="in1URVfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008CC194A52
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590466; cv=none; b=a46e11479thekFG+8C892S96bi3ijANDvw32QDH8wh+/oSC9WBpBTlgQBDb15XMiEDtEoIfQlJcFlNp1UXGA/UZGtEGaczVvm7IBgOCURKqdEQ01FdE39DEL8YLuARAZwfVc5br+5uf3/Ez2J+ycX1FmLmJBJYqxp90XKk80J2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590466; c=relaxed/simple;
	bh=5svplUamz6kn1QlrQNG82IAqSTI/V5Hw/wy9w7Z9vcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzYq8zMWf766ivkx4tiMKnktAwQV1xt5cAhGpjMUB3zULa4x7TMkLmmQVXoNw5YeEhX+u7hceB7ywDO3uqoRG8hiU4rph/f+7pxzWaVYonk4IM4tMA7XUElFFBWKaNFXmssDwFplJVw84FkmM0ppS3TQgvOySfy6kmbTUaBwb3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=in1URVfm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4213a496a81so30887505e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717590462; x=1718195262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66zwRmCvmNHsCoXwcnY7wAttTA1ag7KYFL6z4pT9chs=;
        b=in1URVfmi7nCCdFPj3nS8GqQYmoFRI7AfMMhThQVcFM/DKKuSLXRjcEZTVO5DF7faE
         /sudqe9Cso/5vzaJN58bL3wS2VPmtxOZ4QF6XWX/K7CkPev7JomqKTxrdhZ2Pu7j3KuT
         4LGyLbpHb5YtdXFqC+ktZH++QL/xP3lfef1BnTCzOxPNXiau0+f2UjdrrDuxt49cDsut
         sr4j9ivhtnyo+20kj2yEhejpaIGv/reqYendx48qqbm6mxOH5UKWeH7J5G6bl2oMkDtX
         hE/3XKTtVEdJuMhTw0CmVL3XKarqBtfe1dzP1t0Z8MBSx/p3QeORzIoMfvVcnRvhjA8x
         6MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590462; x=1718195262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66zwRmCvmNHsCoXwcnY7wAttTA1ag7KYFL6z4pT9chs=;
        b=U356V8VlFNs3EKth2McocP+5ydsedsAMmaRGuyESdoXTZODCzu/B97RyW5DZ2vNO7O
         Tk5LG/buUB5+YIKfgPDpql3pbDVfjVkBV/hjFWWV/oMA9ICNQcOBIJZKPoVfdgFNj08a
         ++tpU8Js6hOCXxFoqYjpCTLT4LUNfC4A02IeR3bjGlO/IxTqGvd87BNfCV6Oi5Y7bG8O
         yOV6SNMCV1vD+PcIxp0k87eS3WBX70Ct0/UyTLn7dIuFjPpCeFl8l/wkKrS1W2sELFLw
         RuDuKzz43WyTlxVcyxvC2fE7yUFqKkSDSQm4Ldc7UtipytuXz4wj/XLuUYeSGsFK4d0t
         UhUg==
X-Gm-Message-State: AOJu0YyRRio7wrzLc12So2/fuyoumKgwEaL1pdOM+/Xz8qZge0msKQSo
	n7xE7DKADn77Rr/KupFQzrjhUvLyqWjcplDcEHejEBmHMmByogFC9wSPKAx8nqY=
X-Google-Smtp-Source: AGHT+IGF82RT72tGtXm4BWyWrkcV+Y89WJ0IVRdHBkiMFhFB9eFX5LpVsPiHKIl+gUaoqDkBRaTRhA==
X-Received: by 2002:a5d:5043:0:b0:357:8bde:59bf with SMTP id ffacd0b85a97d-35e84060962mr1714682f8f.24.1717590462506;
        Wed, 05 Jun 2024 05:27:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04cac3esm14383619f8f.39.2024.06.05.05.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:27:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v9 2/4] arm64: dts: qcom: sm8650-qrd: add the Wifi node
Date: Wed,  5 Jun 2024 14:27:27 +0200
Message-ID: <20240605122729.24283-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605122729.24283-1-brgl@bgdev.pl>
References: <20240605122729.24283-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the ath12k WLAN on-board the WCN7850 module present on the
board.

[Neil: authored the initial version of the change]

Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 89 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    |  2 +-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 98f6a272ce5a..6e3c4d8dcc19 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -203,6 +203,71 @@ wcd_codec_headset_in: endpoint {
 			};
 		};
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>;
+
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		/*
+		 * TODO Add bt-enable-gpios once the Bluetooth driver is
+		 * converted to using the power sequencer.
+		 */
+
+		vdd-supply = <&vreg_s4i_0p85>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddio1p2-supply = <&vreg_l3c_1p2>;
+		vddaon-supply = <&vreg_s2c_0p8>;
+		vdddig-supply = <&vreg_s3c_0p9>;
+		vddrfa1p2-supply = <&vreg_s1c_1p2>;
+		vddrfa1p8-supply = <&vreg_s6c_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
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
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
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
@@ -844,6 +909,23 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1i_0p88>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
@@ -1138,6 +1220,13 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
 };
 
 &uart14 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index bb0b3c48ee4b..903c013d1510 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2300,7 +2300,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			pcie@0 {
+			pcieport0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
-- 
2.40.1


