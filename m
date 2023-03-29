Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4106CF74B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjC2Xdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjC2Xdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:33:39 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA0A5251
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:33:31 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bi9so22290028lfb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680132810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zVMAwGVkpyNJLaTUfZNtYcn0toUrAEH2lIEjZ7lN92Y=;
        b=azgrTPl4KSszx0gApDao81k0idOnqn8U0qTnYuqwX/mpAgrWNrA1ASPxw6eHJtaHkB
         Be9+dmcm2aOXY4DUz2E2SBq1l3uKK5XZQUToH+ytCPyzxhJ79MOXait/RVFLE2HBc3jP
         B/wKqFC4R9rwV61I87JXWHYkHsjSC7nYYU0FcwS1gtXLHHDJ5Dg59nNBwdLnTSkfcJ2z
         87hNIcYhxyCq3CHLR3/cQbjUBIaBhUXLiqrJxm0YHJtcz3znDuU+stE/VbRBSLzkeCUQ
         xutLW0QguooRJ1bVDbR8A5GYvmmsTcUG1FnOa+ZKLjkOp9YLF5/WGzzhrCEiLnH1PATN
         fO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680132810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zVMAwGVkpyNJLaTUfZNtYcn0toUrAEH2lIEjZ7lN92Y=;
        b=qvOL3MJFi7Sr7FQJyIzdwfANw4emcRLtnRdYTCyjiAv/PvJqL3W+OldyDvqBon4OPY
         wkvuHb5kmub3bSQFGB4V/iTmAx1m0kUaDPwZ9MBpwBQ4mlErjcNuUdeIDx34SYiktif3
         iU7XkvVle0fKO7uaBEZDqOUmeSqVGeAT1MWHteDWKTDeAD7yP3tq6gQiCEm7yusxvUTj
         wiE4dSuD91GgenmID0JWR3RToqTvaQTqRgFX6KHAXREGhQHKZkm0NKHLfsE4YeUvetL0
         FHFiLl1vr3yHLMAXctV/g3AVI1+cyzCA2fm0cTsUlSG/czAEK0tq2/Vp5QbQaGk2bcVH
         skjg==
X-Gm-Message-State: AAQBX9c+R6AZY0BKJ85+Xh/jNTPE9pN+rqcdebOHEP/8MBEkXdaV/3bv
        /aCxw39jfhKkZ4f+TpWTVylfUw==
X-Google-Smtp-Source: AKy350YpIg5GoYGwOX8o7utB+qDQlYL7axpx2k2XD36tkMfg/3hbs2N/Yi2NCJ1vx7y6SWpejl9Meg==
X-Received: by 2002:ac2:53bc:0:b0:4ea:e688:a04a with SMTP id j28-20020ac253bc000000b004eae688a04amr5778658lfh.66.1680132810008;
        Wed, 29 Mar 2023 16:33:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h6-20020ac25966000000b004e9b4a8f738sm4686178lfp.152.2023.03.29.16.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 16:33:29 -0700 (PDT)
Message-ID: <5b80d59c-7c61-44ca-19a0-d319433fd328@linaro.org>
Date:   Thu, 30 Mar 2023 02:33:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 4/5] drm/msm/dpu: Fix slice_last_group_size
 calculation
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-4-f3e479f59b6d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-4-f3e479f59b6d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 30/03/2023 02:18, Jessica Zhang wrote:
> Correct the math for slice_last_group_size so that it matches the
> calculations downstream.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 648c530b5d05..1a1a0f6523f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -56,7 +56,11 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>   	if (is_cmd_mode)
>   		initial_lines += 1;
>   
> -	slice_last_group_size = 3 - (dsc->slice_width % 3);
> +	slice_last_group_size = dsc->slice_width % 3;
> +
> +	if (slice_last_group_size == 0)
> +		slice_last_group_size = 3;
> +
>   	data = (initial_lines << 20);
>   	data |= ((slice_last_group_size - 1) << 18);
>   	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
> 

-- 
With best wishes
Dmitry

