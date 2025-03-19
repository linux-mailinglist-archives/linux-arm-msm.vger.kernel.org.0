Return-Path: <linux-arm-msm+bounces-51914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAEAA687C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0ADE16F593
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 09:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E82253F24;
	Wed, 19 Mar 2025 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fqvb9XcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DE4253B6E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375878; cv=none; b=qFBFadmPtTiFtBleEZG66no5oc5d/qDCD21CrWuPrtReRl4yQF6qHCtocfu7IE9FXQABCfZlkedHD/FnyqbkLEwfp3D62y3fEEYqBtGe5rKEwnk2QMrzo4WcWVeuSlVzPYGxcL0tZgxKnCAKxqvLAS0wyXh0ErYRa+QZqSQJ+gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375878; c=relaxed/simple;
	bh=G/PQgzYwrYLYsv/3Tx21aVxfqG3KRo86XzpWAbXD6Ow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UV1n7BmIMngNlFpids56lngTSIhroEariWJGWboBBEx2+GK26OdQIOp6qtqSMXWjc/l0xM/Mc2qOrEqH3GRl642F1eNXODxgF3GwP0PPXkmZd9cZZoVwig25UZ9XsObPvA0j9UIFJhNMmiwjDWrLfJFgi4HetJ5wXuk2fmK3DXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fqvb9XcT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3595745f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375874; x=1742980674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MatIsPF8IuzJGTj4rqzD5SEaynR7KV/+RlpqBdYnhsQ=;
        b=Fqvb9XcTfRzkbiNj7uB2sd1ZrN6eRfgSSOON3qcypf101Ons81bD8YEM8P7fFkJ+vv
         Dr/inQ4V6bcHc/bSBZ84L6lDcyYqdv7jXDQ4VNN2Unn/YQpaOEmATo+DBH9+RNPFz8bU
         ZteylGpRguI1b/1xiBL12YoM5SIOaRL51uVqkLKvjpeaAdK6aRnb7rHBQ6LsNUHAooAs
         PQHmecUOutNRbF4Z9SPLBbhnCSvp1NT2KXA4ob7emNTSb45kvhdkasbKok0PDU6Djk5G
         Svb52qxVJf2rjyXt/kCqdz8amF6Bq5k9EqrUBhxUFH6k9OEIHy/nE79/Vd50GqyvBp4e
         MYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375874; x=1742980674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MatIsPF8IuzJGTj4rqzD5SEaynR7KV/+RlpqBdYnhsQ=;
        b=iQuO8hMhQoyFml7mjTXTyfD7Nad2a6y/giFH+S16mEVYzNFyibXkwUt7+F96BcjRCT
         wfD5vRGsbT+RfOgHZe9+dW2spfCTAz+gwOSxzgGWeOMClaDJTtn1Qsl1JAKkGnkxmJps
         2XGWPwEvGXXS1N/6ifQczbZu5IEIsUzOJNZUNGC9CJwX2Ws4O3GQ7YI59PmRL6gauchX
         +FhpCokyNirfWp7jJuI6SLm3//KDG/WMuJ7ds/5sAHg5HZcc6vV3Mr0abqlZuSyvfZTw
         HTHuYHxpdIagGgnWiGiWmmmZo7MByURsUrOElRVPS9DbdH8hDi6+h0dkdqziVAtXKFOD
         cfSw==
X-Forwarded-Encrypted: i=1; AJvYcCUaFDfBs4lL/Yk2CipoPELPyX1IRE5Z+X2CFk0AFzax6+gPyQdEWevqGK/A02Vw9urHHX/KIRgN2FlTZz8X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/TVI/67hd9duC4k1mL3oGgxhRu36csmixXMeCLiWTH8ZoLv2B
	zObS0lh41QfW4JMyU8cTV1x3I7GzDtXs9z0w1MFerpHtgq1q2D9nAdYQIb/Rhh4=
X-Gm-Gg: ASbGnctH/2bOGCk7tZuHtB8Uvb+BYkfsKwnREkOdwheBaSoef0N1cmbnuWKW9ucEf0T
	DXYrkudXTEkhySjrJhYaXu3LQCx/iIQdTLv20K8dDzvXEB/gnGg8BWHERkiQng518agux7rKCNm
	XMn9HrZnKmwE+BpvdU4PM6Wn2/0woIkQCtmMngvQ2xLwkO5FefKaejW5ydnV1Eum5/TAwkyr0s5
	1rJ8dGHLXH/35lKGy0vwkKL9UaaZhEPItoeyrD5rKmTutkFv8uWux3AmbDclkhqVoKh+FTd7gjm
	3ksaXvUiU/b42dPC/vfdeaz9RbQODOSey1hU7qwAQBsfykml3OMZQ6IRey7SbPskpXS37A==
X-Google-Smtp-Source: AGHT+IF2OI4R8vpQRvrvPUiz9MYuf6mjmby8aJEe+xnR6Wn2dDxTXW6xtohznPik5sEd2lnjFnvXNQ==
X-Received: by 2002:a05:6000:2c7:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39973af9236mr1231112f8f.36.1742375873640;
        Wed, 19 Mar 2025 02:17:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm20023810f8f.23.2025.03.19.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:17:52 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	andersson@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Wed, 19 Mar 2025 09:16:37 +0000
Message-Id: <20250319091637.4505-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

Enable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this, headset audio will be very noisy and might see headset
detection errors.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index b2c2347f54fa..f39c51c809e8 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -22,7 +22,7 @@ / {
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
-		pinctrl-0 = <&wcd_default>;
+		pinctrl-0 = <&wcd_default>, <&us_euro_hs_sel>;
 		pinctrl-names = "default";
 
 		qcom,micbias1-microvolt = <1800000>;
@@ -36,11 +36,13 @@ wcd938x: audio-codec {
 		qcom,tx-device = <&wcd_tx>;
 
 		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+		us-euro-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
 
 		vdd-buck-supply = <&vreg_l15b_1p8>;
 		vdd-rxtx-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l15b_1p8>;
 		vdd-mic-bias-supply = <&vreg_bob1>;
+		vdd-hp-switch-supply = <&vreg_l16b_2p5>;
 
 		#sound-dai-cells = <1>;
 	};
@@ -367,6 +369,13 @@ vreg_l15b_1p8: ldo15 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l16b_2p5: ldo16 {
+			regulator-name = "vreg_l6b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l17b_2p5: ldo17 {
 			regulator-name = "vreg_l17b_2p5";
 			regulator-min-microvolt = <2504000>;
@@ -942,6 +951,13 @@ int-n-pins {
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


