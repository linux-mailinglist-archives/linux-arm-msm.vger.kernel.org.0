Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A03E6CF72C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjC2Xbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjC2Xbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:31:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C9D1FFF
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:31:51 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c9so11884587lfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680132709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uWJdsWldsc640792OBi+zRWRy0BJIGGz1A1rf+B8cUc=;
        b=TNtGURSW0FeUCVJHy+WnX4VJ6p4WTzy7IwTT7JipjTJKiTU8JB1WdWnrtzZXTWKjti
         ymd2LMQ74gXntm6TBwJJsNpBNDj18TqdI8PXCroIheLkZXHEi0czGsz4g1MTQZhAHP+T
         GvXnb8ANIacoS+P/5rKSxfSt3ZSq94EoNelfzboSknrNzIVreYefM2b1IRg3VX1cwZwi
         fc9AYla3r55zF8YlYEGSBWc/cFh2PN1dNlGA34MCupbvMTIdNZBMYazoJl0+H5PxFbPG
         F/sLaWGj3G1oPMMYXKeemYzmQ2T7MYO77LPN+uMwtdiWe8U/Pu+J6+abwhM3MwFnQBhp
         Airw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680132709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWJdsWldsc640792OBi+zRWRy0BJIGGz1A1rf+B8cUc=;
        b=J/NrWcUIwmrhPmuqthh6C2PECpvxNk7TcG6Zkrid3LoVdplpLtmsXEN8sqUzm1+yY4
         KfKlXfytE3YbI/SyPvmIPolhZi9ckswsHMx5bI2425XhulBihCMOuJU7PLWkIqljBjYI
         yO/tj5AqCl0nUKIepJbgeVVO2ypGNGZAIuzKPrt99b+aTwMTG9nHtfEGFPcmFrqJDB1W
         1t0//nzRanOxrZD/3z7nVcNrMCeOQr/57S+An5etQ92HJqsQHY29hEccr53Qia+8X8lW
         bKt7J6HIPmlG9ZZgBSUv/MhggEvJE/1U2l1oTyrLowJg4tgTsb9Zd4DkQwj6Mi8MJPZr
         J1/Q==
X-Gm-Message-State: AAQBX9flU5PP2ButjM2Vmat9zr6YfiG+ORHIMmLsLZefe8KcEayAdyjL
        5G/NgzrafIBLRU4AXCEfLWfIiw==
X-Google-Smtp-Source: AKy350Zm5RPFgwDl0ZDjGiqnsvgGsLLZJqSj1PNi0yeREAOszwge8aikOn67MJotwpGT/y9C+qBiRg==
X-Received: by 2002:ac2:4c95:0:b0:4e7:fa8a:886e with SMTP id d21-20020ac24c95000000b004e7fa8a886emr7047635lfl.51.1680132709374;
        Wed, 29 Mar 2023 16:31:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t8-20020a19ad08000000b004a9b9ccfbe6sm5668365lfc.51.2023.03.29.16.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 16:31:48 -0700 (PDT)
Message-ID: <4e12cc50-cd34-e1a1-3a91-0da369b785c1@linaro.org>
Date:   Thu, 30 Mar 2023 02:31:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 3/5] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
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
 <20230329-rfc-msm-dsc-helper-v1-3-f3e479f59b6d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-3-f3e479f59b6d@quicinc.com>
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
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 619926da1441..648c530b5d05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -3,6 +3,8 @@
>    * Copyright (c) 2020-2022, Linaro Limited
>    */
>   
> +#include <drm/display/drm_dsc_helper.h>
> +
>   #include "dpu_kms.h"
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hwio.h"
> @@ -102,7 +104,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>   	data |= dsc->final_offset;
>   	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
>   
> -	det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
> +	det_thresh_flatness = drm_dsc_calculate_det_thresh_flatness(dsc);

But this changes the value! Compare:

bpc | old | new
8   | 7   | 2
10  | 11  | 8
12  | 15  | 256

If this is intentional, please state so and maybe add a Fixes tag.


>   	data = det_thresh_flatness << 10;
>   	data |= dsc->flatness_max_qp << 5;
>   	data |= dsc->flatness_min_qp;
> 

-- 
With best wishes
Dmitry

