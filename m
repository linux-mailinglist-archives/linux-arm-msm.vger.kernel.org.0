Return-Path: <linux-arm-msm+bounces-101631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM+CFAirz2kPzAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 13:56:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB09393D7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 13:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1F483019447
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 11:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EE93BE631;
	Fri,  3 Apr 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7L84h2R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A3C3BE17C;
	Fri,  3 Apr 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217401; cv=none; b=X6tD1AcEwLZDyaj7HVgDjFpmRmewxVjpGBxi8q1GpDGPqExNOAz0xf8owMQMOyhQYijyxWZDXMhCF5qCFmx46cHxJBv7vFTNXwPp60nx9d601XGYr3T1R4GuQSoAENuYu5/PPRJJY5cbERW0YJZ4k4v62iz7nQbY7Jktkq5Sssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217401; c=relaxed/simple;
	bh=yjV8Mii3SO2PRcSDuRgx3Cx4lmWQcY3Ip2b+9zRl/a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QKxI57xUgcFbtTki5KTi79P/foAKm8WPwgPNjU/kp4ZC33RHu2WzBbNDjX8m34MlKwxbObkEH9B/apZK4brTwPFsV6KXWqIA5Cq5gqMscCADmiweXLXuUQ43UlvHEDTyMdPXzBtItMflnMy8oJ+mro7/m2CoWJQAhIeAQInSuAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7L84h2R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F11B7C4CEF7;
	Fri,  3 Apr 2026 11:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775217401;
	bh=yjV8Mii3SO2PRcSDuRgx3Cx4lmWQcY3Ip2b+9zRl/a8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=l7L84h2RSOEXTLa6bgrmPCQTggzf+yd+Kacnd/5ohORJYrkMPWh0MoTkTpeRnFBPk
	 fmMM8tBNODjKRSdJ6Cghd9/roa4uG5Z1PVX1BIVN0TudsgQvejKbUw+oATol65tSA6
	 BeRyNhRdcebb4PhyGySE2CqiHT6Koa7DU4UUk9YELUicp3s2P+iQQhkOXPzTEhjMAC
	 SJER6OAE2Fx9oJefKB/ppFyv+IU003XqFgA7SKSv0I7nWNgxVCWFhkyaA7eFyJdpKC
	 4Xmx5X+rZ0slVX+MnYJH9ugmsB2bLYSHVRCY3r5YrmU77tVgjZZh4ew7y/auQ++sp9
	 oGTLdEBNPiZBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72C6E7E375;
	Fri,  3 Apr 2026 11:56:40 +0000 (UTC)
From: Aastha Pandey via B4 Relay <devnull+aastha.pandey.oss.qualcomm.com@kernel.org>
Date: Fri, 03 Apr 2026 17:26:33 +0530
Subject: [PATCH] arm64: dts: qcom: sm8750: Enable cpufreq cooling devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-cpufreq-v1-1-9d465988c3f9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPCqz2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNj3eSC0rSi1ELdRBPztFRDSwszEzNLJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAPwz9alrAAAA
X-Change-ID: 20260403-cpufreq-a47fe1986469
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217399; l=2411;
 i=aastha.pandey@oss.qualcomm.com; s=20260403; h=from:subject:message-id;
 bh=pWCKzSBAkycqtXHkJIG6H/zPrgLnVC5AlewOSyTpRrk=;
 b=3AVtCFAUZN2NXOPlr9WgYjlX8Q/S0igw0nhafXY/HBVgDz+FCZVIU0Sfc/Blgdzs+MsPF39hs
 JXvrOgR6gPPBak2T1z9w3Wf6kNuo3EAvJqNjJzvxV8NeQMw7j6HMkpP
X-Developer-Key: i=aastha.pandey@oss.qualcomm.com; a=ed25519;
 pk=d6/MXR/csKllB5RHkSN8v/2MfXzvzd7m1vH2PJXwpB0=
X-Endpoint-Received: by B4 Relay for
 aastha.pandey@oss.qualcomm.com/20260403 with auth_id=718
X-Original-From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Reply-To: aastha.pandey@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-101631-lists,linux-arm-msm=lfdr.de,aastha.pandey.oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[aastha.pandey@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.39.116:email,0.0.1.44:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.1.144:email,0.0.39.16:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,0.0.0.200:email]
X-Rspamd-Queue-Id: DCB09393D7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Add cooling-cells property to the CPU nodes to support cpufreq
cooling devices.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..417f28d8c919 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -42,6 +42,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -58,6 +59,7 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -68,6 +70,7 @@ cpu2: cpu@200 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -78,6 +81,7 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@400 {
@@ -88,6 +92,7 @@ cpu4: cpu@400 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd4>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@500 {
@@ -98,6 +103,7 @@ cpu5: cpu@500 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd5>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@10000 {
@@ -108,6 +114,7 @@ cpu6: cpu@10000 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -124,6 +131,7 @@ cpu7: cpu@10100 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu-map {

---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260403-cpufreq-a47fe1986469

Best regards,
--  
Aastha Pandey <aastha.pandey@oss.qualcomm.com>



