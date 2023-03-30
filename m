Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7B16D04C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjC3MdP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC3MdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:33:14 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E66372BA
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:33:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j11so24270305lfg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680179588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Acz7a75RYn2MxRh03BFFRpFoesYJbXn4si/ao0hsblE=;
        b=ZreaFzd/EtdSzQQric5+NR9EFi92/hXcWMc00rZQQSy5/pi3dXb8VSEXAvUKrqtgbC
         HLYH6o3SN+03YnkIpQy6ovxtIGSNwrowOdOcWWLFrSwR+Cziz64kquZCAyFcRUhk9Yb9
         RMdaZiQF6V8oW8qZbWPknPqk0UyYxRdr+gazcbY6fqFPxUpkmduso2paG+HK7B2o5AP4
         lE4vAj3vJGR2Rlo1uy8eyEt1F3SO/aD8jRVsGikfhKQpRcVoZXaxOzpO5K/SGvS0xH/B
         I/A+G6KhpCWJ0PHHEbsefnHvNv6SCl2s9oCQI4d6VONXOPnJBv1iZSXq0gG+j7GwH5qd
         jBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680179588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Acz7a75RYn2MxRh03BFFRpFoesYJbXn4si/ao0hsblE=;
        b=KSmq0h/l4JHoovwwQKizrML1FGokhzhdvH2TlBUJLXZlf5Kx+pqCO7Wg0/q7m2Cdmf
         hGd1zCxWf/ktNeyHo++jnJ1QgqdHnMBtRef7wfotV5CT8aRFyO6RRf1HV/00G4/pibvM
         9h24dzFn55E/MS3eehGvGqp92rxF4vfh+6IaKBUAS+WWxI4CGVhBJTA+ReQKsDTvS7uV
         TS4m5gdQ6hwy3q1Djqhn3o6qM47jlB2fmv485m3x65uZEAFZEmRdQJoNoixbX0KF5rsq
         cCO2I/fPWV746K1gQxGB4hwBVWPng1gixKxQ4ghiVKrmUOkBjKaBPnrwodAcm433dYKb
         lviA==
X-Gm-Message-State: AAQBX9dD7aKDkcGhIVCRVqEKwVUA0WQwKkN8FLW49HrqqDTFBdIQktFV
        vGDE+7vmViDLGiRsgAoJwZKbHA==
X-Google-Smtp-Source: AKy350a/C7gpK0XWIX2hQ5sqZMeXGHJsJLkoa2vvQ4uj15b43N76cax8WAThLRhKaNSyQ8x5Zdr6YA==
X-Received: by 2002:ac2:51d9:0:b0:4dc:8215:5524 with SMTP id u25-20020ac251d9000000b004dc82155524mr6877428lfm.31.1680179588573;
        Thu, 30 Mar 2023 05:33:08 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id q3-20020ac25143000000b004cb43c9bf9asm5870128lfd.208.2023.03.30.05.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:33:08 -0700 (PDT)
Message-ID: <c7961d64-dc15-11d3-6269-74555c1c1b70@linaro.org>
Date:   Thu, 30 Mar 2023 14:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,38/50] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-39-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-39-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Could you point me to where it's specified downstream? I can't find it.

Also, deserves a Fixes.

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index a3faaab2226c..3d95f2472e7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>  	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>  	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> +		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
>  	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> +		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
>  	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
>  	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
