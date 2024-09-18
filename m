Return-Path: <linux-arm-msm+bounces-31979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4997C209
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A5FEB210D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CA71CC173;
	Wed, 18 Sep 2024 22:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKxKYpKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB021CC172;
	Wed, 18 Sep 2024 22:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700285; cv=none; b=EufsRgJzsoAily4IvnkF+5FSjd5jyabZV6lEcZu87E2pwEbwYYdl0G+xkFCdtd3/GSr42t7mYPWJHPNczGqT/IEQPXJ6L8zNuLIbSyMIIH71dJSGsb13l7F/+DrEhgfjPPVw8QVVTkb+E1rTFVu6RhPTc7fAbRPQG+QHZun5A7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700285; c=relaxed/simple;
	bh=yxkJqeag+cHRDOW655uJqun2ar+bn6DrpicUSLT0eAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WitZNAQ9oxNk6bAej49Qy9RvxRkc6uAKv7tIevcU+kbAysIlZ5GxxuPIHdJqCDvl/Q4wMk1dO8xwsscCf5CY6DQbpQ90DbwFW652XqDqUgq4pdsPw3qHsGjjyJPEtVVmFs+qd3FpqM76JtSBbImnaQywUzEC2Tt0m685lu/2p8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKxKYpKf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60510C4CECF;
	Wed, 18 Sep 2024 22:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700285;
	bh=yxkJqeag+cHRDOW655uJqun2ar+bn6DrpicUSLT0eAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LKxKYpKfRcpxQAY8yuTwYz7eKJiG9H7TTC2Vft9ehdcUOt5CGiA4f3Bq29A1DsRJ1
	 /iZYp0Qm5DkO+oHkM+Kr4ufVkBMjvJVDFkW3KFgyqKqLuL35PCyAD3cfgdRUt2Selx
	 EH0Z9g1z9lkVZ15zu0uUbgG5xIXgzCRpuIHYn3Qg1HK27ROhWG2Jc5N3maF/OFgT/c
	 0bl20mkK3dmJ8P+DlP1uwV2F2fpJJGtTaS9zlOlEnv32TmiiEhJwk0+13tq3lUVwRT
	 SiXat3mp79F6N7l98hSwLmZgugjizUj3PimU2KlHnEcQgx41oAP+jRQSEpoZQ+eLES
	 QFWeTLBrzmEYA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:17 +0200
Subject: [PATCH RFC 04/11] arm64: dts: qcom: sc8280xp: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-4-5b3a8662403d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=1009;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=QpUw8ZaJCUB4takBAlqMpvVgFRDLxf4g8S0BjQz9WeQ=;
 b=w/tvXpvFBerXuTddXSslIncKx1/PjB6TbrQ/q9cmad5MzljTy/MspsUdC3WpomcZOxqc8p7qS
 xqH9/4CSHO5A1IrPvVDGoGk/DmSoDnQj9Yz8Lz+ZHo7qRTvNJ3oFoLA
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
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 80a57aa228397e23e3e2d5643c0b563a60d71170..d36f677ae4cd857388dcd5821160a6472a0904b4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5008,6 +5008,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 890 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		intc: interrupt-controller@17a00000 {

-- 
2.46.1


