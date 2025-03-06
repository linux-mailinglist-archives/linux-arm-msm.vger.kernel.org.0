Return-Path: <linux-arm-msm+bounces-50553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ECFA554A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C773BBB65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3145826B978;
	Thu,  6 Mar 2025 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1CpKZLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83425D902;
	Thu,  6 Mar 2025 18:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284737; cv=none; b=mMduSeXxe1x/rohjmlGNPopldPO4UoxqZiBta0hnK+yzTiQz2Qj7ZcKbpV00ZSEA61AEWykhaiU9J7Cv/R25JDda4Im43VhtpzyPl+An9s8Ei5rjREcM0OkZxfudNbISTLBLRjr0PbcpWC0Kty5ntqEv56clGrBXL5gNpMbTVaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284737; c=relaxed/simple;
	bh=askH3R6sG+btM9xBpzTtVzTNW9Ie7Dc8X3GibawDEK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaUmtwr5W9lWp7LuzZULhbeK3LkKkZGnsNAG3zO9RZE3OJpz7YRhOXNAO8Q+5+oS7h3hZLwLRL4+NFU4f6rw/urH1En7dJ7rmB28bkgln7Zn1bmH/zqSnRGucsR9uyrVrFn6F7mvpfi8EoLg5lzhR5E4vSe7VP5ZDXKJpD4Fypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1CpKZLp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A84C4CEE0;
	Thu,  6 Mar 2025 18:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741284736;
	bh=askH3R6sG+btM9xBpzTtVzTNW9Ie7Dc8X3GibawDEK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V1CpKZLpE4FBZwBY+tvJ1CneJ92Q34Fb3T3hhREYTSVcJDvpw2D5Wo8/sCHbg0JPE
	 ZTFdvyPoxhNohxduSSrjip/izwhQBSPtI35HruIS6IOd91KEeVizF47o+zXMBp8P7k
	 Ot0qYMGvc/dwdfAlX9mZSZJiI0vqxT7tTEpxSg/cPdZ/hk6UoOfXU1QdV1Fp0N9qzr
	 eZwnOpdvKQMd9qBlu5YO+TUnQH9c+Ff2zrxC5uh6SWI/xo5Vjs1SSgm4fwiJufYBEd
	 ssr+2Iv0fGB8oXWA35xeWLiiigd2p6NACuIzAPKRTrV2ZlmeBqyUaw7VTT8V2ihYM4
	 RFaIsF3kFa7bw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:17 +0100
Subject: [PATCH 05/11] arm64: dts: qcom: sdx75: Fix up the USB interrupt
 description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-5-0c84aceb0ef9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1543;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=e+qbnc3LyUlQz9wgVj1yFHcotV4iEwr4WI+oHfwIjHQ=;
 b=IdembhZwx0PUrERAy2tXMG4dFVARwNQxDWKRfrRVWphYUz8RItpicLd9pZarKxaEI4X9xViEK
 3ZsRDVh2jAqC9rjuOrmv79vFRA1btjMFgva3GisZ5tcfjOWCf3G81o5
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
reworked the dt-bindings to accurately represent the hardware.

Execute the second half of the cleanup by wiring up the missing
pwr_event IRQ and adjusting the entry order.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index b0a8a0fe5f39ffcd0da1f9fd9f4f5564412f76ec..8da2383861e4321d91be0e23a2f1ade9914e8416 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1008,14 +1008,16 @@ usb: usb@a6f8800 {
 					  <&gcc GCC_USB30_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 9 IRQ_TYPE_EDGE_RISING>,
-					      <&pdc 10 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "hs_phy_irq",
-					  "ss_phy_irq",
+					      <&pdc 10 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
 					  "dm_hs_phy_irq",
-					  "dp_hs_phy_irq";
+					  "dp_hs_phy_irq",
+					  "ss_phy_irq";
 
 			power-domains = <&gcc GCC_USB30_GDSC>;
 

-- 
2.48.1


