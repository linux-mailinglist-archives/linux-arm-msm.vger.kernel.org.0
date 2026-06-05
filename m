Return-Path: <linux-arm-msm+bounces-111459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ebQ3K4FPI2pYowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 00:36:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC6F64BAC6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 00:36:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Z8yafOxF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111459-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111459-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EEE1301F49E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 22:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8296C3D3CF2;
	Fri,  5 Jun 2026 22:36:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C7D3D25DC;
	Fri,  5 Jun 2026 22:36:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780699007; cv=none; b=M9ftBxjRCxWWYiPklCcjDSeAUZ1b46aM5jJD/R0t40eAJpmjSmr57MjbXEc3aIQowTrZTyN+TByJbCWbLrYQRgOmrhtOjdOeJL1MDtnesYYa3M5lJdcgskqrUA5XgCgFjkiP+BRsvoRANlhl+yKa7y0wS36gpXChDyLsb1xvSgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780699007; c=relaxed/simple;
	bh=yIn+5oAXtQvKQ6RfyT5VGlK8I9c90ZfgJGaV60fo3Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X2swWk7e+w+L3bjAQkC4e7JwQKvr4nYQjRQ8yM0ce3iGotdpb1B9YI8ihYuQ+GYCoa7y1xyqvm+HccquMp7mMUjEuTPSnYhJUnMCUNN4qDn15XTozb47QG2hC+M/oJsVIJyVJJIgSwtM/18RrIT8TNi4tj96XGVB5RnNJW8dhbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8yafOxF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D09FC2BCB9;
	Fri,  5 Jun 2026 22:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780699007;
	bh=yIn+5oAXtQvKQ6RfyT5VGlK8I9c90ZfgJGaV60fo3Gk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Z8yafOxFKdlUA9hSPM13fHtpMWcuvuRqhPWwl/cjtThWYOKbH9xIVO0GglPYl4Rvl
	 gVZtJQ2beNNm0VMgV/2wwGq5AtEaq5XK2aWQPTlEJt++4MP5bdGEBLfbRBZrw04GUd
	 8s6eIMxgbJXHMWfsLr1nCn8ShDWj78sRbLnbFB/RfaS1LXsUDNP9jixth6qyIo8FWx
	 AmktoThxFgSieMorHjatJKgZ+dHGUz2vhmvHqRBJ+RafT25sO82r4G7iqjR/j1SnME
	 T25o0/9vN1GEKZ0QHL2BeTsU/vU+5irs27gFJgcPq99gsr1rRVViebVdSoFir925ex
	 RridNk/Jgtbig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88B3CD6E7B;
	Fri,  5 Jun 2026 22:36:46 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 05 Jun 2026 17:36:37 -0500
Subject: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNT3eJcC3NTA92UlCLdpHLd4uTEnMy8dF3LZGOjJAtjM4PEJAsloN6
 CotS0zAqwudGxtbUAu47vY2cAAAA=
X-Change-ID: 20260605-sm8750-ddr-bw-scaling-9c32b8360ab8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780699006; l=9235;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=kbb/4boOUdkbOmNk6sJ8HJw1jKtiEVCgZD941A51xxk=;
 b=Fo8YhRp3cJyhsK/swh443JmVamp3uQSrN2QczJXtXVicwUpeFWbeMejJg109ZAdKdruZDRczb
 OLNmKMG5QKJAVLkDtBclmAPXK7Mar0EAjYWXTUhYZ5RwVLjgQFkO7Yt
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111459-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:webgeek1234@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BC6F64BAC6

From: Aaron Kling <webgeek1234@gmail.com>

Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) to
permit scaling the Last Level Cache Controller (LLCC) and DDR frequency
by aggregating bandwidth requests of all CPU core with reference to the
current OPP they are configured in by the hardware.

The effect is proper caches & DDR frequency scaling when CPU cores
change frequency.

The OPP tables were built using the downstream memlat ddr & llcc tables
for each cluster types with the actual cpufreq LUT tables from running a
CQ8725S device.

Also add the interconnect entry for each cpu, with 2 different paths:
- CPU to Last Level Cache Controller (LLCC)
- Last Level Cache Controller (LLCC) to DDR

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwidths
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 200 +++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66fc2..6f44c393649918 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -44,6 +44,11 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
@@ -61,6 +66,11 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			#cooling-cells = <2>;
 		};
 
@@ -72,6 +82,11 @@ cpu2: cpu@200 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			#cooling-cells = <2>;
 		};
 
@@ -83,6 +98,11 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			#cooling-cells = <2>;
 		};
 
@@ -94,6 +114,11 @@ cpu4: cpu@400 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd4>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			#cooling-cells = <2>;
 		};
 
@@ -105,6 +130,11 @@ cpu5: cpu@500 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd5>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			#cooling-cells = <2>;
 		};
 
@@ -116,6 +146,11 @@ cpu6: cpu@10000 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
+			operating-points-v2 = <&cpu6_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			#cooling-cells = <2>;
 
 			l2_1: l2-cache {
@@ -133,6 +168,11 @@ cpu7: cpu@10100 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
+			operating-points-v2 = <&cpu6_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			#cooling-cells = <2>;
 		};
 
