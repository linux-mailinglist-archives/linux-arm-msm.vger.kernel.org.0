Return-Path: <linux-arm-msm+bounces-101386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL6BKgGBzWlveQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:33:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD6E380333
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23B7D303236C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 20:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC01364040;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XI55P+Gx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD783624C4;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075534; cv=none; b=Skg5M3aOZWSOMbqY7gD4OctDFRCegYChBdVYrkVxHnUK45GXJFqpdB+FpPfniZiyONOTJPr4OKnIHUXhGjCRe1s+TpdxAqrXtDTDbEoJVzyp2FIobA6K/eSejoLUkWkJAMz8clfPrntxFPVqPP50s2Au5LbUPTgtcmqUL2thLGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075534; c=relaxed/simple;
	bh=452m8FHLQPVsDKFFpFV0J4unoJa1T/HptteCCz0jsx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjY6a2isz9sLfg0UvICAnoMhVofslLvxnln02yXekeit/HXgpfKsfZYyT0WgMtGtlziNMiDo+uf9EwnF7IBTKYmD+q+h6abIuKdhVwPFo0OHS8U2Lw3XLITvJXeO2xUygnsHoen02xT54WQt5VGavh2byVH4HWv8kPJFHespimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XI55P+Gx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 768E9C4CEF7;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775075534;
	bh=452m8FHLQPVsDKFFpFV0J4unoJa1T/HptteCCz0jsx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XI55P+GxTx1kx7OC5UNSzF5lPshMkLgN4vRGiJcxgpdCCY/7tZVZZvLAzJkO/GM5v
	 kbngVRmPo5ML1r9YkGX6D2KZzoRto6sEdMg8NnsalvxXJm260yz/FA+2DnTSlo5WFV
	 GP0AH0o62EI6/pN7fFdqrY4sxLlOU0Z7OkaAkaSR7H+n6QtlskDDcHKvNSCKWRUGDl
	 zNCpCrOhb2IzOeMpgeku1QkMmbpd541kna2VoTEXFebOShxvu2pKRv5SKFi6D1j5Vg
	 vgLk8BSqIfgZDlbzilNetFcm9ucQRx5EUFP4iQdHh1ANSuazOc7FyAF61y/PyIqQpR
	 OJsI+UnVhstuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692C010FCACE;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 01 Apr 2026 13:32:14 -0700
Subject: [PATCH v3 2/4] ARM: dts: qcom: msm8960: Flatten I2C pinctrl state
 subnodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-expressatt_fuel_guage-v3-2-9674cfc0b5a2@gmail.com>
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775075533; l=5002;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=uGSuJpabkXo+b2760NIqVXSdmHC8oQgQfvmWmQRFFVI=;
 b=ONbsK8sMeCl2/DeiWXCNx3++3J1t0bEpuhnxGHZ+z2WYkYlihNnEdNlg3UrK5TWLoOpnYT4Hf
 t1HlT9312XbBNp/ccfGeNz7oCNG2nzZgMA7qhDwtbMQnqCVmt4ll55x
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101386-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.12.53.0:email]
X-Rspamd-Queue-Id: ABD6E380333
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Remove unnecessary inner i2c*-pins {} wrapper nodes from the I2C
pinctrl state definitions. Properties are moved directly under the
-state {} node, consistent with modern DT style.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 140 +++++++++++++------------------
 1 file changed, 56 insertions(+), 84 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fd28401cebb5..6069fb925672 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -132,129 +132,101 @@ tlmm: pinctrl@800000 {
 			#interrupt-cells = <2>;
 
 			i2c1_default_state: i2c1-default-state {
-				i2c1-pins {
-					pins = "gpio8", "gpio9";
-					function = "gsbi1";
-					drive-strength = <8>;
-					bias-disable;
-				};
+				pins = "gpio8", "gpio9";
+				function = "gsbi1";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			i2c1_sleep_state: i2c1-sleep-state {
-				i2c1-pins {
-					pins = "gpio8", "gpio9";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
+				pins = "gpio8", "gpio9";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-bus-hold;
 			};
 
 			i2c2_default_state: i2c2-default-state {
-				i2c2-pins {
-					pins = "gpio12", "gpio13";
-					function = "gsbi2";
-					drive-strength = <8>;
-					bias-disable;
-				};
+				pins = "gpio12", "gpio13";
+				function = "gsbi2";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			i2c2_sleep_state: i2c2-sleep-state {
-				i2c2-pins {
-					pins = "gpio12", "gpio13";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
+				pins = "gpio12", "gpio13";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-bus-hold;
 			};
 
 			i2c3_default_state: i2c3-default-state {
-				i2c3-pins {
-					pins = "gpio16", "gpio17";
-					function = "gsbi3";
-					drive-strength = <8>;
-					bias-disable;
-				};
+				pins = "gpio16", "gpio17";
+				function = "gsbi3";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			i2c3_sleep_state: i2c3-sleep-state {
-				i2c3-pins {
-					pins = "gpio16", "gpio17";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
+				pins = "gpio16", "gpio17";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-bus-hold;
 			};
 
 			i2c7_default_state: i2c7-default-state {
-				i2c7-pins {
-					pins = "gpio32", "gpio33";
-					function = "gsbi7";
-					drive-strength = <8>;
-					bias-disable;
-				};
+				pins = "gpio32", "gpio33";
+				function = "gsbi7";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			i2c7_sleep_state: i2c7-sleep-state {
-				i2c7-pins {
-					pins = "gpio32", "gpio33";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
+				pins = "gpio32", "gpio33";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-bus-hold;
 			};
 
 			i2c8_default_state: i2c8-default-state {
-				i2c8-pins {
-					pins = "gpio36", "gpio37";
-					function = "gsbi8";
-					drive-strength = <8>;
-					bias-disable;
-				};
+				pins = "gpio36", "gpio37";
+				function = "gsbi8";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			i2c8_sleep_state: i2c8-sleep-state {
-				i2c8-pins {
-					pins = "gpio36", "gpio37";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
+				pins = "gpio36", "gpio37";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-bus-hold;
 			};
 
 			i2c10_default_state: i2c10-default-state {
-				i2c10-pins {
-					pins = "gpio73", "gpio74";
-					function = "gsbi10";
-					drive-strength = <8>;
-					bias-disable;
-				};
+				pins = "gpio73", "gpio74";
+				function = "gsbi10";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			i2c10_sleep_state: i2c10-sleep-state {
-				i2c10-pins {
-					pins = "gpio73", "gpio74";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
+				pins = "gpio73", "gpio74";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-bus-hold;
 			};
 
 			i2c12_default_state: i2c12-default-state {
-				i2c12-pins {
-					pins = "gpio44", "gpio45";
-					function = "gsbi12";
-					drive-strength = <8>;
-					bias-disable;
-				};
+				pins = "gpio44", "gpio45";
+				function = "gsbi12";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			i2c12_sleep_state: i2c12-sleep-state {
-				i2c12-pins {
-					pins = "gpio44", "gpio45";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
+				pins = "gpio44", "gpio45";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-bus-hold;
 			};
 
 			sdcc3_default_state: sdcc3-default-state {

-- 
2.53.0



