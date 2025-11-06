Return-Path: <linux-arm-msm+bounces-80662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0CBC3D551
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 21:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E2D53AFC36
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 20:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF4023E34C;
	Thu,  6 Nov 2025 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhzQd9pZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BA21DE3CB;
	Thu,  6 Nov 2025 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762460137; cv=none; b=DwbgDM4pp7yWd75k8QlKOC0YI1Txw5SRA5YLSDfrWrLH/Hfu8qYwnkmExNa3j3kZ9pthoBtMnZJNcI1ySLCe1LWMe6GfToR5rcB2k92Xd/C2OecHY8KtUiyD78mNi10HgjsfUjyntVjqhiKmK4QUh3GSJhOviQBaA9IXH0ouUBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762460137; c=relaxed/simple;
	bh=dUAaeQ2uV1vxTyEBdWlltnmOWYmt98pKvjM2hpIJyNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6D+l1KrBVYE+ztnus/ZWn9xMItlqjbdnzwNjuAN3Iwg2QrnEWSv8xWTm7PEKi3pGV8nK+hixDNFFZ3pNrFaLlBjXGQZHzhfuKYMaDNLWC3hn/nWcpzPwTodg7yfOZxjiFL+2GkJ3lD3rQ44CC5pIheYmFMDjFp8gs55HWB++MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhzQd9pZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8BFC116B1;
	Thu,  6 Nov 2025 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762460137;
	bh=dUAaeQ2uV1vxTyEBdWlltnmOWYmt98pKvjM2hpIJyNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QhzQd9pZWXvQT60mj3xlituEC2e9e3uFVI/bfLOS2aZ2W5RoqFVaYzArPvDbeFrp5
	 BTWx42bUxUySmkm3ZyB4k6G2CopLuk+gi0WPTt8phP4uKUYcPP5iMumigMx4tEmmHk
	 JBWbvXERMJe++YlTjoqfEBIdk68SgqDmKl4ocp3udRmaFBK55lAo7ONU0lLBMJoUHs
	 c1qE8YCLyZ7O1sS+l4x9JQiJ2PbKeFPmXQR2azDHv6Ljrm6ViikRYTquaN2hWTZviY
	 3LgXXv/17VlEmCMq1+/gNTcEpzYzVTWFeV955H4nN25vU2WwfVbD6E9Me2I1xXm2VE
	 Umndyks0FTqUQ==
Date: Thu, 6 Nov 2025 14:19:23 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
Message-ID: <bunw3ymcc3f6bhdymyp4oetj7s7imqzcmeexglzr4vyou5nklb@3g4dxxgp4rax>
References: <20251104-topic-qciommu_bindings_fix-v3-1-09c52a1e5ffb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-topic-qciommu_bindings_fix-v3-1-09c52a1e5ffb@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 03:47:26PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Some IOMMUs on some platforms (there doesn't seem to be a good denominator
> for this) require the presence of a third clock, specifically relating
> to the instance's Translation Buffer Unit (TBU).
> 
> Stephan Gerhold noted [1] that according to Qualcomm Snapdragon 410E
> Processor (APQ8016E) Technical Reference Manual, SMMU chapter, section
> "8.8.3.1.2 Clock gating", which reads:
> 
> For APPS TCU/TBU (TBU to TCU interface is asynchronous)
> Software should turn ON clock to APPS TCU
>   - During APPS TCU register programming sequence
> 
> For GPU TCU/TBU (TBU to TCU interface is synchronous)
> Software should turn ON clock to GPU TBU
>   - During GPU TLB invalidation sequence <=====================
> Software should turn ON clock to GPU TCU
>   - During GPU TCU register programming sequence
>   - While GPU master clock is Active
> 
> The clock should be turned on at least during TLB invalidation on the
> GPU SMMU instance. This is corroborated by Commit 5bc1cf1466f6
> ("iommu/qcom: add optional 'tbu' clock for TLB invalidate").
> 
> This is also not to be confused with qcom,sdm845-tbu, which is a
> description of a debug interface, absent on the generation of hardware
> that this binding describes.
> 
> Allow this clock.
> 
> [1] https://lore.kernel.org/linux-arm-msm/aPX_cKtial56AgvU@linaro.org/
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Changes in v3:
> - Expand the commit message
> - Link to v2: https://lore.kernel.org/r/20251015-topic-qciommu_bindings_fix-v2-1-a0f3c705d0f3@oss.qualcomm.com
> Changes in v2:
> - Resending from a 2023 megaseries, no changes
> - Link to v1: https://lore.kernel.org/lkml/20230627-topic-more_bindings-v1-7-6b4b6cd081e5@linaro.org/
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
> index 3e5623edd207..93a489025317 100644
> --- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
> @@ -32,14 +32,18 @@ properties:
>            - const: qcom,msm-iommu-v2
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: Clock required for IOMMU register group access
>        - description: Clock required for underlying bus access
> +      - description: Clock required for Translation Buffer Unit access
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: iface
>        - const: bus
> +      - const: tbu
>  
>    power-domains:
>      maxItems: 1
> 
> ---
> base-commit: 12132ce56439eaefea25c647d850eeed99179d88
> change-id: 20251015-topic-qciommu_bindings_fix-3bf3904041b9
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 

