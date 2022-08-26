Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701715A24C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344010AbiHZJpP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243491AbiHZJpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:45:13 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F67A19293
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:45:12 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bt10so1319602lfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=MRX0Q3WFNIyiJmZ3N40sithEPWIDpqa2XOG7FbBr3D0=;
        b=DdKZMvLy1XEM5WRjVugHdAX4mR9xI5f62NbewhpZWwoafdfHcdoAXDVc/YrZbu23kD
         MM8Lc0U7QhsaSQLgsaE6/7OTRqvm2h+9oL/UYC13P3tPufMFH7nNH1bVIm4J2PD+w2SA
         BgFEkxo+COMALZs9JP45pQNhm2DFWt6K1Y/1NeoLzu8EJCVobi/SSPH2mgCxcQnyRtNY
         L7C2TQPU6ELdcqIwaWdN72y+HtR3S3wy/lnDxN+jerJV7CRJ+tIJXcPFsCWgsv7VDA3D
         wezhM8uUvafqGDIjlgv/aM9A4xtPmK7BXitVAMfuL29zZndhA+xRJ8jT9QcsP/hN0gAz
         4+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=MRX0Q3WFNIyiJmZ3N40sithEPWIDpqa2XOG7FbBr3D0=;
        b=EvpJALrXu9eVOwFBz9kByihTLd6lf902uRN3uk7osMkfWTyapMIwmFC9vy/mq3Ecrp
         aM6w6RdRAxyCDc9MRz37m7hGSVHZisOo8nCc1UdAvx1RB3OvrTeygzxRurEm52Gze1aj
         GAbe7IPVlWCNa59axpvLMJ4L7I9I25E6bmY+OpWFtoQudsRy5jR8ZkSU+VMKJ531RqjF
         byrnSjAnxcyK6dsAAw8G36W81z5Iu57q8OvDSiZHxbYxmN5O41BIBK8nQhYLXko97rk/
         /uVsrdc+7axQSIWUZeUg7wPCCIGHvukCsdbdkN0embq83qvxSrw+I3pIVZqJJPH7xsOp
         HdlQ==
X-Gm-Message-State: ACgBeo0Jyuh+tPe+1dOdLhnnLfh6uJwqNvYSGDthFZ5RUJyIjMwGhi4I
        ZkYhWDXpM1MswGxHf7/nDcFu/g==
X-Google-Smtp-Source: AA6agR5grWoSeTNkOaTdkov5yXG2RspFnS/8kO38DF7QXqH412ouT7J2ahv8u3r5wPWv5QcnQ30ghg==
X-Received: by 2002:a05:6512:2629:b0:492:b1e7:bf26 with SMTP id bt41-20020a056512262900b00492b1e7bf26mr2092332lfb.254.1661507110668;
        Fri, 26 Aug 2022 02:45:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be28-20020a05651c171c00b0025e72aae6bdsm399882ljb.28.2022.08.26.02.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:45:10 -0700 (PDT)
Message-ID: <0e16e719-4eb2-bfb3-6b77-88d5314757a1@linaro.org>
Date:   Fri, 26 Aug 2022 12:45:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] msm/adreno: fix repeated words in comments
Content-Language: en-GB
To:     wangjianli <wangjianli@cdjrlc.com>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, wangqing@vivo.com, dan.carpenter@oracle.com,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220724073650.16460-1-wangjianli@cdjrlc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220724073650.16460-1-wangjianli@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2022 10:36, wangjianli wrote:
>   Delete the redundant word 'in'.

Could you please:
- adjust the commit subject to follow the rest of commit messages,
- drop the extra whitespace at the beginning of the commit message,
- add a correct Fixes tag.

Thank you

> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 9f76f5b15759..9303a011b81d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1277,7 +1277,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>   		}
>   
>   		/*
> -		 * Look for a level in in the secondary list that matches. If
> +		 * Look for a level in the secondary list that matches. If
>   		 * nothing fits, use the maximum non zero vote
>   		 */
>   

-- 
With best wishes
Dmitry

