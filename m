Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08AF0670E96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 01:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjARA0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 19:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjARAZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 19:25:39 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245AD3E083
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 15:46:08 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id s3so9225717edd.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 15:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ivxc3QWlvi/34NDoiDipvk7WlR095YUmLRSgpjmtuM8=;
        b=NCq8Uvo1feByLFtkheaQ4X66U1Cy1r8DReGTkf/ZbxL4bBXXZeRUBlUBFMN1HMPWOC
         ff/47e8FXesF6I7xllyFYJSv+xwvoN8GOGWP4ojENO/vXKsfAf89mcz9GIcMiBidAYVE
         pwkPgTgIZ0QLlDGymP0WcxrOvUyHYLHzCktZyfaZgoVryqFraoUhZceXtm+Bmdby1/Io
         hloKTrRqt1ohuPK+kQzRFKu5WerPj+0WVsDUyoxKJPNn3blyPkCaTb+mTCzZXtaZX616
         K4vT6At73yqqfo/eMV1YMIHC3c3crhNc2t1/OVc+Ao2eBNHb/xLwh22zTcSa6WbFuX4G
         jzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ivxc3QWlvi/34NDoiDipvk7WlR095YUmLRSgpjmtuM8=;
        b=XQCJsRdQ4OL3sRhOqcVHjb3vFyDMwo0RlvGWAh3QzffZn77fehmk8pgl4IK63ks++Y
         sMvdg61I14/nUc6GslxRQai5/iUECNxloZpHtHzojvhU9iqLlJlcQw9RgjZQndD6mmKf
         M5byEk2QUTCD9uO3oUzSFSVswO7BuhJbZjTqlIZBQNIp90K6mLW0pcSk4FXLlRMf72rw
         I79+HI+ckWwTMCmkshRauWsHobJMu2WU1nRz0azZkxhgbYkGkxr8msh4NHgjwCBP9pQS
         DAoGfBShIwGUfxQ/22zWENDDf1iW8JMjh1h/YkQj8yWRT1bP2CCoXbarl7oyErrdxl1g
         Ss/A==
X-Gm-Message-State: AFqh2kqnIUHjeCSoOFacltHKd3eQ/gAile4D7JXo0pg+iqtI/SmBiAb3
        k4uLBwnUP4vA5FoMsI4eT9+8fg==
X-Google-Smtp-Source: AMrXdXuObqZU0bK3Vnix8EIj/qDEwnB5l3rVT1F3Gd73CslZceRiVTz5x8/mQEjPSPrI8hpUYUSsAg==
X-Received: by 2002:a05:6402:f20:b0:499:b672:ee3a with SMTP id i32-20020a0564020f2000b00499b672ee3amr5665776eda.12.1673999167255;
        Tue, 17 Jan 2023 15:46:07 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r14-20020aa7cb8e000000b00499b6b50419sm10380954edt.11.2023.01.17.15.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 15:46:06 -0800 (PST)
Message-ID: <06291416-fb69-2f1d-2d46-9f30d2151ae5@linaro.org>
Date:   Wed, 18 Jan 2023 01:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/5] drm/msm: Fix IS_ERR() vs NULL check in
 a5xx_submit_in_rb()
Content-Language: en-GB
To:     Gaosheng Cui <cuigaosheng1@huawei.com>, james.qian.wang@arm.com,
        liviu.dudau@arm.com, mihail.atanassov@arm.com,
        brian.starkey@arm.com, airlied@gmail.com, daniel@ffwll.ch,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
        mripard@kernel.org, vladimir.lypak@gmail.com,
        quic_akhilpo@quicinc.com, dianders@chromium.org, olvaffe@gmail.com,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
 <20221110094445.2930509-3-cuigaosheng1@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221110094445.2930509-3-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/11/2022 11:44, Gaosheng Cui wrote:
> The msm_gem_get_vaddr() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.
> 
> Fixes: 6a8bd08d0465 ("drm/msm: add sudo flag to submit ioctl")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 3c537c0016fa..0abc802e8d5f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -89,7 +89,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>   			 * since we've already mapped it once in
>   			 * submit_reloc()
>   			 */
> -			if (WARN_ON(!ptr))
> +			if (WARN_ON(IS_ERR(ptr)))
>   				return;
>   
>   			for (i = 0; i < dwords; i++) {

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

