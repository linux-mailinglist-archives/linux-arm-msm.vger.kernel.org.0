Return-Path: <linux-arm-msm+bounces-79194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C1C14F87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 14:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 660AC1C20105
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 13:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599E8222599;
	Tue, 28 Oct 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtFqslrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3B218ACC;
	Tue, 28 Oct 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761659307; cv=none; b=HmUzxMzYwo66jYnhTWku6C2LWzT+2eqXeBykTvY4zAQR7VwOv5kgditoOg47KvXsz2I7YzjKMUzgiJIyHgxhiy9jD4myTkIoRW8W49FpdlrgYJPMX7u04IyK/xhdMmRqg8elHiZiGE4SAMHy2xSjc/sT6FU/KuO24qqic1aRQT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761659307; c=relaxed/simple;
	bh=G7qi5rvC9Ca8mwYeyrUYcrHvUOWw2LAZZygmude9OI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcZ8idmzGbTXYnBUk3Wt0vwxFG9Smci8xrLajKHBIHKIfUIcU1oMBLN79cv53AaNiJzB5XMG8JtQFnfWBPzI35z7dHtqARRTX43IuxuqPx+yL+MC56Lg6p8vhz4t8lehMEYtXVmvpv632ljmQV1Sr5hq9Q2dc2UMJJZKehaPB3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtFqslrT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7DEC4CEE7;
	Tue, 28 Oct 2025 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761659306;
	bh=G7qi5rvC9Ca8mwYeyrUYcrHvUOWw2LAZZygmude9OI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtFqslrTEIwU0Bu0hONlK7yuekEuZM+xv00UqPmQdRWjZ1EK6TlynFwreSv0L1GoO
	 V0US9D1AmPSzNhGs5Gdv8892rgR6FN+elyOEqQaO5Mbqg6whyNHJI3BuG7g5mbFitS
	 ZJVcHv3R9vUpWbKclpdXLC/R1c5RGa5HOtCGw9vR0NCewZj/2pl9cW8FgBzAfc2tON
	 5xfAdA1jFKli4j99BR++D+E9FySLkEfNbUEv4QjjCPByUe9AKDFtdk7y/kOQS0KgyB
	 5qbn4fRvbJROvh3OUIlEbc2/Nd9eSu9uK87avljtC3c7H4Dt2Yw4hG/UIj1c+sXJjK
	 WL2PrEGWOq9+A==
Date: Tue, 28 Oct 2025 08:51:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add Glymur MDSS compatible
Message-ID: <mnq4muqhkssqmvbjb6upkqhoag5r4dpfx5vmfgydcarffh6usf@kzyi7xikttpg>
References: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>

On Tue, Oct 28, 2025 at 02:38:19PM +0200, Abel Vesa wrote:
> Add the Glymur DPU compatible to clients compatible list, as it needs
> the workarounds.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> The compatible is documented here:
> https://lore.kernel.org/r/20251027-glymur-display-v3-1-aa13055818ac@linaro.org
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 57c097e87613084ffdfbe685d4406a236d3b4b74..c21a401c71ebe768115364bf282dd324f8222109 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -367,6 +367,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,adreno" },
>  	{ .compatible = "qcom,adreno-gmu" },
> +	{ .compatible = "qcom,glymur-mdss" },
>  	{ .compatible = "qcom,mdp4" },
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,qcm2290-mdss" },
> 
> ---
> base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> change-id: 20251028-iommu-arm-smmu-qcom-add-glymur-7e953cd459a9
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 
> 

