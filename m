Return-Path: <linux-arm-msm+bounces-52315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D733DA6D8ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 12:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429943A63DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 11:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4E725EF8D;
	Mon, 24 Mar 2025 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMWIOOHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFDA25E825
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742814390; cv=none; b=DBjNDpCpfHoUeWXY2Tg2rKGYH7MjyHxQ4NNm5aAIBDcOetZ+cdqkUbdlJ6pfFL4AA2UwLhVdvlrzyT5s6i1pg0Lp8TMjPDOhz1WL5874cyvFdRXboAP7qwTmG/XmfUYsjSRtHeCTuG6SnLZjUsqEj+lLcCBAqddbx/QUbLSnCLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742814390; c=relaxed/simple;
	bh=4hK5NwvGZj3PELV41E3//V4IRXz5oGNBj9IGYps+vOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IIbZlLBHhVIdrLEKmpAJ9uVklo/VFdeZcRPmwKraqE0LVRjdbCDK2lpK+Z1rFsAqe5eK4ifIz0mKtSLge5J/A1Epw0rbxY0fNN+yhCFl5AfEUT/kP9Fz5SAVUlOgG5SoDMw6jy47dCMewk32bRGBAFZw4w/CBEGhlzxFVo2fA/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UMWIOOHQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso27850335e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 04:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742814387; x=1743419187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=UMWIOOHQGxZ4zX+AuqN3iCirLQn945tcf5NzPm3jisQLhnN41SPycbJ3Hq92xoCskY
         TWHy9TS7qGM6vmtWGyhYMcsI3goitpYBeQSCVW3wYhG0lgJjTq/RETqyj8lqZZU62c/A
         XqYje+tOCYqnax4BbmUM3zeSWbYGHTNwzBSHlXNsF7zKaVw+KESS557Edld/lAs4X/7+
         fVi2G6amEq2D+/fveEXRODs+Vy1glXyYbJ/+20jQXAZersciscTe43HH5GB6R1PWmMnL
         n9P4NeDu6+D6RWmoCPerUVk8QbQCFlmJAiSCl8anbEptp1AuHCyuGJAeWdUw9mAT9+P5
         AQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742814387; x=1743419187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=Sm9BxV+/XN74eYhAl8x61rO0l8ru1lWWCJKYcZxkYhCN/42ZpcDGdLiXQd6QYO6IrD
         ChHwxJZ9595gUsXXKFpoF65nQunpnTWnUbbSEqN0LZWca/IZf18UkrTCO+0I+WHg2L6V
         gQfX74eSv4v0l8qYl3iA5U0xe96DsVMTolqXsqL1taXuBIETiMp5y8XZed8b31SezXPL
         2D3cv6hS94A6JgBWv+erlglkONURfapVVN6bGe8Sz/VzBy9vlv0YB2pDTTr1tBU5HD3j
         XoFur28QSBwAhJ52LAza5yxQWrjamPcVqP5OwqzJxoZ+1jYERGEarw15Oj7tqu2eDfEa
         mZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCWapAw/F2t+j4z/qophxm218rfmZtRU103WMaHWKO0QWfBJQPCH6HpGIIqF1oYNHIJmR/EVW4lkdjUNKTGr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfw56fFX0TRFii+jWNU4Rp8/UClk6Gzut5z5UY472VVoypD1Iw
	GzhbEpGpNQESVUVYGZfjZHtocv3TS4vd+Ezrq+e9zbrro6jHTTTvfoZCgcUGZX4=
X-Gm-Gg: ASbGncsAa/najKFRW559eSLQ6P6YxaR03d4mkjoGPiQfr1tBauXcUrXcTbY1srh2o+c
	nZcxvNwuOHbweeQXirmMAVbVWuImmx7ZkgQ94bHk4y4cT1gBQz6/bPkHfKK98Z++K0DhPmpVf3g
	qvuUHHC1roG4szLgKCAz/DgeIWcm/3f6JNWAQW0nA/QaXq3Y1SJ1LHwnBnLS3h2Ic9qTTUPxDqD
	cdu6uzjZyCf71KPmC1KMSK+9xJEws6bV6s/HAVylW451O9YvCAEZ9ft1Rb+LNLW5tqVKU1iLd+y
	VOS7RoMn0cyRyT8QDS887U8WOKKnFq/E76He24qRYSVCR3VBqs5uo6Yh7c2zBBA30JxVlQ==
X-Google-Smtp-Source: AGHT+IG8WBPlCvVyY1KQYR/9Iquhnkhf4Qaz6J24cTBFhVpXQTdAUekDB7RcQcJow0uNLB2tPbEp/g==
X-Received: by 2002:a05:600c:1d81:b0:43d:10a:1b90 with SMTP id 5b1f17b1804b1-43d509f8691mr116342525e9.16.1742814387134;
        Mon, 24 Mar 2025 04:06:27 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm117236055e9.24.2025.03.24.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 04:06:26 -0700 (PDT)
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
Subject: [PATCH v3 6/6] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Mon, 24 Mar 2025 11:06:06 +0000
Message-Id: <20250324110606.32001-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
References: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
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


