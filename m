Return-Path: <linux-arm-msm+bounces-52344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14309A6DAB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F5A1893F1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C65B25EFBD;
	Mon, 24 Mar 2025 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMXdQK2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD625FA25
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821278; cv=none; b=nEGRp+ePctXJ2M+0DFc9ER+L93dv0iY0D9ogeKy++GH7YwRgbKusCW71nbyHYyBK3cWwy/Dr+I1BzRRKxELfl3X4pitJv1UnV9HnX72G6l41tUcqx2ooTFuRl556tfNvine/jUijpgXmebukzd+urU38hDmicQJ/Lb9qKgCn42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821278; c=relaxed/simple;
	bh=4hK5NwvGZj3PELV41E3//V4IRXz5oGNBj9IGYps+vOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cM3mrGbd/i807HQh3ko0Eixn7uImp8YFruxfg+u83Ib6jbXFWWyKbaONml7CIYrfWN+FqK/5nd/LUBQca+F/qTDBdr3RriR5D4bKH5IUGCparMVhONUHGlrgI6oXBVTQTcO+vKxdyPBs+QfsHU44eSZDzUYhUXvvJZ866+pj4bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMXdQK2o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0782d787so30999125e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742821274; x=1743426074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=XMXdQK2omOUAqBS6EweSRdMI3k/1gGcvPb6WOQc8Mjus2qXhQOBdeqyWhLcS/GzjU1
         SWuaZ3OY/S4zYpHL+/8fAolcDm10TWkV4hNUVTl1eRQBf65GU8cTCtCFMRzU+JUqFzzW
         fq6TQl/Tf129BO1EjQJtHN16JJKLJADIRBOtaT4f1RK2fQXxJ2WC5USqCN629qefqPiQ
         YTk+21Mdv+sZJHMOQR5wok3IuSLXqAl1pHReg0Vrl2JDxqWRU33NEIfSx8+TaM7DIPk7
         IN6SpT1jResUy1qWDzIsPqr+g/FHZUmOmOFgp0NAWEuJbUzDaFi+/5gFrKCBBQXEqtuG
         2fMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821274; x=1743426074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=ux3BqqUSoYUFKGk1EY6vIZxT5XMoM4+FD0wcqQuE7JpFEpj0GO8K3s9PKmhbLNI0eA
         9LrQSidOB7pC6zfqE+Dol58X/O/0p7SVCl740FtDymDS7dvThrBtQDHQUeZKM3TzD5ug
         lNlMaacDA/Ijf+mrjIwAmHKPY24+ScJa7qLhLu6pCplDOF6HdzG0Eab88WjHTgK6zx4N
         9+omAtJXg3t1hTT9Bw+EVH6q1SIFS7o5JqSBDeTx7ivrDELDNdtBJCjBc7A1j/TuRi5r
         VfGa/Ml1XRcUGmg7XLUS7ORa3TXlLNBO4zL4gTZDmT7nwvAxK++Qw02Z+8HRIR4JRieS
         ljoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp+Ehtl+Z7e43yYrb8p40XxSa041sE74WWMiWogSRCq7Vg4awu/QLAaa6IG41i1Z5pMQNJxtlK9jOOQnIl@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+1lsEDk/UXib47waHl/B1TS2vI03hwPPeGtTHhktZczdy9xA
	ASJErTYMeD3hVootyvK3sc274ClbiXp1mv6R+KOMvGILowtPR5O4T+ekSZGtRsM=
X-Gm-Gg: ASbGncuric1O28mibD9vLOqzUqck7vQQJBUXT4lyGsiyA8QXfpWZPBTr/Aj/yx3F4Aw
	fQKbgJNuV+C3XKj0OjG50xQnxoYjUt5Tq4fmulFnnLsv8Rtxmt/febQL0EDpb4l2UbH7Shdp4DC
	nrUfcRyZxedchNlMTzT1Juj2c6cpSWL43VvrRDs77bI5JkqZ/yJjL2rBHA81D6yTDIgE2dFE8p+
	qPDcd+HB7UieafhakxQznjjetPEpz14SBMRfSU4dEQqKOY2uWSZ8fuQvk+9Yvx3vfYmG/1gJjdB
	U2nZ9PL8fxe7l8J2+EvF24T4q/yV7hKwYfJvSiDmJDcwskMe6BncL+QhQmNKZ7Vm+LFaIA==
X-Google-Smtp-Source: AGHT+IGeenGXBUxGWQuSKN6iBis1h2PL0x44PYgwRi+E3q/OLy/gfMO1oiAs9uaXyCp/vP0FDPrvPw==
X-Received: by 2002:a05:600c:3110:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43d509e3394mr108748655e9.2.1742821272912;
        Mon, 24 Mar 2025 06:01:12 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm122275975e9.40.2025.03.24.06.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:01:11 -0700 (PDT)
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
Subject: [PATCH v4 6/6] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Mon, 24 Mar 2025 13:00:57 +0000
Message-Id: <20250324130057.4855-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
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


