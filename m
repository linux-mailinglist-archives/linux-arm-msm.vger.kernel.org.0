Return-Path: <linux-arm-msm+bounces-61258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A68AD9410
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 20:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663A73B9F20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 18:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672C522A4E4;
	Fri, 13 Jun 2025 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="Hv2vqCFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05177211A3D;
	Fri, 13 Jun 2025 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837640; cv=pass; b=bFki7yycpVEBY5pL9Wm+vbwe9U4w0rzLYOqrekelS5xrWO7ar8LQsETEueIiTfKwEvyMuA9bMZkjELW9y5TGwTKRA2yXApnbfhYWy1439I9eFIMFCTaS/pHrr1dMZM5Ar4qgxKvbVRtmLSnMQfgUEhFdV7lmgibUJkuGnOqn04I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837640; c=relaxed/simple;
	bh=39x2sOts/JA4bYtbdbLZWdvg0H9jOtxHW4x4DPCwkLk=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=JhKUZugpZX9pUTAbvdVmGtWiwT3JQahaERIKfvSXzifP8wRdY9le0uPtxjJphG9gWFzZ8rbjSPgL/5XQmmUB2ry62bsy9aYS/c29Pc76r2XOWUywF2IevcoIWLHc91LCSvelAyh5xOKgSnFGZI8rLTJ5Z1v2vlaqhQMuoiojQaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Hv2vqCFj; arc=pass smtp.client-ip=23.83.209.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 43A2F4E6211;
	Fri, 13 Jun 2025 17:50:24 +0000 (UTC)
Received: from fr-int-smtpout9.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.96.77.9])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 223BC4E4DAE;
	Fri, 13 Jun 2025 17:50:21 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1749837023; a=rsa-sha256;
	cv=none;
	b=6lB19nwZInaQr91bfIWhUx4TybxbAWg27aVr4yRh4i0ENCC9faRzfb9J4/rJNKCZx++eN5
	CeyBbHsI3xY+hiV9S5ROh/BwsqA3CdL/tpljHRqT9AW4sSIVSoY1uFrEKXWyH2N7cEyk1E
	jgXn025o9Gu5qPDH0srlLPRbVUScrLrAL+OQnqKeYkHyvjiYZVCr7HxNusiotbwOamjuE+
	8UW1JmF4AAaytqrIrEGCawBwx09uGTnuK/crRhE806fPWdR/5VMbFbxeaMU7nBQtKOKe6C
	80296n8hKfN6dBQVB99NTVWf9PA8L7iL2HQ/bX8zqMQ3kpDk7zTPwHEe1C9aIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1749837023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=wITIvOP3Y/BU1DRBQyWwXE0WSEyQLvutvo9Jo3cM+xY=;
	b=A4GlIWucy6iDHaJ0LmxuL3yLZi/yvbpzt0L3JkdRaV8sFtXm34PjSJW0352KBTjbM4gkNv
	QXgj87sExWtj8mPaC26O2m7V/+OHBnDOfjlP9aCXKheq0SN/WLVMSoYJFK0k+QUHbRZJat
	MlVgpUcRsgI5SvkplEjEuOgiBuRGS0RU/IY7tkL8dgIpv2ESZ0mTzVK7mom6OM6h3rRPmt
	aJCsv+qkLseArUyW9IkXpq1XKXIvZJft8zbkeE8au5T5Lnvhl5nHS6r6BCCmN6wbqGFPdE
	25EEm6q16N1dvj4YyzNvo3KRpxVN/EUMpvtkg6JhuUGngV/rY2Ll3nvf/AJkRw==
ARC-Authentication-Results: i=1;
	rspamd-5859dfb5d9-fwlfl;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Tart-Wipe: 166c0d7a3b9fcfc7_1749837024154_3202172520
X-MC-Loop-Signature: 1749837024154:636548336
X-MC-Ingress-Time: 1749837024154
Received: from fr-int-smtpout9.hostinger.io (fr-int-smtpout9.hostinger.io
 [89.116.146.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.77.9 (trex/7.0.3);
	Fri, 13 Jun 2025 17:50:24 +0000
Received: from [172.17.0.2] (unknown [36.79.97.133])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bJn3n59XwzH9gK7;
	Fri, 13 Jun 2025 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1749837017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wITIvOP3Y/BU1DRBQyWwXE0WSEyQLvutvo9Jo3cM+xY=;
	b=Hv2vqCFj1wHJY5sdMKQ5pGEt/Ng7XrtJXQ2Fe24qzywutRdHLbYvDGcxd+Xy0YVOeIKcco
	u5p6fjLTskKFAEvu5CF/m6wZ2fxW7qFGYsFa7WLJHMNU+OMOR0MMotbXLiyFU8bxgvv1IA
	QKfkNK4euRBk+8HPqdkq76/W5a92HGf6P421m0oSmPYyrGoXqSGRc+/w6H+A+jzm+dhNVj
	H8U5N3/EVcYICbdnKvdAi/FpwGyRcLUxtND3Z9L8a4PGJRuRTALJPRIrw+4QQkRID4Wevv
	Mg3v+jn7bk8Vko8kB4kEittG2J+oR09m1rOPYRflxnRouWSmn0Q6IbQkOWd63Q==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 1/5] ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-msm8960-sdcard-v1-1-ccce629428b6@smankusors.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749837006; l=2173;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=39x2sOts/JA4bYtbdbLZWdvg0H9jOtxHW4x4DPCwkLk=;
 b=ZkgmLQnaSKGwuvev40k377LN896yAMsjKo1DkrfidMLzGZeHOABhHYAdJrKaxtw6GSsm6h8JD
 XzKX+eXfv8SCCjctn4Q+rrSE76MrzK9f9KJbc4DSDo3bRJmJod6Ku4z
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri, 13 Jun 2025 17:50:13 +0000 (UTC)
X-CM-Envelope: MS4xfO88UVV5Ae5bVFu2faTAz5u/TiBEfXzeKuywK2yy8QPhNE98ZqjaqxTvNkly6MLUrY1PugnaxqT8otIkn4wQ2MxRJRg2COvugE0aapkIlDoNc0B4alZx qguuvBQY36AXe0eOPC3An97NfYDK529eoICuGkQFC2Xk9SfTMosHKrJU/Deu0hiSzvbu7cQ1ZYzaWmfcDf1rsISYGh5LTTZvDfJ7dNtu/2muPZEBJSxZCzfM Yf1JM+BsqCVyiMjCR2QPSw+ZE6sor57pNLydNgfl6nUasB4bkvY0joaT/nGMBxEIIShMWVLozhUri65LvjSEnoG3k9MHucTYQPSubcDXLOf3PoF73EvYX079 LdAFBqyT4h9swlA85397xnMoJ09B5P/apZW6wSj6eNwIvbOCklECN2PAlhLWJiS1wBTWFAD5S152Q8nnYu24a0ovyrKTB/+C0dLA2XalN9eo4b8FNoVyYL83 5JpZ8S8ZG30lS4umCfxiQyWzPBYyyxO+Eu0O/IfA3mQKyesJmC6mDdPL+VY=
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=684c64d9 a=/sUT9SOQbq9tkq2xjVjq6Q==:117 a=/sUT9SOQbq9tkq2xjVjq6Q==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=2wrJF2QuKA2qlS4toWQA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Adds sdcc3-default-state and sdcc3-sleep-state pinctrl states for
MSM8960. These are required for devices like Sony Xperia SP to ensure
micro SD card functionality, though they are a no-op on the Samsung
Galaxy Express.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      | 38 ++++++++++++++++++++++
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  5 +++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
index 4fa98277128897a531c54296576a6f15cd6d2a28..77fe5be24b36fbda83ba73034939db10db6ef4c8 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
@@ -18,4 +18,42 @@ i2c3-pins {
 			bias-bus-hold;
 		};
 	};
+
+	sdcc3_default_state: sdcc3-default-state {
+		clk-pins {
+			pins = "sdc3_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc3_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc3_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	sdcc3_sleep_state: sdcc3-sleep-state {
+		clk-pins {
+			pins = "sdc3_clk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc3_cmd";
+			drive-strength = <2>;
+		};
+
+		data-pins {
+			pins = "sdc3_data";
+			drive-strength = <2>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index af6cc6393d740d30f3555825175ea6851d406166..49d117ea033a0ef73c134d1225982786fbded2c2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -71,6 +71,11 @@ &sdcc1 {
 &sdcc3 {
 	vmmc-supply = <&pm8921_l6>;
 	vqmmc-supply = <&pm8921_l7>;
+
+	pinctrl-0 = <&sdcc3_default_state>;
+	pinctrl-1 = <&sdcc3_sleep_state>;
+	pinctrl-names = "default", "sleep";
+
 	status = "okay";
 };
 

-- 
2.34.1


