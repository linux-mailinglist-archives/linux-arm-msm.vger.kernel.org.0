Return-Path: <linux-arm-msm+bounces-69964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30160B2DBA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 178E6174716
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D132E36E6;
	Wed, 20 Aug 2025 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MRVfdeCK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8BE1E51F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690540; cv=none; b=re6B75wAdlti7bQq0CCScbkMZmz3F8kqxc53ct6Yq0L46bhEDEIHfyNpgw4GmCZNuZI9ZcqS0A7fUvgPZJFdx41CsJpos04b75Is3kTcCS453lZh3LSaCpAQAxkdNYdu9VfiIc9aWt+42SFLCb3XOL8e2kyFLGYCB1a6gUzRliM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690540; c=relaxed/simple;
	bh=Ur2PtnEjdCO2AWANEKmeCnsoDNWQXX7toc/InpKT2ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fp0nm3DQB6vsTXQLwVCByTP4arME6J36TnU8evpMUf3eT9a6OncXwy6dRqajtew4bnHsbWBp/EBGz2cxCZBK+LnsPYDMpcfnIOJjrvZDGLs/u3z70vVAqKhnvaBF6DBcvP1r0ruVVTRUxPmc7YqurQvfXb04IVarS4PqAxP5/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MRVfdeCK; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6188b73bef3so11571285a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755690537; x=1756295337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oKQnyKTUV8fZ2I7ZjE3MCBFAplyOUWR7CQ7FlJCIiqU=;
        b=MRVfdeCKamu6EMesETZ0rQSHRAhD9jmR4V/00Bv6XubgMO7jv1C8aj0PuGF8HVV6Jq
         HXcnAlrzD6FK0YhKAmTyaRzGshi/RHbxSszYn8IXjG3Ofej5JmBt4kUmxWlor81eprj3
         i4Q7yrWSaQwdlu0W93PoYj6Np8QkRkQ9dSWp6SNjQjgTPfxInesc+ltW+mdH6Q3yV9NO
         Bs8SH6VJE7ntcZ+DgL5WLLjuu8HbS70IpovxYqF8+8f9nw9S+39qmIREoXdQNVK5rwVr
         Z9wqU5vwII4+cp9slCq8w/qzyK0zde3x1FlrkNOCLh89Bcn/vrUz15hOhVFX7r1zV45y
         zh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755690537; x=1756295337;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oKQnyKTUV8fZ2I7ZjE3MCBFAplyOUWR7CQ7FlJCIiqU=;
        b=cbEA2O8D1W/kUFr65SxEfGpPJ5Nmt2+UQwpTOPuoCTMo/ZbokDbwkcJcJWa5yxowqm
         r2JPXc8VSKctFgKNqHEYrqQ0A9HNWhripFDsVUnZcT9BuS3J3hG1mW5JtmsjAKWzpU1g
         Lz221M1uo2EQe0880pPlVCTi4U6ejIUQg+u4E5C+1MEs9qVGUdIrNqqI1u0MWWU+wxIL
         xlLAf0Ihh/VGfYxHgy7lun89kwA87eWg/I4YP2bRf3pdeZre+X0nlmEEOduSqSB0vCED
         wsvMVg5zInrD6aGuobxzc4BKt8CrGYkhpF/mPLwK/pd0TxL+dkljnxsXvi8oj8dC/IoP
         kb9g==
X-Forwarded-Encrypted: i=1; AJvYcCXlntDAnV7KDjIBKKhazQPrhxsRigRij5nTU8HlP8S78BbSSCPxVouhBRvt4Q3QqJpZdMo42Mo7vM1QK4Ur@vger.kernel.org
X-Gm-Message-State: AOJu0YxNyhzr7pOjtwzC0nL8Fumbqvyi8gGHh3GnP9I7yjzpxLKW1Yeg
	h1QukMirKaYL5BLVG3l8t0pNtLlTiYp2o+vLhy/uuLWIxBO+hQISRYKC2yovYRGVHHU=
X-Gm-Gg: ASbGncuVeNygR2MUs5+kpGjMEky+vUkdKQ4SePjxob83Lww3Q2FaSWG6meRUU44AJtD
	eMK8PW3C6Bp1LQfIm2KaY5EnYhPKu4VzmSo9hyqfBGkZCA47BFFRIdztBOzRXKV8E4KZi80ybjE
	KJed19mHTAmSd6ar+JknYqC8tbD62PASi/ZSPOXLy05/8TMqZCbaB1dyp2nkkOIKyWogPM4BGG8
	bs8NSpIf9EYh3S+3tAstn1ixXHSFKNixFW5rwgSlLEos603ROKR8ZCuk4YS93HqtMS4ivvmW86y
	VQkq+xsXKEX7jIk1Of7UnVnCanB7PY0yIL1xgAuTFgjnfUhXtEmjAbpgfjpFwzx9pwVrwF4DdH3
	yebn2SB56M0/jW3gc6iM/ouszxVopbAFhZx4KPA5EhGxbXezIHL179YGRHo5xMGI=
