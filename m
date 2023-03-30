Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9602B6D06A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 15:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbjC3N13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 09:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbjC3N1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 09:27:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15EECB74B
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:26:59 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id k37so24563606lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680182817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3TWXdzpSnGOM40T9XOpuvX+5naiiIUyXSAIJsPyKJ0=;
        b=DwMmHfz053UKTc8MUJ6Awy9An9UGAQjuj1MbpFu7R/Buuo/8G490Jy8TGjAQEbp0iK
         3mg5iq+LZKZHyi8ZzfZLfUX+zEnNzGyOFE9h5vQURvLR64dGFxW+1xsmeuEWbTUk5xtu
         Man/zMn8NpgvDf1QzL5yuWVKRQrKeLGy++/b9Pd9kCZ3wJ8DKrsEo0Pz2XC+lyuJagUT
         Ab0i1AzqFHGEAzX4Q8kuG29kO1m2Q1FQKle5OaunPA+UAA/mNzJ7X4MQ9wwChaQhWdF0
         6sarK2/3eb4+z449e29a9ZUxqa0l2qtQwqFQxS52Ks2e/9fILeRTJe7RidCxts7kPPb5
         ZjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680182817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3TWXdzpSnGOM40T9XOpuvX+5naiiIUyXSAIJsPyKJ0=;
        b=t65BRRsbEwHcAodvVxNRBc87mTWXupBWU9J9WTccgE1nTSuwkSfTavtNmKXLbSck0a
         JOYsVrjVlkQ20J4Ls1MZ/hRWAUclaQzTBx7uoTFzCu0gObuVaYya5/fVisFes8bKKEg7
         lB4NOIQucey3PZv6f09kHKSOGvyiohAHYFWomZvz1AvrotUPVS6hvJxGCpJR1J2AnYPh
         Ba9YzV1wynBC80yyE6u8QLSTX7CGgqxctAJJ+nj+5YMj1q7B92LEOSrwIm9UTXw1EtFU
         FSFQicM1SQ04yaoRLJNY4t85nW5sqd8w5QaeHhPSrkZHkTTdGQWDxULIV3Be08pwuIM6
         bEeg==
X-Gm-Message-State: AAQBX9eP/Ro8NwE4x2GpKzptxv3xdpoebuaiomYG8HjbdPoQbDV6cHWm
        nfRsKUmivgrgnwuM5QbeyNp86g==
X-Google-Smtp-Source: AKy350b6oLNktszZUGsV6t3dNBDbVvq8Jv73lwCM55h0UOeX0Zy/C9raFLWh6dODP5PcC4EI2en9jg==
X-Received: by 2002:ac2:442a:0:b0:4ea:e68c:91bc with SMTP id w10-20020ac2442a000000b004eae68c91bcmr7337868lfl.18.1680182816729;
        Thu, 30 Mar 2023 06:26:56 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id d21-20020ac25455000000b004eb19a51896sm1048337lfn.83.2023.03.30.06.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 06:26:56 -0700 (PDT)
Message-ID: <8f5b19b3-fea7-1386-ec30-f27aba0f9901@linaro.org>
Date:   Thu, 30 Mar 2023 15:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,50/50] drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major
 DPU version
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
References: <20230211231259.1308718-51-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-51-dmitry.baryshkov@linaro.org>
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
> To ease review and reuse rename MERGE_3D feature masks to contain base
> DPU version since which this mask is used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b8143a3c35b0..6f907992866b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -70,7 +70,7 @@
>  #define CTL_DPU_9_MASK \
>  	(CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
>  
> -#define MERGE_3D_SM8150_MASK (0)
> +#define MERGE_3D_DPU_5_MASK (0)
>  
>  #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
>  
> @@ -507,7 +507,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = 0x100, \
> -	.features = MERGE_3D_SM8150_MASK, \
> +	.features = MERGE_3D_DPU_5_MASK, \
>  	.sblk = NULL \
>  	}
>  
> 
