Return-Path: <linux-arm-msm+bounces-103709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Dw2Nf/x5WnCpQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:29:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 366E2428DC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0F07305E114
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698C638B12A;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dq8rEWXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED7F38836F;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676398; cv=none; b=OnF/6sY+/JGZmOAsJt9/Eo0/vKYWymkATN/27P2+vncX4Oya1GAv+ClCm3j6S9zJTrJu8AUafiMJL4nC5d2NWnt85IJpwEn6BqynG6ZOS1L+jwagez4gVfCGUnhFWU4Z2LkAjVfTvMxOBxzEGAp2NDZ9ExAlT3aEypvtMjt3h1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676398; c=relaxed/simple;
	bh=cep+xMb91JM9KjM4+ZqrlL/XV/ZXMZeYnM+gV7tlv0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5tpbjx3eg8i3Rl3Hujw3klj7/3oIPD4fiewOhHa70L0q0iK5dsbqHxuYCAWRUUvUe5Tfig8m3UDZebpdEZV5MPQEp+iG58R2rJHPZkcvXXjdFJJu87s2SZi/MEuFQ63cLkkTaLGfQlt58OKuV4j9O7xEvqwdxmV07KeeWb4350=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dq8rEWXh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F7CBC2BCB9;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776676398;
	bh=cep+xMb91JM9KjM4+ZqrlL/XV/ZXMZeYnM+gV7tlv0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Dq8rEWXhuVj5p9HcsjqphEysm4hQDGuWo89UcEfODlbbr6fjY+5OVxWWtCRrvo75T
	 RIzv1vwWbtRCS311i+ifVKGcz/Aesg8Txs51PxlvvcT8L1gbGLWR03TcOnLRMZ6ab5
	 KD9D/kv2o8xiUYNggjla8+01xF5Qa4MjFp0eT5YGEqJN/4eP9Dw/bG+97SuK1K/F/s
	 DlM8GgmdaQvBpzhEeS/SK7Sah7WEGVloYpidyMKtMM3VRCrTml11HHFQ+BaoNE8vyT
	 R5sp2y5UhrABm1sQLOt88hwHRcv9GzVkZ5Xj4S3bBHdrGziBceg6mDNk7nxCvozG/H
	 NJVlQFqIcoOIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01735F557EF;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Mon, 20 Apr 2026 10:13:14 +0100
Subject: [PATCH v4 2/5] arm64: dts: qcom: sm8550: add PCIe port labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-rb5gen2-dts-v4-2-b461909c2de8@axon.com>
References: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
In-Reply-To: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776676395; l=2276;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=bK2sEqMstb26/kSTAhsg9lrLGwFBAEwx+Z/Kvj8kVLc=;
 b=HKAaK2GB5XgXKLRUwsBLBBeBrmz024+4hbrNggzAsoFPKR6N4cmdcWdLoF6WF5JyxsyOWCoiT
 MPx9lrG3g7eDJHHRqVv7Cw4JjtD4KXwEM41t/ef0cpNuhpNuGkQYCO8
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103709-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	NEURAL_SPAM(0.00)[0.952];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,axon.com:email,axon.com:replyto,axon.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 366E2428DC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Add labels to the root port nodes (pcie0_port0, pcie1_port0) to
allow board DTS files to reference them for adding endpoint devices
to each pcie root port.

Update the pcieport0 reference to pcie0_port0 in sm8550-hdk.dts and
sm8550-qrd.dts to match the label rename in sm8550.dtsi.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a8259d28540e718851e094f74ead278..e821b731bdc496c872703723df02ae9b9b0233b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1012,7 +1012,7 @@ &pcie0 {
 	status = "okay";
 };
 
-&pcieport0 {
+&pcie0_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c6b597f20f332cdf063daa2664205..cf63109ff7bf7b6fc827f108e22e82b8b04273c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -912,7 +912,7 @@ &pcie0 {
 	status = "okay";
 };
 
-&pcieport0 {
+&pcie0_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 055ca931c04859f3a312eb9921aeb7a8cc676822..54308cbde40732da072177eab533582c155df590 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2098,7 +2098,7 @@ opp-16000000-3 {
 				};
 			};
 
-			pcieport0: pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2300,7 +2300,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1



