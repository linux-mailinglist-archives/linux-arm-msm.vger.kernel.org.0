Return-Path: <linux-arm-msm+bounces-31986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4389D97C21D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 01:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D62281D94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 23:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C901CCEE6;
	Wed, 18 Sep 2024 22:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7lxUEju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A621CBE88;
	Wed, 18 Sep 2024 22:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700309; cv=none; b=gSSdG403WKFTgrj2uwQtdjEF82Xnl6AVMVLsQN2UUwh8Ftq9qwu1z3LhKg7lbF5OMaikjTltEP6VWoZjvECpMc5oywJahSANBF5Xz0hPommOK11eh1N76gchxGY2ah8FUsKsde8fBg7kV55Av7kaTOyxz6ox7+e9PKsjNHpGtUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700309; c=relaxed/simple;
	bh=tUZrk1EdPiVct+xXtl78SvbxSva0eNKjrB1/B3ttXh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ip4KafvoiVzeE7s0jrsITVeKOCYjtj9sajvJI5GaH0tVLXJpmWUklJGAWKE1em+f9jmdAx5Uk1iXkz94oUsw9CHdtzNWetOSEA0bMzPrlBL2x7juzkP4DhjGEXsUnIFylEGaYwRXOPF+mT3kDBx5zkdaOL+nqOng2M3+JC5TkUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7lxUEju; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2F9C4CEC2;
	Wed, 18 Sep 2024 22:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700308;
	bh=tUZrk1EdPiVct+xXtl78SvbxSva0eNKjrB1/B3ttXh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a7lxUEjuQ4nWVnUmGo8im+agu4zBW/o2eC2/eafXjTRUYeunMkyTRietWrj8K3885
	 rDlkrzU4PMgpyjat/jObLtwt+DgWtxFVDJBkINoIapG2UROjD+q2VmSX2m7aJs0Hx3
	 tJ+zZMuISPuPePBjSPXhyKC4Ch/pwwsK/mFrJQlUYSphSDdRztmDMcS6UQH+SNNBEc
	 OHrbd80Pjp6dXq82/EWBLSKyfeLyMzFvIgRxR5X83SZ79IiwNfF2bwls1toIPvo31j
	 ue7FvfUF3x+AYaGU91qCLQxw3aqhb/QfUUr6fJeQDSpXOOkjsh7WyKX8B4F7gBy88J
	 IRjqhBOE4kc5w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:24 +0200
Subject: [PATCH RFC 11/11] arm64: dts: qcom: x1e80100: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-11-5b3a8662403d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=935;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=UAAkU5ua+PTQ82gzLCcWIGiK3QLtBYTAdTr5qxOv2jE=;
 b=5B5qw6At0aNX6CPN3gDyjDuFFQ2Vb23yg0iXDCgb9qc34C/dVt8LkBg+NWLFqFoInMNrsgKHy
 rtm9aAnE9zaDPJ8c7uPIk9Llyw6FSlvYye9HQ6F+Tewc5N4T7b3aGFD
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
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a36076e3c56b5b8815eb41ec55e2e1e5bd878201..d364d5ebdaaf6aa1935d42e49819b02e03e32fe9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5738,6 +5738,8 @@ apps_smmu: iommu@15000000 {
 
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
+
+			dma-coherent;
 		};
 
 		intc: interrupt-controller@17000000 {

-- 
2.46.1


