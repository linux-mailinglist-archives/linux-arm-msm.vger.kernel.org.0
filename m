Return-Path: <linux-arm-msm+bounces-86799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29700CE613B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 08:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C77C300DAA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BE82D2384;
	Mon, 29 Dec 2025 07:07:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08C6246781;
	Mon, 29 Dec 2025 07:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992055; cv=none; b=Jre+2hNFdqc6/pkKaW1BoUrbqAydcguuy0GCH9PeLATtHbtl36Vn9TI8NDRWCxNyfvTWlsyYahWJxpJRypgimHkMzfy0qomM/TOn6bBaFctaNNEBGqijoXRiQytrksH6GrWaETs3lIocMhgtWiJlktewCSC7/OvAv4wZFPW0vuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992055; c=relaxed/simple;
	bh=Ls+A+cHVWddVTwLzKrHoI3UfWGK/CnXoBFc4TcVgeoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fj0CE3Ccweu3A88kWe1gHKi4Yq5crTHoV3uT7R06ncQmVStooAeevID9rlQUe7PgFyMJumO4u/kcZXagHzxb+GLDvUTD9htgqaRLQ/Aq/D6TAy1Vd6IJU2PrcXbCt/uQXA+l8PySnH/OENxKAEtmgvidJAk1SrQFQPuzWbMhK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2000DC4CEF7;
	Mon, 29 Dec 2025 07:07:28 +0000 (UTC)
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Prakash Gupta <guptap@qti.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Date: Mon, 29 Dec 2025 12:37:11 +0530
Message-ID: <20251229070712.456138-1-sumit.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix IOMMU DT propeties for GPU, display and video peripherals via
dropping SMMU stream IDs which relates to secure context bank.

This problem only surfaced when the Gunyah based firmware stack is
ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
as a fault by Gunyah hypervisor which were previously ignored by QHEE
hypervisor.

The DT changes should be backwards compatible with legacy QHEE based
firmware stack too.

Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8bf5c5583fc2..e705eb24160a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1613,8 +1613,7 @@ gpu: gpu@5900000 {
 					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
 			interconnect-names = "gfx-mem";
 
-			iommus = <&adreno_smmu 0 1>,
-				 <&adreno_smmu 2 0>;
+			iommus = <&adreno_smmu 0 1>;
 			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&rpmpd QCM2290_VDDCX>;
 			qcom,gmu = <&gmu_wrapper>;
@@ -1895,8 +1894,7 @@ mdss: display-subsystem@5e00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			iommus = <&apps_smmu 0x420 0x2>,
-				 <&apps_smmu 0x421 0x0>;
+			iommus = <&apps_smmu 0x420 0x2>;
 			interconnects = <&mmrt_virt MASTER_MDP0 RPM_ALWAYS_TAG
 					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
 					<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
@@ -2339,10 +2337,7 @@ venus: video-codec@5a00000 {
 
 			memory-region = <&pil_video_mem>;
 			iommus = <&apps_smmu 0x860 0x0>,
-				 <&apps_smmu 0x880 0x0>,
-				 <&apps_smmu 0x861 0x04>,
-				 <&apps_smmu 0x863 0x0>,
-				 <&apps_smmu 0x804 0xe0>;
+				 <&apps_smmu 0x880 0x0>;
 
 			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
 					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
-- 
2.51.0


