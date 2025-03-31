Return-Path: <linux-arm-msm+bounces-52858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3352AA76023
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 09:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CABCB1685D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 07:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E22F1CDFD4;
	Mon, 31 Mar 2025 07:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip17NFfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53101C5F39;
	Mon, 31 Mar 2025 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406476; cv=none; b=YVI8s/zbmN38x3aMQ94ZbQgPE8yr8vaMzvCQyCWfEZrSyX5WhjItxjHl0rDF2/cwqx/OlnFm2MTPusWHmTbiHOfpJ0uiBUJXi97PwRMEVCuc9LtCkxzNqSiMMgzaaqz/S4TC9lsUMAWCrkuB//mlmxARp5GXN4Wfh6IamZegg38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406476; c=relaxed/simple;
	bh=NFrmaKIj6GnVTC+28ll7yPeQnsC4qCksd6QJYpKgrQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtKIhH27Me9cNWFF1x3Q8Bcezbc+ewwtidK9qgnjBiFeNgD1y4HrWSsRvl2CdIsyDvaZrjuQbgFxjIa+ZyCvbxpQyPrUtVspSDL/OqcRY7RVIVwXIY5Jl9Z1MZollyy+pocv4VIPlirt+o9UlAEBakdYKflXBwGuj8IkkrbYoYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip17NFfU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efc4577so100061f8f.0;
        Mon, 31 Mar 2025 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743406473; x=1744011273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHWRQhGIXD7q4OQfGLy0x34QuL9MLkuMVOOfjz+62wM=;
        b=ip17NFfUfd0KMRmSW1CQPsVNCn75XH7xURWTayfmwEZP2kwsretjCXHwuzFHRpL6yt
         KwQkx0b4Y4/Q6BvW2ZILR4gU5+Mg3qMmTygekD+5o1cNGv4Cyp69Qp0vPbpC7No5/+vq
         oNEAzJJhCuzTfWtoN1kimqf9cQm6ga7fTvvC9EtjD9bnE7OlyKmKZpave2ooiXzYMSuA
         Zh+6kJz8rKxG/RHHcFyZ7dQoHqHrCo2BgWgawLZfcVFKsQzMbeK55DLfljnrDNPTLHH4
         0ABM/SA0psjisQ7Q6x7mEpcBf1VwUKwzR//wYoWZinhRwJnABDnILpThwwbVj2dLgnyp
         LwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743406473; x=1744011273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHWRQhGIXD7q4OQfGLy0x34QuL9MLkuMVOOfjz+62wM=;
        b=KNhFWU/ZRK2ZshAW24n9UGBZrA1wa4AO90BlxytT1BSfhsMX+bu9DH8F9j6iolRvNA
         y+6FtesKGPAhOFasjYX9mpp9UX+1jEgIoBI6xRI2SQtCF/azuXtqoEW66G+rT1CwzvOA
         vcP6CXVOyAdhVBEloPed5TnyVIDx8Dnl0aNDXVUXOw3881oqcbUS8p07TBqOZRQxkdBG
         ExCrjEuwp9KGGGMtMkxV/gftWFLid42wOkt61U40+9/I5Ke49zkML2Sq01AV6Ig2jvIo
         vfBlONdZCCsRmUm9uEyeXbg+MiIcdCogeSR/X/ZM4w9Wwxkoq8MS+SjIIXrIdJkr4H3m
         XHCA==
X-Forwarded-Encrypted: i=1; AJvYcCU99nzqUzcq7XxJohuCtDfH7Nvu1g4T+QmwDEynUFDv289y112sHKG1BHnArVqRjEXxx8BcWDfYgNVDld2Fmg==@vger.kernel.org, AJvYcCWU9fpV6YpeMfXLpgjKdpwYQFYLHLhjIj8H7R7oAE+HR+TCU4b7fVblvFBA9uS6u17rxsRH6MQTEcr3@vger.kernel.org, AJvYcCXBYNYo4tYTYBTu0Opp0N5m7QVGWRhvLQ7/iB0xqvbIQvze4j9VBCMT+D8kNEJj3Wj+NFj0zIIicskY+6t1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd2u0NBzMKEuqG5TUvrXkQaeZYiNq86juw7z7ZKeOYDhMfmYtk
	Fw0VSlnKQnDN2T27zFEFKH9RDYbLC7ZoyuloYDq6oDk7Qd8InqM=
X-Gm-Gg: ASbGnctYJNEOtUiLwSKGG+2nu709R7d0VsbJl+DGDw/Swc9tMw4+8uQqxaW8DSo0Y5/
	sSJ2nNUHiozIqz+yFDk+MM0Rbqt8Iu+uEboAnIu/KVfNfZLnW4ETr3JM74ezpcJ3M+S77wJfcZD
	wHnsL+AI9hFw0fJiZ4qxi1QtrH9vlIbZXSPly+5WJm0+zaJ2LWZhGoLbiLBWyVW7bYrQCDEhxLJ
	I8fmNXmitbqe8kPtwK+wXFfY83dp4APJDX7tyuPQAdzSoM4djwJFFY4qdqSkFe6VsTz7bleGAKu
	kDoPdLp7UBU5GkJ+hUkRkF+9Tdp/s39Of3XjeytSLzIvrDesW19LRhin/hI6jGI/lCkQgVbdZK7
	1LgarHI2B7fBhsquxNOA2qUU=
X-Google-Smtp-Source: AGHT+IE9fHM1x06jDtKrN/f87R9qLuxVhSLKDHJnVyH86/W4Nn5zCtRbtjKVc012CEVZza9e5rekzg==
X-Received: by 2002:a5d:584a:0:b0:391:27f1:fbf8 with SMTP id ffacd0b85a97d-39c120ca8d9mr5785187f8f.4.1743406472717;
        Mon, 31 Mar 2025 00:34:32 -0700 (PDT)
Received: from alex-x1e.. (mob-194-230-148-227.cgn.sunrise.net. [194.230.148.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba4b4fsm115704195e9.1.2025.03.31.00.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:34:32 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	dmitry.baryshkov@oss.qualcomm.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq
Date: Mon, 31 Mar 2025 08:33:47 +0100
Message-ID: <20250331073423.3184322-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
combo chip using the new power sequencing bindings. All voltages are
derived from chained fixed regulators controlled using a single GPIO.

Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
WiFi/BT pwrseq").

With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
X1-based Dell XPS 13 9345")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index d259a0d12d7b..c924f2a67939 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -22,6 +22,7 @@ / {
 
 	aliases {
 		serial0 = &uart21;
+		serial1 = &uart14;
 	};
 
 	gpio-keys {
@@ -288,6 +289,101 @@ vreg_vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_1P9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vdddig-supply = <&vreg_wcn_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_1p9>;
+		vddrfa1p8-supply = <&vreg_wcn_1p9>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
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
@@ -861,6 +957,23 @@ &pcie4_phy {
 	status = "okay";
 };
 
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie6a {
 	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
@@ -1127,6 +1240,37 @@ reset-n-pins {
 			drive-strength = <2>;
 		};
 	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
 };
 
 &uart21 {
-- 
2.45.2


