Return-Path: <linux-arm-msm+bounces-93038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDInOEm2k2l17wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:28:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DFC1484D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9D1A303132B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72172475E3;
	Tue, 17 Feb 2026 00:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtA+1sQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C1826E165
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288106; cv=none; b=b1mlBBfnj5njAPy8Si/Yi89zbkm5eYp+Cq8+qYju5etoMSNg8MGkKJ3KZVdP0ItFQdPh55oja68qGloAgZaoxGE9x4VV1YmHNfPWuu8JoclKzuYUDyLjip45rfEzl5iLNTwXwPfKf4L9QENF2t/dWlh4xklcLOIc661Vfjld9Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288106; c=relaxed/simple;
	bh=EcTRKDBc1veGtECuqy6AI3PYeK9xENvrGwMb1X7Kpbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIGQ+vBLHGyvoHzBMtAkrDDAIlX1SO25LEVjKzqAT3PhCnCnhdxJXa6sdJlPgHifBWYbk+ixCW+g82oSVQZllvUeePysEggtRVQFL6PrBfee2ylov/r0jVpSI12ECr6+OzLNj0H+8GbOMTKFg1UBhhqWMfoJWATHH7ljDdFxLbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtA+1sQ5; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb3bae8d3eso387314585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288104; x=1771892904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=UtA+1sQ5l4f4RNGmavrlB6y0MohCS8lTN2Wn/IKmV1htTSe/8B1J22dBmyYs1wRH4c
         l3mYHpndvy5Wbo2xx7rRLFvwkikGKoJfZQhCPCtfck6tCYICZ6tn/PgFA06fFBhswRdm
         qdoYet1iRR85Jp+nPJekj3T9MZOzM240oaOpkIhPa2O+fngTmGAPEZ7zoPAeGFKA/BZb
         F7mEuEQq21qsB3GLRjv9NrouMvfA+Axkg1lXUtxbbnoqmTyaqCoqaptexc6PaBtksq/a
         5df7wHzNba0dyg9vM93RHJx5rpxNfOFJi5CIaoGlZqyQYjz8PNACX+4y3IxO9tXAj+pL
         1agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288104; x=1771892904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=XGm6yUjwb0a5kD1fp0thhBmHbPhIsPCuQc2uv+H6fEE4V+aSdTfP4crP+F3rIAymhS
         dKCW4Rgf3JyMT3BPvI9sfal9pUTmB7Dd8/NDAwl8unTx1BDnqbH6uc60KK/J0lfABsZq
         bTRqV5EQ7rrRed/LtVjbtjCiY2yMwybI8q8W3g7x1Q31bf0n4IyRGKe7+LHy0doYoEf5
         D39xJtYmiGHFX+z4nDlkZdC+OfQfOAH3oQmywazqC2FdaPzBW+k0hqd54k7H0JjCplUx
         3K5rGO+diWYFP4jBtwjFtGMydny40OG8fyNKg1KhunJIP8KCRfhi5wAFXEE/S+133Okp
         d45w==
X-Forwarded-Encrypted: i=1; AJvYcCWgLaVCwGMPSo/4pxz8A4FzTYvikTTHk/1W7Bm+RAZtygVhBGUVpcJJKWKT9P1Ij1b6Z3l3F2PwNiGRYC5D@vger.kernel.org
X-Gm-Message-State: AOJu0YyGJoq0J4XFrih1M9vqW7d48uWpG9KjxfmQ2xRAKPZ0W6ujyw9s
	hXJxRFYuKf8KHRgdmHpn1/2kULbPDvc4oaFpoJ6BsJF6imwHhaRG7JV2
X-Gm-Gg: AZuq6aL/oJ5klhUyoFUPlETqhlrh+GbunIpFPXXrFi07nKLYnB+ihzHaAzAZ6anE9QE
	ekI2yW8WNhu6uIVTwqy5RCTKr8NQdejkN95APDm5xNobDXSwc42fC53mahkxBnbNPnSQmqRPKeV
	cU/ID6qMGcZGHgYv7TOS0hCIZO8f001fJk0hSgdNo6+KOcqKRnXbFodwE3/WzlJxoo/TcOvcjor
	TBS4BSZmPJq3RJpu+hO8oYVefOxSmLJiaBfxDzzveAYFBvDcKo/6W1+nllursp9IJodwdLYhR4C
	zGhClXy2le2yRjqZ9gk2opmZuDMpY/+Lf7T77O835CLJ/jPVcmu2wXQzjXb7J0c+InDcJxsCjkK
	DR0p06bOEA0G+UujW5FEvr3QzN3/Kl25b5iG23Z2w1FfHBA3+/ovhn1GwzHKNllsSaBFuL16xLG
	9T759cJyXUGtw34eJIbadFpsx2pZO8IPFv9mYZGtLytL6ngjlVRj2aaJayBLjkVIq/8bALKcelY
	kuDl11KGlwGxjo39HE=
X-Received: by 2002:a05:620a:3711:b0:8cb:668f:b7a0 with SMTP id af79cd13be357-8cb668fb89bmr268485885a.82.1771288104126;
        Mon, 16 Feb 2026 16:28:24 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c7ef7sm1509044485a.28.2026.02.16.16.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:28:23 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Mon, 16 Feb 2026 19:27:38 -0500
Message-ID: <20260217002738.133534-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93038-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email,1a:email]
X-Rspamd-Queue-Id: 72DFC1484D8
X-Rspamd-Action: no action

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
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..e925cba0381f 100644
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
@@ -392,6 +420,59 @@ vreg_bob: bob {
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
@@ -490,6 +571,14 @@ &pm660_charger {
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
@@ -508,6 +597,12 @@ led-0 {
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


