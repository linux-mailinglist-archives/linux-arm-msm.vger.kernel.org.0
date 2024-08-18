Return-Path: <linux-arm-msm+bounces-28889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6AC955D26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 17:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04D391C209CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 15:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4BD7D405;
	Sun, 18 Aug 2024 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T307s+5Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B6012B8B;
	Sun, 18 Aug 2024 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723994719; cv=none; b=mrKjf0k7NXFtPRj3M+T/+bvd+bO3eNGoQ1lsGVEqizA/xziDVsQzY2WFy/9xqgb8LCcfyIG/Eg6dg9jJK1WjzCOUVy794CnGinq/achDg7YLh0e3o/TyQIVJVH4ddTH8jbLE+7/K2Ii3G5XCqRLe6mogprrweUhZa5dsYX7JU1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723994719; c=relaxed/simple;
	bh=orlwBxElkQ3sTiSKxjEs+BXm+WDBKsem+aACCut7YCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8ZJmaujvcke0DLVSaekueXrLhqaDEfVGL/3U8sg21r0KodFPkt30vFPh1lEn2RD8GQCrfj0aumba3tkzFKLx2LXYHIrRFBgNyD0qaIbGTEa5NggoWfZEww1Vy79r3/nre7Zzi8uCpQe3lZEoJY5+QoBabJAUtppAW1pVIcYIAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T307s+5Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBD3C32786;
	Sun, 18 Aug 2024 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723994718;
	bh=orlwBxElkQ3sTiSKxjEs+BXm+WDBKsem+aACCut7YCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T307s+5QzegpKA6WEsGFxE9SZ5+1vewr+i/3cGEDZi3D+w4sWsAsL49HvorQ+rnvM
	 41znro7LVlHAIn7qjTfjpDPqZ3JRoq6C9EA4yPDLTSuwn9/LRCaOJi7thfDlOlzOS0
	 dUB2BjaFy+N0E5ONRMQei879QazTgcvhWquBLnRawfSkT51OglcP17Y+TqBUeVVhvI
	 U5gFAFNBNFm9cD03FOywFulirEyM0oLZ5ze4ukGFrKAc/0MRjbp7joo/aP0+ZJDXCV
	 5hrfTXl176Fb14T/lMIV2THKMrhTERHutUsziZ0DKfjXxPTPzV7efqH21Go4FuKAnl
	 0jY5Z4XCrVfJg==
Date: Sun, 18 Aug 2024 09:25:15 -0600
From: Rob Herring <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add
 qcom,last-ctx-bank-reserved
Message-ID: <20240818152515.GA104481-robh@kernel.org>
References: <20240814-smmu-v1-0-3d6c27027d5b@freebox.fr>
 <20240814-smmu-v1-1-3d6c27027d5b@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-smmu-v1-1-3d6c27027d5b@freebox.fr>

On Wed, Aug 14, 2024 at 03:59:55PM +0200, Marc Gonzalez wrote:
> On qcom msm8998, writing to the last context bank of lpass_q6_smmu
> (base address 0x05100000) produces a system freeze & reboot.
> 
> Specifically, here:
> 
> 	qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
> 	arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);
> 
> and here:
> 
> 	arm_smmu_write_context_bank(smmu, i);
> 	arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
> 
> It is likely that FW reserves the last context bank for its own use,
> thus a simple work-around would be: DON'T USE IT in Linux.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 280b4e49f2191..f9b23aef351b0 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -204,6 +204,12 @@ properties:
>        access to SMMU configuration registers. In this case non-secure aliases of
>        secure registers have to be used during SMMU configuration.
>  
> +  qcom,last-ctx-bank-reserved:
> +    type: boolean
> +    description:
> +      FW reserves the last context bank of this SMMU for its own use.
> +      If Linux tries to use it, Linux gets nuked.

How is this Qualcomm specific? Presumably any implementation could do 
this if there's no way to properly partition things. Robin?

Also, this property isn't very flexible. What happens when it is not the 
last bank or more than 1 bank reserved? This should probably be a mask 
instead.

Rob