@@ -256,6 +296,166 @@ memory@a0000000 {
 		reg = <0x0 0xa0000000 0x0 0x0>;
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-384000000 {
+			opp-hz = /bits/ 64 <384000000>;
+			opp-peak-kBps = <(547000 * 16) (350000 * 4)>;
+		};
+
+		opp-556800000 {
+			opp-hz = /bits/ 64 <556800000>;
+			opp-peak-kBps = <(547000 * 16) (350000 * 4)>;
+		};
+
+		opp-748800000 {
+			opp-hz = /bits/ 64 <748800000>;
+			opp-peak-kBps = <(547000 * 16) (350000 * 4)>;
+		};
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-peak-kBps = <(1353000 * 16) (350000 * 4)>;
+		};
+
+		opp-1152000000 {
+			opp-hz = /bits/ 64 <1152000000>;
+			opp-peak-kBps = <(1353000 * 16) (350000 * 4)>;
+		};
+
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <(1555000 * 16) (350000 * 4)>;
+		};
+
+		opp-1555200000 {
+			opp-hz = /bits/ 64 <1555200000>;
+			opp-peak-kBps = <(1555000 * 16) (350000 * 4)>;
+		};
+
+		opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+			opp-peak-kBps = <(2092000 * 16) (533000 * 4)>;
+		};
+
+		opp-1996800000 {
+			opp-hz = /bits/ 64 <1996800000>;
+			opp-peak-kBps = <(2092000 * 16) (533000 * 4)>;
+		};
+
+		opp-2227200000 {
+			opp-hz = /bits/ 64 <2227200000>;
+			opp-peak-kBps = <(2092000 * 16) (533000 * 4)>;
+		};
+
+		opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-peak-kBps = <(2092000 * 16) (533000 * 4)>;
+		};
+
+		opp-2745600000 {
+			opp-hz = /bits/ 64 <2745600000>;
+			opp-peak-kBps = <(3187000 * 16) (806000 * 4)>;
+		};
+
+		opp-2918400000 {
+			opp-hz = /bits/ 64 <2918400000>;
+			opp-peak-kBps = <(3187000 * 16) (806000 * 4)>;
+		};
+
+		opp-3072000000 {
+			opp-hz = /bits/ 64 <3072000000>;
+			opp-peak-kBps = <(3686000 * 16) (933000 * 4)>;
+		};
+
+		opp-3321600000 {
+			opp-hz = /bits/ 64 <3321600000>;
+			opp-peak-kBps = <(3686000 * 16) (933000 * 4)>;
+		};
+
+		opp-3532800000 {
+			opp-hz = /bits/ 64 <3532800000>;
+			opp-peak-kBps = <(3686000 * 16) (933000 * 4)>;
+		};
+	};
+
+	cpu6_opp_table: opp-table-cpu6 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <(1353000 * 16) (350000 * 4)>;
+		};
+
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-peak-kBps = <(1353000 * 16) (350000 * 4)>;
+		};
+
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			opp-peak-kBps = <(1353000 * 16) (350000 * 4)>;
+		};
+
+		opp-1689600000 {
+			opp-hz = /bits/ 64 <1689600000>;
+			opp-peak-kBps = <(2092000 * 16) (533000 * 4)>;
+		};
+
+		opp-1958400000 {
+			opp-hz = /bits/ 64 <1958400000>;
+			opp-peak-kBps = <(2092000 * 16) (533000 * 4)>;
+		};
+
+		opp-2246400000 {
+			opp-hz = /bits/ 64 <2246400000>;
+			opp-peak-kBps = <(3187000 * 16) (806000 * 4)>;
+		};
+
+		opp-2438400000 {
+			opp-hz = /bits/ 64 <2438400000>;
+			opp-peak-kBps = <(3187000 * 16) (806000 * 4)>;
+		};
+
+		opp-2649600000 {
+			opp-hz = /bits/ 64 <2649600000>;
+			opp-peak-kBps = <(3187000 * 16) (806000 * 4)>;
+		};
+
+		opp-2841600000 {
+			opp-hz = /bits/ 64 <2841600000>;
+			opp-peak-kBps = <(3686000 * 16) (933000 * 4)>;
+		};
+
+		opp-3072000000 {
+			opp-hz = /bits/ 64 <3072000000>;
+			opp-peak-kBps = <(3686000 * 16) (933000 * 4)>;
+		};
+
+		opp-3283200000 {
+			opp-hz = /bits/ 64 <3283200000>;
+			opp-peak-kBps = <(3686000 * 16) (933000 * 4)>;
+		};
+
+		opp-3513600000 {
+			opp-hz = /bits/ 64 <3513600000>;
+			opp-peak-kBps = <(4224000 * 16) (1066000 * 4)>;
+		};
+
+		opp-3801600000 {
+			opp-hz = /bits/ 64 <3801600000>;
+			opp-peak-kBps = <(4224000 * 16) (1066000 * 4)>;
+		};
+
+		opp-4089600000 {
+			opp-hz = /bits/ 64 <4089600000>;
+			opp-peak-kBps = <(4224000 * 16) (1066000 * 4)>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;

---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260605-sm8750-ddr-bw-scaling-9c32b8360ab8

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



