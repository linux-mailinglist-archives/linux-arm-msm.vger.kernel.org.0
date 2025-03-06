Return-Path: <linux-arm-msm+bounces-50559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3F8A55480
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 017287ABDBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C652702BD;
	Thu,  6 Mar 2025 18:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2kdLc9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748E02698BD;
	Thu,  6 Mar 2025 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284797; cv=none; b=L6w4V43mdAIWeZCrhwbqN7uCfhvwEUF8KM8lZ3oCa53UZSRYxm63y0999o3fuSTSWHIELqZqs5Mam2DI7AkWZSAMu34jgqo9rvAcwG6cwXzmr0Gw+WzeAdHBcwFCtn07WvCGMgvpkn5kobbaWPOnQEAmI2/n21y30jWcNnc6mjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284797; c=relaxed/simple;
	bh=V9H185IolkXGrMv0yDeTgeTZjT8H3BkkpxepgLhl15Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3ESYOEEC6lUlwue/LS9Xyrosmr4y1A8UrD8AfEIcjGvNRTEu2HuXeat4SAnYXvALzy3EBpIn+0RmqkZCwClPyetitjqn9UQbUya1xX7DsmxJ9SrLvYYBF07I93Y99nzL90hKEUcK6Uh2mJhLk6UZFjWynA+AeWK6LfEIwaqAd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2kdLc9v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9BFC4CEE8;
	Thu,  6 Mar 2025 18:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741284794;
	bh=V9H185IolkXGrMv0yDeTgeTZjT8H3BkkpxepgLhl15Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o2kdLc9vQQ1cGNg8H+JtdjvAp/s0j+FUkrAgV683yNJcPw8JoeIo04pLGV5VuW8V8
	 f9Zpqgp9buF7RtJxrodYBaB/mjfW3QN+BGds414e3o5jq7q43lMrivcubXB0tcQgt/
	 k8+N8h9scBvDvcsoqWdBwV/KwaFEsfzY0MpQQq2KBMoSB9vU1AkLFf34AVHyoLfEW3
	 UNDmlnl6GRx7ot6A4L4JgA8K+EjYOTqfpUnvsvxmeDOXh2xcDAFPU1gWyDk+zi52cn
	 yzBzYATI9EGyzKJHoEVKLbPmjdMrMhsMGXI1ZDe3nUMqz/6KVfNd7/EedEBFEqk158
	 eiiKLxWp3OSrA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:23 +0100
Subject: [PATCH 11/11] arm64: dts: qcom: x1e001de-devkit: Drop clock-names
 from PS8830
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-11-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1160;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ohEmbayu2LsT1id4h533hC8kGW2KXwVmCy3qoWajQvY=;
 b=4aIxanukVplVRHvn1zCChM9eaau0QidU2RP7g1GtwCrds6llxAy+yOc/LeaWvnOE5W0DyRBTV
 23BM8GcQOkMCnULh4Bf7jZ/gqTLzXDVluSPkf/Qkejwp0XSRIusE74j
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The preemptively-merged node contains a property absent from the final
bindings. Remove it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 602bd793e09cc9e7d8447af593e934010fc0c789..f87730f4b63fffc88d07eedef33cdab9bca759f5 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -777,7 +777,6 @@ typec-mux@8 {
 		reg = <0x08>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK5>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr2_1p15>;
 		vdd33-supply = <&vreg_rtmr2_3p3>;
@@ -832,7 +831,6 @@ typec-mux@8 {
 		reg = <0x08>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK3>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr0_1p15>;
 		vdd33-supply = <&vreg_rtmr0_3p3>;
@@ -887,7 +885,6 @@ typec-mux@8 {
 		reg = <0x8>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK4>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr1_1p15>;
 		vdd33-supply = <&vreg_rtmr1_3p3>;

-- 
2.48.1


