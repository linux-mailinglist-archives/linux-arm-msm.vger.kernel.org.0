Return-Path: <linux-arm-msm+bounces-52623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB90A72D5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 11:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 042C0188F816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D6521149F;
	Thu, 27 Mar 2025 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEVf4+1Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114D211290
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070013; cv=none; b=is2BM3t0XIQs/Jax2JOS+E/OYOWR1/zvNOQ+etvXbn/XEtcKAkNUPb1LLlVC6eqZelM8s9XTYR5+OIi9g1u1sQzVG5HVYUlEjfVGpmHZ5jv45VIGEN5trrn0z0lej80ghk1D8SD5BB8exYLV49Qd6g0K8MUrLARs7dTfaItPQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070013; c=relaxed/simple;
	bh=4hK5NwvGZj3PELV41E3//V4IRXz5oGNBj9IGYps+vOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ellgpMvxyYVFq4J6SNu0uud6YZItLJ0zfkewxGqFFAKf0jeF98LTUuedjNBTPuAp8Rmds5qlb5TmVksPV+/QMaW0DDl1nLrsrH1agE3fZTmZhf0N0h7gb6seK2kIxB6yJRlI21lGqMczqLS+5xG3UTgcUfG8WGhGH1ySuvEvmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEVf4+1Z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so5031285e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070010; x=1743674810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=iEVf4+1Z2VQoEpbsRejOLlpWR5/4oHbTwAxdZR9VhPZFx3E9raWHIDxVXhaApuC8/W
         L42GPG+WMryR5DP5TULzBtVtWakLInnFCa8GmFrD5nL+EFeAYXR2VBQvanwoz8DFfzpq
         u9Ur40z32K8/6JGco30L0lkOC1IpwMg+lB9VaxMFjNkpfmNFopGrEGbAtBT6jAFyUc9a
         AFdjP80yx0es6rUY5sWaavNXbs7mAh3xvIanz8LWMk5LOMz55Yv0n06aEni20LLqGpI/
         r66OsXkS1zWM72v65/fd9t9GyzBSbUBidfi8XM2eeqeQunhMWLd0s+eYz12ortzjWT1K
         dFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070010; x=1743674810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=sd5tAnxTORzfRh9RM3/toSxHi8hU8xYXOvlZC+kxp60BaqmXUqV/tVML25Kci9kY0D
         owHcva3/sh0mt3wNn6HSER6aAeb8+pXp6BW/G9NucQ+Nj1VVpov16bDIGDhhA9NdI1Zh
         ZEJib/CtLonou7tG+YNJ+9C0bxJrtBl/iZREOc61DM5IS1vwSrMq1tzu23XqB8HJ1VW5
         a0KOIVYq2DlKwHT2jBxoav6RJERGiORMQM7ABDoFKZbpcSDb5QzPiEEqs7ne8RNco9Sb
         DoohBfu6u63iLmAKrc7fDcG62IpY0pf5NBTpC/ezAeVKx06adNV3dTWJT25IGtVbkuQL
         RtzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2UO+uwAapxJQtH4H/70tsKVlNyl1onYlmJzyZELwnwV/vwT0Wd9Zc3uWN7O0++JCXXsIhTEN7ZgkO0Mzk@vger.kernel.org
X-Gm-Message-State: AOJu0YyqZGUC3LzCL5y5GYS+OvkXoou9PJd2/9XvAMjCs/P1nUDC4VqI
	EyxlKd2tTwwPgnOzGMnPtqaqqizoYjDrKHpWTkLjzWQM2xZdWYPVni8tjJOt4Z0=
X-Gm-Gg: ASbGnctAJIP2j4rGpY2ufJv9BO5p+vXU4xBJ4Z2cV8/JCyfF+nta5Xdclupm0gZnUKo
	2CFdag5/TyJSJVdfVVWoMziEZEZH1pPpvA9FDAiilYEslpfVEkcToLGodwKj3ndg/iW6TCYcbPH
	AM5JkxwnlrvNAvvxDDMI9HVW1xWObaNf26UTkCm7K4G0diVWcZ9RMQJ5uJ9MxZc9WOrTP+bpoOZ
	z7aVOsi0fL/uuPB4hGfgHdk5015raXEBQ/v7UWmq+Xh2r+bDcWFIxubWeGap2784zslQ8+f3kRW
	GcIyCTHXT5gnR9see9U+af+TD1qCT6IOB16WPfD6mfqJ42NCcMHxFZHTmQaYn/1B4mUczA==
X-Google-Smtp-Source: AGHT+IGE/wvSmulXQdHaG0FP4h3r9RIUwRb2WD87idgq+VFnWxcnjSgEdf+KyFgQDYVFnJMa6Q5vdQ==
X-Received: by 2002:a5d:5f85:0:b0:38d:d9bd:18a6 with SMTP id ffacd0b85a97d-39ad1782022mr2444990f8f.42.1743070010288;
        Thu, 27 Mar 2025 03:06:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:49 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v6 6/6] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Thu, 27 Mar 2025 10:06:33 +0000
Message-Id: <20250327100633.11530-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index afea82616bc4..34d1d8927484 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -41,6 +41,7 @@ wcd938x: audio-codec {
 		qcom,tx-device = <&wcd_tx>;
 
 		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+		mux-controls = <&us_euro_mux_ctrl>;
 
 		vdd-buck-supply = <&vreg_l15b_1p8>;
 		vdd-rxtx-supply = <&vreg_l15b_1p8>;
@@ -149,6 +150,16 @@ pmic_glink_ss1_con_sbu_in: endpoint {
 		};
 	};
 
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
 	reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";
@@ -604,6 +615,13 @@ vreg_l15b_1p8: ldo15 {
 			regulator-always-on;
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
@@ -1461,6 +1479,13 @@ rtmr1_default: rtmr1-reset-n-active-state {
 		bias-disable;
 	};
 
+	us_euro_hs_sel: us-euro-hs-sel-state {
+		pins = "gpio68";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
 	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
 		pins = "gpio188";
 		function = "gpio";
-- 
2.39.5


