Return-Path: <linux-arm-msm+bounces-52084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75DA6A5A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 13:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAC40465406
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150C022333B;
	Thu, 20 Mar 2025 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d9JYz6hj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECE6221F34
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471811; cv=none; b=U+fMv5MVZzgp0odEQsBh4uDzEkCMkZJJeWpqR2Z+7ezTqaSXMNSCJT+fKae7RigvasnS+rfrADZsiUHp4xYCKC2PVbT5bLMz0OSv2bb9CPX46cAJEqfwW8odJO1wtGUgf+XCxfhPwnKD/jtC7bGuebqpzHzuWEq8fbyHh8t+DXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471811; c=relaxed/simple;
	bh=cqZk3AtNNaRSyK3WSkjjmRwxCoEdwQtOrf4qTgoOi30=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cjc5Z9IsqZ4jRFAIt1Punq1qX3ujjdA7PHamsO5fGbFaCgQ7YF2v85h05IBkmg2M2T1Mn6z4dkmtv7UBBa2mhvWEljpRKZXrRWFK56ZmK7TXC/O2SMiB1HO5VSvVo6OJzrWEeqpFMLq5MSu31TEYSzuzJ7CVZ+RtsClR84hi/jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d9JYz6hj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-399749152b4so285448f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471807; x=1743076607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYk31Su+89lU6oJN18njTVNWWCpqg8vmtkTowip21t8=;
        b=d9JYz6hjtqL0XlLwEWRt1o7YbNodyVIv4a8rPRJ7bUJT2kCtpD2cQEzlL7yPJYskof
         VWCWfz3QdDWAf5bZvClMVdhDbeQU2j2/8rx6c55Zx97Ml5OkK3XOa8Qno3hpo8gx+6se
         xvGJmUS4ij46udZh4cd5eDJ0vZO4bztA/RG7KsCAcy+g2pNSDJ/9XXwmfL20+INMeEr0
         mUMyu2HGF5nauDuq7lib4t6veeaWygwdaEIEKai17oWoCL7RFNMxWQywbT7G2DE7ft8B
         ll7ZfLjU4cFz5gK+lmylS6EobB+tikBgphxSuiWV9bCHIf6CXw6KjN/Ew32JTSAAGnSI
         Qkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471807; x=1743076607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYk31Su+89lU6oJN18njTVNWWCpqg8vmtkTowip21t8=;
        b=la2KPdpJuPwYzusc5GHBgC5jQ9sFLfi2UDjWLcZ5dzddcEkzcVx1rXuNBNOOgFYx0k
         RA1mIGFcF7HBwOpj6yWHu0K8txA6DIh82ol8wTO3OT0CGCsMx05U1Pqo24SCynbE2FG5
         0w58wqlxZKRM1FjzXcai1DIFkdRqks4TFsSBKm1Gt01YtwY1iPn+P0xG5JCIr2pbu9QJ
         yUTxLDHN3b7CDcS3bOX/IDHZDGq1HPDRsVLk8IMGmmxZOdArwVmB2LJPZX2CsWjItC/W
         PLH6XJNleCulcIknxIlBE15jUBtj1seWsCjDlEJa/Hu+k+nfiEmTa1suoFKv/HQVKJPk
         amdw==
X-Forwarded-Encrypted: i=1; AJvYcCWtp0Ctfgw80cZqIau8xb5/I336B0WjGi580c9M5qItzHgNPcZBC0fAfqzDJCZ5mQUuYEHyq23w+TI8aJT/@vger.kernel.org
X-Gm-Message-State: AOJu0YweUi0QQkvNYBEznxTYbEs/DGpq1B7HroH/nUbjo6OlL0Gb5Dge
	QUtvPZ5Uu+aUqlMrhzkjdfeDDv+vX2+rRa3OLclpgl6datJwMAGQd7BWt6MkfOg=
X-Gm-Gg: ASbGncudxhEOvCObb8sxG+cUJiFc3701Vtf6PJkAFiqLXVTMzvNTV+xSKGBtQ5XqwLd
	Q6L6kWWi9WntjFB7yh4dpPzbQTtABfnOdWWti1gD9GDcu+yPm2PeL9Jz7mpjix8PNjyhmrHNmo4
	ltWJDHlOFC/o4K5pZmtzADqwiEf/oSxnro1IAXkwFbr2Bt/0xCUwWt8M9PgOHN8J1dA1QyQhI6q
	tRtNAIk9x7pIb8esuIBMzzwL7Gk281tsoAowB/GaV1XD3RLfrOH5TqWjEe7f/Va7hCwUXlH14Ti
	HNYDOOHG/3VbU5p7SzfOcuIXPh6Too5mpe1uvcyCNJTAhTNVFos7iz687R1taM325ouiBg==
X-Google-Smtp-Source: AGHT+IGbXLSBtSTdwWHcTNezYYv5v0xUo49S544UTd7/7NFqCyxLiZZUUSnqA8Pb3yJx5M6ETPpJAw==
X-Received: by 2002:a05:6000:1785:b0:391:c78:8895 with SMTP id ffacd0b85a97d-39973b32028mr4631527f8f.50.1742471807037;
        Thu, 20 Mar 2025 04:56:47 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:46 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Thu, 20 Mar 2025 11:56:33 +0000
Message-Id: <20250320115633.4248-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi mux to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

Enable the mux controls required to power this switch along with wiring up
gpio that control the headset switching.

Without this, headset audio will be very noisy and might see headset
detection errors.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index b2c2347f54fa..b40775c20493 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -19,6 +19,16 @@ / {
 	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
 	chassis-type = "laptop";
 
+	/* two muxes together support CTIA and OMTP switching */
+	us_euro_mux_ctrl: mux-controller {
+		compatible = "gpio-mux";
+		pinctrl-0 = <&us_euro_hs_sel>;
+		pinctrl-names = "default";
+		mux-supply = <&vreg_l16b_2p5>;
+		#mux-control-cells = <0>;
+		mux-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+	};
+
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -36,6 +46,7 @@ wcd938x: audio-codec {
 		qcom,tx-device = <&wcd_tx>;
 
 		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+		mux-controls = <&us_euro_mux_ctrl>;
 
 		vdd-buck-supply = <&vreg_l15b_1p8>;
 		vdd-rxtx-supply = <&vreg_l15b_1p8>;
@@ -367,6 +378,13 @@ vreg_l15b_1p8: ldo15 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l16b_2p5: ldo16 {
+			regulator-name = "vreg_l16b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l17b_2p5: ldo17 {
 			regulator-name = "vreg_l17b_2p5";
 			regulator-min-microvolt = <2504000>;
@@ -942,6 +960,13 @@ int-n-pins {
 		};
 	};
 
+	us_euro_hs_sel: us-euro-hs-sel-state {
+		pins = "gpio68";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
-- 
2.39.5


