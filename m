Return-Path: <linux-arm-msm+bounces-30405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC7968A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E3C82836B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800CE19F10D;
	Mon,  2 Sep 2024 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJe4/Z3/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842261CB516
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725289316; cv=none; b=RCqsIyJgdNs1Ur1iOvcrxkwngaX6GlOrAQVs/oRHjSsswpdTqwYNWD7b19uD7URT9dUnzFZcGRL1oEETzy7yv5VyvZm/Dp6iT112q82+QxLWKD+sHDB9vjLA2EJVsDI+pVa3ShM6f2plYZrsNfZg6Lq+TTLnr+zwsyrt4QgNT3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725289316; c=relaxed/simple;
	bh=ArsmYDW55cKASTnQ6hcua5UnQZJb2h3ZYLRZ6WJ8EUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHs4ZQXnE96pI87/LdnXrzsDnYLPo5v8YlLZ8Q7zWJu2LLBapJHKIapZXDB6cWVn+0EB0o/OpAxGg7Zopup7m2OC+TviLltO6AOmlTg8kJ533HzJ1/jNZ/lWyq4xse1mUbNAgqOt4nobES4/FXmgkLBL+hnlKnlO6t+ddwiAsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJe4/Z3/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5334a8a1b07so5267770e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725289313; x=1725894113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3pvwUMo0iJndMRUEcqbJ1B6l2vhr6vHtYLMGbW108E=;
        b=cJe4/Z3/jGmxzjSqHX20NDqXaaTuKGZZQS9QvBy5Zjd1dbeD9T9WWAwGtzXdhV5ZxX
         SSRawmyQQXVIJUGt8gJ7HeNIOAnbuFVmv0t8tLWva3N2vWpdNKCu+u1B0hLZJmPRGQ14
         acjtzUV82cHnC87rf9ZHHSsl3t2yeH7ryHI5edIzLswZEh85bJ6R2MC+REzyBxuDwSmb
         0T0DiJv4274567SNjk7m5d4hErjQIf46vTgdgVLdmj1EMRHKS4WPtczT62Du1Iqe3e3f
         c+J7UHS2Rc8QnX2QJGFTsK9wm8pMYvrpaeiPEsAwg6P15rE4RP9htyxAUs7advC1P3LZ
         HhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725289313; x=1725894113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3pvwUMo0iJndMRUEcqbJ1B6l2vhr6vHtYLMGbW108E=;
        b=VpRXjdbZezeUWM4CCS54CG7xI/yF4luGvSf+W3VPxsIbv65NO5fGjuW+h6S2BGnU/c
         2+tLHIBOhTZC4qJ7M27cWFRipzLdWqxwX/oPSmKSvt4b5ATXxVHtIeAh3GPuSz+9PLND
         c+n4Vuquwotkq16sEMfsFu6qsTwJLuZkDtbbIvnOv62sfa9uYeeKPx+jdrnomZ+J/sU9
         DzOUqgFQiRa07F6YQ0rt3kyqqRTEqIAskEtynhZyAOXa5mDTxhp1rHKL7Eqmm3bs50ht
         WwacuV2B8mxsfHbASo3QlBoMZvG6qgW9GcwQLOYrKK10Vuc30RvyEzyf3juZH9COE51/
         Ek0A==
X-Forwarded-Encrypted: i=1; AJvYcCWPTcub3pjic3tlPZlCxjqXKokydT2rynsyQz2KovJVtGy18Ah0O/hL03GJ3kgE/7trzuaeyGgeeedtgOsu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0R0I8Ci74bXQc6D7uQm5LnZB5qmVe86nc3TGQ+W0+7GsoeEfg
	vegbVzvHfiQKSfn+NEuXEy6RfGmBxq8EYebgx8E+jQr2fk5Z7kIYPEk85+95qds=
X-Google-Smtp-Source: AGHT+IEUpfkkhnqYuZWu5uQpN0jifICl8ddqys0S7znON5JPKahdlXacEdMa0Hdy5+ZvWR6WxIixJg==
X-Received: by 2002:a05:6512:3d1d:b0:533:4722:ebbe with SMTP id 2adb3069b0e04-53546b33564mr7349587e87.26.1725289312394;
        Mon, 02 Sep 2024 08:01:52 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb1ebsm140726115e9.3.2024.09.02.08.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:01:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 02 Sep 2024 18:01:35 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Enable external DP
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-1-899c264c0eb7@linaro.org>
References: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-0-899c264c0eb7@linaro.org>
In-Reply-To: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-0-899c264c0eb7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10887; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ArsmYDW55cKASTnQ6hcua5UnQZJb2h3ZYLRZ6WJ8EUU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBm1dNbs3SG9XUSejydzuinRf5Ksnly7I4Wc3M0G
 0dhWbppXC+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZtXTWwAKCRAbX0TJAJUV
 VgQ6D/9C6dfsbbIdMdB+IbTGubYiIUhmVDgvTxGdJiD/LhlWC0LxryjRoogNW/BzMCvbjr0c6T1
 pCXNiEFKqxUJxSJkUv/kgK5naLkvvbwT9lwGiaOgoke4nQ8tKVUH9O0popGtga79C7KVohYnkl3
 LNLYZS3EWxyNOC1fUCN9L0BpzqWzHNewiAImyDzHY9xtL8VjxHOvM3mcy497lZB8nhMwLmL5UUW
 IVU0xukmFRu44Lu6DenCWZfZqNcjf1Ytp6nbxnJvU1bmiNYi4tWDlzz5q3QyMFJNmHgYex/WQtF
 iPTNbpGIN0J6ROg2NtHQsDwO4APbhL6d9RiOC7SSf2C+lbhH1DoyM9mC63VegaFGpp4pz7DPHWr
 iBQ2Cct+MrUQVsigPHsJ85YgwnoDJBx8NUsmMo5nifXCrNrqyd6+cOa8ZVUcOeK0PoNOecxTMcU
 ALzGjx7lXdi6K4jRUA05i3D5uQQkj0MMcfSfOsLj/o70Pkt6KBwjmZG75lIkLcYZb68br8aiJ+n
 PMUR4hrv0MqmgwlUsomTq9z5ne3yW6KYEpbOh/fFdKYVMHkPI/3Sc/P9G+oodgbyOTbMQICDjCX
 dRZrVfI/m7wDcrSg8Eo9KqAZEQYOudgULoQI78Uv81p/EbAKZNRy5WWpJfauk9uMrPM3AoX5ed2
 Py+CRlk/wLfMpqA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Qualcomm Snapdragon X Elite CRD board has 3 USB Type-C ports,
