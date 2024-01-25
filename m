Return-Path: <linux-arm-msm+bounces-8345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7982F83CF10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6557F1C25A63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB46130E3C;
	Thu, 25 Jan 2024 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyuNyGFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E3013A277
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706219938; cv=none; b=UOSCwwtZmEGqXiieKldwPNcvPhXnDBUJW1hwBYRAMPZFukObBhf1gBHHUb+IFugxUZJBktAmCTV/2c1roIXyRgwQRb65/XdJNflNYY7+pc3AelUDiraVIjEnvG0nrRRmQzg0EuHVSfTl0kHvdtOoYzpgrA/VtbuDnF3mG2mw5o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706219938; c=relaxed/simple;
	bh=o+r97Ork5f8YJTeZ9boDsGM7+eSxv5mdtWmqbFieqo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJqB0zyQCxk9c1cg+FHllPUvi3dEBibn/7BdTlH3we7MVAlU696D5qclYvrTQ++hhsnFPOvyMZnSeULcWBJaLI23DldOtLRzveiBdO1lHvW8yfUtzAU8iPiQbpoGiSmLUSyKueUcYCVNE6cqkugFrzrBvctctJhNcVK6zdHhsqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WyuNyGFT; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5100cb64e7dso3863133e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706219935; x=1706824735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgSuxwGL+KbYV8Y0kD0MNceK2EXDJrHqnOsevOqfDUM=;
        b=WyuNyGFTg0bzyUf0a9nu1KavIWhEcMI3KGQzsJEEcymfTT52iKWKRfvyff4bxtEIdD
         kTHypcs+zxzPyc+qMNw2lM0pSv/k1DC3xQvoyru8yhD2ioU0SM/8PgZBOVGe2NjZBYW0
         kKy+j1pAgBI9CxwUg1ZQcTWIRu7shS8Y2yFaiSfRG9uXh2lykbDeFNO3VnN65+jY6vT6
         acMqMqylmSrgR0Yik/Ps6U5o5fH/GnZhJKSD2yrQdDzjSbunb+4S5Ux94pC6n2c1eKSa
         VNQTToRbBwe4Kryc9MdZyyfN0XRvBsKO0isaAKgM8A/t+toohNgk8jyVOwo2y0RM4SBF
         NPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706219935; x=1706824735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgSuxwGL+KbYV8Y0kD0MNceK2EXDJrHqnOsevOqfDUM=;
        b=HvD7vN9Gyr9E92p4Cy6YmpBJtTP9o2HH/HPOV6kvSXsZNHBPVojmEOWEnASY28c5Zy
         5BtJO/rei9UwE8M91AF8IU0HN+1QYaRl2r5kShY50Mnon7ZieU4Re9rINYj5XotepKhR
         TiynwBUeFT0CLtwnmyWbnHyHAESekZqisVi1BxNOSv+DT8r5p3JmlAGcO17rnEJJA2NQ
         HWzc2UO/XUWe7j+/TsuEr0Qba02LQnpU7ITclV+OWlhotRyhogq9AxtyB9yi0OE5SN2/
         hn/eFMWnsL0B2iLY1Lr7kT4Ny/tB2Ulz7fCCuimjoAG++TO1SKgBUlh3CJkU8PQVk3/H
         beXw==
X-Gm-Message-State: AOJu0Yw1qwpwe8+/86Ta0+Qu+1LMLUkKMOM2CJ0vhOa8AXJUx4AMcira
	cn4UvxXoxnlDSJLaFg8q35BqMLCO25D7vjFGu6m6qgW3ffsAZfqjeUgnjXgz5A8=
X-Google-Smtp-Source: AGHT+IHwZ9f2wn5TlyuXfQu5Ilu3+L0qqCLifkKmuXWnXsL44h7Y3OuVUeYvEQ0bHUK26NOih3rJrA==
X-Received: by 2002:a05:6512:249:b0:510:14cb:79d8 with SMTP id b9-20020a056512024900b0051014cb79d8mr143888lfo.79.1706219934702;
        Thu, 25 Jan 2024 13:58:54 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x18-20020a056512047200b005101b72b1ffsm302483lfd.117.2024.01.25.13.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:58:54 -0800 (PST)
Message-ID: <e587b3e3-aa0a-44d6-a860-253d337397e3@linaro.org>
Date: Thu, 25 Jan 2024 23:58:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] drm/msm/dpu: allow certain formats for CDM for DP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-16-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-16-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> CDM block supports formats other than H1V2 for DP. Since we are now
> adding support for CDM over DP, relax the checks to allow all other
> formats for DP other than H1V2.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> index e9cdc7934a499..9016b3ade6bc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> @@ -186,7 +186,7 @@ static int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
>   	dpu_hw_cdm_setup_cdwn(ctx, cdm);
>   
>   	if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
> -		if (fmt->chroma_sample != DPU_CHROMA_H1V2)
> +		if (fmt->chroma_sample == DPU_CHROMA_H1V2)
>   			return -EINVAL; /*unsupported format */

This means that the original check was incorrect. Please add 
corresponding Fixes tag and move to the top of the patchset.

>   		opmode = CDM_HDMI_PACK_OP_MODE_EN;
>   		opmode |= (fmt->chroma_sample << 1);

-- 
With best wishes
Dmitry


