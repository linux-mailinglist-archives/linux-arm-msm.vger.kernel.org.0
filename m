Return-Path: <linux-arm-msm+bounces-32100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A8F97D834
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 18:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F8DDB232FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 16:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A094617E003;
	Fri, 20 Sep 2024 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X22cuZD5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9061FCF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726849109; cv=none; b=BMxFX/YRVV9wSzIUABZCIIjRPFVDW+DzuvoE6PlGS95Hi3vvpYnk/mjsbPbAQ+Tt2WQb1zJ6REo5I5mplIqOi6/r+pAwLTUlJMXmS4wnkQZSNXfZ7GtBXx430x2128MWTCSZPGbOqhqHbDvMjeOaG9CigmoP9szVpTESf6ndcGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726849109; c=relaxed/simple;
	bh=+4zp3iMscaP3u6SjOBi0EjwSaqInNFWckSmwKwffECU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRsVcD29dw3Xka1ee+e/4NIxYoOPc82b67f6X7PCUMFgvcNEupcCr0duv/GJtCHugcMXXLgQrWY9YH1yCpxcGwfNqrsXKoYsZxHDZls46ni3yXoXy0extKGOUlgIg3WVjeuKr2Dk0AM3dxwmUZ5VanrIUKKhmTk8Fae8gtRs6eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X22cuZD5; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f759b87f83so25182101fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 09:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726849106; x=1727453906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lxiGhrfva9nGr87diE5hXxv7VjrS6V9/md3P63r7x/w=;
        b=X22cuZD5r8cS+5RHhmMtqIEPH+IKpqPloWhqVM/SAi/9+Edm9j/kr/Fvg0yVlQjBlM
         vKIi7p2c+G+wKv8fAOjH7OJ/6x6P1twJfFDhnPoa3E15eq+evBuSZD1dT7bhBRQUGR8R
         FzHa/bCPtq0mj1xwPQRvg6Z2UVLX97FQYowEsxTb0m/nZMVh9GP9BndntK8NwHHttwBj
         5D+Hm22HTeb5Pc8Wz2KhJxvVroURt0jBw15XLlI06Ej+c2uC+hvR2AKkybL3IL+XOEYK
         ZiG0KIcRioufzCUd1Ti2xONveDJEluFeS0b91seMYv+BsQvAQy7oTNzBmft8iZSx+Dpl
         OeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726849106; x=1727453906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxiGhrfva9nGr87diE5hXxv7VjrS6V9/md3P63r7x/w=;
        b=utyDBSivDSRrcBpmAJwa+ifXw/S7vC20BIIs6ZCRXA1ErLw3AzVfj3+eR3GQNFyUGR
         Z7jDpAjGqZNQrJ1owC24FcQqJ3GoUhbhXiZEnamM20sQGyPO/fxZOXeOneG1kiC0HS4y
         PAZ4XzIa/TerfQ3eC33uPR0s8aitL7oezs+TjAx356s9obOo2FP9vkHWlYD+qxSM3pe4
         bXSGHulYUfAAggCOGEqWfjEipz8/4+z1bTRORjnFdKHj6AJA4nQA/uKblMVwBz8g67tS
         kGXQPPQ6q649vphvJWgGeZ4ZxKuAzz4Am0NIQ4jSpCfyV5qIodigKf9MmKrnWmQqK4JX
         YwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMtPVIHu6FxCvBWbXdfU03eDiw5PvRqX8ij6T4cTMB1oqCAcxwweV9w3GaLvVFmqW8HqPyh4R1fbg4jn34@vger.kernel.org
X-Gm-Message-State: AOJu0YwrIHO2QAsce4/3yfaR/weYYsKSx/atgoP1Cm7L/UWfWzR+ilUc
	TptCN+WKaal5RP7fhNMXkiYFuSWVmXCxp79LjXGm8/XwSiwMH3pCRfbB2OYPoD4=
X-Google-Smtp-Source: AGHT+IHnk+GuYg0PsULi5WcAZDBS6KjfmBIje9WOOcvV8OdZljNJ9XPeC22rF0PyufI4gptRj2e73g==
X-Received: by 2002:a2e:a9ab:0:b0:2ef:1db2:c02c with SMTP id 38308e7fff4ca-2f7cc365d6fmr21049911fa.10.1726849105787;
        Fri, 20 Sep 2024 09:18:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d300839sm19573671fa.48.2024.09.20.09.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:18:23 -0700 (PDT)
Date: Fri, 20 Sep 2024 19:18:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 5/5] iommu/arm-smmu: add ACTLR data and support for
 qcom_smmu_500
Message-ID: <xxd74r5zzobcsg6joty4rxxmj4gaiezmj6bqlcdbcyhshchqq2@ljpxtgq2dthg>
References: <20240920155813.3434021-1-quic_bibekkum@quicinc.com>
 <20240920155813.3434021-6-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920155813.3434021-6-quic_bibekkum@quicinc.com>

On Fri, Sep 20, 2024 at 09:28:13PM GMT, Bibek Kumar Patro wrote:
> Add ACTLR data table for qcom_smmu_500 including
> corresponding data entry and set prefetch value by
> way of a list of compatible strings.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 4ac272d05843..e8f936a446df 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -25,8 +25,31 @@
> 
>  #define CPRE			(1 << 1)
>  #define CMTLB			(1 << 0)
> +#define PREFETCH_SHIFT		8
> +#define PREFETCH_DEFAULT	0
> +#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
> +#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
> +#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
>  #define GFX_ACTLR_PRR		(1 << 5)
> 
> +static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
> +	{ .compatible = "qcom,adreno",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,adreno-gmu",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,adreno-smmu",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,fastrpc",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc7280-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc7280-venus",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8550-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ }
> +};

Wow, this looks really nice now!

> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>  	return container_of(smmu, struct qcom_smmu, smmu);
> @@ -640,6 +663,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>  	.impl = &qcom_smmu_500_impl,
>  	.adreno_impl = &qcom_adreno_smmu_500_impl,
>  	.cfg = &qcom_smmu_impl0_cfg,
> +	.client_match = qcom_smmu_actlr_client_of_match,
>  };
> 
>  /*
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry

