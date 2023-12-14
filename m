Return-Path: <linux-arm-msm+bounces-4769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5418130FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 14:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CAAC1C21716
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 13:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86DB54BC8;
	Thu, 14 Dec 2023 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/uZIrjz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203DB120
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 05:10:26 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50e18689828so565137e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 05:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559424; x=1703164224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W/QSsdACA/eA5fQPjydp0vgvxLKWZdDjtl/+3q43lk=;
        b=K/uZIrjz//z8rYU1kFxAOEgqp6KSTw6KzTxlefhfBsupalvjMn/CSSv/ftio1MEDB5
         k/DAKiJGjrnZ93A18fIO8YSIKgCOJyzu4vay/YvKh8Zo7u3R05HWr64+CgItMgzBLHgz
         Gs1nCpeX3bIW0w5a2zaUKeYNDy0YcXeAHFkylJfYOZ9zE5PT65M0fn7aP3S2OPhlhu/D
         rs2c6RHgBwPu/J/RQbGKdIlTTaGra9HG1mxfD/w9wCd0yuFQRdwWD9iVWqyfRugNv2UN
         dYAvwZwEiTPkTsxjkz24+PuqZ6Kqk0LF/xSrtJu3PKeLuFag3DqIHVCYAxwQYxUyu/pn
         rLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559424; x=1703164224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W/QSsdACA/eA5fQPjydp0vgvxLKWZdDjtl/+3q43lk=;
        b=k4rVGiXNc/NtV/dI/7ogs4UmugpAiyFXAR3ab2nej8IQDGM5JDm34N8WgfnjME21y0
         L0+hrtu1gTOfV8LJkkRrELwMJSl1Un7ibWaBMWShH/frjgb6D9DZeaHFndRAtkTOj6vV
         vThCGZ9tHATzWNI18BGQGytZ5qPqv1nuY5npMOYqSH8LwDYo1CA787DBXpwj1h7aofXo
         b3eTWSCXwtlBscjh0wBjb1ElKG0aO4K6rlFfNZ37oyabPXIVSjg4O+pli4to6GjbL/k7
         mNKMribgOm9hotTjbeJv0Y5ex9/1ijxSJmI1gZ9oeGQjv5E+uOtNoS66C2ADAk5ykEvZ
         5ExA==
X-Gm-Message-State: AOJu0YwJo9RgDzyMBZP8qFQoiJ1fQukqp/mmBeROhL2iWX9ByP6cMU+C
	nPtEprAQfZ0coR9hu8JyM3Rfxw==
X-Google-Smtp-Source: AGHT+IGeoMrQeDi5aSzit+fx94Jr34rs1Zn4BPlT0fYh/FcJK+8FnPOOIGilItyEEuqmlx7DJWEfCA==
X-Received: by 2002:a05:6512:3e19:b0:50b:e4ba:b07d with SMTP id i25-20020a0565123e1900b0050be4bab07dmr6523387lfv.75.1702559424352;
        Thu, 14 Dec 2023 05:10:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vq2-20020a170907a4c200b00a22faee6649sm2547776ejc.117.2023.12.14.05.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:10:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 3/4] arm64: dts: qcom: x1e80100-crd: add WCD9385 Audio Codec
Date: Thu, 14 Dec 2023 14:10:15 +0100
Message-Id: <20231214131016.30502-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214131016.30502-1-krzysztof.kozlowski@linaro.org>
References: <20231214131016.30502-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Qualcomm Aqstic WCD9385 audio codec on two Soundwire interfaces: RX
and TX.

Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 56 +++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 4f7f83d49847..aa5c4199bd2c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -18,6 +18,32 @@ aliases {
 		serial0 = &uart21;
 	};
 
+	audio-codec {
+		compatible = "qcom,wcd9385-codec";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcd_default>;
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
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -607,6 +633,28 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
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
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
@@ -649,6 +697,14 @@ reset-n-pins {
 			drive-strength = <16>;
 		};
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart21 {
-- 
2.34.1


