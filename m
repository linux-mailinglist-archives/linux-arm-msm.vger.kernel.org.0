Return-Path: <linux-arm-msm+bounces-116147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TzvKG/1CR2rJUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:05:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B77686FE8CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:05:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=bXeLB3U6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116147-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116147-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B1273015143
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436F03451C8;
	Fri,  3 Jul 2026 05:02:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5240733EB1B;
	Fri,  3 Jul 2026 05:02:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054922; cv=none; b=asGXBbj9XCkO1ukr4GTaQxCMsTaSUFp0r5Z9I4aiZc1NQDLimUMXdA9Iuf5t6u7yMedlVlvYMjYVLT4gIy985J+FO+BT/NeZGQ9eFcyzyjUMUMgPiQjLxwCUxo0vKW54IdGS79ClJROhowaIiJQw02dUHoG8WUNOP+77tC86Ujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054922; c=relaxed/simple;
	bh=ruRDsLiRVJS672K5oo8OA4gOAKdVmvXkKSjCKbHPxU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cthfOg+sUMpF3Gyw/ngGFfx4R3rpF+IkGNUpAczyHSZOTKtNZlqdIOZY7999bMMYbHio06tjeNBeS2984z7/g5fpJb+0aj1e0OvDOw/+Yep10IAuHxH/nGYAomZrwDnbur1pSQHea6DOdMSUBhASX/FzRd9nBv4VJfY5fj6/n9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXeLB3U6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 819A2C2BD05;
	Fri,  3 Jul 2026 05:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783054921;
	bh=ruRDsLiRVJS672K5oo8OA4gOAKdVmvXkKSjCKbHPxU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bXeLB3U6yQm2dXWm2NCHItX6pqksGIi3ASnLd4uio/VaejhsI5OP+ZKxfq1oo9/Wk
	 dFcG0RttORwXtlGHeDLKYnYfueGcFJzqjt1rmyEiD49cL2d71q1QK1Vm/K9gmhHQEC
	 /oohR3+Ij5Lk8HAB3/QhoR1lKGBKkdK4McaZ1SyuaNRYgPeYcDTIHSi2aFUH7Yfp7k
	 3v1KLhTpvElpLJWNMfBPHeaM/1LkjxO89/K6IgAI8xj5k09PfRtTiayNc/WMRDg60K
	 UvYvdrb79Oybm4myi6qcny8IEcAXzfN0UWFe4+u4Xqhq3tGgNDgnSsApkm/YyAPf4m
	 t0rmNz7Nic5pg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED84C43458;
	Fri,  3 Jul 2026 05:02:01 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 03 Jul 2026 09:01:53 +0400
Subject: [PATCH v3 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783054918; l=1634;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=W34SYW/fjbOsDklvwrwSAhVsxNGBAP8d0fG4MddytFo=;
 b=odimwWqx4LOzTR3PXrfLhZJHoOeqpZSyfolbErDBbi4U7QejQr3mrRdwJlblQGu9ncqCpWzvW
 UkDUEWENAMmBphY0kKnIvOUrCNbRxV+D4PvhQOmHbE9BBslrwcCLJbX
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:george.moussalem@outlook.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116147-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,outlook.com:replyto,outlook.com:mid,outlook.com:email];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B77686FE8CB

From: George Moussalem <george.moussalem@outlook.com>

Add nodes for the reserved memory carveout and Bluetooth.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6f8004a22a1f..65a47ba7d3a3 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -17,6 +17,23 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	bluetooth: bluetooth {
+		compatible = "qcom,ipq5018-bt";
+
+		firmware-name = "qca/bt_fw_patch.mbn";
+
+		clocks = <&gcc GCC_BTSS_LPO_CLK>;
+		clock-names = "lpo";
+		resets = <&gcc GCC_BTSS_BCR>;
+
+		qcom,ipc = <&apcs_glb 8 23>;
+		interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
+
+		memory-region = <&btss_region>;
+
+		status = "disabled";
+	};
+
 	clocks {
 		gephy_rx_clk: gephy-rx-clk {
 			compatible = "fixed-clock";
@@ -136,6 +153,11 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		btss_region: bluetooth@7000000 {
+			reg = <0x0 0x07000000 0x0 0x58000>;
+			no-map;
+		};
+
 		bootloader@4a800000 {
 			reg = <0x0 0x4a800000 0x0 0x200000>;
 			no-map;
@@ -647,7 +669,8 @@ watchdog: watchdog@b017000 {
 
 		apcs_glb: mailbox@b111000 {
 			compatible = "qcom,ipq5018-apcs-apps-global",
-				     "qcom,ipq6018-apcs-apps-global";
+				     "qcom,ipq6018-apcs-apps-global",
+				     "syscon";
 			reg = <0x0b111000 0x1000>;
 			#clock-cells = <1>;
 			clocks = <&a53pll>, <&xo_board_clk>, <&gcc GPLL0>;

-- 
2.53.0



