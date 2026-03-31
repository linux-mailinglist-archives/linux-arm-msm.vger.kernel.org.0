Return-Path: <linux-arm-msm+bounces-101156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKCSJCkkzGllQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387B370C45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09DE230556FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3A13F7E65;
	Tue, 31 Mar 2026 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIQhowUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E4E3A75A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986248; cv=none; b=NgMFWgchQzDQw0dma0yHup4VXhzfChpp4TV8B7tDRq+5vS/uD4MeU3lau8THrJImZ+LMt6A+s+ylWElBCcqDeXE8Tj+mwMa/7Iofag+ch/Ic+uD5t+NNxcWuvAmr3AyyWeNLsI9wWXFSTV6KITcTk6nPPUI8hu6mXtIJZz+9hGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986248; c=relaxed/simple;
	bh=jhJ+9X7mGcDu4aUH5n4fWbiURU7rddBOFbSL/B5iHQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbYELmJAJFwYsnfrKcsfEAGKDcFRqmQ0nmF4OxCx3DxM0eFrbgDdMKmVXWKlx3Fo/cb/QqS0F9Gt3QuqgJJvwlvQH//8ltSGFoURTWPUDLkawbvKjR9KV4prKg9Y99J27FMXDuyykBQu9uimNkeFnJ7oTak2E2AY4s0eqzyfxfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIQhowUY; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1213092585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986246; x=1775591046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41V2HoNtVWwcbC5TAQVx7fTS2emu4IQ5c9Oeou3v8J8=;
        b=DIQhowUYdw2PI0nUTVWR4Q4Fv2GfLAHw5Y9zgTVBbPLQecrSoLkHEX/s8qAuWMHIqw
         H3Q5zIPmD/dRK82snZmkY9msh4BwAdRPzx1FWn3jnjObeOzD/tB1X/3Fj1QsiWqIMlU2
         R78ni9qwf0ZCosRuIvE8F/G/GYzy/4tcn5P14zF8hFkqsUmUOmAeM41gDBOlBN86ZktO
         X4LxIbiXlz0kXazsnljPm4xCE3PdU7FbSQxGoBLpexn9K5N6foX8Qt9yxlBVjBMsnrZC
         R5knD8e6+UkfqAhsqn6jVFHZ4CDJIIyANshHbaSeiUDY624I3FqXtHzoHQJqJLC4vYAf
         +m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986246; x=1775591046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41V2HoNtVWwcbC5TAQVx7fTS2emu4IQ5c9Oeou3v8J8=;
        b=atJXYSPh7w9x3sSMyLmU4ELgR8CE817H1cmXawbTQr5aO7+KKkvpyokK2X41zM3jKW
         FK40vEWHBlU4AsHLEjDZUF2n7h0vBQNwe7gTKiyEgeB2kkc1qHhOwFhIZLHZt+Jsg4l7
         d3AgOFglwaRpULvcVlHVB21brfeSndSpI91lsQY8lwhtwIGepg9wg0VPYGjSBopSd86n
         i7XkW+PkgA/pbUoxjEYW24Ptc1wwtzgMmO8wqgGc18SnIuu44fMFdd6EAFg1ZkoS1ww1
         jGTBQkZe2kDyQbHGpbu6ZNbr8uZUV0BjAphpPl2tnZ7irjaK6Pof1N5x4ymH3aRlVrKH
         NwoA==
X-Forwarded-Encrypted: i=1; AJvYcCULJWSR4wsk7xwfw0IEe/sdCrxORWVhrbl3eBkW1sUKib/Mr5/ukbjy1C/YblmKYpvnBrxbCYYQSM6Dyj63@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4+OYzK7J8QwOkncQC7lQci/0ipciKweRoDODsUAmveY69CE7
	AUgRa8I+lq+jtPc8iPDWDH2paZvopxHJgMCPU/6T8ISG2cHRlZctt+ky
