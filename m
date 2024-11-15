Return-Path: <linux-arm-msm+bounces-37989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6959CDC68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 11:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05673B2715E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 10:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A05C18FC86;
	Fri, 15 Nov 2024 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekzDDrFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302851B2196
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731666063; cv=none; b=b9hW/3MBk5cr3PXwAx7HFu1KveayqlAo+RnvNhEOQIf+3/gD9lllE1F58SG/7m+om11m/e+UNJw4HOKh0wxJh+6ZzSllsthygT+SVRMaXkbIcBugXJq9S+E/zpayFnTirk9hpeWU3InFDTA07r20Xt3e3TctcM4GuRpZNt0y0+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731666063; c=relaxed/simple;
	bh=4pvj3RcFaHyFcXU5TSfG2pJeuLLKECeuNu7+oeJQGgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzdRGdEoIP2oz7D6MY2FUXvPMCapd5EYedcN7gha2t5xQ+nUHOwVedW1gqV3A51JUzyIgGZZVUtbwRckYvlzsJp68e/TQyMmtGfxDsGYiP85vzss117cP9PwzunFAgmNWmlV6K9vpgcIS1iJBSs8xcDC4qNmvkPL1LruXABIIc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekzDDrFX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so17504425e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 02:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731666060; x=1732270860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeQNRx7lpK/GDSryJ6BkIjI+HYySdSCbTfQqez+jfkg=;
        b=ekzDDrFX+Bd29kGGtn+CDEZgvVI4Xxh+UMIlyXqrtSq2f+uYO1gBlgy4XbvTom/BBm
         w6/lQKb8gF5dJ/yy7GUeUUc0JOfdNGCuh+ZyslmNgOOpVbhst43Yti4vYX0ldR0YBRaP
         Hn4jPlGntf8eDNQVmo4L7LgEPmquxekZ4JnX1GSN2bm+29woZAbwEZRoNnvedk9o6BP/
         sNFxmbKTOrNzQUKzxkbR1dyMnbQR4VoJXLLgOx7MkDbjU8WRo4sSKzeOTGc3KIz8ekkl
         bnDQPpkwgMKC2dfyjJ/r3m5Iz8ueEzF/WhEbJZg3N4jF0NwjC1IX/L+PGGCjbKBrVORR
         zkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731666060; x=1732270860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZeQNRx7lpK/GDSryJ6BkIjI+HYySdSCbTfQqez+jfkg=;
        b=nnu6bFEhdrEFC/kTE0eooEobHCKlv/mbW85T5ZPW9hhq0xR7a+4fyAA2rJrv1uZHbj
         u/i41n2lLVd106VVuH6YIeXHwOpWN3/jNzN7C57fzMrQDyxS4Pg7y8BzVODUqGHbus/O
         5ZMQHet122Oa65yjN4sdfg27PbVh0QC62PjnVtt8R5DGFnCg5PPU9P6Fpcre3dfu25n3
         P6p4l2l/YVl1+kasTnXkKBEZgpPYsRybgore8QRimnEj00JuMrkTdE7Easjs/AjTICqZ
         poLoQwtklDLwm5B4wOefcVXIvp2n7+bEauyUdlmHyzp97v1YEHrK4xtf6nb12eiZ6hnq
         hLtQ==
X-Gm-Message-State: AOJu0Yx0kjwvtff9kxBf1Y6G1q8Wkgf278apF2BgcuxoE7ujc7POJyUD
	frIuaqPVntkeGA88/YacMqg7uq0t5nM7vsVeAOyq1RRDocfm2df50ALdO5iaQ+4=
X-Google-Smtp-Source: AGHT+IGIoPWOzRDNQZvlX+IYVb/j7IZ91jp6mD/+zEgO7tguT0YmNZmscq4+WY/0O6/302F52uaBVw==
X-Received: by 2002:a05:600c:34d0:b0:431:6083:cd30 with SMTP id 5b1f17b1804b1-432df7229f6mr18823915e9.6.1731666060490;
        Fri, 15 Nov 2024 02:21:00 -0800 (PST)