X-Google-Smtp-Source: AGHT+IFXB9ifQgnia7Vr9YjH5EEe9FNqq1rPflzG82G56ljPGXhRGo0c75JH6Cotm/rGzsChagXmHw==
X-Received: by 2002:a05:6402:34d3:b0:615:ac6c:7ea6 with SMTP id 4fb4d7f45d1cf-61a97624cc1mr2109562a12.24.1755690536980;
        Wed, 20 Aug 2025 04:48:56 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a7579f799sm3299893a12.47.2025.08.20.04.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:48:56 -0700 (PDT)
Message-ID: <ea769342-4d0e-497b-bee9-ed761401b63c@linaro.org>
Date: Wed, 20 Aug 2025 12:48:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain this context until
> authentication and reset, while non-remoteproc subsystems (e.g., video,
> graphics) do not require it.
> 
> Add context aware qcom_mdt_pas_load() function which uses context
> returned from qcom_scm_pas_ctx_init() and use it till subsystems
> is out of set. This will also help in unifying the API used by
> remoteproc and non-remoteproc subsystems drivers.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> If this approach is preferred, will convert all subsystem drivers to use the
> same set of API's using context and completely get away with qcom_mdt_load()
> 
> -Mukesh
> 
>   drivers/remoteproc/qcom_q6v5_pas.c  | 53 ++++++++++++++---------------
>   drivers/soc/qcom/mdt_loader.c       | 26 ++++++++++----
>   include/linux/soc/qcom/mdt_loader.h | 22 ++++++------
>   3 files changed, 56 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 55a7da801183..e376c0338576 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -115,8 +115,8 @@ struct qcom_pas {
>   	struct qcom_rproc_ssr ssr_subdev;
>   	struct qcom_sysmon *sysmon;
>   
> -	struct qcom_scm_pas_metadata pas_metadata;
> -	struct qcom_scm_pas_metadata dtb_pas_metadata;
> +	struct qcom_scm_pas_ctx *pas_ctx;
> +	struct qcom_scm_pas_ctx *dtb_pas_ctx;
>   };
>   
>   static void qcom_pas_segment_dump(struct rproc *rproc,
> @@ -209,9 +209,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>   	 * auth_and_reset() was successful, but in other cases clean it up
>   	 * here.
>   	 */
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
>   
>   	return 0;
>   }
> @@ -235,15 +235,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>   			return ret;
>   		}
>   
> -		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					pas->dtb_pas_id, pas->dtb_mem_phys,
> -					&pas->dtb_pas_metadata);
> -		if (ret)
> -			goto release_dtb_firmware;
> -
> -		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					    pas->dtb_mem_region, pas->dtb_mem_phys,
> -					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware, pas->dtb_firmware_name,
> +					pas->dtb_mem_region, &pas->dtb_mem_reloc);
>   		if (ret)
>   			goto release_dtb_metadata;
>   	}
> @@ -251,9 +244,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>   	return 0;
>   
>   release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> -
> -release_dtb_firmware:
> +	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
>   	release_firmware(pas->dtb_firmware);
>   
>   	return ret;
> @@ -301,14 +292,8 @@ static int qcom_pas_start(struct rproc *rproc)
>   		}
>   	}
>   
> -	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
> -				pas->mem_phys, &pas->pas_metadata);
> -	if (ret)
> -		goto disable_px_supply;
> -
> -	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
> -				    pas->mem_region, pas->mem_phys, pas->mem_size,
> -				    &pas->mem_reloc);
> +	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
> +				pas->mem_region, &pas->dtb_mem_reloc);
>   	if (ret)
>   		goto release_pas_metadata;
>   
> @@ -328,9 +313,9 @@ static int qcom_pas_start(struct rproc *rproc)
>   		goto release_pas_metadata;
>   	}
>   
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
>   
>   	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>   	pas->firmware = NULL;
> @@ -338,9 +323,9 @@ static int qcom_pas_start(struct rproc *rproc)
>   	return 0;
>   
>   release_pas_metadata:
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
>   disable_px_supply:
>   	if (pas->px_supply)
>   		regulator_disable(pas->px_supply);
> @@ -774,6 +759,18 @@ static int qcom_pas_probe(struct platform_device *pdev)
>   	}
>   
>   	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> +
> +	pas->pas_ctx = qcom_scm_pas_ctx_init(pas->dev, pas->pas_id, pas->mem_phys,
> +					     pas->mem_size, true);
> +	if (!pas->pas_ctx)
> +		goto remove_ssr_sysmon;

this function already returns -ENOMEM you don't set ret to any 
particular value so if qcom_scm_pas_ctx_init() returned NULL, you would 
exit your probe function here "error out" with returning ret = 0

Please ERR_PTR() in qcom_scm_pas_ctx_init() and return the error up the 
call stack via your remove_ssr_sysmon jump label.

---
bod