all of them supporting external DP altmode. Between each QMP
combo PHY and the corresponding Type-C port, sits one Parade PS8830
retimer which handles both orientation and SBU muxing. Add nodes for
each retimer, fix the graphs between connectors and the PHYs accordingly,
add the voltage regulators needed by each retimer and then enable all
3 remaining DPUs.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 414 +++++++++++++++++++++++++++++-
 1 file changed, 408 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 10b28d870f08..6dfc85eda354 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -99,7 +99,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+						remote-endpoint = <&retimer_ss0_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
 					};
 				};
 			};
@@ -128,7 +136,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss1_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+						remote-endpoint = <&retimer_ss1_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss1_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss1_con_sbu_out>;
 					};
 				};
 			};
@@ -157,7 +173,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss2_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
+						remote-endpoint = <&retimer_ss2_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss2_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss2_con_sbu_out>;
 					};
 				};
 			};
@@ -288,6 +312,134 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P15";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr0_1p15_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr0_1p8_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr0_3p3_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_1P15";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtmr1_1p15_reg_en>;
+	};
+
+	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtmr1_1p8_reg_en>;
+	};
+
+	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtmr1_3p3_reg_en>;
+	};
+
+	vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR2_1P15";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&tlmm 189 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtmr2_1p15_reg_en>;
+	};
+
+	vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR2_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 126 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtmr2_1p8_reg_en>;
+	};
+
+	vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR2_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 187 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtmr2_3p3_reg_en>;
+	};
+
+
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -709,6 +861,163 @@ keyboard@3a {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK5>;
+		clock-names = "xo";
+
+		vdd15-supply = <&vreg_rtmr2_1p15>;
+		vdd18-supply = <&vreg_rtmr2_1p8>;
+		vdd33-supply = <&vreg_rtmr2_3p3>;
+
+		reset-gpios = <&tlmm 185 GPIO_ACTIVE_HIGH>;
+
+		orientation-switch;
+		retimer-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss2_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss2_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss2_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss2_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss2_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss2_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK3>;
+		clock-names = "xo";
+
+		vdd15-supply = <&vreg_rtmr0_1p15>;
+		vdd18-supply = <&vreg_rtmr0_1p8>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss0_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c7 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clock-names = "xo";
+
+		vdd15-supply = <&vreg_rtmr1_1p15>;
+		vdd18-supply = <&vreg_rtmr1_1p8>;
+		vdd33-supply = <&vreg_rtmr1_3p3>;
+
+		reset-gpios = <&tlmm 176 GPIO_ACTIVE_HIGH>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss1_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss1_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss1_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss1_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
+				};
+			};
+
+		};
+	};
+};
+
 &i2c8 {
 	clock-frequency = <400000>;
 
@@ -756,6 +1065,30 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
@@ -854,6 +1187,33 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pm8550_gpios {
+	rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
+		pins = "gpio11";
+		function = "func1";
+		input-disable;
+		output-enable;
+	};
+};
+
+&pm8550ve_8_gpios {
+	rtmr0_1p15_reg_en: rtmr0-1p15-reg-en-state {
+		pins = "gpio8";
+		function = "func1";
+		input-disable;
+		output-enable;
+	};
+};
+
+&pm8550ve_9_gpios {
+	rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
+		pins = "gpio8";
+		function = "func1";
+		input-disable;
+		output-enable;
+	};
+};
+
 &pmc8380_3_gpios {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio4";
@@ -1093,6 +1453,48 @@ wake-n-pins {
 		};
 	};
 
+	rtmr1_1p15_reg_en: rtmr1-1p15-reg-en-state {
+		pins = "gpio188";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr1_1p8_reg_en: rtmr1-1p8-reg-en-state {
+		pins = "gpio175";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr1_3p3_reg_en: rtmr1-3p3-reg-en-state {
+		pins = "gpio186";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr2_1p15_reg_en: rtmr2-1p15-reg-en-state {
+		pins = "gpio189";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr2_1p8_reg_en: rtmr2-1p8-reg-en-state {
+		pins = "gpio126";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr2_3p3_reg_en: rtmr2-3p3-reg-en-state {
+		pins = "gpio187";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";
@@ -1164,7 +1566,7 @@ &usb_1_ss0_dwc3_hs {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_hsphy {
@@ -1196,7 +1598,7 @@ &usb_1_ss1_dwc3_hs {
 };
 
 &usb_1_ss1_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss1_ss_in>;
+	remote-endpoint = <&retimer_ss1_ss_in>;
 };
 
 &usb_1_ss2_hsphy {
@@ -1228,5 +1630,5 @@ &usb_1_ss2_dwc3_hs {
 };
 
 &usb_1_ss2_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss2_ss_in>;
+	remote-endpoint = <&retimer_ss2_ss_in>;
 };

-- 
2.34.1


