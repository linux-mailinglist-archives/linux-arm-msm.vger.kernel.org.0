Return-Path: <linux-arm-msm+bounces-33520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 300FF994551
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9E811F24750
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 10:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0831C2434;
	Tue,  8 Oct 2024 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2XtFOQgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9504B1BAEEA
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728383162; cv=none; b=OY97f624rqOuoyGmq6lSYzvds2iuLNO9Lt7wr05/cEuV3PLiwJAWaWdqTJzz5qSbycjGQnE/gSppn799jAF48LaoeCwOUtbcqzWG4wJrmfbfJDojNdUhufFnN3oDuvePDrTcdUtV14xgIUQWdBTNeVdzYOgKAD0fyg+EUt4yeao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728383162; c=relaxed/simple;
	bh=lDqIh3H/vWELixQK7kH36Vf7D/HlGgVTg57Mysl6ug4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=me1G8WY1rEBPKjakfyNh0+ooGunNJEfXUrmD1QI11VcP5wiw7t8nJrUk+NzefEmj/KTeMgznUDwva40kxs4NAjEb2Fryu8MJj2EDXvYhx43bbQOFpJaursFZoBojrgzNV1DSAxVj1EB8p9xWxfjTQ5WKDkJkq7ILFXqAtwWO33s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2XtFOQgd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so56107575e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728383159; x=1728987959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiFzJljIZK6K18VBx2o+5L+9T8qGzII0DZ/h6IKErVs=;
        b=2XtFOQgddsaAoevgbrlHxMe6psGEjLjkB20fbMUMFKkWw2guFS28KeuQLSXYaLsH0s
         odq4/a/lY3smCpcr7hInG2bTnJBVXLnikTpEdSCb0yAob5r212P3a3Op/4cPYQULbOKE
         RcBJ0Wxk+8hrzAGkcVPpmjUNzeV+N+vF5VZVOqe0pdCpXIFdWCvGx/PU572CkDtraBqv
         0b1lAOFAWVONbHwKb9K2vUfz3RVkhvTY3SkQIPs/RYkarMf14RY1901AIeRgzhmzjnhq
         bPCIK+7L26a8rDplwvnIXPCYk2+zoR/EEshIxuDjloQMsJPdAhWSX/htWLjj+lLI+jcp
         pRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728383159; x=1728987959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiFzJljIZK6K18VBx2o+5L+9T8qGzII0DZ/h6IKErVs=;
        b=mYbUEW3IzCrXs+WyTGyLS4bbhJZp5ZtY+l/ZR+OQgWmmljtCVVapH9wWZ+wqyV8+Zz
         dPRUqDWY92bN2Wo1Gu+496hlArzgIP/B/G/1PdXnTKBcyHVXk85kphnDlhAHM8OSPqHx
         67drfPHhwtVW0PRkCMPSj4VKWor+W01lbDajlJ65nSY6S/9g0q3tQHi6eUaJzjrqOO3r
         FPY9lKsyDbuzm2sn9r3f78lHmnZJjI9EhfmHRuTw9UP4l3GVugzlzdMsp2LGDRgJ4JVz
         cmJaHgnvuWO9WBDOd7LM8Z60AhedViiOI9Tvmy+559RWg0TaStv1z94QSKRnTNX67lty
         OLIQ==
X-Gm-Message-State: AOJu0YzBUGFmSO59c+J3GYkzKMUxDP40RqoDrJ09lR+qD3zgNh5J70fy
	WEr29xQx6hWBFtzyhUvGxUBn9DQ3Ha3suinDUoz2HRIpG69sp8U9AJihF24bU2c=
X-Google-Smtp-Source: AGHT+IEGcrxEhyJl+MXEaIJ+7wi+2eFIF0HFIrWSMUS9U40XllI18QLKQiArpLJr4U/01gV7YwnE6A==
X-Received: by 2002:a05:600c:1c8a:b0:42b:af52:2525 with SMTP id 5b1f17b1804b1-42f85ab7cd9mr119677385e9.16.1728383158933;
        Tue, 08 Oct 2024 03:25:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:738a:20da:f541:94ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691b505sm7766800f8f.43.2024.10.08.03.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 03:25:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Steev Klimaszewski <steev@kali.org>
Subject: [PATCH v5 3/3] arm64: dts: qcom: sc8280xp-x13s: model the PMU of the on-board wcn6855
Date: Tue,  8 Oct 2024 12:25:44 +0200
Message-ID: <20241008102545.40003-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008102545.40003-1-brgl@bgdev.pl>
References: <20241008102545.40003-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a node for the PMU of the WCN6855 and rework the inputs of the wifi
and bluetooth nodes to consume the PMU's outputs.

With this we can drop the regulator-always-on properties from vreg_s11b
and vreg_s12b as they will now be enabled by the power sequencing
driver.

Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 101 +++++++++++++++---
 1 file changed, 87 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 6a28cab97189..863412842102 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -400,6 +400,68 @@ usb1_sbu_mux: endpoint {
 			};
 		};
 	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_default>, <&wlan_en>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 132 GPIO_ACTIVE_HIGH>;
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
@@ -426,7 +488,6 @@ vreg_s11b: smps11 {
 			regulator-min-microvolt = <1272000>;
 			regulator-max-microvolt = <1272000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
 		};
 
 		vreg_s12b: smps12 {
@@ -434,7 +495,6 @@ vreg_s12b: smps12 {
 			regulator-min-microvolt = <984000>;
 			regulator-max-microvolt = <984000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
 		};
 
 		vreg_l1b: ldo1 {
@@ -927,6 +987,16 @@ wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 
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
 		qcom,ath11k-calibration-variant = "LE_X13S";
 	};
 };
@@ -1258,20 +1328,16 @@ &uart2 {
 	bluetooth {
 		compatible = "qcom,wcn6855-bt";
 
-		vddio-supply = <&vreg_s10b>;
-		vddbtcxmx-supply = <&vreg_s12b>;
-		vddrfacmn-supply = <&vreg_s12b>;
-		vddrfa0p8-supply = <&vreg_s12b>;
-		vddrfa1p2-supply = <&vreg_s11b>;
-		vddrfa1p7-supply = <&vreg_s1c>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
 
 		max-speed = <3200000>;
-
-		enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
-		swctrl-gpios = <&tlmm 132 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&bt_default>;
-		pinctrl-names = "default";
 	};
 };
 
@@ -1761,4 +1827,11 @@ reset-pins {
 			bias-disable;
 		};
 	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio134";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
 };
-- 
2.30.2


