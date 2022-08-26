Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 721C55A24B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245456AbiHZJnd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiHZJnc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:43:32 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463A4D4BCD
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:43:31 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id w22so1052377ljg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+lqDjb0qBgeqnkEqJaLG27x7N3wtLO3gCVuMcmo3TBw=;
        b=VhxJOtjjqS32cws+7S6MknCuthUPbEFAM8r54Og1meOmNOF5aLgq+CDq6b6oHJv0wz
         QVjTQgDiLo99fHiCA1l9RbuoSugkVrj4tm4rQdNo6iH8nv8T0YtwZz2944Ouuex4twr3
         r49e+nez32HZCyhRn1NuMHD0UtltpqlFfa7TQJIH5G9S2qwqg9FRtWkzu43i8gP9//rJ
         inkrP8pAQZJZpI/sHBVb5zaYmW3+uDHlDyz96Mq48JAZJOMp5TnmHZRtOXLstbqdnY9Q
         nd1nhPbLPsAwKAdyzAR8Wv88RDl5dibLpYwgH3RDoKvfBX/7MXf5F2gkdMl3BsPGjU2f
         srxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+lqDjb0qBgeqnkEqJaLG27x7N3wtLO3gCVuMcmo3TBw=;
        b=5L8yqDJVk9CR6gjS1yxznzBjWFOYnVJ4vlEUoL/I6BbYSEsYTdo2kODgyEvCpUVH1e
         CCoY5C24DAjCMqZJaltWHp48zutgujUW+Xd633Dc15SAJVPB3l9BjY3oWeHenhMGkwCF
         lA0q3JEXwOpOewCMHP/JBPK1PlrdEukZTznyLlvjj9urYuXkDGSb0Ga3+2zPGV4oZ5xj
         uy1i7bHbV88feju05fY6rsSg1tsOulnB4LLPMVIb21+DUfPp+FMRxDX6fCWtu/xNl74P
         zzVbsQBi5SGguPmoUna2eYG7m1IF8ywnKUUoTIg2gDIsQekCpRFt1h/OyOpkx1V8732S
         48DQ==
X-Gm-Message-State: ACgBeo14aF/2wrUeJ2Rxmvz3Vbg/Kf+nPWHU67p8n35QSxJ+dfG0+0uv
        UZw58WIPzeFa9dpgtFSLh6lG5g==
X-Google-Smtp-Source: AA6agR60mdKAFt3fcZSOqh0nQB0mBgQpUkcT+i+VJYGcCuzDHjy0Ta+/PXxV5E04Iyz2oJx0T+2haw==
X-Received: by 2002:a2e:b602:0:b0:261:e4a6:8c89 with SMTP id r2-20020a2eb602000000b00261e4a68c89mr2163985ljn.354.1661507009617;
        Fri, 26 Aug 2022 02:43:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x7-20020a056512078700b0048b0aa2f87csm321710lfr.181.2022.08.26.02.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:43:29 -0700 (PDT)
Message-ID: <658faa4e-ad16-7b13-87f3-27ea91db4ba3@linaro.org>
Date:   Fri, 26 Aug 2022 12:43:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm: fix repeated words in comments
Content-Language: en-GB
To:     Jilin Yuan <yuanjilin@cdjrlc.com>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220823115409.46653-1-yuanjilin@cdjrlc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220823115409.46653-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/08/2022 14:54, Jilin Yuan wrote:
>   Delete the redundant word 'one'.

The whitespace is unnecessary.

> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")


> ---
>   drivers/gpu/drm/msm/msm_gem.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index c75d3b879a53..e300c70e8904 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -118,7 +118,7 @@ struct msm_gem_object {
>   	 * An object is either:
>   	 *  inactive - on priv->inactive_dontneed or priv->inactive_willneed
>   	 *     (depending on purgeability status)
> -	 *  active   - on one one of the gpu's active_list..  well, at
> +	 *  active   - on one of the gpu's active_list..  well, at
>   	 *     least for now we don't have (I don't think) hw sync between
>   	 *     2d and 3d one devices which have both, meaning we need to
>   	 *     block on submit if a bo is already on other ring

-- 
With best wishes
Dmitry

