Return-Path: <linux-arm-msm+bounces-71626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA0B40609
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D8A6560255
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CB9212556;
	Tue,  2 Sep 2025 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZTg5tvA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664E91853
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821524; cv=none; b=YDW92a7Oe99wqEFc7dZS14Ghk6LnOo6Gx2BCIetVRyceQoi0CJ+ST5tA3xqKETo5w5bz/3t3QJwajHae2Pys7fgRpWGFROiAAxB5lA/oEIB6CeRthyXURdxQCWLizPtYSaiAvrOR94OdqnMtswhAMYfvUc8wXFsxJvUKtZ1d/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821524; c=relaxed/simple;
	bh=YZAH/V1P/09om9Ubb2lCJps3ibSld2f8OjAoadqgER4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jQr2hz1mQP/yFrl175gDiSWBCMu6RH2ffxJhhMUi0cuefVv6u28mff2JoATcIAoeutGy5HdN5vKry4hQfP9D1q1slR9MXjx2XEP2I4lMc4IygIDNFzKQyDzjh2SjbaHyyw2JzJGG+tkNKmiKxq9m0bmwt8Zvqb3nvvJkKahk3o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZTg5tvA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61d1f60aac7so738829a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 06:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756821521; x=1757426321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=glTF6ghkk/uOHfwCIvpH7x76sV+73HSeA2VQ96I2mIw=;
        b=kZTg5tvAPAiwPNCacA3L0o8j10OLE2FE+/CS0M4P29Cq6qhdPbEwr0D3OgYve1e2yz
         RI9VnyL5YaWpO2+xdD097qMOf66hVW1dHqL1nV1P6f0wxkhvtjst6/eCNsh225bz7Ui/
         5wgOQph8bvghVYj+2MayMtR6SiUR7TWWEUg5OkyjH4SzCgK28GIDDoHiQ7KjvUL3HATR
         QvdMqi/pqYJomHnPDu1WvQ70k5R/nbtyWXtIKWIzn9VDIkul4Hisi4UwiATaR0Y97IP4
         r5tRbmRoRb/DjduUY3vgnB3IjyWCXx/QU1hoENPgq3a5+zyNT8PERUMIRhayoFd4DOoQ
         fGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821521; x=1757426321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glTF6ghkk/uOHfwCIvpH7x76sV+73HSeA2VQ96I2mIw=;
        b=mD3YLk2kFP66fHOZpDfk9V632BMgAKV5l0GOlFiv883L+HEU6Y0BgPijLPOejc1/jB
         fGV3WLbHfHY31ZRIsr+QTAUzhn7MCoIRJP0WxXfDmH5lQN+eFq9UzbpcWtp41Dmun2Jh
         L8046wU1JFe3ZIYXDlKefrOBaZ35qtVN3HYIN9CiSRJsiYnUwDYxqIRH1bAjjRhBJlQh
         Pt5vjrpuMqnIuUge6vPj7x/8y8SQxMHxbekm6plGr/Ekdl9Mk/8Lvr4fn+rlcf+Pisuh
         Rrw2le29TsHxAljPpMl+1y73WNRV9ggd6yqyahlGJUfgNvuTT+QegCAL7SLXoL7/yTr7
         5+2g==
X-Forwarded-Encrypted: i=1; AJvYcCWjhf49QvBN9lx+hMBizoGo7+pakmk+csqyfS4UVWeLFP1OLd7XftLplvdacvVS7qkb53jsxWWRVx1EVvwK@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6wJXL3B/TJ0rMiutWuNJUkOrNk/gA2wcjf4cspCEZ6csMzGq
	WbklEYfEJNelfVat3GgRJRop9J4DhPjviRQOicWyw7NsvOjm/3luxbyy6ks1qy2PXLQPaKFwe+O
	FOQwg
X-Gm-Gg: ASbGncvGm7SivrHduX1PSQSfs+raHgJhNePqostQNL/rQmnRNsVf6gcNiintbjWJWGw
	PJ6RAI3hwJ4zh+ipuJwceLXZazgm3gN8MyUH7EonXYI0WFjMgINduqnSvbaUaONuHhNCYOsARz6
	eVJKImpoFz0+ofCiNy8mlgDTXAkwGxgaKXpkd522NVwwaGPOa2lczmyDJdv/rtz0l5JslNk8xwf
	OlrZTjykdieagPZ0U1yJvgsPrLI2ek0+yh2YJMZizQ3Wh8DljahYYyI1JfNa0C0zEXd//n+frBL
	QT1sFYD7ygH9tkLfqNwiHIMMuYiI5eRh6KSu8Na7KYtkPkSvUG3rM+IDGQTt3PA2NmtYkjzU1m5
	Q2oBn8wLgH5Cs5oC5i2OhzbWRTYh/tEI6fg==
X-Google-Smtp-Source: AGHT+IHEA+ux3C2leMJyhtfz7EKlQm9QTNr1LmU+r/UkhW3ssD8otrVwf54aUtrez4AKL6zYcSCw0Q==
X-Received: by 2002:a05:6402:4316:b0:61c:e612:db1e with SMTP id 4fb4d7f45d1cf-61d0d0ebea7mr6837393a12.0.1756821520651;
        Tue, 02 Sep 2025 06:58:40 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4bbbd1sm9642503a12.34.2025.09.02.06.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:58:39 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: qcom: sm8750-mtp: Add WiFi and Bluetooth
Date: Tue,  2 Sep 2025 15:58:36 +0200
Message-ID: <20250902135835.246713-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6002; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=YZAH/V1P/09om9Ubb2lCJps3ibSld2f8OjAoadqgER4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotvgL+p2P0NQxpZzZk6TlU73cVU3cl0Oyx5PWE
 yAw1NdoyPuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLb4CwAKCRDBN2bmhouD
 17NOD/4qWvj5Zs3YdtAq2ylnRJVWzaFL0FxXlxwToWjF5+1VYgkZ4GZIYwyIeDJCqENccFBwbDK
 FzhAvDBh68o3iv65b0y4lPUH5GjYO8Uuv3TJY2X6B8loevJtRKTd+ceyVFMhQPYB+sep47l5Ywt
 HsZWDt4NyD3FtWD0AlYB1l8YWFj7cnYqDFg8XDwQ5yC1xa/8OILmK1TiwFK4Fce0UY3VC0yaH1t
 Q6Kur4cgiZ1ErbaVMe9tKe58EGD3ibqpN9WpJW+oAe8qv1iBG7WemFedNiWA1KLLsaHOJ5ninR/
 fAmpJ/p52hbOjuopOLJylPNv9RFvMqfW/cioO+6Nt7cRANMqCtxNxM8vtuq+IjdcV2E7GRtKHoU
 2vgr0GRmAESjSdUhdWBZgc8Qh+9/XQ7VrB4WtRrX4f7qSam0q5yN9UX/eNh+QbR19SvZIg6xlH0
 3m5tv6KWpB/07ZClkpWN0mbTnvQdhRqHWraBsIBGlRwzNt5+L2LSt+cDQO/RTAFZJSLcISQmrGS
 oEoCJhOpgTuUbN0AOIpLCVwMpLWKO+Pj9v36Vs8pZ59tjQ+b03gU+Z5CnBwVI28UIizSUmkcsF1
 uDlGHPcdyhbS2oC2IcX017CiBKTjY+JX732I+ity6Aw3+UawIe6mCoZzu3CaosdZIDau1AyoWg6 0A2ToAFZtce8/Ug==
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