Received: from [127.0.1.1] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da28bc11sm52109995e9.31.2024.11.15.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 02:21:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 15 Nov 2024 11:20:54 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sdm450-lenovo-tbx605f: add DSI panel
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-topic-sdm450-upstream-lab-ibb-v1-2-8a8e74befbfe@linaro.org>
References: <20241115-topic-sdm450-upstream-lab-ibb-v1-0-8a8e74befbfe@linaro.org>
In-Reply-To: <20241115-topic-sdm450-upstream-lab-ibb-v1-0-8a8e74befbfe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3073;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4pvj3RcFaHyFcXU5TSfG2pJeuLLKECeuNu7+oeJQGgA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNyCJuN1tAKejxj+8k8Ji7UU0y8NgxnFiVvBOE
 SkyNz5HeNyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzcgiQAKCRB33NvayMhJ
 0czLD/9/InzNKq1vLvBqC2CIV2pRGxSWhQyVKshI5YjMJEzy7Pxa4QKIqH2Gh4eBj+COmXSnrsJ
 +S6xDvtHqkbKjaV/LRmph7z+ieshO2umqYxaKl3LT4iQcVVcY7l67j8Wz4OmfoX52DfmKytTiRI
 FiQTPwNLWi8UVgVnVKtFZT4QjwA6vdEwY9FVjDDnrwDjE34BUq73X26o9pwjEq8LN/dffhTdsoE
 r+GyRC2FbNhfhaFRcJ0mYvsuVX74WaSlE45rMNznNB/XAocltsasvYHTHIA5E5uzkXwoDcQ2UuN
 /UOS6DL5erGKpM5noUmNPD3uzZIQm7/emOWuQk2On8fDDbSxZ8a/eG5oc1YpujCzwX9oD5APBlm
 mmX78UFBiW3SCT/NrClxTeywDFLg1e7s+dSPCS56V8jg3LNSNGP5EtMaUGMlapDkJJ1nMxGikVi
 P9QfnuDsAYckGPa4TexcYdFdM2/HdlsveJJnYhDl2aa7rrYB++gFlcqBsB6glCtSaaG4fwTOnsA
 Efu4vK8VW7C9z14eaKwM4lXR6NkoK+c8ATXfcARVYLHHdANEPEvI32MqelHZ9e+JUBpMB/LhSy2
 XXu4PcjPOZb1Qv7I5otadQWGPyQ+0tI9gtwFb5hiWjPfmZFjuInKNVNWbLK9VvQl+CB7tkRiLIE
 9LFpohEjGWo9pjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to enable the DSI panel on the
Lenovo Smart Tab M10 tablet.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts b/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
index 175befc02b22f5df895e95d828edac35fbaed963..e80a89c59818573c7068c3adeaf51fd51defc7f0 100644
--- a/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
+++ b/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
@@ -46,6 +46,18 @@ other_ext_region@0 {
 		};
 	};
 
+	backlight: gpio-backlight {
+		compatible = "gpio-backlight";
+
+		gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+
+		default-on;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_enable_active>;
+		pinctrl-1 = <&backlight_enable_sleep>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		key-volume-up {
@@ -63,6 +75,49 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8953_s3>;
+	vddio-supply = <&pm8953_l6>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,tv101wum-ll2";
+		reg = <0>;
+
+		vsp-supply = <&lab>;
+		vsn-supply = <&ibb>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+
+		backlight = <&backlight>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_reset_active>;
+		pinctrl-1 = <&panel_reset_sleep>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vcca-supply = <&pm8953_l3>;
+
+	status = "okay";
+};
+
 &hsusb_phy {
 	vdd-supply = <&pm8953_l3>;
 	vdda-pll-supply = <&pm8953_l7>;
@@ -90,6 +145,18 @@ touchscreen@38 {
 	};
 };
 
+&ibb {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	qcom,discharge-resistor-kohms = <32>;
+};
+
+&lab {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	qcom,soft-start-us = <800>;
+};
+
 &pm8953_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
@@ -237,6 +304,36 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <135 4>;
 
+	backlight_enable_active: backlight-enable-active-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	backlight_enable_sleep: backlight-enable-sleep-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_reset_active: panel-reset-active-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_reset_sleep: panel-reset-sleep-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	ts_int_active: ts-int-active-state {
 		pins = "gpio65";
 		function = "gpio";

-- 
2.34.1


