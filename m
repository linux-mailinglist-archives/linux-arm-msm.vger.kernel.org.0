Return-Path: <linux-arm-msm+bounces-74320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D786B8D3E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 05:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B73817DCB0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 03:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E911F91C8;
	Sun, 21 Sep 2025 03:08:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from dragonfly.birch.relay.mailchannels.net (dragonfly.birch.relay.mailchannels.net [23.83.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CDD1F4180;
	Sun, 21 Sep 2025 03:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758424127; cv=pass; b=Psp2PH4GaaDSQDCxAzR7SY0+//xlBGgwFgnmZXiS+1Dqe8ESVUxSid/+s4Q1HvfD9uhQZUb+lOyRyBYjrD40T6xY7wfMTfTqEznW+RAdUnjw6RkzAlFgZS4qWhkctRiRSlAc4ubeNRjYZRh6PnbR5/JKjuBxf7R8SNqISCMZhTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758424127; c=relaxed/simple;
	bh=BlR9x3eSePzSy1L+QfgRuYvhAuaocRaKff+vWhiqeVw=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=aVJIcB/aoOZPTzgJBzs0C9yy+H4wjXx30JjXOGZWFIGMyZ8lfWLKRwBkvTEnCRL8cgdm/qNiXtXrlY4qJpES0ib2VB19e/7M/Et6gvbajjubZzol/AZmDqWICnW+jOz6tNvODEyv44hIUIqLfDB+f1Wb+6ItMnRgI+HCVfJO/UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 94B5F101532;
	Sun, 21 Sep 2025 03:08:39 +0000 (UTC)
Received: from uk-fast-smtpout7.hostinger.io (trex-blue-2.trex.outbound.svc.cluster.local [100.108.41.100])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id D5DB9100D25;
	Sun, 21 Sep 2025 03:08:34 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758424116; a=rsa-sha256;
	cv=none;
	b=LVJqNYJOTwkNKFnRWQAjrsiaammytSOkub5/EW71G0U+CHO5vX66xBJ13W0ND0Iu9lu2Qh
	TSYxisegkUOTbiu98rTsYek68RLuDS8oNPcRQYlfb+3bNMwm9EOwc8vor4YYQO6mD+WTrp
	k/bWTApKU13R8LzlcD4s0FKb1JOxwQc1ydBqzOiGBCheT/gQnnqEzdYydgeMDCwfhXNgm7
	NpsigbiUL6xnhdHRkbK0x4aiePs1dcY4XT5NMCJiRUElALZjRS5F9Ls6dZnahGl1K+oNr1
	WBDK0VOY4FMWCur6Y+O7FNAuEy/VJY9xJ3L8ed07sL8dqaXX2QoZN7vH0S7qVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758424116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUDK73pkvQg7xXIvUkZ1y8zUcVSVH0aIEfqXiQWj8cY=;
	b=AGcb0VAfabscVaJewSYdegUCrPo2fVM6CrKX0R2eH8yRVSXLBBhLcT8zAMuaKIxViu7nuS
	srI6scoy9A0vK/1FqkJw7mW9J0A7mYTlzdxpn7UZG6Mb/Lhiq4xAlVEpQWvAPNM7n0XRDu
	9+iuheSeKaLYgrlxsxgsOdBT/6sjRrHM00EwYLYZm6xQPuQwcTTJIdfu6aulTIkSZvw71l
	int7kzsQOvvhzizLlKj13zBqqgwMmkFZoI3mrwhDXCF7pT/IDK5DuYLab8gfdG8gotRYxT
	8mvCqxJu7D+Y1RcU8SJDgJgtwnPBcxB8JNYYSiqBHPKpm6qhtJrZpCesMxxF7Q==
ARC-Authentication-Results: i=1;
	rspamd-59b854cb4c-klkzd;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Continue-Whispering: 75dd93c01df97490_1758424119515_893569463
X-MC-Loop-Signature: 1758424119515:3233673431
X-MC-Ingress-Time: 1758424119515
Received: from uk-fast-smtpout7.hostinger.io (uk-fast-smtpout7.hostinger.io
 [31.220.23.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.41.100 (trex/7.1.3);
	Sun, 21 Sep 2025 03:08:39 +0000
Received: from [172.17.0.2] (unknown [180.253.43.125])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cTrlw31XKzHTnH0;
	Sun, 21 Sep 2025 03:08:12 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 4/5] ARM: dts: qcom: msm8960: add I2C nodes for gsbi1
 and gsbi8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-msm8960-reorder-v2-4-26c478366d21@smankusors.com>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
In-Reply-To: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>, 
 Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758424077; l=3213;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=BlR9x3eSePzSy1L+QfgRuYvhAuaocRaKff+vWhiqeVw=;
 b=CPUCoP22IL3Z03NvaTR7dNa4AWSQGyfM/D69kSZcs8h5tQuAhK11o65nyc0PlVaAilQkePMT+
 NjpS6vKnF4tBaekzMReKtLD4MH0bhnAOM20jqRt5jYjfnZ58cIhgPTd
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 21 Sep 2025 03:08:12 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68cf6c1f a=hVqNbC/oQIbyndLMfyRB3g==:117 a=hVqNbC/oQIbyndLMfyRB3g==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=NSl9ojEGCNJ8CHMvDxQA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfDvWkQVpHfBXpHRKygudyQw4PxvY6JgO8KjmrNXdJ9WuK4vQ1c8LBPaDAyRHfCqjmJ3G50PM9ZMhgeWWY68XdNf4/CHwD4hIPBpysCxbyXf7SNi381Ou sa+tX9szwEJPAsiRHXmW56ornZF+e8EMTDw5slbBB2Q5umYkwTZkLQNQ+IY1i7RR8l0sEizu8CB515nZWREm/QY1fxLn8h47y4oaZAwf6R2cyxUGb4x0m/o/ UlYrlbuW7vpz3s8lmtGdzrCWrs5YAEU66qMAqFRFRjU3coRBgzOoS54ko/ead7TFg+ppasyaUYCAKE2i8AT4eMwFf1M28Pi9uXHSEt+WyE3dIyNNHMIyeFke EZVSmnMznp27Iyg+QI/x0efj7auwQqXkcoY1YycyLN+eI/Oue/BjIxnzhYlJRfiw+RzbYrVF3BUeTKt5mzdmBoKqNf7AJmVf/ocpRUzbaQz/RMI3hpkvASxe EdkiDBn+TyxeNKgqXHWOaMa1Gc8pXji+/E7aNNyP+bDNQUP3x0CCzIHaL15I8hh4DZRKJS0PuZt5LWYEbpWrkDVlxBNcagJE17TJtQ==
X-AuthUser: linux@smankusors.com

These are present on msm8960 and are required for devices such as the
Casio G'zOne, which has NFC wired to gsbi1 and audio amplifier wired to
gsbi8.

The nodes are added disabled by default.

Co-developed-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 890b34bdf8c3376659570218500e28ce5809c26a..0aaf60dcda647dc2f7ce11ae7cde05a0bcd35716 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -131,6 +131,24 @@ msmgpio: pinctrl@800000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			i2c1_default_state: i2c1-default-state {
+				i2c1-pins {
+					pins = "gpio8", "gpio9";
+					function = "gsbi1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c1_sleep_state: i2c1-sleep-state {
+				i2c1-pins {
+					pins = "gpio8", "gpio9";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
 			i2c3_default_state: i2c3-default-state {
 				i2c3-pins {
 					pins = "gpio16", "gpio17";
@@ -149,6 +167,24 @@ i2c3-pins {
 				};
 			};
 
+			i2c8_default_state: i2c8-default-state {
+				i2c8-pins {
+					pins = "gpio36", "gpio37";
+					function = "gsbi8";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c8_sleep_state: i2c8-sleep-state {
+				i2c8-pins {
+					pins = "gpio36", "gpio37";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
 			i2c10_default_state: i2c10-default-state {
 				i2c10-pins {
 					pins = "gpio73", "gpio74";
@@ -474,6 +510,23 @@ gsbi1: gsbi@16000000 {
 
 			status = "disabled";
 
+			gsbi1_i2c: i2c@16080000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x16080000 0x1000>;
+				pinctrl-0 = <&i2c1_default_state>;
+				pinctrl-1 = <&i2c1_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI1_QUP_CLK>,
+					 <&gcc GSBI1_H_CLK>;
+				clock-names = "core",
+					      "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
 			gsbi1_spi: spi@16080000 {
 				compatible = "qcom,spi-qup-v1.1.1";
 				reg = <0x16080000 0x1000>;
@@ -572,6 +625,23 @@ gsbi8_serial: serial@1a040000 {
 
 				status = "disabled";
 			};
+
+			gsbi8_i2c: i2c@1a080000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x1a080000 0x1000>;
+				pinctrl-0 = <&i2c8_default_state>;
+				pinctrl-1 = <&i2c8_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI8_QUP_CLK>,
+					 <&gcc GSBI8_H_CLK>;
+				clock-names = "core",
+					      "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
 		};
 
 		gsbi10: gsbi@1a200000 {

-- 
2.34.1


