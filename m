Return-Path: <linux-arm-msm+bounces-101260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKIWER7YzGkyXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:32:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE88376D9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB579308EF0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 08:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56113B0ACC;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7cJzmga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B93AE189;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032129; cv=none; b=mgkoH8QZFF3fppcSj4dapEUlIXoCz7VYOUyS36Q/qEk/EmHo8dCoNoOfz/9aVU8ZibUG102n1L1wAF17svi0lN+wF+eCVAALYsa1BBa+a+3wUPXFrSD/5C1X6ewqHIj63vI0DKyCo/aMPfUnfi3V6pIpkUaS1bBXt5pThL02u+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032129; c=relaxed/simple;
	bh=Y+Bh9iIz3NKZ8LmK42uA8SUnD17OYdO0aVEElDG6KUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cAdVAy/cvqFun/hHbGfxJpIp1/K3gWjdr+XblfEqj+MjASijAVoECdp/bDnTu+8TgngLlmnDwZcT9YKJ4opbQ6m0e4mgU2sPOT6tIaSZCDFZhB70bXFfuTIuh2BwJpa8F8OC8XdbezyOFoJcmQL5E3oHl1TDsMGnfFLbovtc4gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7cJzmga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CC75C2BCB7;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775032129;
	bh=Y+Bh9iIz3NKZ8LmK42uA8SUnD17OYdO0aVEElDG6KUw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h7cJzmgaZ5S7ywvPoQH7IOMy9BvXUgVlFHEGiD7/ydOstsGfo28lyLjUcyxFx4H1P
	 usXvoqZd53Y9LUrS7fw1iWE8PmaMThiXzkz0zZB578s5eUFkipA5eC6ByoXD5DDsqT
	 yuItU2Rg8gQMbcvFD/mn6lb+DKu2MH00j/9x07hDA8DUEhPA9c8oqAWTuXCcAyvGiI
	 +0C8/lVQuaNj+VobOJzWkyYYQxAmZEFGKZJ98uJ+peUBLo7iDd5O1d9EDwofThY/yC
	 jgqhm8TFFH5yHqIwLRpKrwKOKyr33oi3ttS08/WtkPql+pp8/+2VBUzP3AYoDUYxYF
	 DCIW4CshAbMvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534BAD3515B;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 01 Apr 2026 01:28:49 -0700
Subject: [PATCH v2 2/3] ARM: dts: qcom: msm8960: Add GSBI5 I2C controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-expressatt_fuel_guage-v2-2-947922834df1@gmail.com>
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775032128; l=1727;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=8/RzBwh/fES/8HrOxicZH3ECPDErdir+yKEmOkH4FcM=;
 b=8RY/XE8pPT2II/im619+VCBP8uFt53wYimEnOrLUp4SSUXalABE3APqROdSjgCrWwzafpO9rR
 lKqURR7o3zlAYZl6faRq4dyyPRBMkOPt35uxWs+Vc6dHHIDZVVyBQJo
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101260-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.251.119.0:email,0.253.75.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.250.218.192:email]
X-Rspamd-Queue-Id: DAE88376D9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Add the I2C controller node for GSBI5 (gpio24/gpio25) alongside
its pinctrl default and sleep states.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fd28401cebb5..2088baef6c30 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -185,6 +185,24 @@ i2c3-pins {
 				};
 			};
 
+			i2c5_default_state: i2c5-default-state {
+				i2c5-pins {
+					pins = "gpio24", "gpio25";
+					function = "gsbi5";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c5_sleep_state: i2c5-sleep-state {
+				i2c5-pins {
+					pins = "gpio24", "gpio25";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
 			i2c7_default_state: i2c7-default-state {
 				i2c7-pins {
 					pins = "gpio32", "gpio33";
@@ -664,6 +682,23 @@ gsbi5_serial: serial@16440000 {
 
 				status = "disabled";
 			};
+
+			gsbi5_i2c: i2c@16480000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x16480000 0x1000>;
+				pinctrl-0 = <&i2c5_default_state>;
+				pinctrl-1 = <&i2c5_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI5_QUP_CLK>,
+					 <&gcc GSBI5_H_CLK>;
+				clock-names = "core",
+					      "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
 		};
 
 		gsbi7: gsbi@16600000 {

-- 
2.53.0



