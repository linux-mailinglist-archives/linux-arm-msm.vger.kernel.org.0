Return-Path: <linux-arm-msm+bounces-31981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539197C20E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE1981F2247F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96F41CBEB2;
	Wed, 18 Sep 2024 22:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfWebyUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A98A1CBEAC;
	Wed, 18 Sep 2024 22:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700293; cv=none; b=pzg1x+U4XmaMn6fFKVU9jRJrMePJ6/mdThvOsP5G9wC1WWvd5PPc4Apyg2hxNNoWrc9coRuDj4KOgwco2yq6Teew4E2NJIv2QtC1TxMYYqm/cH0ZaS9kb0FzN80sgiiANBjSE+9gmkQBIIuel8LUT7R8nPB/XhwPfPzQgLmkyqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700293; c=relaxed/simple;
	bh=mmj9k/5wzoOZV6DQSW73lInky+Ha7Es9GsL3JQUu8D0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uclc5gTU0WIkX+DfNL7TXdGEADTZGQl8lUrJXSRgC0k1fKEtHJAkcHFA5h6JfH0IIU7wj7y0XVfmUskG8N7EaCoC+BazdxNYcDHFsQu/rE93bdGqioQWjfqFDeFFgRDNMNUWZDnaec8Q38mwttj18ToWe/CNDNC17CeUj/4279Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfWebyUY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315C5C4CED1;
	Wed, 18 Sep 2024 22:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700293;
	bh=mmj9k/5wzoOZV6DQSW73lInky+Ha7Es9GsL3JQUu8D0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OfWebyUYkjxcfZWV/YwUfqYglTa3lVOn0FuJ7qX8LUIzrEps3EUOPEy4qAhCexVq8
	 zSWSS1nNv6tQZYSiSB02KoK+N2+cPqYuVrIVLSe/miovHmHRF16IJlqpLF9KYfg+uu
	 djDBPZZF7GKOE/4Uh2jN3TmojoPrl7tbhmwqdSrkX1YuwgKjhb0b8T5rNHUaN4Vd6F
	 n5F4SCVdG7/Uc8DALAzk6XvrX9ETWywIiJYnXKgM4JkoUT5xOv3SGwEuh8H86LlFUp
	 z0R+FroEjLxqm+PcCVuwrOOyvMabLTJMW3s1AveXcVt8vXvAK4iWw4ORxLJ/S/kvvO
	 fG68ZXfarifgQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:19 +0200
Subject: [PATCH RFC 06/11] arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-6-5b3a8662403d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=988;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=UZMF5MnsUbzsHMthR4Ow1hPxixbpxGwRvIlbTvumHUE=;
 b=6KbOYn1tyI0IsSLsMiQ+CqJCuSkm2gOZxp+N/YJNZqAK/sIKvIDjAgVN8kD9ph5kx+fJVrZDd
 XUjX1534QJSCINCfBmwayJsfRg1/c6PszsQ2xilBVe5a+ys0yP290uv
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
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 54077549b9da7f0ece69a01d370692d9d716bbb5..49440d1b2cf6caf6da9d97c635cbd751f0700326 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5159,6 +5159,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		anoc_1_tbu: tbu@150c5000 {

-- 
2.46.1


