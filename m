Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8C569B48B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 22:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjBQVUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 16:20:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjBQVT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 16:19:59 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297B65FC47
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:19:58 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id i13so3377974lfe.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPa4zpKK9LMhVGjvMfR207w96ZbhPR+KevF5Kn6aqmE=;
        b=uKHb9GXrSgVAJfC4sLtp+TmdgFeeR9kYhPn7U6jZ6Z3ZzeLYVy05ogltF0Voigkf8n
         dTap3IwJ+ZOWZujr/WjR0tO83QDVH+d+DiKhqZYHOkBlMdLG0DYF4T0tUZ2d9Y+ysbWl
         F4hXQ2halCA+tjFyw3ioGxJJP+gBWxYNIzM2VcdO3HB/NzkYaHp6q4mATyhANatjB9zm
         mPbo2fi1KFi3MkFHs6j4Iq3+iSlO+vUfZywbRbdPZ2SPZtDD/ckG+X6VO9f+oxnesjBB
         WKQ3MWL4BACdLpZX6bLH7VVXqiYM+Vw6dArsGpdtJ1d6qnyrXlH5h9ehl2ppY8danPX8
         OOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPa4zpKK9LMhVGjvMfR207w96ZbhPR+KevF5Kn6aqmE=;
        b=a2CwI4yrtyR8T+MPHHF7XhvjdRHEnFbPfKP7dvX9Hgufw763FDsAh3oD+oWy3yL1BU
         LBwkqCRkdx6w9HiHJ/EuiJ5EzleFUTbX9zeWgfG0AscrIK6PMJ3ZyH1pGFK2UgNLKMKN
         iP7ScAEl7yP1gyKyHF9iz+lK5mkrGhMxkUH8PtWHeMHwjL1i2uTxF/7dFuXrMCTN7yac
         Aw4iAAd0ha320Q1UV1Afmorlb/vglVZJ54KH8chpOvd90r0FyGOGaeKsLxXXRnG0zxcU
         1jM16ue3n3elr8pPl+GFKKFsTDPWmN69lKT06RqBLLl8/96EeJ6uUqEco7ztRpK3hXmo
         NT0A==
X-Gm-Message-State: AO0yUKVySuOEpqgJtTblGNI3T01RCwiUkYJAfLnbhXrVTePjCgVtqiGO
        fQ5kJS2bSsNUUazqcAZ9L3zsXg==
X-Google-Smtp-Source: AK7set8ANGwm2kcIXjfTUhgay6r6hLONjkhUR4qB3WgVOAUNlj1S9WRNkRSndrQkmSrLevDlX4GipQ==
X-Received: by 2002:a05:6512:3ca9:b0:4da:f379:9f60 with SMTP id h41-20020a0565123ca900b004daf3799f60mr2572847lfv.33.1676668797721;
        Fri, 17 Feb 2023 13:19:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l27-20020ac2555b000000b004cc9ddce3adsm779134lfk.82.2023.02.17.13.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 13:19:57 -0800 (PST)
Message-ID: <26baf35c-cc96-3911-95bc-c675123fcc49@linaro.org>
Date:   Fri, 17 Feb 2023 23:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 11/14] drm/msm/a6xx: Enable optional icc voting from
 OPP tables
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-12-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-12-konrad.dybcio@linaro.org>
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
> On GMU-equipped GPUs, the GMU requests appropriate bandwidth votes
> for us. This is however not the case for the other GPUs. Add the
> dev_pm_opp_of_find_icc_paths() call to let the OPP framework handle
> bus voting as part of power level setting.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index d6b38bfdb3b4..b08ed127f8c4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2338,5 +2338,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>   				a6xx_fault_handler);
>   
> +	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return gpu;
>   }

-- 
With best wishes
Dmitry

