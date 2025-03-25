Return-Path: <linux-arm-msm+bounces-52451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE09A6F4A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 12:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E95F91891A16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 11:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E84125745F;
	Tue, 25 Mar 2025 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O37S5wV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C72571DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902875; cv=none; b=kycSB7WSlYi7vLP7B5QW36+nWc8+RUGE17cMJ8L0pyAUJIfgAP/R23GKoNDXtiq0uZ33y807eL56uAKRe9VZ8FG7Hj62MgHQyNDoJoEqRZzw/1WYU6bsk86CceySq9YiwLqGJ3aQESENJh07LcFaCJN48vWM1nInnq/eWDLnIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902875; c=relaxed/simple;
	bh=4hK5NwvGZj3PELV41E3//V4IRXz5oGNBj9IGYps+vOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OEYfhpQdQ5j3rnusDa1GNY6xrgc5Dts1ppxMeIzMUxDRTAM+3ADZh2TsCbYcuEoCkZB+WiFavYZNq3w4Vhg1K45u1eGTVap0B8oh6hOxgMqetEFJ+wnLMY8kcg6DUxrmbuKT8VSErm+8zR7i2sBV6E1az8ZvMnMpHEZrE0FPn6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O37S5wV+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-399676b7c41so2938038f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902872; x=1743507672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=O37S5wV+iqpX8LHQLqDuBub3v39fJGQ1jyfFmU5HgS1AsV6pBmA00c4M0oJU2vSSSy
         RhQnb2/5QHg18hkf+Ayg5tGQkQz7U6R8jui0UnBLcJWv4COW6MTfyrqDnbtJmk1IYWaP
         MsNDYDcbEClzxgGIVWAjY87akqe7w5eaZHTM63o+jNya7GNn5akIBv0Bb5tVpemnQYul
         8ycHGqhi7H9cQ9s8d9V3MkC9NBl6n+7213xOjRfFdpRG45ZyXYEOqv4UAtlCGeoDOsUy
         cqJYWsGLq3QhZnBtCHjzW3O5e90rw/1X/ByTdSfPPwZOnf/ePaZ8wd2VbVqO6qTmyKBq
         KYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902872; x=1743507672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=H4v6uzIpUNGGQxhk0MIyU6A5im3NCz2QIhuZapO4vAfS0/xuU86m6uIBCX3DwVw0fM
         QnaSFRcQyewsB0RuY05y3zqFQgOGy243eeG9e5Fi+Zo6FVCHLVE8QBEEOT5ZOj/onERl
         Iv3d3Ht1GWz+4lsvX+uEC3jCRuRM4khZcpY9kX3q+vW2zzB5qt1Lfr64IlMuEO5659P+
         mb9wJSBAiG7kMYwN4qJtJeUGG9bxHZVK/SqJ0Bppc0yi0ffEIDf9nv7C1+gGM8AHbnkW
         GmANg0KswskR63ZD0fNICw0D8EaLkrWJjnEbjWeRevDT3U3ouyYakfZn36FkIclpgWia
         x4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCU1bfAhI7gxZG2jsfP+WFs4NnS2m6HHq5HQ3zNpN98zv2Eo+/7MgMPuZ5Z7EV2uGA9sHbY6ChR6ZdTmb7+h@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMFe6IrZTc9VE1ORCQkxjRIG9e3d/ZtHg4x2iSsOzwTNT3Qkx
	BhcS0sfFob7Y7ofgW+1KzmpRikpHmqdwJ9X1p2r8gf7gFqHekG1/62IZSl9tlo4=
X-Gm-Gg: ASbGncucAsi0smGuwT4xm5DLH4rz2+jh2RpLZ+JdaBuFmML3cqvveKIbcxolJQndnJG
	P4SQxwE/FTMe+VdYbsC6yB36m/BQM37VYNw2pwABA1nUgiFxos7nMMbNi+snRVdZ+Uj8kB6xR7E
	fICkem59k4ndf4Dc/2OLnVXhzfeT/6TTUruTKtYNBXeeZep2aY18EuFHzc7X4D+UxhKqP9gZF7I
	NdWZu31PxG1VIVmXswjcyZhXXh37fHIOPvINhWhxWCHOOwZiy2HbJyPTms2BrgjjUeovcIB47Ri
	1RixS1Map9Hlt1tNLDXwvBuJ3UqPEcpRN6iYnMUMwI+O7hoBADuvJNTdmkr19kyGAOgTVg==
X-Google-Smtp-Source: AGHT+IEMuI1g0ZU02+lOgr8fYYCjQ7o8X4OMjftQEoVT08K9es8AYYCt3BGby4k10kE/8HnyILx4Lg==
X-Received: by 2002:a5d:59a6:0:b0:390:f6aa:4e72 with SMTP id ffacd0b85a97d-3997f8fabdbmr14153166f8f.18.1742902871718;
        Tue, 25 Mar 2025 04:41:11 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:10 -0700 (PDT)
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
Subject: [PATCH v5 6/6] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Tue, 25 Mar 2025 11:40:58 +0000
Message-Id: <20250325114058.12083-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
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


