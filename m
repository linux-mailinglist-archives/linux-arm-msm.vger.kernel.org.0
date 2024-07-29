Return-Path: <linux-arm-msm+bounces-27304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125C93FEEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 22:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A7192841BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 20:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A39743152;
	Mon, 29 Jul 2024 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GhdvIum4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA2188CAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 20:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722284095; cv=none; b=dKmocevGwa3UokmLs9x0iHDGx6OJ6jZ0VnGrzeBqRcqffBsUxdbYp6N/Sor/Sf0P/qFDSYC571AC0h5sjDOnDFksF4WH6UYSJqa/6WefeXXTz2qhhrM+zHzdod8zo9P4BCjnFI4OMtz2J1kh173ZjQyWVuG7nMD8PEl2RC6ek1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722284095; c=relaxed/simple;
	bh=AKeyuLupkAmAZYcAw3WzV2K6qgDlQbwQXs+KeJQTye8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFxEuG+I8YR/RpLYPs8LdvegHOJbVwX9OWKCCUfJJNdjDPWJ+jN02eQng0fReV6pJUmtNMHbjtc9Dtr4xoD2/eNO/Gb0bs/j7vWr3ut75wv8skEhyguJBLh53elxh/Jnh4FFtaaFGXMr1Gww0dG+XPi6hZ8zSytkQcLbZ+gqWP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GhdvIum4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so58334221fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722284092; x=1722888892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1MSxQLkATCZcwG+U7RrSWy+VSeH2u4p3Lmc5mvojSKw=;
        b=GhdvIum4lifHU4PwNrEfNqwF0Hix1Ujbwek1dL/02NPWyB/CVOxTuF2iMNWCCqIVZW
         OPSNR35rUgu1oXXveimwoIPBzckBrLsYQPRaWQuswAI10m1vMfrxfrwtzZ0N/cyK1KLn
         MGleD9gTaWwNHMfC3x7dTGgDRgxZ1VbKOtVZhCNquXiHlR0EjFfW+sPXIAa28K8Xuxtc
         t7FuIm3SGWMTJZSxWo3w/B2EEWcbi2mQLjjmAoqbQDHDyXMY6++gM8ETch8aFiBkSW84
         fzGaCEdcSIMs4yQfgWfoMMsCLj5nl8N3ET2Q+xpmtQiVTvC36TBLLXRhjlqPfvIXw3LJ
         LPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722284092; x=1722888892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MSxQLkATCZcwG+U7RrSWy+VSeH2u4p3Lmc5mvojSKw=;
        b=C2dHN1VsYwPPCvWpLN23fmhRdYNUAnK0/oXZSArFpFzmtVG+jiwVK4ygekLRpamhAf
         c4p+zRt1X0M9W7XPYnvj5dVTQmgyEbQNgEuQWBRW6TqU586RWlqDKlyUBn6I/r90p26o
         pUiLeSHgEaBfBS8vJiXXO9ZZqRvgTE0lEHnMW+4v6w1CKx7rMl8QJc/ifDZVzLPwsTnb
         jVpgjbJcAhbHATPK2JTJZvsxziEklC6xUGf+nfubkEvVfVJ/mIJnhQ7et5twMsJAQXKg
         R6pXGUBk0gjKhZ4mwkDGOaWFmAxspDGSD5P6n7YIwcTuwxRt5od7FFa57kCnUthnshrF
         VRzg==
X-Forwarded-Encrypted: i=1; AJvYcCX/21VvzQsJe8OUVpLDxlUehgOZqytbCt8LBC0Ub8cnC4xja7nm0CIhkHr3NwuUDnXqMisWcoTby1WOLG6RToYddO3hPJJmZrYS2IIwcg==
X-Gm-Message-State: AOJu0YwjeoYYxMzCCNFHPgVYiUMjoosPPlKoVc92LBwEJK2u1iXZlNcj
	+jBO3Ghiqn6w/aAv+zmY1kBqzIrVTsz4qmn+wlw3MsACap7gO4utjQ5/PldRZ5M=
X-Google-Smtp-Source: AGHT+IHwWi170IaSpuqzgKXSqdDpCqWdNwQokms2xCpWCNu7yyJPx2iZ4KDFBHzK0i6N4igPdmbOBw==
X-Received: by 2002:a2e:3a17:0:b0:2ef:22ef:a24a with SMTP id 38308e7fff4ca-2f12ee57c24mr67925111fa.31.1722284092292;
        Mon, 29 Jul 2024 13:14:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf0dc57sm14566801fa.10.2024.07.29.13.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:14:51 -0700 (PDT)
Date: Mon, 29 Jul 2024 23:14:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
Message-ID: <osxynb352ubxgcb5tv3u7mskkon23nmm3gxkfiiiqss5zp67jf@fv5d6bob2rgp>
References: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>

On Mon, Jul 29, 2024 at 10:37:48AM GMT, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> SDM845's Adreno SMMU is unique in that it actually advertizes support
> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
> 
> This however, seems either broken in the hardware implementation, the
> hypervisor middleware that abstracts the SMMU, or there's a bug in the
> Linux kernel somewhere down the line that nobody managed to track down.
> 
> Booting SDM845 with 16K page sizes and drm/msm results in:
> 
> *** gpu fault: ttbr0=0000000000000000 iova=000100000000c000 dir=READ
> type=TRANSLATION source=CP (0,0,0,0)
> 
> right after loading the firmware. The GPU then starts spitting out
> illegal intstruction errors, as it's quite obvious that it got a
> bogus pointer.
> 
> Hide 16K support on SDM845's Adreno SMMU to work around this.
> 
> Reported-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> There's a mismatch in sender/committer addresses but that's "fine":
> https://lore.kernel.org/linux-usb/2024072734-scenic-unwilling-71ea@gregkh/
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 36c6b36ad4ff..d25825c05817 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -338,6 +338,15 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>  	return 0;
>  }
>  
> +static int qcom_adreno_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +	/* SDM845 Adreno SMMU advertizes 16K pages support, but something is broken */
> +	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-v2"))
> +		smmu->features &= ~ARM_SMMU_FEAT_FMT_AARCH64_16K;

Shouldn't we hide that uncoditionally as it's likely that none of v2
Adreno SMMUs support 16k pages?

> +
> +	return 0;
> +}
> +
>  static void qcom_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
>  {
>  	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
> @@ -436,6 +445,7 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
>  
>  static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>  	.init_context = qcom_adreno_smmu_init_context,
> +	.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
>  	.def_domain_type = qcom_smmu_def_domain_type,
>  	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>  	.write_sctlr = qcom_adreno_smmu_write_sctlr,
> 
> ---
> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
> change-id: 20240726-topic-845_gpu_smmu-ab738f7a013c
> 
> Best regards,
> -- 
> Konrad Dybcio <konradybcio@kernel.org>
> 

-- 
With best wishes
Dmitry

