Return-Path: <linux-arm-msm+bounces-31977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1051997C202
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 847ABB222D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6B71CBE9E;
	Wed, 18 Sep 2024 22:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="no1i+sPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E53B1CB515;
	Wed, 18 Sep 2024 22:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700278; cv=none; b=FR0x5hthvlNYVVDS/IGOUBKMFAacZXgJ68w9IeCkrOAqt+ImQ0EIXgAWvavSX9hyiiyqfRY0BqI5/ERvzDwvfXezsL6UAxyAjb6oLhBgUk50tVyL0ALlxevktEGk3LCWkrA4iK/z3IlZP7rVvHDJ9gMupoA4/O/dnV0txAQxzL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700278; c=relaxed/simple;
	bh=9Xbdr1pTl7lYm6kqYHAJ7Pr5h+ltrNyYvsLJzKXgVnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2B2hYkWGfAsMj7EA6RvFpOolKXBp45f9fixatDaYsglR/SyeAp4MEI8iyRavpvZxk3qvIeLAbpxidcheTvVJoJbDnn0hr/a1FdBTy29iN1eJ4lfMUqlfVSkk2R1c3OgAH89MnuoJtx/FEdQe0rzOtkiQTJX93gInFdYyFwSKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=no1i+sPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1DBC4CEC2;
	Wed, 18 Sep 2024 22:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700277;
	bh=9Xbdr1pTl7lYm6kqYHAJ7Pr5h+ltrNyYvsLJzKXgVnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=no1i+sPFDWzZuHZsFi0rWmfwoc5a8IUh4Jia8nY7EgVF+Np5lmcgeuMcf0M/JZIaS
	 wpchAEbUvJgHQKDXRAL78AV9E61Cu7Lko2Xr014dASRoUT8VVFSE4uXxGiuiAfFqZL
	 DOprQO/9IaJNs9F6MvJNJkvgcnWcwnGeCzJhH0C1DpWTnmsPk7jy1A+qE9VEChj0jP
	 b2AXbpDu8Ai6p2V+BeJoamns4PCP6EmI9OTrqFJWVSS3EYr9B+zWRRCMxMvdUB56/r
	 JJaNcOipOUw9dMveSRUDwXEhaTHYPS0yPT96DE+CE2MOABrgjIn3n5wbRlWc0HocAU
	 yPLjAsTS3nuhA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:15 +0200
Subject: [PATCH RFC 02/11] arm64: dts: qcom: sc7180: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-2-5b3a8662403d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=999;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=TocsrPaJ8I1VAyg6H1MUXOkr4BtJGYiVHFeGO5oxys4=;
 b=GD2PXDTF6K9gyC92vamg0mELPyevvegAlpXgPdzvUxMVJ4d8VF2VfwRwyR3SXK4jSiNNGBMVk
 kJHbwk+Tt4IDckyA6jc7I8c8IrvvMCpfeRb7YmQliMJWRARIWWSNmGJ
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
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index b5ebf89803251203a8d38f6a4690aa052a9e8e61..ed258b4ab486af1765b882164962c56935210898 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3625,6 +3625,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		intc: interrupt-controller@17a00000 {

-- 
2.46.1


