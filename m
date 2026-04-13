Return-Path: <linux-arm-msm+bounces-102998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JmuIhk73Wk3awkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:51:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 006783F23EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1FC430455CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BB8390228;
	Mon, 13 Apr 2026 18:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="bhK9432u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from dragonfly.ash.relay.mailchannels.net (dragonfly.ash.relay.mailchannels.net [23.83.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE823EAB2;
	Mon, 13 Apr 2026 18:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106187; cv=pass; b=nEOaWW4sSNboFqXuGDKJeLJghuJ4laL/wqDVqXQzQNYGgaAUh15/AvNVDT80XIWvZGr5nknaS7tO0ZwkNBgqX6ZcC7rI1SwzdcjqgLkuT7EaOHEeUyJPhqlP81csi8clD98qdgFLEMchY9upku65Cy+cjDgRS9ymbAk36FjaRm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106187; c=relaxed/simple;
	bh=krAuu/0WstJknY+csLrR8SH0m8CWuJG86jpKvvPTtfg=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=spUT8a+2RUjj/P2kckYmnzBPdfzgnS7YyLzyoJhTxvFAnkC+8kACg9brWtU1W294xl+ohcN4l/XOmNThPcHL2Na0KLQOhQKqHqF7E+9RrKbT+Cf0WkHct2aEeU8GGxK1aclUF2UfioiTX0G0qM+EK5fjO46ozE5hSVOhMJg0fRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=bhK9432u; arc=pass smtp.client-ip=23.83.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 315F77E188A;
	Mon, 13 Apr 2026 18:33:18 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (100-101-159-68.trex-nlb.outbound.svc.cluster.local [100.101.159.68])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9CA4E7E0E20;
	Mon, 13 Apr 2026 18:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776105196;
	b=mm3qaltKo1hYwXPXTNkqf7z4k9IfCU6ZyydtC0HtYYl5HfnDhirWt5mMz/BmiS+WmZVBpY
	wiUxylwr3RJ2G2sHcj3QUrsH25Az8XSVgnPKA0p2JrZCaMHd8j2YkVODYlnmTz8ugp2D3H
	/RKZyLnCg2yrneOjDSAFKyc+g+tziGmprvJqEb5e+uuHvRe/X+fJurZxO9CUd+y/k2dZ/r
	wP18o/IQKVZezkxqzew+2GYD316h8Uoi6gTaGQdE8BNJLuItSyZwVyCqUniQSmgmlKT+yZ
	H5dV3hptViwpC3cRtfyMOuODjUOrGoGwCyl1wdO+KpWrvPLYi1Xie7Oi2XbB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776105196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=gC4QEJJYFCDp2IOgth+X/Ti9ZrwlGREYN4zuIaCIQ/A=;
	b=Nw53ktyCDFjhAkP+fUwEy2atpFq6jg0DLRtjsmvIiExwZFbCg7V+hh6EMySoWAcfjqna4g
	pXl+o2yvKpeKcj6LwDmhofKO4KTNRSB8Pl/66Emz15n0LhOS6qwNHTSNLc3Cz7SXQvYAEW
	KZVhajyO37q63kgD21ZUN0e7cmncuGe3lKcfzos76m3G32JJzJJvxFot4VDMunWR1Wf68l
	X9vx5lJImRORF31NMlpIjHt/DwBPVuL9o9VMaak4s3KNT7LBmzGsCeHNlacbxY2VmSKmx7
	Vfj98NLlecJbqdmbl4WdIIKUHtZ7u+NUHrSpsRMGLwYxzIWIZKlIPNncMT3fFQ==
ARC-Authentication-Results: i=1;
	rspamd-7d86dcc447-fnj9k;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Lettuce-Quick: 4cb05ca90b9ec1db_1776105198087_2698546186
