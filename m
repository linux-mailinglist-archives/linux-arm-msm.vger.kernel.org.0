Return-Path: <linux-arm-msm+bounces-101757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCxzHKHf0GklBgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:53:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB06639A9E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E6283031E99
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 09:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E4E3A9D8B;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBoCvbJr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CF43A875E;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296273; cv=none; b=bJjEEAQm3LjVZKaO+OcwODkqc5oqyf9tdYssWMlxq8hbO8uZBDFVnOB/Hulfp7bsroF3Ef2seESu4/ro/fQYM55zmns/LcfOpXGzg9JvlSDfY5evT6olQkoV7WpTH1cC6tbcRRthq5M9phyFZmBs3Ap88t7qB8EDc7O87PKEO4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296273; c=relaxed/simple;
	bh=KQ8lsG+ZU1fa4Zfq1OtQatABJX25qxFvudXC4UWGJ0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANd6gYm2W3LMd2hAVIyW/xw4AneJ3omvKgoxT9IZcGo+GydaV4lvbVI0yS6QqWedPYYcE2/+OM2hIgMnxNQgJn78RQIQhvN0QayRkAySLHSadvJ8MzXX9QkW1eKwgFATOLWh4QbiGLVhtBnmXteDUo6Pbtxfb9MzXV3CN8pc3+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBoCvbJr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 741B4C19425;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775296273;
	bh=KQ8lsG+ZU1fa4Zfq1OtQatABJX25qxFvudXC4UWGJ0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QBoCvbJroDq84+L4VNdb7CpkUkIyHJgzNHsymOpWvKovpSMa2F1kvB29ZlOi/AI/2
	 TS2iYinqDjtaF6M3YwUPuiK1f9iVhGSGJQiaW2fUtaHtWcAy/2HQf32ekMWsO1ksrA
	 vQ/Llv30ymDWRxQtCv5XJoGJ1FTC8SgXhkTjVpLOta2riLbNBn7ffzMqirBO4VJHaK
	 LJ4dVGS+kUXah+zJtoa6ZVg6Gr09E0mJSY9zbSooRZUV4kuUN46A9tXZOdjOLAeUc1
	 7SFeY4Ua3md9UokdAL/XgUFsfb325CQXu0UCBqRQnX/JLVtqntIA/eqpssAZ0ipctd
	 kVZK1WaCF7aug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F68E88D94;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Sat, 04 Apr 2026 10:50:54 +0100
Subject: [PATCH 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions and port labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
In-Reply-To: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775296270; l=2186;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=8wWHbLnW7l5BtOwjusH2UH9x4Bz7+MdlfIopte9jZIc=;
 b=/HR3+gbkZpZKc2hF6yjfI/Vn8tsYHQumElfWr1CIXbwGseLSsKQNu1500aTd35ZlhuMnb3zzL
 6iniPJ0tl19BrvgjnoLC5a10bl9ArqefVJ/j+70NDdPlMM0Tr7wxhmq
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101757-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,axon.com:email,axon.com:replyto,axon.com:mid,1c08000:email]
X-Rspamd-Queue-Id: CB06639A9E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Add the MHI register regions to the pcie0 and pcie1 controller nodes
so that the MHI bus layer can access controller registers directly.

Also add labels to the root port nodes (pcie0_port0, pcie1_port0) to
allow board DTS files to reference them for adding endpoint devices
to each pcie root port.

Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..d4caf4d00832d7f1e8f65bf2bc873cddadc42168 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1964,8 +1964,9 @@ pcie0: pcie@1c00000 {
 			      <0 0x60000000 0 0xf1d>,
 			      <0 0x60000f20 0 0xa8>,
 			      <0 0x60001000 0 0x1000>,
-			      <0 0x60100000 0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			      <0 0x60100000 0 0x100000>,
+				  <0 0x01C03000 0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
@@ -2092,7 +2093,7 @@ opp-16000000-3 {
 				};
 			};
 
-			pcieport0: pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2138,8 +2139,9 @@ pcie1: pcie@1c08000 {
 			      <0x0 0x40000000 0x0 0xf1d>,
 			      <0x0 0x40000f20 0x0 0xa8>,
 			      <0x0 0x40001000 0x0 0x1000>,
-			      <0x0 0x40100000 0x0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			      <0x0 0x40100000 0x0 0x100000>,
+				  <0x0 0x01C0B000 0x0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
@@ -2288,7 +2290,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1



