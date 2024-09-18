Return-Path: <linux-arm-msm+bounces-31982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7051497C211
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A33B31C20CBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05CE1CC8BC;
	Wed, 18 Sep 2024 22:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbnqqK84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852871CC8B8;
	Wed, 18 Sep 2024 22:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700296; cv=none; b=pJOaW3YunYQMo9ZxY5UKPzyB+frKDliUjWTunh3VSwh0930USCUu7RQeP4Hf7kIlDGAegImjq9iXppoZENH7ZVgIAgwAuRtAg9LNAhhbq9obR0LnKL4dZtw+AG7IDgbWterpZDPiQP9ZSWJEoANL6gAmBWXDZmhE3kUf8O8NmIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700296; c=relaxed/simple;
	bh=HwgYbAoeeuxP+0YGncCc+jFyal9DAfjf/+Xg0+QlNIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjqePRCKMgzj7COXHC+4r+KhdNORrt9it4wHaZKFl/lUF36oNRdtKVWqcQm7L+a883F9EVYm+nScMxORx5+dx/D+rqNZDuLMj+REHOSoCnXb4UiRScO9Y7/r/DxhtzVz69WbHBhLTYrMQj8qZeii69D2k0phoh+88bk+oWRScwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbnqqK84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C6DC4CEC2;
	Wed, 18 Sep 2024 22:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700296;
	bh=HwgYbAoeeuxP+0YGncCc+jFyal9DAfjf/+Xg0+QlNIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GbnqqK84LcFI14boXv4oJaHLQlVVJilueT94ydvxlbTwv8haWxUQIN83IBJHnMYBr
	 1kZbHf8K/MdXvcB4fEWbOZ1AAlMSxzAh1D6G/xpUL8j0RufGQhMkj2wia4lDL7ipOT
	 hCKBeVUAPACWjEBkFYPQulp+c6s1sXKrKzW87CaEVREcsrFN8pNuUk0LZpZeLZgMkA
	 ZzYUyfhr7Jc8ATijC2XLtneP+7miicvYcwZFEpZcL5Hzti7/AnDFQv8dcJ/c729FHi
	 d6o7h2y1wShAz/c14mb7CPTdTkeSu/TePiJnE/3hitgFmA+8PbmQlcpall9m4hJ+Po
	 gFGmrFc7xhfnA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:20 +0200
Subject: [PATCH RFC 07/11] arm64: dts: qcom: sm6350: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-7-5b3a8662403d@quicinc.com>
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
 bh=WDSobhu5cZf6LUkFYpRDvkoj/aXymJ0ZoDrptncMGIQ=;
 b=aEi0Plw+Qtu8ZbuLpHZ+ymojjYZtcuVmC2BMTImNN5VObzbQSACAKuL2prjuY8hwlcBqFypRa
 KKWh3JO5lKBDjNBeWHZS2pMoH0XlkHLNZwepTQqZ6VauBoijyfTux4Y
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
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 7986ddb30f6e8ce6ceeb0f90772b0243aed6bffe..54cfe99006613f8ccc5bf6d83bcb4bf8e72f3cfe 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2685,6 +2685,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		intc: interrupt-controller@17a00000 {

-- 
2.46.1


