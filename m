Return-Path: <linux-arm-msm+bounces-30893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 459DB96D84D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBF6B1F24DCD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07E219DFBF;
	Thu,  5 Sep 2024 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Mk/6uDm5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD719D8A8
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538839; cv=none; b=Lfxy9JZJdWKprNJzutTX5a7l0SSgNcwcylay75PtXhOAREk2IxiQZyEOtGl1Kt4E/JpMHG4SGfeI2sY5CWfP0hk0b7lFAOTRJWmZg0SGs8l7CRpqOcSBEffaCcgXbwLjvuKrHV2WbrX+3LJ2vKqn0PBz+tytgn8qBPPWmkTCnRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538839; c=relaxed/simple;
	bh=UDY8mN7NLkOQeS1dWllQkhgyygy99CoGI6WWaVJHSv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOCThEoS9+M8A3dVrDvh8ZjYOdfyOX3brYXpqgVTcHovXLFZOjLzYmJRiNiuxrABBIvFZm1j/0zKDLqNJ7fedBmYUHK3YvNTZPDWnTgFnQtX93F+vY4EU/6iZe0AFxOzroOiRoXlEiJYnJO7+WG00LJcahHzjWhvPSMJmVZZbN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Mk/6uDm5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37747c1d928so409218f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 05:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725538836; x=1726143636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpoQwlpkGQNE662npRSFJddFIL23SgdklNOB5QSDny8=;
        b=Mk/6uDm5YqUriRooOrz9Tsfu6cAyLvJ+zK9HWM1vJJj2JF096KASlcPGfjOQadbHFZ
         x39QKlWMn9SO1aDs8boAElWdIoNSqPOlrR2YfoIf4CKM3j0WT57LC70sDTaS0Y1NqLK0
         8YgwLbMi9EZU+BNdcoTz3fXJl7Bqs/ybSNmnWuufkxIjT4qdjf6w2JhnyiGAsahEKaNL
         TCt8EXlJeEHtrLsNhvlh2Lta/W34l6ozwkexuu1CaQvi0Pr8IsYKSqVYNU0G334S7IAN
         gqjZ5h4+H1diwxaqGLhw3nzp4XUrEbgDwU+JhjBHsK4QxyRAZbKg9LUZcvgkIU3uyVqn
         DVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538836; x=1726143636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpoQwlpkGQNE662npRSFJddFIL23SgdklNOB5QSDny8=;
        b=Ui3ls4M70oIshcNKcDnA5m2/aIM0FrwJBPDK3zoB69Ud5sZbpdgV91K8cYjkf3gJ9k
         OrQ4NjJuEr4SoCJw1Dzewuee/AgUrEIbOyEfy1CMSZnkCRD0fyA54ENgsNCM418pgDBb
         +U3fVnqEuQhAycLlqvuoN3loF5mpbHE1Am74PE/qQA+gH/9PfGw4RUg5TtYNiJI/wIt6
         t/IDJnwqoPObCdiok4qVI0uy8zkXLLKasc8aQdr0XeooIzM+OVTVW+3/ghAdAuUdiRuA
         +AOh9UACSnvymyQeCOQPyCJw63wI/W1VW8VcB6Loo3yGgiE1/b1sCg7YTq0fAfcbgRMn
         lqcg==
X-Gm-Message-State: AOJu0YwxKhdAe3Mf/xVvDtx9TYxkNfBm4U2ZaPmyH8F1dKTD+90NX7JL
	joCbMcrVdpU7q9F8JMPbx8UFKR/L+QIFhXQoT5V0qRw3mRhZN9/DAdYFnV6KAVQ=
X-Google-Smtp-Source: AGHT+IHvK0u0iS10sudWOxZEj65ytOgtHcaNt6E3zKJmOxmlU2tiAiTkSn/DrE3j3k8hgZb7FSPgzQ==
X-Received: by 2002:adf:f0cd:0:b0:374:af59:427d with SMTP id ffacd0b85a97d-374bf1c814emr11845639f8f.49.1725538835226;
        Thu, 05 Sep 2024 05:20:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cbe4:ce99:cb33:eb1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374be2edf08sm14645764f8f.6.2024.09.05.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:20:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Steev Klimaszewski <steev@kali.org>
Subject: [PATCH v3 3/4] arm64: dts: qcom: sc8280xp-x13s: model the PMU of the on-board wcn6855
Date: Thu,  5 Sep 2024 14:20:21 +0200
Message-ID: <20240905122023.47251-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905122023.47251-1-brgl@bgdev.pl>
References: <20240905122023.47251-1-brgl@bgdev.pl>
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

Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 98 ++++++++++++++++---
 1 file changed, 86 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 6a28cab97189..88b31550f9df 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -400,6 +400,67 @@ usb1_sbu_mux: endpoint {
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
@@ -927,6 +988,16 @@ wifi@0 {
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
@@ -1258,20 +1329,16 @@ &uart2 {
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
 
@@ -1761,4 +1828,11 @@ reset-pins {
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
2.43.0


