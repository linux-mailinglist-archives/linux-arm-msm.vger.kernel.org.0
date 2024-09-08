Return-Path: <linux-arm-msm+bounces-31218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74E9704FC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 05:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18E5282FFF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 03:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2CF25569;
	Sun,  8 Sep 2024 03:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgSr9YUl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B1F45C0B;
	Sun,  8 Sep 2024 03:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725765919; cv=none; b=LTNoKVWitu6JjMNPG7TRqwO/+lb0IvtK3YrJ5ERcqaarJg72Pnea9IRCt+fiIlkIMuRhq28uYhlScuDRuGVYZVadDl+POWgwqyN3GOHKQv0Q7JEJ36GC6JnccmIQTFOif1RrDeDsVMww0zwGlWSWk6uCJROGlGVmxrmk2eZDwr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725765919; c=relaxed/simple;
	bh=izGX5IudWXgEPrTjrFt+ZvVIsIuXuq42/A8TQru98MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNJPXLWtW9cwGdzDWlqKanODutkSmzprLbBqbaI9B1Yj2H1kz48/c8wMpM3CTCn4PQ/jH+nkUrQY9qUOoN9a7fOzx5nJJ8vw3Ir+owQmI9XjRRsaps3LQouVHGgq6KvSJ+EhqNVdpzsIidNmE/CjBOZC8ixm/pQ8+WDmueJK2EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgSr9YUl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF81C4CEC4;
	Sun,  8 Sep 2024 03:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725765919;
	bh=izGX5IudWXgEPrTjrFt+ZvVIsIuXuq42/A8TQru98MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgSr9YUl3ec2QDIJBhlp9ubWExTyxIkzDjQN8a9tGQFMqFE/HCfJF+2j6BqWybUQ4
	 rxAWSxKi9BrdJndn7N+koNEgWja7ktN6MPpupqSUMosOrMtJZK4k/4MrnZqIu1IcZ6
	 +TIIIyn/xxJ0TeV1W2nGXcugc+abm6flwytC+s6f9fP/72+4uVUM7wI+SSUjD5uXQH
	 HsWTfoKQDwDLS9IPk0pZI2L86uv7Ld9DbJa1V2BFMcbKI9Ci+UuIR6oYTPvP9gNnom
	 EEOFI81IAdmB7Jvj+CZUOtt2m6ZZDJWlCMoHO/GB81BUj22Dyh+d/5+PB5kKTJKVpZ
	 K3Mm26tEWtq3Q==
Date: Sat, 7 Sep 2024 22:25:16 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] iommu/arm-smmu-qcom: apply num_context_bank fixes
 for SDM630 / SDM660
Message-ID: <ptugcisjsh6mdnkhrdhbtetykjpeya4epmlbqbuayst5efgjq4@mzan2bvz74r7>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
 <20240907-sdm660-wifi-v1-1-e316055142f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907-sdm660-wifi-v1-1-e316055142f8@linaro.org>

On Sat, Sep 07, 2024 at 09:48:12PM GMT, Dmitry Baryshkov wrote:
> The Qualcomm SDM630 / SDM660 platform requires the same kind of
> workaround as MSM8998: some IOMMUs have context banks reserved by
> firmware / TZ, touching those banks resets the board.
> 
> Apply the num_context_bank workaround to those two SMMU devices in order
> to allow them to be used by Linux.
> 
> Fixes: b812834b5329 ("iommu: arm-smmu-qcom: Add sdm630/msm8998 compatibles for qcom quirks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 087fb4f6f4d3..13a3e3585c89 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -288,6 +288,12 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>  	 */
>  	if (of_device_is_compatible(smmu->dev->of_node, "qcom,msm8998-smmu-v2") && smmu->num_context_banks == 13)
>  		smmu->num_context_banks = 12;

This should now be wrapped in {}

Regards,
Bjorn

> +	else if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm630-smmu-v2")) {
> +		if (smmu->num_context_banks == 21) /* SDM630 / SDM660 A2NOC SMMU */
> +			smmu->num_context_banks = 7;
> +		else if (smmu->num_context_banks == 14) /* SDM630 / SDM660 LPASS SMMU */
> +			smmu->num_context_banks = 13;
> +	}
>  
>  	/*
>  	 * Some platforms support more than the Arm SMMU architected maximum of
> @@ -350,6 +356,11 @@ static int qcom_adreno_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
>  	/* Support for 16K pages is advertised on some SoCs, but it doesn't seem to work */
>  	smmu->features &= ~ARM_SMMU_FEAT_FMT_AARCH64_16K;
>  
> +	/* TZ protects several last context banks, hide them from Linux */
> +	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm630-smmu-v2") &&
> +	    smmu->num_context_banks == 5)
> +		smmu->num_context_banks = 2;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.39.2
> 

