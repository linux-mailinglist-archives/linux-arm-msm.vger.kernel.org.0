Return-Path: <linux-arm-msm+bounces-71628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6FB4061B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19843203A3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B6A2DEA9E;
	Tue,  2 Sep 2025 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZc5s+Kt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C252882DC
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821633; cv=none; b=GVMT8ItBxKVolq1G/YQ/ymzUrNMNr0APGfDBui/vyEj32OrITE/yFrDSHHIYu22t2hEiO5Cry/1Jpw3J90IoqMMIvkzU4ckjdMf897vsdr0P0PMGyo/7g+rt28UrOmvM7T5yc3AeE/WcyjKp3jaAi2N//6HZ5jIChMJpPFbtKNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821633; c=relaxed/simple;
	bh=YZAH/V1P/09om9Ubb2lCJps3ibSld2f8OjAoadqgER4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=unOvfdZPQ/FlhKu/879dJhSLE3WaR6aUk0rntkS5cWMOkVDUCkENhDR376RulLC6izegfqmNAfJKB1mmErLHiBRglfF73rZ1HB+DBafZY33rKwNf4jrfh7QPQpT/+lYnR4A9iB3djIXEczLlMCWiQMffsvYsthukpzkhnDf55RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZc5s+Kt; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0419ea61caso42926566b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756821629; x=1757426429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=glTF6ghkk/uOHfwCIvpH7x76sV+73HSeA2VQ96I2mIw=;
        b=YZc5s+Ktls3nMHzyX7plYijupPYIpmU6pU8asrfszX6+/otlqiSjfmGKxObEgQzrSo
         ZbnGr5QbPGFw74FVzJHQWz9wSJnS/T3HlxuldcaOAfJNIJkg3UBKXQ+UMV9lVdDlJDsz
         Z10lfn2LF9lliEffPNOndB/fj57t8HIZrDO03VWEGBGhtiTAZpw4Ixq9D093/FHeCVHM
         poVXpzAl64leAWIILbz/bN30tZPcVpuZ10EbaQDziNa8ZxJQ2YhuGL5UeDDNb2EpCuP6
         bKz1BXYj7TbHiSWQasxj+3pjPzp3su/JtDEu6o53/enaCOpfaIUTUa87nBPKXfUphvbE
         uNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821629; x=1757426429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glTF6ghkk/uOHfwCIvpH7x76sV+73HSeA2VQ96I2mIw=;
        b=eT6bUAh8w/08cX2lLoD9Cj77sIY6vfvFhcAylL6dO6uvd2kcRtDTHnPzxlzmLSy3Ji
         lzOyp4BWfciKdqk0CqXeZOHb3hASfWvCnq9nxVGQGS7Ev8b4/lVgrX+bM9WuvHvjsu9f
         NV2sB6PdRaTI5w+uVa9H5Hc1Rc4A9ZjDJpMy8AR8KdvbxoyKxKdwWoFL77VkA+NdP4IF
         1jwH8KD9FQdqjCHYRMjJMp8E5ZfLW1JUSBlWmdBMRMLaYokQaBoPxycPwdAouZnzSCt2
         boJeDAvJ7gkxKeRuUUlkd2GOWY2oTxAvK+gTFeucOQGOjI1H88t2Kfw0UishBQESyTb1
         Nc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgi2smB4RqGNoj7ezgHxyISXo/fq+1oze0cK3//8iI/pHvWB8wP4Y5vw2aOd7kVVlF9xUfoQhYy0A1rdM5@vger.kernel.org
X-Gm-Message-State: AOJu0YzPavl6NEYwqqcCPyyWOd7FMpf9obr9ah9nyJUuYzbdUJ5gJi7p
	7K+WN5Gh8dNJ2kwyI0MM7Q0IHJPb2eeM2RhtpeWPDzgHpYUWntNdx5bFgWvwm7nV/B8=
X-Gm-Gg: ASbGncuniRosAYLGJb0CIrTaVhRcnqROWIIFySKC93DYp13187us3UfliDN568F5kyB
	ivg+eFcnnP5Je3kY0L51XK4N4diHzp6D96L8fniguY9zULXuGyhCDKNSTA+q3ne8PPE+9CBcRSU
	S77qmNp77DELsP4RXqWb7cCjoUGLF41EPOBt3w7D5V4uIpm/O/yWoFcEHFExQ0RlzXnqulzzvu1
	nxe7z3QdgDRomkSSF5X/q1pjGh7pQ2h9V4sB84HVZ8vnrbUFtoYzdhUNdGaKbp0iTehW2Qiy9zs
	zU2IB6sAddeK+mJQbNAOVLCP709cklTrbRay8eDpyiyrTkfcOYtfBSFswha6Gh8ZVfqPiRjr2sw
	CxQUndznhnu10bu4kdaaDIh0YmJ7w4omcZCpbKykjK6Ib
X-Google-Smtp-Source: AGHT+IGDAshsJg36aVD4eQnhtxPLKIJLVsKtgZ2Z0HAaLohyIGC1DvuIqRiP4HLvEGb1IvHql5sFCg==
X-Received: by 2002:a17:907:3e1e:b0:afe:fc35:4324 with SMTP id a640c23a62f3a-aff0ee058e5mr773663866b.1.1756821627646;
        Tue, 02 Sep 2025 07:00:27 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0445cb9296sm275455566b.61.2025.09.02.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:00:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v3] arm64: dts: qcom: sm8750-mtp: Add WiFi and Bluetooth
