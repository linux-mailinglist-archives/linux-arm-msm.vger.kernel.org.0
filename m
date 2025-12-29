Return-Path: <linux-arm-msm+bounces-86802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EEBCE616E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 08:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8630F3002FD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166C72E1C6B;
	Mon, 29 Dec 2025 07:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOvph/IR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2352E228C;
	Mon, 29 Dec 2025 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992401; cv=none; b=oWKniqTKflAq4rreLp7LOsBCgCwFDB88iPIHGHc/vtIanTq9Xt8OLtMQx4Ujf/FyxbiVFB0XW8n+jE9D4kMJs1i5IdBkwi1/MJts6InSP1niB0MWmZ8JTXNp3f6lwdnIpQGKq32HnGyWND2dC20q3X9DzWJbfuUvxqUlHFiVCnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992401; c=relaxed/simple;
	bh=CB+l4wZA4BaOmC9XFQ84yG2DQPQaxXEVtg1dJhfADSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2ognHpMVZ5kBvofTbrcdpE2hZvP3rx2TLxnmOTkiBIUHpBWSNru4Pa9cIy5f7fT2ETXjNCwrQPaJO2F5BfiFjYAXj4UUztuv7+TJi3nQyPbCcj/eWBw8Hdm6uUP8VJ/7eyteJWdqw4yUmKaEr6Tr9/o376Ow4QZzL+P9ZWvxP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOvph/IR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047D9C4CEF7;
	Mon, 29 Dec 2025 07:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766992400;
	bh=CB+l4wZA4BaOmC9XFQ84yG2DQPQaxXEVtg1dJhfADSY=;
	h=From:To:Cc:Subject:Date:From;
	b=qOvph/IRDro3Sw4NUjAcd+R3a5wYZW/xHyiiSm08tnIwt0/gDn3f8bCDee4ggXAOi
	 Flx91RIF5KOqzfL16s2wWAnURarnoqw8j5IWkMrmvjgaiVR0BNL3RYD/4g018tqu7L
	 I1+I/l14Bs/D/oXuqxZ/O0YH9V76D13QKrhzuvZDWfcCPm9VQDlhY8Wf0Fan5a0p7E
	 uSXgECf31v5YdJOIK1xkCoronZmYSPHEIsXKunSXx8bzoKHujbgrB1+LO7yWw0sXY5
	 5ZwVYVQQjTZ348ida7UNlYv3dNh9urOfrSb2sYxy7D7T6yGTyUkJITpKSY/RnWXyZl
	 R8NUlYMuew9Vg==
From: Sumit Garg <sumit.garg@kernel.org>
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
Date: Mon, 29 Dec 2025 12:42:57 +0530
Message-ID: <20251229071258.456254-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

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


