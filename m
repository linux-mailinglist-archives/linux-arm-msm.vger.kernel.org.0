Return-Path: <linux-arm-msm+bounces-31984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 282DA97C217
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C931B1F21AB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2651CCB4E;
	Wed, 18 Sep 2024 22:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaZLE0hJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A691CCB4C;
	Wed, 18 Sep 2024 22:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700303; cv=none; b=Cvpk9Hx5LKPAXeANYWiz5I+Wz0qGf2kAdp2zOyg7nHNuVe1T1Qu2vwOhUoVyPWpNVlh4ZUQz3fgPv4yw+HMYs66vVWAKEjI7oi2AYvs2wzjsvHdWQpTBnQDcih9n1/23gZfupAXVd8U4TE5cwi9AiEojj9/VvJmO5JhvRfbX2/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700303; c=relaxed/simple;
	bh=fvbcgqAs1rsyvlilfy+Y0MNH7szTK4zdztzefiGCpxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wi0cEa97ZirdL7VFQWqfyzDjLNFtwgj0ASBGWd2JebJm8ZowMQDDQIZNf/cnnTwhLIJlsVgxcsxht6Au/nAo/0Urn4w/T4fdUAeO9KK3P1QbSYdjMViYU4VbfwehhXi1doOqX23jwsCbzIdxDlBt82N4eaVYYWDOo/ZYpIxnTeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaZLE0hJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38335C4CECE;
	Wed, 18 Sep 2024 22:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700302;
	bh=fvbcgqAs1rsyvlilfy+Y0MNH7szTK4zdztzefiGCpxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TaZLE0hJIt7f4EeU+k6Iww3zmiqifmV8/I5sTFRVyb+JbRSYPu4HQ08Vh4/Qf6Dqs
	 +NoWyG87fLONPt/3ttla7HUVJmxRNq1cuq7tQdKlVEvmSCoe+Mv9s8zc2WRKgNDnst
	 GF/blXpZym0TJcNPmYRw6AzZvKBKFpRATIN8CN8e30ElR+bw5LHNixvUAOI9uAsR95
	 eI2CuQZIm69L1q83aATr7y9xtoKCBSFTd6mEvF+pEr+9+1Nmx2n/sxerK9P9dEgucm
	 ECkmedMbDN6JxHhelu6cjvRqEF/1gZKGKM+rNdczHTxb2Ko80bh7MgMaFUx1a2hBaf
	 OFRzAEkPNertg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:22 +0200
Subject: [PATCH RFC 09/11] arm64: dts: qcom: sm8350: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-9-5b3a8662403d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=989;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=wTWitVw9dc+KqMmrRNavgfSxif6bVcuzlfUqH1vW+mQ=;
 b=ywwQxolO+k2AHxStq7ykh/1Ojo36V4y4wtU/Ku7ejhgeZxAXl8ZSmPM0CSDv51tAABya+Obib
 oglCDXg5j94C2/G6oyJgR6jrv+WHun6UFvfR8Ut/ygpFde2sI8f1/I7
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 37a2aba0d4cae0421c8ddc09d70373836dac8b33..3156aff90f16b32e8458bcc9a93e6fa6084c5a09 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3282,6 +3282,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		adsp: remoteproc@17300000 {

-- 
2.46.1