Date: Tue,  2 Sep 2025 16:00:19 +0200
Message-ID: <20250902140018.247209-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6002; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=YZAH/V1P/09om9Ubb2lCJps3ibSld2f8OjAoadqgER4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotvhy+p2P0NQxpZzZk6TlU73cVU3cl0Oyx5PWE
 yAw1NdoyPuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLb4cgAKCRDBN2bmhouD
 1wJDD/oCb8b3kdJA3Ch5EjmwN4flY44wGkimwToCGnmLOOVQpF1M2COfSolr8OI/YdZ2kN5KdTE
 +zHJsPN2RsBIb+TrWyPmEOH9uBKDVH4nsdLmDeS4mJarjq7DmD1pkM2Im94D3qHEde8644tdPjy
 IRvueW5Su3F102iH3ObqvYcQN3vFL8wKCvr4AeHZvDn3vWLE4xK7UY/ihFmlj+kl09iySUS1wo3
 tUf3uJ8gU3/Uh5yTccjIrRfbinPZbpr+u+OIid0m+Iq7j04231mN2UnW7SZ58E0v1WsQLNngDl0
 loJ00jrCYlUV36oiA+K5JFcSUypbVufsEum4bOm8EJ9Y/EjIWJRT5IgogPI84ixkr9aaPle7+Ky
 Nx2NQYK+v/D1gDjBbICaJ1CeU7jll8mKezG2aht1aALFsofBl5Jd+P0zpzUJAG3j/H6Cy7oeAvV
 cx7hXBS8ev2X4xxZUJ0zLiUJKKVUnAZy92I1BLxpF7j6LTRQnDgokCaeOSEik1L+DrSMG2WK9rF
 wUG7b8OiCR4/axxWqI6ixEFasJy5P0jJNMJw8fMoPdPZjbTONCxKs9wltS6srGqM0QpvUh9DIz4
 4sMjFnLUedscM553V4ULCmH4ZmCO6tFLD2RvW7Be7SXEBjvdUNXIbapUdnTkLeBo7jTiOSa9wYk zdyf2SJbjo/DQFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

MTP8750 rev 2.0 (power grid v8) boards come as two different variants
with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
supported by the kernel, but WCN786x is not.  Both of the board variants
are considered newest revisions and the difference is only in MCN
numbers and internal codenames.

Add WCN7850 WiFi and Bluetooth to the MTP8750, stating that this DTS
represents the WCN7850 variant.  The S4D and S5F regulators should
operate at 0.85 V, thus adjust lower constraint and regulator name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Add also PCIe nodes, because they were not planned to be sent
   separately.
2. Drop pieces of comments as discussed with Dmitry.
v2: https://lore.kernel.org/all/20250811131055.154233-2-krzysztof.kozlowski@linaro.org/

Changes in v2:
1. Add missing &qupv3_2 enable, so Bluetooth works.
2. Adjust also S4D regulator constraint.

No dependencies, can be merged.
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 147 +++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 946ba53fe63a..3bbb53b7c71f 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -201,6 +201,74 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	/*
+	 * MTPs rev 2.0 (power grid v8) come with two different WiFi chips:
+	 * WCN7850 and WCN786x.
+	 * Device nodes here for the PMU, WiFi and Bluetooth describe the MTP
+	 * variant with WCN7850.
+	 */
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>, <&bt_default>;
+
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&pm8550ve_f_gpios 3 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s5f_0p85>;
+		vddio-supply = <&vreg_l3f_1p8>;
+		vddio1p2-supply = <&vreg_l2f_1p2>;
+		vddaon-supply = <&vreg_s4d_0p85>;
+		vdddig-supply = <&vreg_s1d_0p97>;
+		vddrfa1p2-supply = <&vreg_s7i_1p2>;
+		vddrfa1p8-supply = <&vreg_s3g_1p8>;
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
@@ -426,7 +494,7 @@ vreg_s3d_1p2: smps3 {
 
 		vreg_s4d_0p85: smps4 {
 			regulator-name = "vreg_s4d_0p85";
-			regulator-min-microvolt = <500000>;
+			regulator-min-microvolt = <852000>;
 			regulator-max-microvolt = <1036000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -472,9 +540,9 @@ regulators-2 {
 
 		qcom,pmic-id = "f";
 
-		vreg_s5f_0p5: smps5 {
-			regulator-name = "vreg_s5f_0p5";
-			regulator-min-microvolt = <500000>;
+		vreg_s5f_0p85: smps5 {
+			regulator-name = "vreg_s5f_0p85";
+			regulator-min-microvolt = <852000>;
 			regulator-max-microvolt = <1000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -891,6 +959,40 @@ &pon_resin {
 	status = "okay";
 };
 
+&pcie0 {
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1f_0p88>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
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
 &pmih0108_eusb2_repeater {
 	status = "okay";
 
@@ -902,6 +1004,10 @@ &qupv3_1 {
 	status = "okay";
 };
 
+&qupv3_2 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/sm8750/adsp.mbn",
 			"qcom/sm8750/adsp_dtb.mbn";
@@ -1035,6 +1141,14 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 };
 
 &tlmm {
+	bt_default: bt-default-state {
+		sw-ctrl-pins {
+			pins = "gpio18";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";
@@ -1042,6 +1156,31 @@ wcd_default: wcd-reset-n-active-state {
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
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
 };
 
 &ufs_mem_phy {
-- 
2.48.1


