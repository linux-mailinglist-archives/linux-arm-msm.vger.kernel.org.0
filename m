Return-Path: <linux-arm-msm+bounces-111527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ev5FLpZxJGqt6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 21:14:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFCB64E188
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 21:14:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thundersoft.com header.s=default header.b=Q6kJZErv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111527-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111527-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=thundersoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5D56301953B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 19:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA983AEF47;
	Sat,  6 Jun 2026 19:14:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m9328.xmail.ntesmail.com (mail-m9328.xmail.ntesmail.com [103.126.93.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED953016FB;
	Sat,  6 Jun 2026 19:14:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780773265; cv=none; b=VJKOtxjUP6bKUQxXr7I1sTijBelgHH/yp0D6H4TS6v5UySTcl1DOUFKBn5AybMnUL/mDsA6i7mW741D2wIeKspb50Oam434kzSwdsv4/kLPKMn+bCvPjw+9Lh4EgXS89HuHEgqrvKcb/sJP6QwGtFzkOPJK5VyvQLBngTG9rLbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780773265; c=relaxed/simple;
	bh=MeGVjaMxjH769oiq2fSMjLP0j+/dHsFf8sy3tDKl1p4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jMqIw8qi5cEkCFzELsEUN8yzoyMidEyvGXQKaOR2MuxRPdyqpQGdpMlJMphoMtVjkCsUly/wp3QUqZPdH+bSpopk/WCLYPaqHE6+Cnx9a4u0mSx6CTKS7seVfxWXcoNddVuhjt2TzM1FLthsJp+Gsspo+976tsWnGwiMJK9Z8uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Q6kJZErv; arc=none smtp.client-ip=103.126.93.28
Received: from [127.0.1.1] (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415a3a861;
	Sun, 7 Jun 2026 03:14:13 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sun, 07 Jun 2026 03:13:49 +0800
Subject: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Move PCIe GPIOs to
 root ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-rubikpi-bugfix-next-20260605-v1-1-ff97c5e35bf6@thundersoft.com>
X-B4-Tracking: v=1; b=H4sIAGxxJGoC/y3MQQqDMBCF4avIrB2IKcbiVcRFkk7iKERJTBHEu
 ze1Xf68x3dCosiUoK9OiPTmxGso0dQV2EkHT8iv0iCFVEKJDmM2vGyMJnvHBwY6dvyPLT7sU1p
 NSneugUJskcrp5ofx1ymbmez+NeG6PikmpmCAAAAA
X-Change-ID: 20260607-rubikpi-bugfix-next-20260605-3c82cae6a7f1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rosh@debian.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780773253; l=2259;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=MeGVjaMxjH769oiq2fSMjLP0j+/dHsFf8sy3tDKl1p4=;
 b=f2vs41GsoUcJBD9h6rWOU2jvjVDmgt0NtP3cnYI9Un5G/8CQTgRw7K4DLM78TI/pNpWH+QWgd
 pr7ALCcTA8vAks1XNDS0N06dRxukewRoElqUh7wIBgrltwWjK7VfneR
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9e9e5b714209d5kunm4bbfa1de139e81
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTxlDVklLT0lOHhpLGB9MSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Q6kJZErvAEVVOR2dVtP42TGPfr92yyF1m4fAqfgK9sdx1RF6u+mwSzVmHgchQQrVuetvGKQ4m7zSzXH+ffWYnqZNXLtZPPrCwscfDTfuE/nLVxrTs+kcRK4NTvvVNbBSXu9SfJ/HSWP3YdPFaVDOyTmGBQ0z82J696BR4deEEsw=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=2ydJ8/WjXBtIfiJFXOyfkVQHcRbJXJdGqMLYUNx89/I=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111527-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:hongyang.zhao@thundersoft.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:mid,thundersoft.com:dkim,thundersoft.com:from_mime,thundersoft.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AFCB64E188

The Qualcomm PCIe binding deprecates perst-gpios on the host
bridge and expects endpoint reset GPIOs to be described on the root
port as reset-gpios.

Move the PCIe0 and PCIe1 reset and wake GPIOs to their root port
nodes. This keeps the GPIO ownership with the device below the root
port and matches the PCIe binding.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Fix the PCIe reset and wake GPIO description for the Thundercomm
RubikPi3 board.

The board currently describes PERST# and wake GPIOs on the Qualcomm
PCIe host bridge nodes. The Qualcomm PCIe binding deprecates this
and expects endpoint reset GPIOs on the root port nodes as
reset-gpios.

Move the PCIe0 and PCIe1 GPIOs to the corresponding root port
nodes.
---
 .../arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..5c08ab53cdbd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -812,9 +812,6 @@ &mdss_dsi_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
 		    <&pcie0_wake_n>;
@@ -830,10 +827,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
 		    <&pcie1_wake_n>;
@@ -849,6 +848,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";

---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260607-rubikpi-bugfix-next-20260605-3c82cae6a7f1

Best regards,
--  
Hongyang Zhao <hongyang.zhao@thundersoft.com>


