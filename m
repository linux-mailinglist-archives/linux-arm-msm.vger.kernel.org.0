Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750F83E102E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 10:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237055AbhHEIXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 04:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbhHEIXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 04:23:23 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B923BC0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 01:23:08 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g30so5235217lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+e6CGQXxPMJe6R9jF7UtUP2EM2nwkAeOu++SZ0r1h48=;
        b=g9Fw9rp8HJt6YVrjbNKeYQ1cxVRtK7R5x5yue0bGcwObp8XT8wnN1ueN0WXsG0n46f
         hJtSGe20wDlez9DuciC9s+qlj4cmcdzZ+oVIymjn3Q3IQhU7zhoft9qfOpmHlSZYhIxJ
         jCN/BeTXg3D3L/XQuJdM3DSCT7/P3KFXDJcYKPza+o7lLDyn2iFtMQyThi6k1g749Go9
         pjt2FCuQ0EwfxacwyBIZvcZqGDT2MwhoULpYjSx0CfoCY6YYZFl9Fdp0l7mlN2eTpVCn
         h0IPLKTpJ0fMHtpT7TsyuuRGsE311a+5PgEy0+im9sj5WD1OOa+3+hKnyNEDVkQJ71Fz
         5btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+e6CGQXxPMJe6R9jF7UtUP2EM2nwkAeOu++SZ0r1h48=;
        b=IPQAKrDDMbIDNv3owkmZZVI+1T6eJBDvDXNzVgVInTcXtbMBi9KXth0nQI6GrNi1C2
         9KbwY/luubj6SeOVfspcoEUNt5BVTIlT8T632gtVveeaIhcjPWnOIt9dsKbggACHp8nT
         hxBYnHSGQ43+1nFlyrRGuyQNgIVedTBlrpAiuzurV1eBN/F5MxqpUwe/FW8M/51v1KsQ
         XhVrPjBaAm9IEkozo+LFNVbtCnD7EmehC1FrMEXlL01T4NijNnguptFPPYAd9/gKd5KC
         r9Lg2oTA4GCbVRyzZyLgwT0JwttJhLciFCUpnZ0NuHdm9JjbkjyEMbyXrc9UhJs6iVBd
         qWXw==
X-Gm-Message-State: AOAM531wpMpvijcNt1/NxELlYF9hFd5k4GMvR/jmNsSxge2/n/HKH+xm
        w5zrxO8nmO471SlgeS8MOcn5Zg==
X-Google-Smtp-Source: ABdhPJy/d8s2887ufCuc62214Nvv1BektY4zjKTu/arCogjXCRDEpuyLUIGwPdFqdI23mNRuLRdaqw==
X-Received: by 2002:ac2:569e:: with SMTP id 30mr2756171lfr.322.1628151787049;
        Thu, 05 Aug 2021 01:23:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w10sm440434lfa.66.2021.08.05.01.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 01:23:06 -0700 (PDT)
Subject: Re: [PATCH -next v2] drm/msm: Use list_move_tail instead of
 list_del/list_add_tail in msm_gem.c
To:     Baokun Li <libaokun1@huawei.com>, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     weiyongjun1@huawei.com, yuehaibing@huawei.com,
        yangjihong1@huawei.com, yukuai3@huawei.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210609072838.1369371-1-libaokun1@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <0ac0b93f-65f6-930b-a224-12ebf919ad9d@linaro.org>
Date:   Thu, 5 Aug 2021 11:23:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210609072838.1369371-1-libaokun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/06/2021 10:28, Baokun Li wrote:
> Using list_move_tail() instead of list_del() + list_add_tail() in msm_gem.c.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> V1->V2:
> 	CC mailist
> 
>   drivers/gpu/drm/msm/msm_gem.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 1865919368f2..5b7d63d3750a 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -854,8 +854,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
>   		mutex_lock(&priv->mm_lock);
>   		if (msm_obj->evictable)
>   			mark_unevictable(msm_obj);
> -		list_del(&msm_obj->mm_list);
> -		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> +		list_move_tail(&msm_obj->mm_list, &gpu->active_list);
>   		mutex_unlock(&priv->mm_lock);
>   	}
>   }
> 


-- 
With best wishes
Dmitry
