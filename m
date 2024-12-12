Return-Path: <linux-arm-msm+bounces-41618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 901B59EDCB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95F73283822
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB8813F43A;
	Thu, 12 Dec 2024 00:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCIDFUqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E62213B284
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964466; cv=none; b=ChqPC0qnCBW1CnkhMyeSnVdcJn9ELWt8J+1OlMbtfyJrK7TnJJGpHPJul4D7TzapKJPqEObXOiobW0lrnL83oUjTwOvq2/lAt3jSyjgWSXuo8QWTvaZrvTPmc7ZSBqpxqYPDhm5GGcRwiRPpXsRKJMsoPGPmyt3Xn45yVus4c6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964466; c=relaxed/simple;
	bh=tyapNoEQY3XYO+jmzcvBF2+W19GTvYciSfkZQRjl4gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1Uhuw/N5BjtmqoOsFRaAeSQz/pfPE/1zRRm7sMezUlA6hktWKNbJK8+Yg0HdfbyIyV3HULRCRxm2MAwDNn1SAzVk2jalO92gzBEUmTMH8VCig8pyjbsf+v1grJq7PbH6YfitvVvKVemlOljokELwcC1wyIpdH9HN9MG2RTzhlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCIDFUqZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-382610c7116so11126f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964462; x=1734569262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeswejV8LMfcb7qwCslWXku0mWaecv3bAOXmE+9YQHo=;
        b=nCIDFUqZC1EYfaWP4mXqjCQiKZbE2+3ycLkcLsNwfWHH3GRPtUJUkRl3xniTPgwBu0
         er5csjwZPBrS/V00d/86Q6mHu5VB2RQtbQQq1K8WLOs6ppQ0kbgajOgpXcES+KgsIUwJ
         D15vFpmbB+9BJhG7dhwzvzz0tVst2bZQ/utRtdqUkcrVsGlWgWZeBUmJ6q/Nv19ZOmip
         bGPSSe+t0KScCcd3vy9fwkXBVvuwoXT69xmbKGxvpUVqEmZW4SymO2CVSxIMbhAYBx/Y
         kDHy4/v9Hr30QgtxO9KM+34ddg4Tc2Rj+UHFGxbneNW14KNUm0hpEkJQfU94Ar7dQQZJ
         KNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964462; x=1734569262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeswejV8LMfcb7qwCslWXku0mWaecv3bAOXmE+9YQHo=;
        b=DDsj3p8hJ5ExfZBJM++plYeJ1/Fj+mhikC6cD2l/cIyzDk59tb/dRZPnTlIiapPmEJ
         Jm8G33GLMhEIrX5Oqc57b6X9yPrMQOfyIAcGc6OesiLOXgPHT2Ggi0YIO+D+ueZb57NB
         7jBMxCzNkHeD53xyw6UkuBqaVplfd8iV7txrHqmMQoGmXa3kIQz1s9602apUo0s3C5lG
         SGVZ4gl88nIAIHP3ZfyodvJIiA7c3tfCG72D3sVCDdLjGJW70WbeeyKLzj5/P1lYzHLi
         2iQd756ETjy702h2Sjr4cCugjQJQSqvquWFqWJFFoFjb697W4AOm4R9TstRYGWVDf3cR
         1uNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1WF1ImCVlQgqyI2ssV51HjwkA9PhgBBipauKZ1E8o2w02YVwCA/FWU83ZlDzBZ/LU1NIWXEeHbvLSTJyu@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSIpbVvlAYjDVHpwofeQUbfojWTglpoSUYJertiV2I3Aq54UJ
	qjrbJVtvjp4gbE9GsCmnwMbYUEu60ECslBoICmAsh6PpIfw96EnrP+1VIMCBurc=
X-Gm-Gg: ASbGncuc9mc6EkP7kCx+XwT1t6oVzwHQV4jHfshmzUt54GBTH2dkDZEBYIp0Rby8SQ+
	2Kmizml5xx3Lgfq39TejOoZ2/asNPgbku2IR646dmrVRh3zxAJNYJGfyOMTZ3Tv56H383atjbcf
	GQr8xCZEUabYafs7EQ0muMOOcAZkeUEB/tX8Tn/V+A3SALtE1pNHpzh/8LPI8NY3GUis8BmQbLJ
	qF2o8Q2qouaLmFRiOqBBcig7VB0Dak/1K6x/FyTApd82jMEsRqI6iKkr7c3wPzz9CGZxm9P
X-Google-Smtp-Source: AGHT+IHgKENLpDieQsFB14HFzmuxdYzoOXPmh+CHOUJNHXU2LbSWQXM8lcVrkY+JONlF+DyQH9GcDw==
X-Received: by 2002:a05:6000:68e:b0:385:cf9d:2720 with SMTP id ffacd0b85a97d-3864ce55a73mr3615290f8f.23.1733964462584;
        Wed, 11 Dec 2024 16:47:42 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:41 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/14] arm64: dts: qcom: qrb4210-rb2: add wcd937x codec support
Date: Thu, 12 Dec 2024 00:47:19 +0000
Message-ID: <20241212004727.2903846-7-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wcd937x codec contains soundwire RX and TX slave devices
and can convert digital audio to analog audio and vice versa.
The codec node also requires description of reset pin/gpio.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index edfb18c85da8..6217bc6e6282 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -146,6 +147,25 @@ codec {
 		};
 	};
 
+	wcd937x: codec {
+		compatible = "qcom,wcd9370-codec";
+		pinctrl-0 = <&wcd_reset_n>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+		vdd-buck-supply = <&vreg_l9a_1p8>;
+		vdd-rxtx-supply = <&vreg_l9a_1p8>;
+		vdd-px-supply = <&vreg_l9a_1p8>;
+		vdd-mic-bias-supply = <&vdc_vbat_som>;
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,rx-device = <&wcd937x_rx>;
+		qcom,tx-device = <&wcd937x_tx>;
+		#sound-dai-cells = <1>;
+	};
+
 	vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_HDMI_OUT_1P2";
@@ -599,6 +619,26 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&swr1 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+		compatible = "sdw20217010a00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	wcd937x_tx: codec@0,3 {
+		compatible = "sdw20217010a00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
 			       <56 3>, <61 2>, <64 1>,
@@ -683,6 +723,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	wcd_reset_n: wcd-reset-n-state {
+		pins = "gpio82";
+		function = "gpio";
+		drive-strength = <16>;
+		output-high;
+	};
 };
 
 &uart3 {
-- 
2.45.2


