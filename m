Return-Path: <linux-arm-msm+bounces-31385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F38179729C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 08:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 089891C23B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 06:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC75175D4F;
	Tue, 10 Sep 2024 06:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hN8nBQmX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0070C4F218;
	Tue, 10 Sep 2024 06:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725950772; cv=none; b=ZjplCh5+9kQ+HXt/Tk6TFIEsJsRiEQJNk3S7FTws2UnUDazCStt5son9g+GTu+XDRCMIcK720Ftdrzsrm+wMdCsiBEPBWkKR5BTQe1sb8YmcN80LYBqluSjoe4bUtJfpv8LTv6GMfPcRWXWa7Ddzz/7Wi//l37aLc6zn+vF0HzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725950772; c=relaxed/simple;
	bh=H1mw1H0igfpT2ceP3ag5c/jsVtQlAKvnzY43QBs36dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsIJY55QnjRzbT+a7RC7mESmeNzcXBxf9eMR/Tq799TZMYe7usK1086haPdwwYVdUvSILLuuOhSGqTBT6b0/f7dYd2NYS9N9xteuVeiGDvs265mGmsrJHk3wHa3/mWzxEgoVXytfJLZXUVs+0Sq2g9HJc95bPlgCYiqxtvEeS14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hN8nBQmX; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-717849c0dcaso4688281b3a.3;
        Mon, 09 Sep 2024 23:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725950770; x=1726555570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2zcItFUpecva7XuMPRWJPcICnDpEJKw+098+qoDz5Ws=;
        b=hN8nBQmXcKZZ7trW7uxPLiQGmwAe4Easv5uifbl2Mk9Y2gBm1Gj8ZDW1KOFAmD5TxC
         BN+PFjW1Qj8Jy2u9pKHjZRWMdxrNTnvf8tJGWk69In7XRhSHGwf6JDYAd69Vcrn347OA
         1r5238VSTdbBd6Ov44g1mQTJZTWFLmBu709GFWTwFRfiLMwqXdNooiDIocGUPTMchlZV
         M/bE3D2QWRFtgbKxAERYJlTCIP1+bdOSW+3g4CLsL+frWTggDnvY32Ew2uchVH47ZxuB
         SE6Twl1k2oW7AN8suWNDHTxcx9ccjzMROafuqvwzoTo33BdTsyyohjZ1RMZjbYlny1M/
         OEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725950770; x=1726555570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zcItFUpecva7XuMPRWJPcICnDpEJKw+098+qoDz5Ws=;
        b=Lod2yMAhpjyeYMGOZL8wVGs9Rp8NgggK0iUc2WRo+w9Q5t5IVGdWwCy/SSFpas+LRK
         Uiwd6iSzCUCkvDVAp9rUV0CQkWJbzg/iPuOrSMestKVFcgAYvNKJexF331DSr70IDI/c
         hcAEW/qhGqO2cDImNRwtdundmEjCIehN1KxHGHxkz7awgjwOYYSoIAUMoemj1eAcdVav
         sa/Mpk6NL4nMB1rb9aMDiWxbKLOl+oYVSVsqsX8y2Nc4w0YxSIZL0tmF4NGGxFTuZqcf
         pztQMXlOz5ut38CLg+8AuW7mPeXgAQMmWl45L1VS7pyyNksXCzFNN/nT2M/qylvV2npn
         O+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYYGwCUJeoEnqSDGPgvCYZodZZTNt39rjCMnh4s0PRsPTjD2tUtT5RZ3TlpA9lX1qVvkHnPUCm2ItzzQg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo0QHO2rB15waoD4vDlpY8HUf+NduO/Y6Oj38fyv6K0pvpQ0lD
	o1nZfPb0cgwkiVrOxWe5E3naqAiJqyDRk6WfyqA4cgbYX+cqfooF
X-Google-Smtp-Source: AGHT+IHU+5BsStWVs2BTJ4oXmSZlGD/kVkK8XQvbBYpVTsroKMpTWAlXIDfBZ2CEli/65zyiaYGbWQ==
X-Received: by 2002:a05:6a00:85a2:b0:70d:2796:bce8 with SMTP id d2e1a72fcca58-718d5f3370cmr15132036b3a.20.1725950770018;
        Mon, 09 Sep 2024 23:46:10 -0700 (PDT)
Received: from ?IPV6:2601:644:8502:9460:d6be:d9ff:fe52:7e82? ([2601:644:8502:9460:d6be:d9ff:fe52:7e82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090afaa1sm724294b3a.182.2024.09.09.23.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 23:46:09 -0700 (PDT)
Message-ID: <d720d86f-91fc-4e70-92fe-668413df826f@gmail.com>
Date: Mon, 9 Sep 2024 23:46:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney
 <ahalaney@redhat.com>, Elliot Berman <quic_eberman@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/24 11:38, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Older platforms don't have an actual SCM device tied into the driver
> model and so there's no struct device which to use with the TZ Mem API.
> We need to fall-back to kcalloc() when allocating the buffer for
> additional SMC arguments on such platforms which don't even probe the SCM
> driver and never create the TZMem pool.
>
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/<S-Del>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
> index 2b4c2826f572..13f72541033c 100644
> --- a/drivers/firmware/qcom/qcom_scm-smc.c
> +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> @@ -147,6 +147,15 @@ static int __scm_smc_do(struct device *dev, struct arm_smccc_args *smc,
>   	return 0;
>   }
>   
> +static void smc_args_free(void *ptr)
> +{
> +	if (qcom_scm_get_tzmem_pool())
> +		qcom_tzmem_free(ptr);
> +	else
> +		kfree(ptr);
> +}
> +
> +DEFINE_FREE(smc_args, void *, if (!IS_ERR_OR_NULL(_T)) smc_args_free(_T));
>   
>   int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>   		   enum qcom_scm_convention qcom_convention,
> @@ -155,7 +164,7 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>   	struct qcom_tzmem_pool *mempool = qcom_scm_get_tzmem_pool();
>   	int arglen = desc->arginfo & 0xf;
>   	int i, ret;
> -	void *args_virt __free(qcom_tzmem) = NULL;
> +	void *args_virt __free(smc_args) = NULL;
>   	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
>   	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
>   	u32 qcom_smccc_convention = (qcom_convention == SMC_CONVENTION_ARM_32) ?
> @@ -173,9 +182,20 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>   		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
>   
>   	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
> -		args_virt = qcom_tzmem_alloc(mempool,
> -					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
> -					     flag);
> +		/*
> +		 * Older platforms don't have an entry for SCM in device-tree
> +		 * and so no device is bound to the SCM driver. This means there
> +		 * is no struct device for the TZ Mem API. Fall back to
> +		 * kcalloc() on such platforms.
> +		 */
> +		if (mempool)
> +			args_virt = qcom_tzmem_alloc(
> +					mempool,
> +					SCM_SMC_N_EXT_ARGS * sizeof(u64),
> +					flag);
> +		else
> +			args_virt = kcalloc(SCM_SMC_N_EXT_ARGS, sizeof(u64),
> +					    flag);
>   		if (!args_virt)
>   			return -ENOMEM;
>   
>

Tested-by: Rudraksha Gupta <guptarud@gmail.com>