X-Gm-Gg: ATEYQzxqbsg1/mnp5EU1B4MZ5biOdXzKSyB6W+eoDzT1HPRNhAw5eLkmRU7BvkznEev
	VPuTwdQz4u0Wp2jcJmuulLMM+v/g3vTkKUIkXQdxc3cH7/ug15RE8IZ7NZMMLeXTZIuv6Rv5ov9
	9k97YJAjaLf6yMh+9qKPyWxT5nP2Q2FtJYY69R2iUayCr0C9OCpgRGzPiuludwoWUDRBJlYz+Kd
	bVu5UyQuSlQG1R47CS5QYQBDarZqyRTSur5Vo1j+YD0HJ4SWGKf7fNfJ2Tq+2bzub38FCZJH7xB
	dl1O5HPSnQFGTaOOuRhxWuLd8GqM/rb3o0lnGmVo3i8CVvCktr0Y/RDxpdFY0BT2NrYKCB14F0p
	ReyWj6OX3z/XyYGQRI9nCM63/jZQZZOHOCn6U4GgWXOrOYOtEifqBMwalEMyIQ6pzhJ/K50IU04
	YW2smL6fGu458adtbuGkPZra2f
X-Received: by 2002:a05:620a:19a6:b0:8cf:e015:afe2 with SMTP id af79cd13be357-8d1b5bb8a73mr168064185a.48.1774986245724;
        Tue, 31 Mar 2026 12:44:05 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edb8d1sm893138685a.4.2026.03.31.12.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:44:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v12 3/3] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Tue, 31 Mar 2026 15:44:37 -0400
Message-ID: <20260331194437.41041-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331194437.41041-1-mailingradian@gmail.com>
References: <20260331194437.41041-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-101156-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email,collabora.com:email]
X-Rspamd-Queue-Id: 4387B370C45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
support for it.

Co-developed-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..eba2f3792dd0 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
 	};
+
+	cam_front_ldo: cam-front-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_ldo";
+		regulator-min-microvolt = <1352000>;
+		regulator-max-microvolt = <1352000>;
+		regulator-enable-ramp-delay = <135>;
+
+		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_ldo_pin>;
+		pinctrl-names = "default";
+	};
+
+	cam_vio_ldo: cam-vio-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_vio_ldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <233>;
+
+		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_vio_pin>;
+		pinctrl-names = "default";
+	};
 };
 
 &apps_rsc {
@@ -392,6 +420,64 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_1p225>;
+	vdda-pll-supply = <&vreg_s6a_0p87>;
+
+	status = "okay";
+};
+
+&camss_port1 {
+	camss_endpoint1: endpoint {
+		data-lanes = <0 1 2 3>;
+		remote-endpoint = <&cam_front_endpoint>;
+	};
+};
+
+&cci {
+	pinctrl-0 = <&cci1_default>;
+	pinctrl-1 = <&cci1_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&cci_i2c1 {
+	camera@1a {
+		compatible = "sony,imx355";
+		reg = <0x1a>;
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+
+		/*
+		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
+		 * better driver compatibility.
+		 */
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&cam_front_ldo>;
+		dvdd-supply = <&cam_front_ldo>;
+		dovdd-supply = <&cam_vio_ldo>;
+
+		pinctrl-0 = <&cam_mclk2_default>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_front_endpoint: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_endpoint1>;
+			};
+		};
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -490,6 +576,14 @@ &pm660_charger {
 	status = "okay";
 };
 
+&pm660_gpios {
+	cam_vio_pin: cam-vio-state {
+		pins = "gpio13";
+		function = "normal";
+		power-source = <0>;
+	};
+};
+
 &pm660_rradc {
 	status = "okay";
 };
@@ -508,6 +602,12 @@ led-0 {
 };
 
 &pm660l_gpios {
+	cam_front_ldo_pin: cam-front-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <0>;
+	};
+
 	vol_up_pin: vol-up-state {
 		pins = "gpio7";
 		function = "normal";
-- 
2.53.0


