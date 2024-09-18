Return-Path: <linux-arm-msm+bounces-31980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E08797C20B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B77581F2190F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DC91CC88E;
	Wed, 18 Sep 2024 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqN5Dk4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D141CC88C;
	Wed, 18 Sep 2024 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700288; cv=none; b=O9cGNTdG1EclPsqyegIXbgEPiD1EEw9S0yKVDyTGAT2Uf1itf2S2Y8oaEBAgA9dvLqluTSRTVVnm678KTDi5wzSzGHHVzSnZSG7jf3lD/WLz5Y+96YGkxHc7N2j2cf9l7+Bb/iRw7op0eN1+41b9aAOIj+73d1JrEpjoHI15xf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700288; c=relaxed/simple;
	bh=aGbFusPDI63Fm+CFi0ZmI+xAVQzIkHsdozHQd35Vles=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoVwTxlsHiC9lKjJVSBi5tk4MRZQGj6d8ezqj6lyR3o7I2QtEb9ut8pguTcHRKrV+xjx3pqVJUv6ZERDy5/NLfuVbLvTkpKTUz3KGtBZH9BVrPDB3S6ONWWhhOpk7HeerCvioFzP+YLjSBfVq5r+2dQZW/evvLWsc5C8xVkCRQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqN5Dk4Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78435C4CEC2;
	Wed, 18 Sep 2024 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700288;
	bh=aGbFusPDI63Fm+CFi0ZmI+xAVQzIkHsdozHQd35Vles=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YqN5Dk4QvZMUQYcXRPqsVCN+MXu2GZbljX1ui6Kssig4hS4GsUrpXQLtBdFIq142K
	 d9VKegBCjTa3EujSwibgcpwYfTNf3874Wrw5toK/N5mithafa8WKj9EXEBnNImFNH0
	 IcluuTGWl3oaSBBnUMw4AuGzZjv4IjNklyYJ9IQNtcMvV2hztmnMDVEESb3PEc4gSl
	 tCYsB9FG9V5D9jRvMVXHcxfZAZBpqru1SjuTBBwoKMTkFsF991y5G2oAmWXdGhzpKC
	 MdCtQG5RGsgrrgP7P1sMXF3Po9+R5ZKsqGgQe1s+IDOJ3VHmZ/w0r8o6tLjz1tC4uF
	 tkIQOkTWiEHtg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:18 +0200
Subject: [PATCH RFC 05/11] arm64: dts: qcom: sdm670: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-5-5b3a8662403d@quicinc.com>
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
In-Reply-To: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=1000;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=JG8EJoLAHahav7rFKM04sHWlWdZU1KXmxqIrjdhaM9o=;
 b=OTi32NdVAKltLS/SCktu9a/1mc2OngOpUqxGdCwvJFJoG6P+hrkJa63St3SMx1Pq2GYKJhM0X
 2mjypiXGaU3An3oL06JXlk8vBREKG/yx7jFWCat5l/vQOgrnWUj4eC2
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

On RPMh-based SoCs, the APPS SMMU advertizes support for cache-coherent
pagetable walk via the IDR0 register. This however is not respected by
the arm-smmu driver unless dma-coherent is set.

Mark the node as dma-coherent to ensure this (and other) implementations
take this coherency into account.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 187c6698835d34e617aeb83309b6d5926eb57198..a08a64bc033ffdea283645c6bf4ed835a59c3366 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1737,6 +1737,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		gladiator_noc: interconnect@17900000 {

-- 
2.46.1


