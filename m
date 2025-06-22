Return-Path: <linux-arm-msm+bounces-61988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B4AE332B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 02:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4134A16E371
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 00:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DB7A933;
	Mon, 23 Jun 2025 00:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="s1Q7qZLu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A373C2F29;
	Mon, 23 Jun 2025 00:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750639310; cv=pass; b=cS2q6YlIX/xyf+XGqRUFhs1aUNVlDLpd2gtczANeTuPBq/A67gVsECXM53xZQ4zKEBHQePdbN6UsLmEt7666YZWHB6NnNinQw7wS0ikNtpRzWWgmIkgCHqFOVOkdIo1r7/P55dNdMEpHyklSTCCU0XBk2+DOGs6WkpTmh9U1o/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750639310; c=relaxed/simple;
	bh=4ehXf59ZxCKwIZe3x4VcN0FbVJWmUO2gSjtQNs8cW1Q=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=TXgR69g0nGWalXgvF+FufomySk7pMVcTRMomipKsRBLSsmiMqPDocT2p+9tdJ6lBIyG3gwhv/8TLpkOKq6PS+kcoDwul0WNqzHxDkgJ8PEp7aqIxCVvFlD3rJdJ5g0wtLqzprejMUGYcJMgeVRfcRBZ/90ibAMen2O+LOmZm+E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=s1Q7qZLu; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CE2118A3542;
	Sun, 22 Jun 2025 18:26:49 +0000 (UTC)
Received: from fr-int-smtpout7.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.108.116.219])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 150998A01F8;
	Sun, 22 Jun 2025 18:26:45 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750616807; a=rsa-sha256;
	cv=none;
	b=xVuTaFtluxsXhKEjhG8okf7kI507hfNeoO5eYRvneL8OgvN7jHQTM2kGXUG8X8yh+aYpZy
	Vk92gylVsrxwcgx6L35cODrkRRnZgKFnEHvKtCtK/czRwTQx+y9fAN3KaRUA+8RcpQV/X8
	2XDsuNKeD7ZNzqGSIAPTKNdpZ3Xnw0Ltfl4Seo3m8lq34yx2ZiY0mWgzKVREsERNcX0Rx1
	HaKTOwMtF6Tu9EYAur3iOYjRlaUnjsxRciI2rPv61kHAfflryPg79QFxI5Pgmh5qCyRfnR
	TyQrMi67VKjaLQMEQDUGxTSUr+vPRMJHiYD6OzJrk/sGWnkL2KI/sjnPvsyg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750616807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=KPo04CXgY+2Sr4BBCCBjD0uiSw0hxaC3xZEVcKPTLRg=;
	b=N9z6rqOLY6QpD9TP2RVZdv6ma33xW3NKCFFQKLBsHbdSKXR/qjs+1w4cwmWV0KJh4YR20B
	pHi2rAowgqdvukDJZac76C65lhDc1zc9TtpQxpZpSq8WgNtou6g4soWLRGoTHIL4tlfaYA
	Bn4goitEGDTgWswnJfPK3szncMJ5pDfYRvakgvjJWc956/Bo0JU66RIQ4Z+tJhv14E+jw+
	MgqvpYyBmLHXnakCM3dqiyrm4ySopyBFXThjjwe+VGJTFRuztEhVloaneoxzLcjRiUKA1G
	yzsBXTInp9yWpL3/LrGPRLpWBik1b+BAJ6x5ArwrLKBwOdkTMHBpMCy1om5Qcg==
ARC-Authentication-Results: i=1;
	rspamd-6597f9cdc7-sql6l;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Quick-Name: 6a7139280b0b5490_1750616809751_890448327
X-MC-Loop-Signature: 1750616809751:1881878027
X-MC-Ingress-Time: 1750616809751
Received: from fr-int-smtpout7.hostinger.io (fr-int-smtpout7.hostinger.io
 [89.116.146.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.116.219 (trex/7.0.3);
	Sun, 22 Jun 2025 18:26:49 +0000
Received: from [172.17.0.2] (unknown [36.79.123.39])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bQKRj6MDVzKLLHq;
	Sun, 22 Jun 2025 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1750616804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPo04CXgY+2Sr4BBCCBjD0uiSw0hxaC3xZEVcKPTLRg=;
	b=s1Q7qZLuE3ZRRv5ecevYcM+kf5q2EsrwVhKaoQJ8XyByvBfq/r09pjcy9+hrzetbyBmb3M
	SrTZyomdYv5voLdS1oB2KGTaowSb+q9+AEsareVJMzBRqxjo2NENqlFYvWaqnAPMXeTgLN
	qWF9Lp9uqjrYEIgUotqzb7g9wpN3+Y3SDHNFHBkeLpz6PyAcowstiQ2t7uhrpJVpAEBIDG
	WY8lrdSugEIAb61o+UGs5zaauXUdeSb5nr0Hzg+SMaNuv4xoIUSEYz0++b6T0eQpssbUem
	kwBLnaLi0ajqYecEEOgRiKTUvWg3vKXsXLEabEQUpPPNF3EuFkQ8np1zOea0+Q==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 2/5] ARM: dts: qcom: msm8960: add gsbi8 and its serial
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-msm8960-sdcard-v2-2-340a5e8f7df0@smankusors.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750616795; l=1551;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=4ehXf59ZxCKwIZe3x4VcN0FbVJWmUO2gSjtQNs8cW1Q=;
 b=0zEIYZTP+IYGEGpA5tZRamb6Ldh6TG3K4FJF3uwBldz0qy8Zz1sk8TA5YoXxGb1mX5DZ1NV6a
 8+Q+lsio9ndD4b/0XsyogoGeHY+J2kWHbxHRz+XCOR0d+Wv2yzhV+7t
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 22 Jun 2025 18:26:41 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=68584ae4 a=vFgqIyFt8cetXi1S0ACNwg==:117 a=vFgqIyFt8cetXi1S0ACNwg==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=dPS0CNwDI8gHXBqWMWoA:9 a=QEXdDO2ut3YA:10 a=bNUbUmQ3fjJCcntIu9VZ:22 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfGshWlmH8dwr44w6u2OWUeu0RmB8kB+wwjnoouZvLaONfVIq+FUAbkjtZYzqoenXZaAaqih5VJcadf1cUMcJiTsqauXbBvFghBBqXqjGnuM0I25f0NMy W5jlfS7pCK2QUuFTaDEF8UoFvUUE2XiauCFNJ0cyW5zXmNkZO7TmqlaXrAxpUSSFQZRwXR0wwSNocNcsw21zbpUHgfOQoeVQdg/RJRTrJNOmoVGG4oIupiDQ A45XjzjZ0zAODbSKnLH5Xh2CGPNbbobKn3smNw/OGelYDF0hBslJr9OvSma4OtXunSnYZeHndWblTLusnAMwzA5g7B0YHM3sVkZcvEyNkMMlKlZu/JsPF6Gh pL5FOWp84I4q/R4gpmLuTXVhsJ8sNAmR4LZENoMiF/33Ylw827RIYTdt479lTLXza0JSMO1vwefWVtLOePOJWVRMxSnX2PrZJR5/T5bgVp31OlVChscidZaa 6ukP7qTrvaqLudcmvBZWaRoHArus5MCtCG3HsPXf4tLo7ZI7VPNprjQXGqg=
X-AuthUser: linux@smankusors.com

The LTE variant of the MSM8960 SoC has a gsbi8 node used for the
serial console.

That's if the downstream kernel is to be believed, as Xperia SP has
a serial console on gsbi8 even on the non-LTE variant.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 4babd0bbe5d638b228e05cdfe6b068b4ea16335f..588ac6c7a51a667202550432bee14fa14f3f74e7 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -333,6 +333,34 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
+		gsbi8: gsbi@1a000000  {
+			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <8>;
+			reg = <0x1a000000 0x100>;
+			clocks = <&gcc GSBI8_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			syscon-tcsr = <&tcsr>;
+
+			status = "disabled";
+
+			gsbi8_serial: serial@1a040000 {
+				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
+				reg = <0x1a040000 0x1000>,
+				      <0x1a000000 0x1000>;
+				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI8_UART_CLK>,
+					 <&gcc GSBI8_H_CLK>;
+				clock-names = "core",
+					      "iface";
+
+				status = "disabled";
+			};
+		};
+
 		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;

-- 
2.34.1


