Return-Path: <linux-arm-msm+bounces-6876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC3829836
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F5F91C21D45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 11:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5B141746;
	Wed, 10 Jan 2024 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H/dSOAFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAAD41236
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so4868250e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 03:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704884440; x=1705489240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RfeKeWELsUXSOsoX/4w9IRfss9fiLzU6vIaJLnkhKk8=;
        b=H/dSOAFwvou2rKPgvKuitSKE7egPG9TAs/Uo9L0LPZt7LR05d2IyDHbS/QWbnOfH2b
         +ba2tcq/QkjdNY04fuMHG4BkQiT7GLGv0Q3fZCoLlqZWxyIzYTynC6cS2R2RedlTHE7V
         fbV7WeKKDJlEzhMFDE47Tvq2SK05v+fMIFHl+JSoSQFfsLK2FMKxkCsmYRaow96dMRrg
         ZePhGjrZ9WfpEx6hqr/YGKgEaFX7FjkzFcBQsPpnG+ZbkTinRM6M0Y9QaL/pwHaKGrGJ
         o0gRN+CHi/O+Qe2EUOxOSeZ+XM6S0ewy7UZ3FHqRELSglNf/35twUalWuKqB/wk2GyVB
         UtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704884440; x=1705489240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RfeKeWELsUXSOsoX/4w9IRfss9fiLzU6vIaJLnkhKk8=;
        b=VP2tpbOBx6p9X7Pxhz6vAxf3I4ylmfoW7uLMPblF29TQB615+Vx495iUeNTSwj6eV9
         5Z39/wjYLQNcPgf9PNzlU0Uo+ajWE8szZOV1uwrDfeL5FK+8LfIeM4sCOi6OjcAvPPko
         qyKzCB24HPZAr+xAgmNZFG53FlLWuFfjjnq153iyKU3RqU3fnxLvzXly0IQxa66zuYUd
         36dDn/jrq9e8rOO0kyiADbH6g87jb/GtkRSVVxRFL0Qi+tImEXWRHmev4IqSBFZeOMh1
         fXVh9aEcjCvNVclbLv9/1P34B4Z+SL/odS9bqspYLQWVioxPIVEBP1e0iqx84sQx4arz
         AKsQ==
X-Gm-Message-State: AOJu0YzKDW+6M4XaE7+igGIu/O55WBn0YsNAd2er1WE0SQkQp1WVBF/R
	T1ZWvBCkRmEI+Wd4QS02VHZ7GEtKSyjs1Q==
X-Google-Smtp-Source: AGHT+IHxHBhrhaM+rqV9BsRHT6XAftzD06A/BcYSyyty/0KA0tCunnAFj1XF5aWGoLi7Er3fmNTdWg==
X-Received: by 2002:a19:9117:0:b0:50e:7be9:52fb with SMTP id t23-20020a199117000000b0050e7be952fbmr326167lfd.82.1704884439955;
        Wed, 10 Jan 2024 03:00:39 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id eo30-20020a056512481e00b0050e7ed9585asm617280lfb.233.2024.01.10.03.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:00:39 -0800 (PST)
Message-ID: <36f9eac0-3086-4d18-9879-02738e99d262@linaro.org>
Date: Wed, 10 Jan 2024 12:00:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
Content-Language: en-US
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, dmitry.baryshkov@linaro.org,
 jsnitsel@redhat.com, quic_bjorande@quicinc.com, mani@kernel.org,
 quic_eberman@quicinc.com, robdclark@chromium.org,
 u.kleine-koenig@pengutronix.de, robh@kernel.org, vladimir.oltean@nxp.com,
 quic_pkondeti@quicinc.com, quic_molvera@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 qipl.kernel.upstream@quicinc.com
References: <20240109114220.30243-1-quic_bibekkum@quicinc.com>
 <20240109114220.30243-2-quic_bibekkum@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240109114220.30243-2-quic_bibekkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/9/24 12:42, Bibek Kumar Patro wrote:
> Default MMU-500 reset operation disables context caching in
> prefetch buffer. It is however expected for context banks using
> the ACTLR register to retain their prefetch value during reset
> and runtime suspend.
> 
> Replace default MMU-500 reset operation with Qualcomm specific reset
> operation which envelope the default reset operation and re-enables
> context caching in prefetch buffer for Qualcomm SoCs.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 549ae4dba3a6..000e207346af 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -14,6 +14,16 @@
> 
>   #define QCOM_DUMMY_VAL	-1
> 
> +/*
> + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
> + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
> + * buffer). The remaining bits are implementation defined and vary across
> + * SoCs.
> + */
> +
> +#define CPRE			(1 << 1)
> +#define CMTLB			(1 << 0)
> +
>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>   {
>   	return container_of(smmu, struct qcom_smmu, smmu);
> @@ -376,11 +386,32 @@ static int qcom_smmu_def_domain_type(struct device *dev)
>   	return match ? IOMMU_DOMAIN_IDENTITY : 0;
>   }
> 
> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> +{
> +	int ret;
> +	u32 val;
> +	int i;
> +
> +	ret = arm_mmu500_reset(smmu);
> +
> +	if (ret)
Weird empty line.. Please remove it in the next revision since you're
already going to send a new one..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

