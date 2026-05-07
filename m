Return-Path: <linux-arm-msm+bounces-106258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNXBEmwx/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:30:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5554E3807
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FB1A301B919
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4ECD33A03A;
	Thu,  7 May 2026 06:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUb92ySy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806282DAFAF;
	Thu,  7 May 2026 06:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135398; cv=none; b=jFE0PHcl+j6RjVBWChchcA8U5BJrFLF+iu0nq4Ea4bad19+EbdLhbnomkM4vKs4isgrFf0HAyj3ptrCeFdRrbkh/oL4qeCzv2Cp8aHW/TP4i2FzGKcokAB2T9AE2MwSwvO+NEQrKcfRyQJV2XP+NF/cpQ55RWLMQPeLvqUeXYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135398; c=relaxed/simple;
	bh=FU22JZrq119GDU3J/InpMXFnLI3oMvT09I+8QA14Rw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eQkI7pfFyzvbL3VXF77IyiENA5YC2X7dmp5J57naLjwN9weGywfFvyfN3fuqt5SVBr0y+OwSx5T/x9WoAXoCF0Tw7bOs+pjdWArKh2XY7SKM+69CGeLSNWn7Nfc9QmHU8OVzmcPcLfFSJd9LCIlE+06U/hc8+QtpeibCoSrEguI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUb92ySy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B71EC2BCB8;
	Thu,  7 May 2026 06:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778135398;
	bh=FU22JZrq119GDU3J/InpMXFnLI3oMvT09I+8QA14Rw0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VUb92ySy8WgZPXXOXL4behAGIxxp0ebEHt6gjokhKNJ1mZLj03xhaCeVT1wPYXh7w
	 ahsFZQM6Vq3dQHrCC5cNBXkopz9jm5bylaEng1vfSBP6JoxBhbD05SiIk18ZeUo4hf
	 b2mnP8604UREkqu8qJRP472o2vfoW1ri5Cbj+P7wIszTxCg74QFMpJyh8ru33369eU
	 zTXRosVTwX5244wlre7zwGPiKO9gsHefVs88cBeM+KDsqcBm3DSLuovFmPloPZ7n9R
	 f9ZGlhG0rYZ9wpoDJD35GQaCstjvNtKbtqdckUNfQ3GSgHNxxX0pA2TcrqkEkQ/RNv
	 3lAXSRtmA1xgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EDCCD3442;
	Thu,  7 May 2026 06:29:58 +0000 (UTC)
From: Haritha S K via B4 Relay <devnull+haritha.k.oss.qualcomm.com@kernel.org>
Date: Thu, 07 May 2026 11:59:50 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: Enable cpufreq cooling devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-glymur_cpu_freq-v1-1-d566cc1d32c3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF4x/GkC/yXMTQqDMBBA4avIrA1kUnThVYpIjKOOWH8mRiri3
 Zvq8lu8d4InYfJQJCcI7ex5niIwTcD1dupIcRMNRptcZzpT3Xh8glRuCVUrtCq0mBMaaw2+IFa
 LUMvf+/guH/tQD+S2/wau6wf9E9cTcwAAAA==
X-Change-ID: 20260505-glymur_cpu_freq-1a16e12aa213
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com, 
 gaurav.kohli@oss.qualcomm.com, Haritha S K <haritha.k@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778135396; l=4683;
 i=haritha.k@oss.qualcomm.com; s=20260422; h=from:subject:message-id;
 bh=bI7+4pLky4jLFMKlYUdkSEXsFPxmbXV05qBezAGMXV8=;
 b=vd06qx7K61rX/W13PKZ+5bHGXS2kvn3Z8fN6QWD/HgTp8qTCd3NX9xoNYazwfhcKIIdHw3sNu
 laIVCGb84aLBpc1XqtfhowRGd1cxv1KvyXzJ62yLWeAc1UpXv2fJ1aL
X-Developer-Key: i=haritha.k@oss.qualcomm.com; a=ed25519;
 pk=ivp2P9RgsC6IkOe8JaqweeahT9pd0BVtL2d1YD8ICSg=
X-Endpoint-Received: by B4 Relay for haritha.k@oss.qualcomm.com/20260422
 with auth_id=745
X-Original-From: Haritha S K <haritha.k@oss.qualcomm.com>
Reply-To: haritha.k@oss.qualcomm.com
X-Rspamd-Queue-Id: 3E5554E3807
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-106258-lists,linux-arm-msm=lfdr.de,haritha.k.oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[haritha.k@oss.qualcomm.com]
X-Rspamd-Action: no action

From: Haritha S K <haritha.k@oss.qualcomm.com>

Add cooling-cells property to the CPU nodes to support cpufreq
cooling devices.

Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..5fb685664370 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -39,6 +39,7 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -55,6 +56,7 @@ cpu1: cpu@100 {
 			power-domains = <&cpu_pd1>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -65,6 +67,7 @@ cpu2: cpu@200 {
 			power-domains = <&cpu_pd2>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -75,6 +78,7 @@ cpu3: cpu@300 {
 			power-domains = <&cpu_pd3>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@400 {
@@ -85,6 +89,7 @@ cpu4: cpu@400 {
 			power-domains = <&cpu_pd4>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@500 {
@@ -95,6 +100,7 @@ cpu5: cpu@500 {
 			power-domains = <&cpu_pd5>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@10000 {
@@ -105,6 +111,7 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -121,6 +128,7 @@ cpu7: cpu@10100 {
 			power-domains = <&cpu_pd7>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu8: cpu@10200 {
@@ -131,6 +139,7 @@ cpu8: cpu@10200 {
 			power-domains = <&cpu_pd8>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu9: cpu@10300 {
@@ -141,6 +150,7 @@ cpu9: cpu@10300 {
 			power-domains = <&cpu_pd9>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu10: cpu@10400 {
@@ -151,6 +161,7 @@ cpu10: cpu@10400 {
 			power-domains = <&cpu_pd10>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu11: cpu@10500 {
@@ -161,6 +172,7 @@ cpu11: cpu@10500 {
 			power-domains = <&cpu_pd11>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu12: cpu@20000 {
@@ -171,6 +183,7 @@ cpu12: cpu@20000 {
 			power-domains = <&cpu_pd12>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
+			#cooling-cells = <2>;
 
 			l2_2: l2-cache {
 				compatible = "cache";
@@ -187,6 +200,7 @@ cpu13: cpu@20100 {
 			power-domains = <&cpu_pd13>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu14: cpu@20200 {
@@ -197,6 +211,7 @@ cpu14: cpu@20200 {
 			power-domains = <&cpu_pd14>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu15: cpu@20300 {
@@ -207,6 +222,7 @@ cpu15: cpu@20300 {
 			power-domains = <&cpu_pd15>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu16: cpu@20400 {
@@ -217,6 +233,7 @@ cpu16: cpu@20400 {
 			power-domains = <&cpu_pd16>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu17: cpu@20500 {
@@ -227,6 +244,7 @@ cpu17: cpu@20500 {
 			power-domains = <&cpu_pd17>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu-map {

---
base-commit: 82a481aae4502d10ebaeeb387a3e0a5462c05b4d
change-id: 20260505-glymur_cpu_freq-1a16e12aa213

Best regards,
--  
Haritha S K <haritha.k@oss.qualcomm.com>



