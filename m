Return-Path: <linux-arm-msm+bounces-101389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL6HBImCzWmaeQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:39:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE65380484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2937C30C26B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 20:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD633659FD;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eka3qcdb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBC33630A0;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075534; cv=none; b=O1c7T7Y1o6OTWV0M8HNqCmhubz62VzvMIAWaemNNhJ095/7cCKb5WSVGScLfrTHfnvSQJ/gI8pB/05YMzetddOT4xMfvaeHOfmK9j+9IciqQDzFMtYlWRWYH6xz3q+0to7kklO/rlN+miIHtx/baNKTuRZueOnhrFEmBoLpI7Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075534; c=relaxed/simple;
	bh=BhjX4uyPeeaD1j4TK8oIjoR7bWrbTgvxC9nfYp2K4Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AdKbKzSupLac8qHSEsxKaHkO0sQq78ppkJxFNEk2pmswJZ8mQdG22imLtkTI02E/HBoaZhCmNeFJHlrVASVejpjBKKiwjR9D6Zei79zBBnp5jmJZ0yqOU7g86eu3H2K2PgPJoAaDKVyDKYctXqO8FnNEY8Lp7M4fc6lZ8DnKIaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eka3qcdb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82DECC2BCB0;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775075534;
	bh=BhjX4uyPeeaD1j4TK8oIjoR7bWrbTgvxC9nfYp2K4Vg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Eka3qcdb8FG65mc9WEbe5t3yzmFAeFeHkgtFA40EDeyGdgTpET5F1GwUxXlNes7Ge
	 LnTrcUoY887Qwv6V8cE++9xUvUBPHX6L9v0sthjvW1d/qDcPIdn6LRqk8+kXgs7cmi
	 RruQJJ9GSWfTS4nmbPZWo8RbcNJDDR9WV/xjht5SsWuf2aBhhdd3WSGcPxgyNtNc5f
	 WLshZf8Q236TZnY8Swc330tq/47SndZkm2x3uc5DdtMd45c3zDU5aPwnExMnQBZAcx
	 NapSNBhDnPGKVdVRNA7E5nVyzIWQr+VVhGKYChlD3JQ7SuFm00EDxMXjsbpmTxQm82
	 9GJInnRwYefzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB0910FCAD5;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 01 Apr 2026 13:32:15 -0700
Subject: [PATCH v3 3/4] ARM: dts: qcom: msm8960: Add GSBI5 I2C controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-expressatt_fuel_guage-v3-3-9674cfc0b5a2@gmail.com>
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775075533; l=1769;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=Gq2ZOsf1+PUrTIP7d32BgUfFC8VGna7SqX4ihp3Y+5c=;
 b=ENAUCLk3ske828CQibam5xXcn88ce3y2WOGib9+IkR+TeTg5FynzSB1m0mSPdAJDPaWv2aL/l
 qW1GKHys8LmCJOKqlekazU+8tExTTLH4/LHEU0fmp2odLLL26dMCfpa
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101389-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.989];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.250.218.192:email,0.251.119.0:email,0.253.75.192:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BE65380484
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Add the I2C controller node for GSBI5 (gpio24/gpio25) alongside
its pinctrl default and sleep states.

Assisted-by: Claude:claude-opus-4.6
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 6069fb925672..a427f0f41cd1 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -173,6 +173,20 @@ i2c3_sleep_state: i2c3-sleep-state {
 				bias-bus-hold;
 			};
 
+			i2c5_default_state: i2c5-default-state {
+				pins = "gpio24", "gpio25";
+				function = "gsbi5";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			i2c5_sleep_state: i2c5-sleep-state {
+				pins = "gpio24", "gpio25";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-bus-hold;
+			};
+
 			i2c7_default_state: i2c7-default-state {
 				pins = "gpio32", "gpio33";
 				function = "gsbi7";
@@ -636,6 +650,23 @@ gsbi5_serial: serial@16440000 {
 
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



