Return-Path: <linux-arm-msm+bounces-37906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276F69C8A16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 13:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1210283FC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 12:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E441F8F17;
	Thu, 14 Nov 2024 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hKRrgFNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B351FA242
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731587764; cv=none; b=dXJjCkpi/tjb4/9R1C6qvRoA8cFxP21UcihsGHVbAlwivrjxEhdixUtcbN1V/3KnvQ/nb7l7TeQi2vEuaf4ensmjv2AOnZ3IpyOCHHjAyrp456o4T3/n+vvrwQnNFbNBOAIUdOIMCOl2StQdQSDWQTBPZRnRbxTX8CqUpSJwhZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731587764; c=relaxed/simple;
	bh=T+LDaEiPLaW2+KPSAG2c9PKXYlFwR3gPf0XLpn/LmK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsezSBbLgJ+y0OL+85ryhKUxPfHAZVXckNv79DHMQCSE+gKZNNhh2Q0cYGmgl7SYzMawJntrBNumOhx3ixrwsWHzALeLTIf5MEvM690IoXWmhTZhtqDF6Vf/uWlJeYhMcsYUMhAcS2548bg+4iSWIkDsqfHsesU0/HmrMRWwWNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hKRrgFNl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53da5a27771so572990e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 04:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731587760; x=1732192560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VolHPGwzyzWXHH7WDKvK/ITQahcEIxL1w6M06zCzGt8=;
        b=hKRrgFNlooqZJotrlyxr782mroUorzeUjj7S7yt4JSZrgvTVcQgFOgtso9wfcsF/56
         +Y0zxFyaF+AMsXGJhT+QwV3+vsiCt5uH+fhQUF8IxtR+ZHD60jzCY40A74w9BSunkSZ/
         sAMNDadcgdn8+1jQfO9Tonx7pJHpi/7M8V4Q8NdAj2OspuZglmwhUM5T8GwbYYrf0sqx
         4zztJ3IbaC1g9TCciE4jotzIuQ4GNxDGaHO4i222xICJUDMRbIKouadg4sHGUhdociFN
         eFR9Og2izb6Ft0hC7PsqSGVDfIqIsAN3gWe/SeSLJ2t9i9tOqun4x9LaHRbzUprUea5w
         NGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731587760; x=1732192560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VolHPGwzyzWXHH7WDKvK/ITQahcEIxL1w6M06zCzGt8=;
        b=uCVnzl9lhD4P1WwyPyoLZxAzAlXCHOOjtJaEBJTHdSxh8fgqFfxixaHo4VOjQlfH/W
         QmKdhpUxlLktp8/mWyfbqaPDSIj1Wq3HXm4B1bBmraAEmWzHff8SJDQgUV5uUb0fcPIU
         X8JiBTGg7kzDlIv92jnQGhHWYgbWQkAvmB8JTlLvi3Kff8VyHgpG+UQhBSKw4b5iYU5h
         I0DtI4X6uUzobnaJrPvb5Q8UAct0fEB8jHkmrD76aQE4ggYCR+la3wCif3L3aeNLANmu
         A/NNwv/xWCwoWFjK4YdlYhTDaBot4lGJHX97eCw/izGcofGU+G++18zMIO0u+JpDoDtH
         aoBw==
X-Forwarded-Encrypted: i=1; AJvYcCX9T6cXO0BW8eVxm/NLfY8ckRt3yZHttkdY0OcM8KvSNSd0vOCxGpwFL+1dA6SdxIh9l4oumxtvMmrRxOZu@vger.kernel.org
X-Gm-Message-State: AOJu0YwAuYv+cV9gwVb4myN6QeMCwB9QKv84F2f7YX3cnfzcRuL5jFAP
	uYsiel89tzkiKalgAhxIJ5dw7crTARa8uYXBWVwbsnYiRtHeESIhJOZrlGWDb00=
X-Google-Smtp-Source: AGHT+IGi7UOzSfwh72ihUwOGEexWy2JMnijNfqGBkqGRHqPGSrFGRfh6xQPHDoXZUsDQNmf4oTaytg==
X-Received: by 2002:ac2:4c23:0:b0:53d:a86e:4f19 with SMTP id 2adb3069b0e04-53da86e4f40mr648491e87.25.1731587760466;
        Thu, 14 Nov 2024 04:36:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6530f62sm170210e87.166.2024.11.14.04.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 04:35:59 -0800 (PST)
Date: Thu, 14 Nov 2024 14:35:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-qcom: add sdm670 adreno iommu
 compatible
Message-ID: <4lpz2sx3ikvdpb5dv7qdovpsfm724kc6ibjtbmmxaajtwemr5l@xtiaork4hy6e>
References: <20241114004713.42404-4-mailingradian@gmail.com>
 <20241114004713.42404-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114004713.42404-6-mailingradian@gmail.com>

On Wed, Nov 13, 2024 at 07:47:16PM -0500, Richard Acayan wrote:
> Add the compatible for the separate IOMMU on SDM670 for the Adreno GPU.
> 
> This IOMMU has the compatible strings:
> 
> 	"qcom,sdm670-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
> 
> While the SMMU 500 doesn't need an entry for this specific SoC, the
> SMMU v2 compatible should have its own entry, as the fallback entry in
> arm-smmu.c handles "qcom,smmu-v2" without per-process page table support
> unless there is an entry here. This entry can't be the
> "qcom,adreno-smmu" compatible because dedicated GPU IOMMUs can also be
> SMMU 500 with different handling.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 6372f3e25c4b..601fb878d0ef 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -567,6 +567,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>  	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
>  	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
>  	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
> +	{ .compatible = "qcom,sdm670-smmu-v2", .data = &qcom_smmu_v2_data },
>  	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
>  	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
>  	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

