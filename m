Return-Path: <linux-arm-msm+bounces-92371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFEBFZKRimkQMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:01:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5C1161E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A08B4301B14A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE9D1F4CA9;
	Tue, 10 Feb 2026 02:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZUvqjpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE6B2AEE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770688907; cv=none; b=ZQk63PgWzZ66TeEHT9Tt8WzhGXCXrnGx+XTPBQS2ZfNhkqbWAxv/54Zqg74Z4az6GHfdoNxkpPHSbd396Cij3i6itkIzxsfw+tjnx34efnPjuarKTuUq7T36sl4zlAWkTqKMf76YHivvtVYZod0dnshpkI8Hhd2zyQLw+zP0FUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770688907; c=relaxed/simple;
	bh=EcTRKDBc1veGtECuqy6AI3PYeK9xENvrGwMb1X7Kpbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=su7sr0gtq41l+pn3A851LG5ytwYe1dPiM+vNw8fTTb2KVquymevDZDSoycHhwu4B81i3FwrYzyrm/CZ8c08yZaqrF3z0mGP8OFNLGYlPgKT7GwtJMjU9civxEFITgwlKdZPOsb9YK8zARz3a5zer3eNfRucRc+wt4Hof71NSnDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZUvqjpe; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c6a7638f42so500736985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770688905; x=1771293705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=QZUvqjpeehV4ddCj/pxgpgRBRhZC3c3I3dI63WHRjD8a7YcM+d9Mqemun3Wugl9QoS
         Qalaau7/9qLxfkbXGLD4VdLEwryBWvM29DWcvong9U+fphJPltZrMo64KxR/dhImcIRE
         IGbjZ8Ul05SvlV3IVohmbZaeFBQxFEtmjkSK4yGQTr6uhApQ3DAiod3xRWroYaD9C4Ub
         UZ5BeNtpA+CaT6xmF0WWcRT3K6GBzmGQrGBRhlKh+COcnKn61sn9+Trng+Qdho0+0mrc
         j6bVM+zvIy0QtcIW4Q7KdnTdozsZe0I4d/Huq/WOl8iK/zom4AtatvUqMpV9x9TbVLy0
         SIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770688905; x=1771293705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=b0DEHOfobcJ50O+tnSV1gfkqkG9qS5HVYf2z6FXvGspRqwg4lctGvkVJMBIyXZiQ/3
         89ip2kxlFJzKFbd0pdmlgiXN7unFyh1GIPWXJcXUglxnDbZLKkZapNjMtDufT5j7p2rD
         gHOHopMdppjGZMeHetovDW2CpFd7q46PCSbakLk13lxeoNr+RfiJVEgdYzwK6YLd7MGa
         3aDZ800GgshNMjG0cwr52Vbi+1ab6NCihUNIyQeETGUqReSZM38bpZLwSoiW+rbAqqTx
         RivUDmMRM3+hyykECbFOEIyccukcnVmhcwNNQLc9R2NAqSoDXdS9uYjZkf4bXKz2O+8a
         dt2w==
X-Forwarded-Encrypted: i=1; AJvYcCUbeSj/tM/pZZRwNlkqhryNtGpI1cOC5QAaIhWyKTNXtNHaSyFH5c6NI0AXuut1BXii4G00R7tMmtNY9BzY@vger.kernel.org
X-Gm-Message-State: AOJu0YzrMyVkkl5/21iqUnBZwh+t2gc8oa1MBU1XUVZ8X4tTCHdH9xKg
	dOM0Ab7HAOrhdFOdV/THzb8FKasnF6wc6OWlVrQ2vGPx12IRynWg2ihs
X-Gm-Gg: AZuq6aLFKl9oTMRL9zKC0AZLKTh9MleJh3rRmWcw1l1mXNev/S3Cq5S0gpw1EprLeyN
	rsif89NBoQeyNWVwN7g3lU1ar6Q2B0L7WkT3P4pCg0Y6AwsGeKIaRu2VXrK8ivCvbt2XyPc6YvQ
	66Ao2vreMKkBvY73tyT4YQaZpwuMc4pi40/UgkPU0nFq4IK8TBoGAM56cXyL/RMEk9lrWTKkHHQ
	9UN3zK07D7IuQMQQ7T02EHaQqbzx/F5ADtkZflmLxIpgIc9anBvxtCJ4gt+adhWjqrp0iwZat9M
	O8dNkXktpo1LkaY+BVcLpt3Sf8eOyWIvzfy141CLNeSHY7lmjPEFLS6o4P8azXhaFMQdOi3GIH6
	WXttwVI6qZ2631zaDdxGmylvNnaf1ZjaeJk8X0XYHHH3VFFP/LyYT8L9ig6rnQNOXq8yvjipn80
	2NjpSvC7gmgb8YJ9Qvqq0FMnrSnQ1h/yDahKr0o5NPABmDAqN6Y8cj+cTSWNzXJaIHRkQ3iF9Rh
	Ne1lfmajvewGIk=
X-Received: by 2002:a05:620a:4093:b0:8c5:32b7:210e with SMTP id af79cd13be357-8caf1bc6675mr1878858085a.82.1770688905495;
        Mon, 09 Feb 2026 18:01:45 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf745sm922591585a.40.2026.02.09.18.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:45 -0800 (PST)
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
Subject: [PATCH v8 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Mon,  9 Feb 2026 21:02:06 -0500
Message-ID: <20260210020207.10246-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92371-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,1a:email,qualcomm.com:email]
X-Rspamd-Queue-Id: ADF5C1161E1
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


