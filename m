Return-Path: <linux-arm-msm+bounces-22142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D035C9015D8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jun 2024 13:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB5F281030
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jun 2024 11:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CDB28DA5;
	Sun,  9 Jun 2024 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVcGTYyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2A249F9;
	Sun,  9 Jun 2024 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717931149; cv=none; b=sF2mXyC/X/3ph0plQQI3NCtSIThJS4fbmuhdCfRhZuySKqmCA08O31lakFk1Uxo9/RZDic5LEKtq9g6hauiSQhhO5/4pFVA09SDTDacB5ehCfg3ewflPVX5suKL1LuLfVoqNpKk5GZKGZdDY0M8osZL1wBFXULfS35ulufaD9PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717931149; c=relaxed/simple;
	bh=PWjuma657JHSCyYAkXbvSDzqdk7odz+k9Uhz/JiiDJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QkomDiunlYmDKyIXEfYfLQLANGu1QJ6AtnCff3FoMRHl4NUAVYxqpK1L5w5lG2juRwLfNs16B0z/STQmTIIq25N/IJQN3JT+4W8ZbRLYO23kSOnL/07jVXR9bT3sQeEVevBhq2kBqueY8JBAajfHhUG14HaV9jGjlEYit87gYsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVcGTYyt; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f0c3d0792so110549766b.3;
        Sun, 09 Jun 2024 04:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717931146; x=1718535946; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpM5CSHQ7BjZsm86jY13nUms8C9enIOcpR5asKG1/Ro=;
        b=gVcGTYyt0fX+pzbjefearwwirDJ/BrJeJfaXoJsHEsXrKDl2Aq6prG7ikcZE7s5Z0a
         lHfVaVthY3aiq4Bbz0Ky4vfAVjxXFOXY9MrrGGypxoIKzCzcpf23UMoNPlAVA9uO85Lw
         kb9KsrjsnPJceCgHmGF2RNyrt+Inkwvr8rY2XiI/BwmBt9Czi3cfBR+8KdchbmEAZ/vH
         6rKcF4IBqojKA+yehc2emN8+cbIXrDhu5nxUfdWG21/yQzEUUwVRggACYJvN6f2w/dRv
         sbl1chW0Aetqcid6+4RuTsUQND8fmEbvCsyzGd3eRL23WuKuiahriyjRvmS0MmlDhrdf
         ypcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717931146; x=1718535946;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpM5CSHQ7BjZsm86jY13nUms8C9enIOcpR5asKG1/Ro=;
        b=xNiPLs1SIP5ScJmluCLt0WnEgwkH09RcjurxcWpQRjRyKUoJPM4IvnCsVjp0eSuXhu
         2E4KHhpJ0hLQ8lKfOEsXh5Zi6pCZjVYKBOjV34vm4ql3O80VNJp/zwhuKuwU8iasNYFj
         UCcjtd1foiR3hrLU/AeVX6xy+e0MlbfYrdMEVqGWXJJOg1fgyucGAN37WXNcN5FEeAyM
         ItrE2NjgSw5vuSqpuCsJRiotE65e5fJiGO3nhtz/xRASzGq7HE7FANbA5m+F0Z91wAHh
         vTlLo87XuFdK9aloSshNMKcruQkDvmVC8q/fVXSNg1MGxxTuLvLEF7pmAMHTEkwMtbgo
         oPpw==
X-Forwarded-Encrypted: i=1; AJvYcCXWly7tIkS289rdIaZyPcnGqpsXklTCrTWkx+CEqk/KRjh3ELTnGJMIBv4wvsPABTES3Xxl7pYSlOkDtJYIUQSogvEezhXvVLdURAxc8WcfpbYFP2e7QDEG07LxTxnXGlwdoeyZYZBOAExGTIl5wL8LqKyI/b4B1OqXCPotq2IAty8QwBB8
X-Gm-Message-State: AOJu0Yw6KbflnRNV4HxV7OGYh9MYkG3dBQRQ4FdXOBcV9sB4ZBRTpVuA
	0isXBl/kkKX5lsoYlPJLD3D9YWfIITBaH/Rmvql50zLYInDI+tov
X-Google-Smtp-Source: AGHT+IFMn/iHi3S62iXJonXfBdAPUVD5+Y6loLLU+/1VysHfn0b6aGHs2T+z7LzchWh08FlOKqtnxQ==
X-Received: by 2002:a17:907:7d9e:b0:a6f:ea6:9534 with SMTP id a640c23a62f3a-a6f0ea698d6mr217343866b.76.1717931145707;
        Sun, 09 Jun 2024 04:05:45 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eaa41sm508317766b.115.2024.06.09.04.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 04:05:45 -0700 (PDT)
Date: Sun, 9 Jun 2024 13:05:43 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: motorola-falcon: add accelerometer,
 magnetometer
Message-ID: <ZmWMh6fuLasvGkR/@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add the accelerometer and magnetometer that are present on the Motorola
Moto G (2013) device.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 .../boot/dts/qcom/msm8226-motorola-falcon.dts | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index 029e1b1659c9..5dbca83f2230 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -96,6 +96,35 @@ reserved@fb00000 {
 	};
 };
 
+&blsp1_i2c2 {
+	status = "okay";
+
+	magnetometer@c {
+		compatible = "asahi-kasei,ak8963";
+		reg = <0xc>;
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pm8226_l19>;
+		vid-supply = <&pm8226_lvs1>;
+		pinctrl-0 = <&mag_int_default &mag_reset_default>;
+		pinctrl-names = "default";
+	};
+
+	accelerometer@19 {
+		compatible = "st,lis3dh-accel";
+		reg = <0x19>;
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&pm8226_l19>;
+		vddio-supply = <&pm8226_lvs1>;
+		pinctrl-0 = <&accel_int_default>;
+		pinctrl-names = "default";
+		mount-matrix = "0", "1", "0",
+			       "1", "0", "0",
+			       "0", "0", "-1";
+		st,drdy-int-pin = <1>;
+	};
+};
+
 &blsp1_i2c3 {
 	status = "okay";
 
@@ -321,6 +350,30 @@ &smbb {
 };
 
 &tlmm {
+	accel_int_default: accel-int-default-state {
+		pins = "gpio63";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-disable;
+	};
+
+	mag_int_default: mag-int-default-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-disable;
+	};
+
+	mag_reset_default: mag-reset-default-state {
+		pins = "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
 	reg_lcd_default: reg-lcd-default-state {
 		pins = "gpio31", "gpio33";
 		function = "gpio";
-- 
2.34.1


