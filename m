Return-Path: <linux-arm-msm+bounces-28416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA81950CD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 21:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F2E71C230B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 19:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D091A4F12;
	Tue, 13 Aug 2024 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kbIp/Q4C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE841A3BC7
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 19:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723576008; cv=none; b=o9e2zKM+XD/NNDrSKXoDwaGjvvmEJ7kkMg2/hRoK/FN1bccGp/XrGMdu62CvcXKFupRy8hnWROi/mmdx0ENEttbua8AADhBRydlFZ4aM+6BhvA8QbsQbhSHrTZwBbaP5NVTUPYanKsMvYgN1lxvfJtNY9oqS7nwMFpADCktFHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723576008; c=relaxed/simple;
	bh=mewBQ5RDEqagsjt2lG11t5eBkvDcRWf9y6E9yAMbPVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUOyfuC0S1yzuNwJmW2j+ZdItVAGadlvP3kJP6ZEXB2ccQ3c2FJw4upnTB1CgEaSk7x6owrzzEuMAyq8cD3EX6Gxc5Wv61ri+faqJr6yRPjyHaoBgUo4jJ4AuNn651HEvfsWxhhzt8bBBzrSVraZOxiwG4cw4+pWb+yRLN3g2PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kbIp/Q4C; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3684407b2deso3166894f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 12:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723576006; x=1724180806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6dRMYYGkFEzUx72BoTFKhbidKTOX5RlSihSxNf84YA=;
        b=kbIp/Q4CkdlRxCDAVbDYaYuGgzQyM0ZAfQICLvGoFVVB2h21jiZaIYmFNvci8+FGrt
         xT/mJ0FHtcCxazEGxVjoiNib63r4paG6pxny6rXyeal7BrXQGDu4pUSeGiSQYifPrinp
         QftJu2Qh4mkUqzpn6SKpPxgCTuc9ecgEgk9xLlLJrXGHHPWPQkYfr6LyL+E35bT35+Qt
         RYU1oNB4nyxn5IbpmK1CvyKUESlSDGFSXaAwuiyUoQr69lgGKB1mgHOqv3KNzZlGHpfy
         ZPlDm6v9R0WQwEoFpmVlIAAtwN1Wka7mBorsgQH3k8ChEWe73jzROEYNeuLo9FFS+6vw
         T8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723576006; x=1724180806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6dRMYYGkFEzUx72BoTFKhbidKTOX5RlSihSxNf84YA=;
        b=mE6ytqwWDDQw0o5RGD+xm6Qet4EHhOHXq9ZFu9x/BckH9ntl6BcD3BIkBiXi8RHGwF
         3PQqqzIetKzHTx0/OBr0d0bwuy63S56etTH76ow54eacw+93Dk0zYsF9/l5+swu+Hzmi
         joY/VGlVCJtDVGqOPI+xH7pqnr556K8DcM6MoPF5ACRvRAsas5EUJdw05vFBg8FZGZ/1
         4gb6zBdtJwwmC1Wf+o8AOLaZ1HmJ+VTfefEwW/cn2YB2elvK/Xijo7/XKChyrUXrtKVI
         RxvLG/Z9/YxLtCuNlVLihQfi6/NZBJOt8lIlz4tGj91Bx3D8f/jRDafbWw4cetfOoWcZ
         ilwQ==
X-Gm-Message-State: AOJu0Yx28gapdRA75B/OSRON68AQiiGfrg8V3AwG8fuUy6uXqyGuBLVT
	h19wl6hYP3EvVcbO6e2L+gIAaHYIqSJZmqXV4rDr8wsywLmfM0LXrpfWNHjcWhM=
X-Google-Smtp-Source: AGHT+IFejtSRG7RRYnL4z08S2L4gmVa7Wl15o0oikoQMwLR03rR1aGa7hSVmm9y3rCvkWjbUNssYwA==
X-Received: by 2002:a5d:5228:0:b0:368:460b:4f8e with SMTP id ffacd0b85a97d-3717775cd8dmr453393f8f.13.1723576005407;
        Tue, 13 Aug 2024 12:06:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3979:ff54:1b42:968a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c93708asm11119358f8f.29.2024.08.13.12.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 12:06:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: sc8280xp-crd: enable wifi
Date: Tue, 13 Aug 2024 21:06:36 +0200
Message-ID: <20240813190639.154983-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813190639.154983-1-brgl@bgdev.pl>
References: <20240813190639.154983-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konradybcio@kernel.org>

Add nodes for the WCN6855 PMU, the WLAN module and relevant regulators
and pin functions to enable wifi support on sc8280xp-crd.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Bartosz:
  - write the commit message,
  - rebase Konrad's commit,
  - fix one of the supplies' name]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 112 ++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 6020582b0a59..57efeefbc89e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -177,6 +177,17 @@ vreg_misc_3p3: regulator-misc-3p3 {
 		regulator-always-on;
 	};
 
+	vreg_s10b: regulator-s10b {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_S10B";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_wlan: regulator-wlan {
 		compatible = "regulator-fixed";
 
@@ -260,6 +271,67 @@ usb1_sbu_mux: endpoint {
 			};
 		};
 	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&wlan_en>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_s10b>;
+		vddaon-supply = <&vreg_s12b>;
+		vddpmu-supply = <&vreg_s12b>;
+		vddrfa0p95-supply = <&vreg_s12b>;
+		vddrfa1p3-supply = <&vreg_s11b>;
+		vddrfa1p9-supply = <&vreg_s1c>;
+		vddpcie1p3-supply = <&vreg_s11b>;
+		vddpcie1p9-supply = <&vreg_s1c>;
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -276,6 +348,13 @@ vreg_s11b: smps11 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_s12b: smps12 {
+			regulator-name = "vreg_s12b";
+			regulator-min-microvolt = <984000>;
+			regulator-max-microvolt = <984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l3b: ldo3 {
 			regulator-name = "vreg_l3b";
 			regulator-min-microvolt = <1200000>;
@@ -304,6 +383,13 @@ regulators-1 {
 		compatible = "qcom,pm8350c-rpmh-regulators";
 		qcom,pmic-id = "c";
 
+		vreg_s1c: smps1 {
+			regulator-name = "vreg_s1c";
+			regulator-min-microvolt = <1888000>;
+			regulator-max-microvolt = <1888000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l1c: ldo1 {
 			regulator-name = "vreg_l1c";
 			regulator-min-microvolt = <1800000>;
@@ -583,6 +669,25 @@ &pcie4_phy {
 	status = "okay";
 };
 
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+
+		qcom,ath11k-calibration-variant = "LE_X13S";
+	};
+};
+
 &pmc8280c_lpg {
 	status = "okay";
 };
@@ -829,6 +934,13 @@ reset-pins {
 		};
 	};
 
+	wlan_en: wlan-en-state {
+		pins = "gpio134";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio135";
 		function = "gpio";
-- 
2.43.0


