Return-Path: <linux-arm-msm+bounces-90196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF8RNQkgcmmPdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:03:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF266FCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 88517725625
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F7347F2E3;
	Thu, 22 Jan 2026 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uX6L16LN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA9347F2CA;
	Thu, 22 Jan 2026 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083873; cv=none; b=YsBcJpFiUub0wpbCrQzgzx1pJme8Kkm2gwCz2NJZz1V4xxDih80WcXz9Qu/d5gYtn8zvxX25mOvmsc0reIUMCwXRs3wK9oC3G2uhS7ANc2guehtAeD2s94xYNhylb0D4Roie/mhNydON2xztFsq5YokvSWxgdSZxquoKybFcYyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083873; c=relaxed/simple;
	bh=RrAU4MCpxG40dMN3gl21TIoYABcckcN7SRx1uchoCMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yh36tv9UI8fNA8XqTPT4PG0FHAiCqFO1CHZ+WhmyzF9vKUT2KecST4/YWfpclK71MIq7acWuQD8panmoFaAO5WqvM+pS++dkQVceJOXo9b60q/x0DcJsNVyR3RdcH411U5jTvUFsNMf8bVWW1TGf/uHlyXTt44I+yVRTqGzA7uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uX6L16LN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A3FC4AF09;
	Thu, 22 Jan 2026 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769083872;
	bh=RrAU4MCpxG40dMN3gl21TIoYABcckcN7SRx1uchoCMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uX6L16LNUkUtLcoLstMeL++s5uiA+4G5esbf6tQb2ifWsinwNIXGRSzqAmq1p//xq
	 knhDyk8b+VSVxgPZDYiUpWBpxeux5pLiePvloHLlVL8Jhg5bTR3tfq54y0EPc2v7rk
	 h92je/cFZSYtH/oVXdb+9U2VTHEU/Qv1KFUiYQZQ6VjUcly5szKOyAoD/gBJ1F3XzK
	 rOEAMueLqiUGpYKj4wkfOe4UkdIIHqAC+Z6667oVPjdS7ZbmIvhxh/szBI8usDWEFH
	 kl1l/VaVSFftkBrB39C1D4gkeK1AUxtXBdGkhFyGA0BU0bB7Te+IH7vB8X1o6klf17
	 VkNUdFC46SS+A==
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Date: Thu, 22 Jan 2026 17:40:42 +0530
Message-ID: <20260122121042.579270-4-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122121042.579270-1-sumit.garg@kernel.org>
References: <20260122121042.579270-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90196-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.90.6.224:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,5e00000:email,5a00000:email]
X-Rspamd-Queue-Id: 8CDF266FCF
X-Rspamd-Action: no action

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


