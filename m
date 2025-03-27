Return-Path: <linux-arm-msm+bounces-52577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4872DA7286C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D921A3BFBFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C975156F45;
	Thu, 27 Mar 2025 01:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChTQFVGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167E415687D;
	Thu, 27 Mar 2025 01:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040093; cv=none; b=rTEzdiHbGhHBiTFTdU1I/B9X0isNMA+NsISPHl3xC1G08k1S/ywuBZL3DAZ8h+ghRmpl93fO9Wmmjn6Z/d+eLaQATaAGtDCCu4ytJ8iVpuaSbN9Rk+Q2IV45FqFpkGQSfgyqEO0CT+46ye4sWYeI3WU6Bzas1SICEkAYTLjmMZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040093; c=relaxed/simple;
	bh=wRH1P0SkisfCSoN8w6aZevyPLyT+Ov4RvePk5teZCm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUO/8MdcauVJj7pNkjbhoE9SlowjU3lbmpTZjp/5JWhMjrI9BT4qDbfO664VVHBADHy+RLbhzg/0dTQbk0CJ4yxLgFZtXmllZhlbMr+JtmegMHOOmN0xLOzELj8ymsuDOJsUwuPe1rBSkxrBD14gHY7SHtVnJgOw3pEE5DSd2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChTQFVGn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387EAC4CEE2;
	Thu, 27 Mar 2025 01:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040092;
	bh=wRH1P0SkisfCSoN8w6aZevyPLyT+Ov4RvePk5teZCm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ChTQFVGnUMg9E5X0Jr+dAlPSkukRWMtbgaQ2Vn0rhWxHKeS7itNMpVmzWnOqiHwOG
	 CC+kuE3KV7Fec1jrChBgb7tGhOKqA6QvEgL1g+gWTgCmVcpGEXy0bUSawr9H5f0tqW
	 wkSuOJwwpKmmbqwVJMCtJVfna/eQNZMFkeMz8Hisvnpd4jwECX5zwt0Rt/vZX8sESk
	 F0cPq23Ko27xmeWoIGqv7LrZQc8LO2l0jfpaNv7fT4xYiN9ujeSfWKcw2oiV6qtrGc
	 1XBhsTQ116anZzEaamJOiV8/OmPjehiopJ2ackOhS6VQGM5/TMf+b8z3Wm4cCUYSOS
	 c2rOsFMBefsTQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:13 +0100
Subject: [PATCH v2 11/12] arm64: dts: qcom: sa8775p: Clean up the PSCI PDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-11-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>, Sayali Lokhande <quic_sayalil@quicinc.com>, 
 Xin Liu <quic_liuxin@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=1626;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=N7rFyT8ZwoZgZYJLl0677wcSO/TKrKTC/pTp8NyXtlU=;
 b=J+H4vJembSZVP8l5I2ok+F7CINKkDk51ZouUKRWzcPAB84cTY0NOn0fqVFPW5W54lh1bHO4RD
 sUkqgHIm6imBXhHMpM53peZm7s5Xo8uq00sCtnWOE1zHp2hw5+K1PPz
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Because SA8775P comes with two disjoint CPU clusters, we have to follow
a similar topology description like the one in sm8750.dtsi, so:

system_pd
	cluster0_pd
		cpu_pd0
		...
	cluster1_pd
		cpu_pd4
		...

Do that & wire it up to APPS RSC to make the bindings checker happy.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a904960359d731d2f0b6659a8ae99bff0e1bafb4..707c9dc3e748d9f24b38244bb468ec6db9c20efd 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -471,17 +471,17 @@ cpu_pd7: power-domain-cpu7 {
 
 		cluster_0_pd: power-domain-cluster0 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_2_pd>;
 			domain-idle-states = <&cluster_sleep_gold>;
+			power-domains = <&system_pd>;
 		};
 
 		cluster_1_pd: power-domain-cluster1 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_2_pd>;
 			domain-idle-states = <&cluster_sleep_gold>;
+			power-domains = <&system_pd>;
 		};
 
-		cluster_2_pd: power-domain-cluster2 {
+		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
 		};
@@ -4734,6 +4734,7 @@ apps_rsc: rsc@18200000 {
 					  <WAKE_TCS 3>,
 					  <CONTROL_TCS 0>;
 			label = "apps_rsc";
+			power-domains = <&system_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.49.0