X-MC-Loop-Signature: 1776105198087:1841770979
X-MC-Ingress-Time: 1776105198086
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.159.68 (trex/7.1.5);
	Mon, 13 Apr 2026 18:33:18 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fvbd04NwBz1xqg;
	Mon, 13 Apr 2026 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776105191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gC4QEJJYFCDp2IOgth+X/Ti9ZrwlGREYN4zuIaCIQ/A=;
	b=bhK9432u0yMRESuEHtfh36WLRInULMC5i1YR0WzOcd+eX5fuaSDRcJJUzx5sYaF9OuyoQ/
	lJqPFu1wu7Lc+eafdeFTYbhoLFoB0IvsJhy0JmeRMBHQzM8bR2y9wmhzBFW90VUbkGsWMA
	QZVgIWQd3BM88sOXLhzgwofCMjtdCfMBN59DHM72S6gJCuyLPemHUWubMOWHk4o7fcT5Yc
	MFXmdLfD3HjSJZqAmm6M5mvN+EzbHp7rIgWT7LppWZfhiSNz6AYQcVIYuZlYKrOMiZKc88
	PFcf1usze/r9RqxeDeVy7syK61lM34WvSAx9KhLYo+dEc+S/rgQGUHkQys7BVw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
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
Message-Id: <20260414-msm8960-wifi-v1-5-01c081e54610@smankusors.com>
References: <20260414-msm8960-wifi-v1-0-01c081e54610@smankusors.com>
In-Reply-To: <20260414-msm8960-wifi-v1-0-01c081e54610@smankusors.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776105169; l=2412;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=krAuu/0WstJknY+csLrR8SH0m8CWuJG86jpKvvPTtfg=;
 b=YD/QNMISLnHbuokZ1UjLJ46X7QNOmJqkibV+2Jq2a+DXDDW8HjrPsM0kyUBcMUg1vo70hyc2Y
 hPHCjhVQpXjCNiA0P5iFGOwOh6OpRukxylX4qX4ctjAvfmCsskJSX4s
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Mon, 13 Apr 2026 18:33:08 +0000 (UTC)
X-CM-Envelope: MS4xfHLah8amrRpS/czPuaRGUpMGPM0QU17E8x5b+Wgn6LlSGsbWSPU+FIimCluy+Brw8JJ0MBwL68pzUxTZCD0d4lGwueOvoDJLw074MQxNRyoJ10xWfmFH v9Rpx0ZhJlf8LBNA6iQSDSJ2ui4Tc9QfIwsg2qoKNRX9Yc6w0cp9+6qW7LL1Gck2GWNcxelm0ZYcvYDY6VJJk5nIXL3j9RLagDL0RFKDMbojumgSlOX0mDXO Qdb8ARnkvCzBq0greAnwnxWuKO8brS+PtL1a1B4pb7MfaWh6u7IkxsMrTXd4TnoewciY3Z506Npy4t/fgxWXMhUkyUKjJmFxR4xurt735O8B+Vxao9swcTTD pj8pQ+7gvZnzRZwd8av0pMNRgQyv6tFOgESxvLgziC6TR9H5gCo5hCworv7vrZYutCoigCJj1UbFpzTFa/5xRseFBaJvXD/cfC5/49+OXM63dqTSNWjP4wKW LsKiG3+/qI4eIxkhpem2yG6EyY/zPONk7k4ssWEbtmjPA3Y2MP4a2N/QZ/EF9VE3yJ+S5qp7pTdjp6FtNZJsKuCcuXvqoF3dHlarf6hx7VNtyNy4IUroWP1+ 0HYjVGxLI+aXp3iSyUtkjVMPrlzrxVcQGEqXlOggHOpD9aeoBLSI0ccyPbSxnEHQPXzpGQ2S0JX4ai8+X6orgOhK
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=69dd36e7 a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=-g1pO0pIwJ2TSlcm9fEA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102998-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:dkim,smankusors.com:email,smankusors.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.7.161.32:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.190.188.32:email,0.1.165.224:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 006783F23EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index fd28401cebb5e15cf9eb5bfdeff29d7b0c580b1a..1d5e97b6aa4bdfe98469a51d25984429e5c3be5f 100644
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


