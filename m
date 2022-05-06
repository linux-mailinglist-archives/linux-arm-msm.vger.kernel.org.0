Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC62151E138
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 23:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444543AbiEFVhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 17:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243753AbiEFVhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 17:37:45 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F4F6F4AC
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 14:34:01 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id p10so14619912lfa.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Hu54ovJHRyaSZ9Bj4QI31tKxj0E0gusmTA9CouWhVWs=;
        b=E6ubfehEot+x8OIJN5C7LyAh0NxnQYP+RE9/EESVDWl69ZQaV/yxIOwei4gYpMgp9u
         KYGp1mJ19wh4ZbLDI2xwgyR6S0de2pOwrp0ci37vT2JsSZgS2FeN3mfYUZEd/twNI0Uo
         8oUUsnFxi4/8IaLTiOMsbpepGLLSgZABHFSO/557vUiup9JZiPbmIE8FS4tcZePNQJEU
         KJq/NzyOxrQRZnztocLanqCG019/CrdaIDCj7/umEZYOSbLokeOvFfuTfjmE6SKhIJF1
         D4lRuJe51mSe7wTT6KFUmKGmltxmO0g+dsLrToFHKXgK0VVu9PAWaLeqzpi2g+gL5diJ
         h6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hu54ovJHRyaSZ9Bj4QI31tKxj0E0gusmTA9CouWhVWs=;
        b=8DzrwZm+Zg/JJ3DU18hkmGpuo885ttik4l4tehzSdGQRP6sRVT/j3F+ARjbT8hwz80
         JdjBxJ6yy9VD70SOtoAeETdhSl45CerLPar13bOnu5WamsHa3hFn4d5PQy5+E8JL6Pch
         9/fk6zUWdY7a3T+K9r3Q4S8pzGdDig+8Tj9mzd5qD+k1rHHsCJ4FQYpYGlpRU5tzqnIa
         btmdBu1B/P37VWlhb/7vyZtVKKO1P0BB1WmcD1aflm33TUKDyyl2bQBccEzKKvrx3qEO
         jX/Iiz/JfK+N0Y0QePYteShzVCDupWvb1FWemi0qacY0U0Pab85sAVZy+ju/WK+cBUj5
         PLfA==
X-Gm-Message-State: AOAM532mVTVsRBK7bCELL+xv+nPB80kkjmhL+V9uN5kVmrasEwiCvPm1
        oR1KFgNmyQVleKXzdHCOcvhedA==
X-Google-Smtp-Source: ABdhPJyIx7HcnaKtjeqHbF+57hQVC9kVqNcgwjcSjUaE5fY6FOVbRp1itaMTMdwdoIAzxxj0m6KmKw==
X-Received: by 2002:a05:6512:3b28:b0:473:b9ec:187e with SMTP id f40-20020a0565123b2800b00473b9ec187emr3774357lfv.536.1651872839945;
        Fri, 06 May 2022 14:33:59 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651211c800b0047255d211dfsm826080lfr.270.2022.05.06.14.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 14:33:59 -0700 (PDT)
Message-ID: <a78b160a-a173-41c3-0c9a-d7cb7244af98@linaro.org>
Date:   Sat, 7 May 2022 00:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm: return an error pointer in
 msm_gem_prime_get_sg_table()
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
References: <YnOmtS5tfENywR9m@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YnOmtS5tfENywR9m@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/05/2022 13:28, Dan Carpenter wrote:
> The msm_gem_prime_get_sg_table() needs to return error pointers on
> error.  This is called from drm_gem_map_dma_buf() and returning a
> NULL will lead to a crash in that function.
> 
> Fixes: ac45146733b0 ("drm/msm: fix msm_gem_prime_get_sg_table()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem_prime.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index e8f1b7a2ca9c..94ab705e9b8a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -17,7 +17,7 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>   	int npages = obj->size >> PAGE_SHIFT;
>   
>   	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
>   	return drm_prime_pages_to_sg(obj->dev, msm_obj->pages, npages);
>   }


-- 
With best wishes
Dmitry
