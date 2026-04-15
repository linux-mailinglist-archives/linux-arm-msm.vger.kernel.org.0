Return-Path: <linux-arm-msm+bounces-103276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLO9LQ1v32nqSwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:57:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62740376B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0E203037439
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6427C34AB17;
	Wed, 15 Apr 2026 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0TfrNVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE703491D0;
	Wed, 15 Apr 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250635; cv=none; b=hntI+uqKFKbNcznS7bdg2Rxtar4fWpfsvMCYdi4byh+3QcZEZscJybsrbovJQ6Pf4tyglMtV0xhtmdpQMdneaM4pXFfbuotnUmrHbT9riPcIwHa72SHc9j/mZJ/tPrD2M16jZM6Mgu40IAHprcm/Yoi7GAyQkYI8EpvMM9YngGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250635; c=relaxed/simple;
	bh=9gZgTNxWUGcHFzmD8/FcFdr30Ms2ywUzbEoRqtw95Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RIi3S3Mh6qS6blwWNtQ5ddC7Tx5R/aOfyBDLzeblrzjW6ag1aQyde2mt1OhR4u0h7Gqx5i+6sD/uYFW5Pn0pxNvVQaBzX9zzjb2iDAH5+1+I7uqKBlLzF2GsR0l2ZxbHsNxTueswp883Bnm29fHos7mQa2a1Q/xW2ey8D5vQevM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0TfrNVf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1E52C19424;
	Wed, 15 Apr 2026 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776250634;
	bh=9gZgTNxWUGcHFzmD8/FcFdr30Ms2ywUzbEoRqtw95Eg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=D0TfrNVfGMr5fLVsgQkArp1FQAl/zYX7Zjuis3/Xv6Le01prQFZS6Z2mntFdRp+di
	 GuszB9gVYM/wA/KXRvJG9schenhuPIbSRGLPi/jIZgSkWa9hNIGwL/sgnkERG/L2Dx
	 koupCQYHAbaExhH/wjzjDLxpqhOS8jVfOopBClGJ+TWgAeE0FIr5NMkPRr+Ebm4mnD
	 pIsac2JxnIYwKRe4D9zqu3SQGIiGPP+JhcPoLHnw4CmrPC4nH2Q8kbo1RPo+Kx2fdq
	 UeQ9uIRIQRSy/8HfNbrPqfIAr2vc1Eivjx79J6lNyAmileE2lc5z2jlUfZho9yKOvq
	 KnrIGqtUsIOgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B69F4198B;
	Wed, 15 Apr 2026 10:57:14 +0000 (UTC)
From: Dipa Mantre via B4 Relay <devnull+dipa.mantre.oss.qualcomm.com@kernel.org>
Date: Wed, 15 Apr 2026 16:27:08 +0530
Subject: [PATCH] arm64: dts: qcom: kaanapali: Enable cpufreq cooling
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAANv32kC/x3MQQqAIBBA0avErBNSzKKrRMRgYw2FmVIE0d2Tl
 m/x/wOJIlOCrngg0sWJd58hywLsgn4mwVM2qEqZSkstbDhdpGNcET0G3Fg41RqDsq1NYyF3IZL
 j+3/2w/t+TOglfGMAAAA=
X-Change-ID: 20260414-cpufreq_kaanapali-f2866a18567c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dipa Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776250633; l=2252;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=qRlPI1bp3rfMHl7Ftdun6TIjf61wRmlS2KEJHHF/2v8=;
 b=qNqvbAR4egJ6GWZqWKqT9ABaOPEAGXRaIL9qKVvArzFmcnKe8OoaDzesdTly5yTJiT9UAbOR+
 I8EtSgUX73UDv5rHckmAuAfOog4XJIeo9LARNMb9XzlbnbC24c4TFYz
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-Endpoint-Received: by B4 Relay for dipa.mantre@oss.qualcomm.com/20260415
 with auth_id=736
X-Original-From: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
Reply-To: dipa.mantre@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-103276-lists,linux-arm-msm=lfdr.de,dipa.mantre.oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[dipa.mantre@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.39.116:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.200:email,0.0.1.44:email,qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.100:email,0.0.1.144:email,0.0.0.0:email,0.0.1.244:email,0.0.39.16:email]
X-Rspamd-Queue-Id: 5C62740376B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dipa Mantre <dipa.mantre@oss.qualcomm.com>

Add cooling-cells property to the CPU nodes to support cpufreq
cooling devices.

Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..81c493668b51 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -48,6 +48,7 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			clocks = <&pdp_scmi_perf 0>;
+			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -65,6 +66,7 @@ cpu1: cpu@100 {
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			clocks = <&pdp_scmi_perf 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -76,6 +78,7 @@ cpu2: cpu@200 {
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			clocks = <&pdp_scmi_perf 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -87,6 +90,7 @@ cpu3: cpu@300 {
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			clocks = <&pdp_scmi_perf 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@400 {
@@ -98,6 +102,7 @@ cpu4: cpu@400 {
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			clocks = <&pdp_scmi_perf 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@500 {
@@ -109,6 +114,7 @@ cpu5: cpu@500 {
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			clocks = <&pdp_scmi_perf 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@10000 {
@@ -120,6 +126,7 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			clocks = <&pdp_scmi_perf 1>;
+			#cooling-cells = <2>;
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -137,6 +144,7 @@ cpu7: cpu@10100 {
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			clocks = <&pdp_scmi_perf 1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu-map {

---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260414-cpufreq_kaanapali-f2866a18567c

Best regards,
-- 
Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>



