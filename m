Return-Path: <linux-arm-msm+bounces-89311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2C3D2C756
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B56830319DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D25B34D934;
	Fri, 16 Jan 2026 06:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nynApEyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB04D346A0D;
	Fri, 16 Jan 2026 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544446; cv=none; b=dX4VDHajiVktFLPTyLG1zXyfZsu8dodbpD19ka4biNSUI94aZapeImygof6wtC/IlfyfEbW3OWN8YMhCypkH1GgrEukyOIuAmD0EPia6s/ky0Rv6v9dVxHxM4QgK1VHnMim51nQP3ZdKHm93bn4kaqmhrYTLcWpd6wQedhSW0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544446; c=relaxed/simple;
	bh=RcOvjpfrnhKE2x6xrrLTEgKABRushRuehUD1Cd0XPKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GX1iKeIVoTO2iRaGOtDhG48KJtH8kNqDTOwRuT3Obr7s02zz944oGfcyRQtDRr7zSDLWd1aT/5NFFSFPKfgojWRHAN1b8zmRtE1o52VRjtzrbSxhdpl9WX5Jn7eda2estfOCIfa+CBcSV5nPdJ0Gopvb6Gya9GyQUkj6TEsHOYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nynApEyk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6242C19421;
	Fri, 16 Jan 2026 06:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768544446;
	bh=RcOvjpfrnhKE2x6xrrLTEgKABRushRuehUD1Cd0XPKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nynApEykhUR0/YIDrDYnuMrGWQRGCU8fCpfGsvL4lvY0kFoYydbyED7KQBtexQlhl
	 DWqmRbmwrOqM2t+z+OuQZe6QKTAEh0hL6Um3pQm1UV+koUJwWeuw1sNc0rli1DZU2U
	 9n2ma+vrfFFBn07TGM05aK6U4tmZKBWfcpTTFAknwbB9q1QoEHQupGHtGvNkn9J/e4
	 5jzEaLnTZOidGof2bXrzU2I2Hki8SdPj1XnlzEO5AFb3wcjFEI2QCkT0tCC4+drBrk
	 aanSkouYYccr6V3LF58/AZ5OtVNsguU7nEMtQKru+1gnwtUowqOkJkHR3TOkL7eWfF
	 h1eZz9ZZ8iQ7A==
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
	loic.poulain@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Prakash Gupta <guptap@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Date: Fri, 16 Jan 2026 11:50:04 +0530
Message-ID: <20260116062004.237356-4-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260116062004.237356-1-sumit.garg@kernel.org>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 7815ece261ea..7c1a636e51f0 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1665,8 +1665,7 @@ gpu: gpu@5900000 {
 					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
 			interconnect-names = "gfx-mem";
 
-			iommus = <&adreno_smmu 0 1>,
-				 <&adreno_smmu 2 0>;
+			iommus = <&adreno_smmu 0 1>;
 			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&rpmpd QCM2290_VDDCX>;
 			qcom,gmu = <&gmu_wrapper>;
@@ -1947,8 +1946,7 @@ mdss: display-subsystem@5e00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			iommus = <&apps_smmu 0x420 0x2>,
-				 <&apps_smmu 0x421 0x0>;
+			iommus = <&apps_smmu 0x420 0x2>;
 			interconnects = <&mmrt_virt MASTER_MDP0 RPM_ALWAYS_TAG
 					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
 					<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
@@ -2391,10 +2389,7 @@ venus: video-codec@5a00000 {
 
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


