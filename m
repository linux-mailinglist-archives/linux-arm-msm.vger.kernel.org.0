Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A4969B417
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 21:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjBQUlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 15:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjBQUlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 15:41:49 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB644C3E1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 12:41:47 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a18so2404672ljp.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 12:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NWLQ8GhGWTeecUq7rQpF0zTEqtX/Q2r4EBkdCAJ/NY=;
        b=NE9m1H/AGgL//qsJkO+ByH6tqTtVR42pjXc9IVl8lqPcRh3RJ+ZAP2lFaq8hbk6IyQ
         iMmsok4R+sC3mkPBhkKXJZbUWGwraNbmQm0xk0IJt6SpBn1eBk4shpuFc5eUMcn+sCbb
         zKSS0fe368bl11dU7IP8EbOT9Pp9Wh0Vt+4k73hupwPeUjRLOkJ+6fWtf9lS+wMM9VF6
         qOTLIGpYIGkvghnQbPqyDus6/0EO2RKjIWw4TK4vxqjug8lwPlEWtCy6Ou7QRn4wA8su
         yfhtgLDRnWXipoLExBaMyjp3ruD7Vz3rX1uQfyHNntdEHrzRZuI7a5n8FZ0h0JBLLeuw
         FMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NWLQ8GhGWTeecUq7rQpF0zTEqtX/Q2r4EBkdCAJ/NY=;
        b=sTfE7x6KYq4tUITEn8zQW1bnUr50W70deJ9nTGm3v6xHtOxCGkRQyPSfEvKkbbXGUb
         zLsRdaKqtsANrq00pc3rLST2Varfxa6Jd6xn4/JDDrv3UWC3d79CceVoSWWopKPQdsky
         utDOu1HkE3xdRIIvAhIjKGO6EzngkYtDtaxmcWDM1xf+cFrH1SEpoo6ZuDILySe2Ip+J
         sADR06KzOZzBrXrIIG/vuCzv5W8RG3Qz2doiHu+NDGMZNu6/wVtkn5vddG9WqKlihV32
         ASDOrAShL7T19B1yEn/qAZqF9Z6IBdXxjbZKQpYGua8FlOgdeYZk8tXJjUM0GeDoH2y7
         0GHw==
X-Gm-Message-State: AO0yUKWPSt9UC6oLLTdOZJjFtSdX/aIjuBJmEzQxfNLtTK9pxuGCQlOB
        ihybGgKRZOO5V9jyEMFP4X14JbJvaeYVZS8v
X-Google-Smtp-Source: AK7set+knfCs4nq/e+nlnXVCaOsj4lwGcn0SZczvY3CyVumuwNyrXb6I3mKnGCs8f46nYntdx7yAXw==
X-Received: by 2002:a2e:b803:0:b0:293:51d2:1a70 with SMTP id u3-20020a2eb803000000b0029351d21a70mr641034ljo.0.1676666506034;
        Fri, 17 Feb 2023 12:41:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w2-20020a19c502000000b004cc99cd94basm769138lfe.113.2023.02.17.12.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 12:41:45 -0800 (PST)
Message-ID: <aaf19c87-0761-a108-af4c-c6ec6f75691c@linaro.org>
Date:   Fri, 17 Feb 2023 22:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 01/14] drm/msm/a6xx: De-staticize sptprac en/disable
 functions
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-2-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2023 19:31, Konrad Dybcio wrote:
> These two will be reused by at least A619_holi in the non-gmu
> paths. De-staticize them to make it possible.

Nit: 'remove static annotation' or something like that.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index f3c9600221d4..90e636dcdd5b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>   }
>   
>   /* Enable CPU control of SPTP power power collapse */
> -static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
> +int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>   {
>   	int ret;
>   	u32 val;
> @@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>   }
>   
>   /* Disable CPU control of SPTP power power collapse */
> -static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
> +void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
>   {
>   	u32 val;
>   	int ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index e034935b3986..ec28abdd327b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -186,5 +186,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
>   
>   bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
>   bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
> +void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
> +int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
>   
>   #endif

-- 
With best wishes
Dmitry

