Return-Path: <linux-arm-msm+bounces-77309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE5BDCCDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 08:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673DE1928220
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC05313278;
	Wed, 15 Oct 2025 06:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GemylBBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF7312814;
	Wed, 15 Oct 2025 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760511435; cv=none; b=Kr7MYIa3k0j40ChGNV/8XM/Kj/Ibug4l72y2IdGeqGIqnJtVIGImpTTAV3Fw/q10H+/IYMBuqO374Bqm6LO1XtXtNaXYuegK1UwLmz9Ci+BFYlbim72sAl7+FIrpWS+DO1v5fenfXJj2CRBi4ug8ZYbkcqOrSC7I7IVrSdfYRjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760511435; c=relaxed/simple;
	bh=1LOKxl66TxjKHpx9GC3Vf6qY6KPEG1rHbykwMtUFets=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5+tbwYg6QpAAfsTPSVDG1ig5lQ5irIrj1PIQQ9FGnG0FR/dvvKTAqbYSErTcUnquokgzV7On1/1GUrqxs/qji01+u7xq6qjzs/gLLae3knfD1MtS402PNF9/izSjV7+k7mIH69xmU9SJFDxOUlc/SCM6dt1oQm/Ku5HL50HAx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GemylBBl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D3EC4CEF8;
	Wed, 15 Oct 2025 06:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760511434;
	bh=1LOKxl66TxjKHpx9GC3Vf6qY6KPEG1rHbykwMtUFets=;
	h=From:To:Cc:Subject:Date:From;
	b=GemylBBlcKmMaXiSZ/t3Gs0hS3noIbjoTpuUKe0i25NFfLZTTvrmG2eTVzOfR7Km6
	 ojt3Jh0JeXMwZrx6znV067LzPEPzOc8Q01GIhyUPBB4pSlt9DuHleIz/nYeRwcy34B
	 YxzOpQ7i/3cdtVj91PnxNchj1EceFu6MlmxZU8Zw21YpRBI09/C2aYZp0z51o4CbMh
	 h4FMcCPZAlOX2/tv2sXpLrsqV+sDCk/JAjOqyI6I1qQre71oULy6IywFQJiGAzvJ2Q
	 xrl51iShu+yzR7EyzF7V24WcPN0dt8uQCAIW0ThRRBTnk33K5pgo8/VHnkSsi18len
	 YuD0RQcrgwEDA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU nodes
Date: Wed, 15 Oct 2025 12:27:03 +0530
Message-ID: <20251015065703.9422-1-mani@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Enable passive cooling for CPUs in the X1E80100 SoC by adding the
'#cooling-cells' property. This will allow the OS to mitigate the CPU
power dissipation with the help of SCMI DVFS.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..001cf9cbb0c5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -76,6 +76,7 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -93,6 +94,7 @@ cpu1: cpu@100 {
 			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -104,6 +106,7 @@ cpu2: cpu@200 {
 			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -115,6 +118,7 @@ cpu3: cpu@300 {
 			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@10000 {
@@ -126,6 +130,7 @@ cpu4: cpu@10000 {
 			power-domains = <&cpu_pd4>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -143,6 +148,7 @@ cpu5: cpu@10100 {
 			power-domains = <&cpu_pd5>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@10200 {
@@ -154,6 +160,7 @@ cpu6: cpu@10200 {
 			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@10300 {
@@ -165,6 +172,7 @@ cpu7: cpu@10300 {
 			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 		};
 
 		cpu8: cpu@20000 {
@@ -176,6 +184,7 @@ cpu8: cpu@20000 {
 			power-domains = <&cpu_pd8>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 
 			l2_2: l2-cache {
 				compatible = "cache";
@@ -193,6 +202,7 @@ cpu9: cpu@20100 {
 			power-domains = <&cpu_pd9>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 		};
 
 		cpu10: cpu@20200 {
@@ -204,6 +214,7 @@ cpu10: cpu@20200 {
 			power-domains = <&cpu_pd10>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 		};
 
 		cpu11: cpu@20300 {
@@ -215,6 +226,7 @@ cpu11: cpu@20300 {
 			power-domains = <&cpu_pd11>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&cluster_c4>;
+			#cooling-cells = <2>;
 		};
 
 		cpu-map {
-- 
2.48.1


