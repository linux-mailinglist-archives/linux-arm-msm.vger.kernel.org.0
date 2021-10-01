Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48EA241F777
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 00:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhJAWhv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 18:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhJAWhu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 18:37:50 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C09C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 15:36:05 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y26so44394859lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XXgMIfOKyq97KypYEc7j/J6+r5ZXueX7YTNTMv8Ua2k=;
        b=GP6c6KY/Hlx3hOXso9m3i2E+F1E0V2AdrpKUg8AEQxKtOaY+FO58/XnO0SKfPDMHr8
         iw+SY3OJmPMlUpQXaXWLKiprCx1hAZotQVTx82SdjQzQ1yy3jU1k/2bKNoSGNCVcQxoy
         zX3f1jIyTnXX4WW7L7D5qoP/YqCjZuo2ZbkpENj+Mdj9pZRgxgSMKMNNoaqVB8gXNXkZ
         FgwyFwAowACaKNNE6fyqzDpJVfaxn3AZzdA6K1pyzmFYNvu04m6Kev5k2MR/Uny1e/AW
         8u2TBcePVhtki9Qk+gsuNFQ/r7pvLwuDMOEfJxdrovAdX7y9QMlcntbhven5PDXzvbtk
         7yyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XXgMIfOKyq97KypYEc7j/J6+r5ZXueX7YTNTMv8Ua2k=;
        b=jxxrd6kSUAoaKZO/UhcGagZtMSSda2et1rP8lLetJ1e7zmz+HyCG1j9vQmYsz1TwLs
         LevHgGWMsaIepIM6digkWcSD2eSPML7wH8AvGKSpZwAUeCTBm1jG9PqxomWUnmY4uD+2
         +p3fAL52mMxDVaTuapCzWD/afxuEJZLso8hDReWh+FXIyJH0QUxiANGC+OpoGWG3MHUK
         6bMJGKXfZ70tPUCOd0BVLNG9FB6OcEBiztlLBAhQP+yybKSPrdKS3tnzWeMSey7L4x8a
         IAMVn5m84bjcNIwUHvTj3sQRByR6ANW68CtDJdC9JUWGWYpcLOTifuIQ9+SE0liocBGU
         4i+Q==
X-Gm-Message-State: AOAM530moGvSdHSJQbOT8EeJ2jjKzVvj2M91MMxm9lgS8L01JItkAnqx
        rM9r3VZ/oOzsfgxR96p2UPoReQ==
X-Google-Smtp-Source: ABdhPJxb7u6Y72mC3hsrEjK2CqiCaMW9Htd0Rk6JXyKdn/qJV4B/VmKbc09lODoXSU7xTEWIygYjXw==
X-Received: by 2002:a05:651c:150b:: with SMTP id e11mr509102ljf.289.1633127763821;
        Fri, 01 Oct 2021 15:36:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x15sm584308lfe.129.2021.10.01.15.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 15:36:03 -0700 (PDT)
Subject: Re: [PATCH v2] drm: msm: adreno_gpu.c: Add and use pr_fmt(fmt)
To:     zhaoxiao <zhaoxiao@uniontech.com>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc:     jordan@cosmicpenguin.net, saiprakash.ranjan@codeaurora.org,
        jonathan@marek.ca, airlied@redhat.com, smasetty@codeaurora.org,
        konrad.dybcio@somainline.org, akhilpo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210826022316.9559-1-zhaoxiao@uniontech.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d41c34c1-cb22-25a0-2bd1-49f1ea177c21@linaro.org>
Date:   Sat, 2 Oct 2021 01:36:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210826022316.9559-1-zhaoxiao@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/08/2021 05:23, zhaoxiao wrote:
> Use a more common logging style.
> 
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Your subject tells about pr_fmt(), while the patch itself changs 
printk()s to pr_info(). Could you please fix the commit subject and 
expand/correct commit message?

> ---
> v2:Remove the line: #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>     drivers/gpu/drm/msm/adreno/adreno_gpu.c:23:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
>     #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>             ^
>     include/linux/printk.h:348:9: note: previous definition is here
>     #define pr_fmt(fmt) fmt
> 
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 9f5a30234b33..f10e9e04c13b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -753,7 +753,7 @@ void adreno_dump_info(struct msm_gpu *gpu)
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	int i;
>   
> -	printk("revision: %d (%d.%d.%d.%d)\n",
> +	pr_info("revision: %d (%d.%d.%d.%d)\n",
>   			adreno_gpu->info->revn, adreno_gpu->rev.core,
>   			adreno_gpu->rev.major, adreno_gpu->rev.minor,
>   			adreno_gpu->rev.patchid);
> @@ -761,12 +761,12 @@ void adreno_dump_info(struct msm_gpu *gpu)
>   	for (i = 0; i < gpu->nr_rings; i++) {
>   		struct msm_ringbuffer *ring = gpu->rb[i];
>   
> -		printk("rb %d: fence:    %d/%d\n", i,
> +		pr_info("rb %d: fence:    %d/%d\n", i,
>   			ring->memptrs->fence,
>   			ring->seqno);
>   
> -		printk("rptr:     %d\n", get_rptr(adreno_gpu, ring));
> -		printk("rb wptr:  %d\n", get_wptr(ring));
> +		pr_info("rptr:     %d\n", get_rptr(adreno_gpu, ring));
> +		pr_info("rb wptr:  %d\n", get_wptr(ring));
>   	}
>   }
>   
> @@ -780,7 +780,7 @@ void adreno_dump(struct msm_gpu *gpu)
>   		return;
>   
>   	/* dump these out in a form that can be parsed by demsm: */
> -	printk("IO:region %s 00000000 00020000\n", gpu->name);
> +	pr_info("IO:region %s 00000000 00020000\n", gpu->name);
>   	for (i = 0; adreno_gpu->registers[i] != ~0; i += 2) {
>   		uint32_t start = adreno_gpu->registers[i];
>   		uint32_t end   = adreno_gpu->registers[i+1];
> @@ -788,7 +788,7 @@ void adreno_dump(struct msm_gpu *gpu)
>   
>   		for (addr = start; addr <= end; addr++) {
>   			uint32_t val = gpu_read(gpu, addr);
> -			printk("IO:R %08x %08x\n", addr<<2, val);
> +			pr_info("IO:R %08x %08x\n", addr<<2, val);
>   		}
>   	}
>   }
> 


-- 
With best wishes
Dmitry
