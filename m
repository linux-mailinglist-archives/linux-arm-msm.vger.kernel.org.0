Return-Path: <linux-arm-msm+bounces-21653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC78FB9C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 19:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6A5A282312
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463DB148820;
	Tue,  4 Jun 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+ujUwTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E12F145B15
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520592; cv=none; b=tNzdYS5R/obB4Hc65xngY7nYwgV4tAropooYH++eVEWhlwxp1YayT9VVe6axRTO4vtHMvD8Elb3kS6iyElJckj+OigKKED5psC8N0BOjvKXpSgeuIztokdXWEQivRV3Low9CUOH0d69cOwHKhoH0g9lX8WmQCXz9hTx2KNLxAks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520592; c=relaxed/simple;
	bh=fbN1yn1WXmD47S/yfZkaPl28JFLqrk+dTSapV7zB4iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GP5wXZzxD5NsdYaohobZNzwYrgw1z260tUPRpfRVKuJHrkheo7wdfJzdgQoi839GBpI/cAj2unUHGFpA05sqrbvYcd3XX7d29Qx53P5+d52nufZLVqUTsKe/RmWGgQj/cnVgVieFpaGIH8Nw013lLanF8fXO10GqTRA7tJRxSEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k+ujUwTU; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57a50fecbadso3851593a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717520589; x=1718125389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vT4NRPNeixA+G6MuIymamVECCUZ9IQFLGyEaqSpBSHg=;
        b=k+ujUwTUyHx0n4F2Rk414a49iZKZczaBvpvmjsA5urLP7xd6xBE3GqXFQmnUBbSxfA
         pg8ANbcEZASEC73haS+g2SkLAO3E34tQLFHVzP9xsOoCnbOLWmoz7P2U9f9xc5qTLMLl
         KtT2gwTMOb7fIf2NSvWzVJzaifVaz7VMPllge7z8D3mgULB1cIAp6pKoif7IdzfUdmm1
         Kg2HNrcQWImk0wg2P9BRx5fW3HwfkjMVmbceReP1Jfo4nPJTW3ySHpjxATLW8GLDNvHc
         vk2DJ3F8LFD7hNFFAcRgLzVF/uQnL/lSR+pnVA3ZwOUEht+ZaexnfNIoBkjNonvSnqLO
         Zk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520589; x=1718125389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vT4NRPNeixA+G6MuIymamVECCUZ9IQFLGyEaqSpBSHg=;
        b=E3n0IuM+KjZjtMTP1k9LQ6JcqYx4HWVTCY5i5g1wd7yRGNRNEyszhF2YgqJLzzpEuc
         FHx1KtMO/uf3oTt61EJhPSgTkDn9knetdVBd6WdR4QjTrjkROllJTJ0ZREYGSv2hCMYm
         JVpdyNT6dGPkZLfqqjp2e0WzKsl+7+IvrcIA9SxbR6qLykyed+3Y7PUSk+qtc3slgApE
         LHQG9kIgo6u7KiH7WGv/Gowy7Ok6898GAVPBCM8H3jjjzceTH7tzgtc1uR3MexhmvIVf
         3830iPfNYkIHpjL7F/XBM0hntLfQOqaE72xtzVtphR0UlmOHi9ee2B8CjQsMxgmx0AeL
         l/3Q==
X-Gm-Message-State: AOJu0YysncdVOvhI/px6QvuPOR5qle5Flmw5VlO0UX9PDIMBEhNRASwi
	4EH39sysGTuGbrD9EurcaOy83tnkg/WI9GR/rw7RsbxGYB22hLwyZMwD2aQfosv8wovfL7k23yl
	SmWg=
X-Google-Smtp-Source: AGHT+IEgWg2pjUKwHDa6bycaIJ0McqADKPUWZ9CMQ7XIFyoVyQxXnFBcVvb3dOZX9DbeyDkuE6usRA==
X-Received: by 2002:a50:8e07:0:b0:579:c393:82ad with SMTP id 4fb4d7f45d1cf-57a8bca2eabmr121356a12.30.1717520588716;
        Tue, 04 Jun 2024 10:03:08 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8? ([2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be7c04sm7774939a12.58.2024.06.04.10.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 10:03:08 -0700 (PDT)
Message-ID: <4a8a9984-efd4-4aaa-ba48-5ff6b641349c@linaro.org>
Date: Tue, 4 Jun 2024 19:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Print SQE fw version
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240604154846.500357-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240604154846.500357-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/4/24 17:48, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add the SQE fw version to dmesg and devcoredump.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 32 +++++++++++++++++++--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 ++
>   3 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 56bfb228808d..5a2a005003c8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -665,6 +665,32 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
>   	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
>   }
>   
> +static uint32_t get_ucode_version(const uint32_t *data)
> +{
> +	uint32_t version;
> +
> +	/* NOTE: compared to kgsl, we've already stripped off the first dword: */
> +	version = data[0];
> +
> +	if ((version & 0xf) != 0xa)
> +		return version;
> +
> +	version &= ~0xfff;
> +	return  version | ((data[2] & 0xfff000) >> 12);

double space

Some GENMASKy defines w/ FIELD_GET would be nice here..

[...]

>   
> +	DRM_DEV_INFO(&gpu->pdev->dev, "Have SQE version %03x\n", get_ucode_version(buf));


"SQE FW version: [...]" instead?

> +
>   	/* A7xx is safe! */
>   	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
>   		return true;
> @@ -714,7 +742,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>   		}
>   
>   		DRM_DEV_ERROR(&gpu->pdev->dev,
> -			"a630 SQE ucode is too old. Have version %x need at least %x\n",
> +			"a630 SQE ucode is too old. Have version %03x need at least %03x\n",
>   			buf[0] & 0xfff, 0x190);

This func should probably get updated to use the new getter too,
getting rid of magic masks for e.g.

if (FIELD_GET(SQE_FW_MINMAJ, ver) > 0x190)
	foobarbaz

Konrad

