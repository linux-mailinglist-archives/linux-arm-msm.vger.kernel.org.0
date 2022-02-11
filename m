Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09EA64B1BC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 02:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347075AbiBKB6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 20:58:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347045AbiBKB6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 20:58:21 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2DF52A3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 17:58:20 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id z19so13716024lfq.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 17:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZC1uqgrvXsIBWCW6+/3AKBzj42cmqBCOtVTeIFF9gQ8=;
        b=usHybndeVb5TLwmLHBrShLJ3L1mMv30/AbKTRRK0Ad6jZV65pXh9Q31cjz2Cro9LSk
         t6g3qVrJg+S6Sh5Ecifk8Yc6UnujpCzAR+fuM1WxKz6MAxYR1LX6EIGRstOl6sAj3PWV
         u20BxdMOhz4lP/eSyY6lSVZwhejtrjhWu7otHFsokV0pX5bogNboJJSznGEjRdLyLe1B
         4F552vHRBffa1K5SyUr+9s5tPaS8DkpddoYfeuPZIhiBJ/nbU6F5fYgAAP7QSRvnb+LG
         kVFKHUi1UveP7f+29emKd3/O6tmwoUnSbBtijITh2oPwZ/MPd+jsHQ1L7d9CsEBIk4sI
         XScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZC1uqgrvXsIBWCW6+/3AKBzj42cmqBCOtVTeIFF9gQ8=;
        b=nheUJdGJlMEGYFZ1T6J2QSasqdCpPA/33rNbE+eOmQru3LGm0y7I/t4rsEz6I6FIhm
         IOtpEJB0frKDR3+3YrCZloqmczemmLaYrKNv1eB/863JuIa5MFJPrQXttGxDOPp/GsVx
         YS2kX6YbO+sfs/T2Ojo+q2GrHzzdWcTgpnGKvP2qn9x6W6IbH7WX7/5dSghCOC7qyocq
         FrT7SBH2uMTHsqow2Q4jQppeErrtWFGIXnZWAtTuMAGmrFzegpkUi2zayr10yu+w44Eg
         ZJzcr19YpYEZg1zvfgr2FEPXQCZHGDjji11M0EVaaJ9cdAtO0eezGZzSTnPJPxQvDUQR
         6TSg==
X-Gm-Message-State: AOAM5326niOHP7/ngcawMNqAF9reCKOTGLvIODXrvFzZCzOtPtxN4Ky3
        EhG+fN/qRzju+Ui5AcXI0pAeEQ==
X-Google-Smtp-Source: ABdhPJxZobwbFRhHRkhxhuImyV2J0FBbZMpweM4eIPj6Ttm7k/ck8K4S97TAzRwglr9idQtgDZfXdw==
X-Received: by 2002:a05:6512:1191:: with SMTP id g17mr7068991lfr.55.1644544698491;
        Thu, 10 Feb 2022 17:58:18 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f22sm2956990lfc.149.2022.02.10.17.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 17:58:18 -0800 (PST)
Message-ID: <cff9e31c-4564-1219-2b12-709f3f140f70@linaro.org>
Date:   Fri, 11 Feb 2022 04:58:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/3] drm/msm/dpu: Update the comment style
Content-Language: en-GB
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Mark Yacoub <markyacoub@google.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220210114106.290669-1-vkoul@kernel.org>
 <20220210114106.290669-2-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210114106.290669-2-vkoul@kernel.org>
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

On 10/02/2022 14:41, Vinod Koul wrote:
> The multi line comment style is wrongly used as kernel-doc comment. This
> gives a warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17:
> warning: This comment starts with '/**', but isn't a kernel-doc comment.
> Refer Documentation/doc-guide/kernel-doc.rst
> 
> Update the style to fix this.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index a77a5eaa78ad..9341c88a336f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -13,7 +13,7 @@
>   #include "dpu_hw_mdss.h"
>   #include "dpu_trace.h"
>   
> -/**
> +/*
>    * Register offsets in MDSS register file for the interrupt registers
>    * w.r.t. to the MDP base
>    */


-- 
With best wishes
Dmitry
