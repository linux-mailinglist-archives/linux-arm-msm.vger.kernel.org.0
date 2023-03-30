Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392D96D1243
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 00:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbjC3WkM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 18:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjC3WkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 18:40:11 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADB3CA28
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 15:40:10 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g19so13412470lfr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680216009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AMJs/U5UnLd5bFOKJPEHLahakMqQOuZt33+aoqfKk80=;
        b=xOmcjUBOYyImBSg5vKMA59tGHFPK4SA+o+kKqbW/FfXGSBu3NmH5xggpqPqzS8ioKK
         4U0XJDWj7FB+LAkCOUoB/1hhntrXQ0H1xMxUxNhU14cGNs2lxA/HjKQd8gmfo17PDixg
         scz27ljzFQfwEUK5UoMQWIIpd1rdMkZRjxTpyI3ictIlUk2N/2+SdvU+Ig0DKKrbeDLC
         Gb+VjwI6j2MyN7EtzKDdaVbZLobm4ReMBzUzTpRfwfQMXbH9OoUBZRPRsHihk8H8ykVC
         cXpawfR8WaWSrmWeXVKCLXDxJ3NvCjLZr1vZfeQ26F0exKat3cluKWwZMdYNeQH4+rCm
         kUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680216009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AMJs/U5UnLd5bFOKJPEHLahakMqQOuZt33+aoqfKk80=;
        b=us+1hNbmNfpUd8Mvf5z3eaNpFjnVo53pwNKRBRR3NJhZFICTZr0qFj+42q1B/xcxbf
         XuIkZv8uUM/3bO+ov7z/wXCuV0qJvtRXecYdBopZ/O14vwnlilCdf6Of/sie8enMdLKd
         e0MwW5F9ZsBUtwNz2xvCT8u73UPmEu4ZF/zdEFTIBtBlEpYgeyrg/sd9XTQsgPQUa1kS
         adJYN9Ev62GBDgOfqt4iQAj56/NyBJoVXmFjkiL6ofGYqSRtXhrOS3dY6nXuTLP3G8uc
         +YPkqPlBXZL6XJDJBrqvvlDBramTCJWOMXs84VXZWEgaDlF3+xtef/vqFL1SHK1yTA5v
         2KKA==
X-Gm-Message-State: AAQBX9ePDCgLP54TpUERIshElVQtWlN+fOhjNmvAtFc2vrqclNoYyKyp
        XnkloxRevLimlEBfIiTeci7WLg==
X-Google-Smtp-Source: AKy350b6RwWIx6C6yOTO1IoA5dTMxrnYjKOYDyWWfUj6x9XXLL+PnhmZIbdz8iII1zzPdVmZaJqCCA==
X-Received: by 2002:ac2:5337:0:b0:4db:d97:224d with SMTP id f23-20020ac25337000000b004db0d97224dmr8066707lfh.19.1680216009129;
        Thu, 30 Mar 2023 15:40:09 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2531a000000b004e8497a5604sm116680lfh.108.2023.03.30.15.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 15:40:08 -0700 (PDT)
Message-ID: <842fdf1f-5cd9-44ad-ad7c-b28e26b40601@linaro.org>
Date:   Fri, 31 Mar 2023 00:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v3,25/38] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
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
References: <20230330215324.1853304-26-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330215324.1853304-26-dmitry.baryshkov@linaro.org>
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



On 30.03.2023 23:53, Dmitry Baryshkov wrote:
> Theoretically since sm8150 we should be using a single CTL for the
> source split case, but since we do not support it for now, fallback to
> DPU_CTL_SPLIT_DISPLAY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 01ef4115ee4d..33f2d53df13b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>  	},
>  };
>  
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
