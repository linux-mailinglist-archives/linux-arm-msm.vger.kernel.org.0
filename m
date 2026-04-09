Return-Path: <linux-arm-msm+bounces-102505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K6kFMLG12n6SwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 17:33:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A03CCBA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 17:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34B5B309564E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 15:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555B43E0228;
	Thu,  9 Apr 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrKjvOj4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39B3DF01C;
	Thu,  9 Apr 2026 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748416; cv=none; b=uZudWK/6fUoI8/sI050kBSA1cBJkqGvgTav+0TtumcIiRi02v+Cb1jh7o4kUBO1tsOg53kexl1FyB8nhr6qLivVWQLikSF8Byvdij+IPilKketdwDLbylmX1kYqxpkQkVuVhHbkmlmG0WqvWWG3OkZmVESDsTHf9rfKC+wcJWZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748416; c=relaxed/simple;
	bh=yO9UwjiPWDJT3ejKvEkvRNwuNU1ZbGTnzRZSZqrMmdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oNRU1Vwyc4ebbbcYBeIrSxMXvNB/laeX6moN4IUJm08UhPnpgMpu0KY4eRqwhShANRnbDHWjf6x5l6MOJ9ULkco2ZjrWAFQ/7q+Aob0QaJxWQjOtNyiuzbC9nbMWozzt9HWQCcI2ITnGB7V4xO0agumi56M7stMssasL+l5Gk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrKjvOj4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2D3EC19424;
	Thu,  9 Apr 2026 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775748415;
	bh=yO9UwjiPWDJT3ejKvEkvRNwuNU1ZbGTnzRZSZqrMmdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qrKjvOj4lvAqJsMPSayx631wSxvOEgNEdgQQq5PTxOTIBSIj5iMQVgSnuwYn80Xcn
	 RMLnND4gA0qVw7NXgAa/E7ClHWzroJ7odblgMKk3YDCi2jB3nRjznGv+L2Ff+9vBMi
	 mzhG7Ft2BVAt1Pvk9bi+wQxkCe/RI+4N0HfllZM2dEOk3aeC1Y8mRBiWm83kQ3PaEF
	 Rke6L+w/XLTHdiY95s75i/FvICoUxLiW65g5lIg7JOYgMsyQgDJDuLKOuMKJ1xNrmm
	 muKPSnHpEixROoxYSBby3/uezZF9FLc+GAbNDZT1RNY5JM1gqYInHk55lILMqHDSJ4
	 MV2cBxFchH2zQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BD8F31E28;
	Thu,  9 Apr 2026 15:26:55 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Thu, 09 Apr 2026 16:26:53 +0100
Subject: [PATCH v3 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rb5gen2-dts-v3-1-be736355d4b4@axon.com>
References: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
In-Reply-To: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775748414; l=1848;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=CXzCYgyTFqrynuOrAfcu3fHTmrJpPiscAHoxToN3nf4=;
 b=q29obwietSG++BXkxOyOJf7bh8mBfFJ6sWIAMuy68/25Kj1u91x77p/3xMxa2L88xWZlDi8zi
 stZpK/54Fm7B7z+RAtckWR6IoWzHycsRnjBUtVpYBXtA/gdDoXhCp7O
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102505-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1c00000:email,axon.com:email,axon.com:replyto,axon.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1c08000:email]
X-Rspamd-Queue-Id: BA6A03CCBA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Add the MHI register regions to the pcie0 and pcie1 controller nodes
to expose link power state transition counters (L0s/L1/L1.1/L1.2/L2)
via debugfs. The PCIe host driver uses this region to read the
link_transition_count from the MHI registers.

Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..055ca931c04859f3a312eb9921aeb7a8cc676822 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1964,8 +1964,14 @@ pcie0: pcie@1c00000 {
 			      <0 0x60000000 0 0xf1d>,
 			      <0 0x60000f20 0 0xa8>,
 			      <0 0x60001000 0 0x1000>,
-			      <0 0x60100000 0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			      <0 0x60100000 0 0x100000>,
+			      <0 0x01c03000 0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
@@ -2138,8 +2144,14 @@ pcie1: pcie@1c08000 {
 			      <0x0 0x40000000 0x0 0xf1d>,
 			      <0x0 0x40000f20 0x0 0xa8>,
 			      <0x0 0x40001000 0x0 0x1000>,
-			      <0x0 0x40100000 0x0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			      <0x0 0x40100000 0x0 0x100000>,
+			      <0x0 0x01c0b000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,

-- 
2.34.1



