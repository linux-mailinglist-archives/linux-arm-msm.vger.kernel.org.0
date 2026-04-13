Return-Path: <linux-arm-msm+bounces-103005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCU7G2E93WmqbAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 21:00:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 544033F25AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 21:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A319F301939E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17ABB3B895E;
	Mon, 13 Apr 2026 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIrUDRVP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C43921C8;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106822; cv=none; b=FOG6qy9TmUciy5Tfh6/9CzI+eNd+Og2LhkuZxZH2e6u7EqRHaD3Ldw8u9gAtC+9SkYiKizSy/b7+A5AMlBGevHvftsfOuHYTx0Bgn2jXuwHysHAhdiTqxts8u7iUYgc90GYCM2R3yqOug4zyC2RuJN/RnpNdUInKUH8gQjdoWVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106822; c=relaxed/simple;
	bh=eMPQCrWuwYp6Qaj9tDKHV4FwksQ6oYZfXp6eAYzfY3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HhBoweOh3I54H3oXjK9STSoASVREm8e7HNqH2CQQ0GQpyGyDlFlvaoWkVRgdpEIpFyzLpPSW0iHxNjo/yz4MnbfK2WGy6GkBew/fW62Ly3IVEiGTbL3d5kb2lIwKC0P4V2mqGiWeMGLtW9e2UT0gS/TROHVpJ6QLRhqebgZNqu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIrUDRVP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 549A3C2BCFD;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=eMPQCrWuwYp6Qaj9tDKHV4FwksQ6oYZfXp6eAYzfY3Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fIrUDRVPltYuZZG9teHqHX3E4d8JNHUiJXU9Jz606+0QkcKl9//EiVM3o6M043UaG
	 R/JdgQzT6yqLMiqtSYy8jsxLg3iHvREfQtxDc+CykhTlHaF79B/OShSus8jCDFcgLb
	 K2QM6mMEcZCbgovVGFHwK7YYHINJ0mTNSzus960aMpnsKF62dgjmGhEnE83ZFpvpDC
	 9aEKwESoE05JvPVtxna1imSSL9A3YUEVdtsidOHmRig9OFOAS49iaKahvc/+N7ybIq
	 Wtoe1MGH8qfwTQSXWGheJ9gwa2YxastH+vWrgBVMbaKIz+ncsi4P5L3rT2EIk4PjIh
	 cVFBv3uQroYpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D28F531C7;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Tue, 14 Apr 2026 01:55:32 +0700
Subject: [PATCH 05/10] ARM: dts: qcom: msm8960: add RPM clock controller
 and fix USB clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-5-007fda9d6134@smankusors.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
In-Reply-To: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=2356;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=dE/g7MGseDjTU+F2GnRvBWqzhWFxWvzCHDcn/uKrYh0=;
 b=zkm3oqtclo1LLRb08UVeJF/3izNEBbDu/WS4AwhxOVkQIcsB1DQQcHzUyqgaJR/NUyO9InoiG
 esLCn5OvhYuAgee8lW7eJyIk4Pcf5WGrxcVdmPRcsHYdFsNi53+XGlx
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103005-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.190.188.32:email,0.1.165.224:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:replyto,smankusors.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.7.161.32:email]
X-Rspamd-Queue-Id: 544033F25AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Antony Kurniawan Soemardi <linux@smankusors.com>

The RPM clock controller manages clocks shared between the application
processor and the RPM firmware, including fabric and bus clocks required
by several peripherals.

With the RPM clock controller now available in the device tree, the USB
controller must explicitly declare its dependency on
RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
would consider it unused and disable it, breaking USB functionality.

This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
clock. The XCVR clock is in fact used for PHY/reset handling rather than
as the main core clock.

A similar issue has been observed on APQ8064, where missing the RPM
fabric clock dependency leads to broken USB.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fd28401cebb5..1d5e97b6aa4b 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/clock/qcom,lcc-msm8960.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
 
@@ -98,6 +99,13 @@ rpm: rpm@108000 {
 			interrupt-names = "ack",
 					  "err",
 					  "wakeup";
+
+			rpmcc: clock-controller {
+				compatible = "qcom,rpmcc-msm8960", "qcom,rpmcc";
+				#clock-cells = <1>;
+				clocks = <&pxo_board>, <&cxo_board>;
+				clock-names = "pxo", "cxo";
+			};
 		};
 
 		ssbi: ssbi@500000 {
@@ -507,8 +515,12 @@ usb1: usb@12500000 {
 			reg = <0x12500000 0x200>,
 			      <0x12500200 0x200>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
-			clock-names = "core", "iface";
+			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS1_H_CLK>,
+				 <&gcc USB_HS1_XCVR_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "fs";
 			assigned-clocks = <&gcc USB_HS1_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS1_RESET>;

-- 
2.34.1



