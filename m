Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D20421A891
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 22:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgGIUFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 16:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgGIUFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 16:05:47 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74ECCC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 13:05:47 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id t11so1551564qvk.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 13:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PycHeytyEXnAfxuN7qqf3DZk4rAs+Sr/OQVpihKvwZY=;
        b=AhNQ3fbwpzkEIcm+5ODN2ebHaNffsSaihE9J64OOIAKCSrPOSi8UTKlTBg+IOFXo9t
         5bjjk0weUCuGjLom8mO3n25mxkCZmksLojflbh+6QCihWuuzCh0ut7Do9/4MUH9uccBR
         bBPDd5Twd+Cbygxijcpwr3A11Rjp0BYBxDFWkVNH+XYp6OstTJeK2RnMGDUNmPdn9/pC
         C5py86ce/WHUUfwQNnkMrv0D5p/H4i/o21HHeP9NzG5bCDisxZgP7a9fEfN1lP29epEn
         E5qBcFQSAVhLpxnKd+CBvjfwNG6AgFsvOtC7UZuWlI5TTwoOj9pJVUXPhZS7mVHl0uAX
         sd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PycHeytyEXnAfxuN7qqf3DZk4rAs+Sr/OQVpihKvwZY=;
        b=L8mGLthALNAzaPKCg6NkROxy7yGqZuhKlFF5oWXtPNiHZZakqH05fsXTOYTN98Flog
         wgkpdMpfB5DUTHdjaWvZBDaOXQ3eGMn3cbx87ferv5zEfMQneP+M7UTnRQUPfCxrxVAG
         ettlKod2WvunGnzYZ4pSIa6yEXoefBsZbF3fE5PdYnSOb9URV5H+oFYHqGzYPlRrxxxq
         RPTE1K02/UL1zOZ+oPRMb5tHoWsNwOPmLBLFLqtyt8iAgddzgcNEABaMgpEAwgzkATSo
         QAJnjCLkH5BGmoMkKnb9efl37j0jGfCIA2UDKKmlj5fgSqofMJWvTXMh/4KLmCtezqDV
         We0g==
X-Gm-Message-State: AOAM530FfWHfEqBGehrh5ifHY0qLNJRXM4JZZc7QzxN51dRq93tXm8As
        9dCFo2ngHuLXmvQix/CrxifgLw==
X-Google-Smtp-Source: ABdhPJxcQip3en72uHZuZNYNwMWZgp8T1yNScrJF7eAeMu6gqoKUSdmJo+0p2Tl8FLdWhxkvOaeMpQ==
X-Received: by 2002:a0c:fa84:: with SMTP id o4mr64584468qvn.186.1594325146682;
        Thu, 09 Jul 2020 13:05:46 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id a185sm4702422qkg.3.2020.07.09.13.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 13:05:46 -0700 (PDT)
Subject: Re: [PATCH v4 3/7] drm: msm: a6xx: set gpu freq through hfi
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        smasetty@codeaurora.org, devicetree@vger.kernel.org,
        mka@chromium.org, saravanak@google.com, sibis@codeaurora.org,
        viresh.kumar@linaro.org
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
 <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <322c921f-7c8f-7052-b191-44f0dade742e@marek.ca>
Date:   Thu, 9 Jul 2020 16:04:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/9/20 4:00 PM, Akhil P Oommen wrote:
> Newer targets support changing gpu frequency through HFI. So
> use that wherever supported instead of the legacy method.
> 

It was already using HFI on newer targets. Don't break it in one commit 
then fix it in the next.

> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 233afea..b547339 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -121,6 +121,12 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>   		if (gpu_freq == gmu->gpu_freqs[perf_index])
>   			break;
>   
> +	if (!gmu->legacy) {
> +		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
> +		icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +		return;
> +	}
> +
>   	gmu->current_perf_index = perf_index;
>   	gmu->freq = gmu->gpu_freqs[perf_index];
>   
> @@ -893,10 +899,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>   	enable_irq(gmu->hfi_irq);
>   
>   	/* Set the GPU to the current freq */
> -	if (gmu->legacy)
> -		a6xx_gmu_set_initial_freq(gpu, gmu);
> -	else
> -		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
> +	a6xx_gmu_set_initial_freq(gpu, gmu);
>   
>   	/*
>   	 * "enable" the GX power domain which won't actually do anything but it
> 
