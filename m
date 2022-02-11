Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 890E44B1BC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 02:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347070AbiBKB6i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 20:58:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347045AbiBKB6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 20:58:38 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C8E2A3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 17:58:37 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bu29so8546683lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 17:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OzrUthCxh0bIlSOqitw37R5B8Fdq3tCLDbK6Qh2/C8Q=;
        b=ZQDr0ay1Wz19gMKtrpBi307SVX9tV4tAToNV2JFRDOf5evKqf4+ez4ZTLARzAPCNfO
         z19mj+yT6Zjwnm6oqlIX7sjaWin1aZfrAcsxQhK5kyeouoO0R3iKAhgFWHk8Ve4Mwq94
         Q05NPqR5am5p9ofPF2yOzQPcRThfEEPUra3CuKZ1fJHYkVNwtTYcwztjDxV5GxHMT0Bv
         tvVqBEsa9A8gdH5zjBvbZmKoyXrPss4MRKIzdnmDOunb+f+VK/pHOiUjBhCG768x4KaO
         cgTpTvBq22FeyVqCMmkZLRdlNQAU7f2K8f7XGRY1XchKqvWL1aDU3YY6M14N4x2xlN2h
         EC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OzrUthCxh0bIlSOqitw37R5B8Fdq3tCLDbK6Qh2/C8Q=;
        b=EbhnB+kOa8MUYE6dxIAgji//J5dhe4KlKp1k+ZguyV3q4vV/a6QdovST9CDfYjiU3W
         R0Iqli8w5iR0IZiC/LJCa9BCpPhYOA8ZYTnYRHbViXwbjlQ+ltDJ+9MCOVSfwHB10now
         rmINv6e/OYWGXJJ/b2zMefFt/LgxeNWMBC9QVDOCExcd+0k/nL6o/Iauv8CU7ELIDYAM
         JieZ1vxiK7mE1z1oM1/n1r3bkH4UfH22TPtcAFZe/ZqwxYEshAXNuiaiGAuUgs+eqo/Z
         ku7sHq4k/LOhxF0P8g2uG3st2WRWAV9rJ0Ql/IOp+XvCUs99oFJyrLH3v2+zEGuM3SEL
         Pj5g==
X-Gm-Message-State: AOAM533ICiModUrPGx7QoWWHltw+TuPSKv1oRrj4i16HST+snVRaVEsy
        Sfn7/yOtb1vT2xgy5b3vmqtL9A==
X-Google-Smtp-Source: ABdhPJzT3QRQC9YOW3Jed/SZIBeEBkFTLrX5UNG9bL1oszO0iPRP2KY/T0Vd4bq6K0zrpZWMmc6Y8A==
X-Received: by 2002:a05:6512:3c94:: with SMTP id h20mr7009357lfv.480.1644544716355;
        Thu, 10 Feb 2022 17:58:36 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t19sm2958070lfl.123.2022.02.10.17.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 17:58:35 -0800 (PST)
Message-ID: <ccbd30f2-7627-f44f-6a0f-e6ef4736270f@linaro.org>
Date:   Fri, 11 Feb 2022 04:58:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 3/3] drm/msm/dpu: Update function parameter documentation
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
 <20220210114106.290669-3-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210114106.290669-3-vkoul@kernel.org>
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
> dpu_core_irq_callback_handler() function comments seem to have become
> stale and emit a warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
> warning: Function parameter or member 'dpu_kms' not described in 'dpu_core_irq_callback_handler'
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
> warning: Excess function parameter 'arg' description in 'dpu_core_irq_callback_handler'
> 
> Fix by updating the documentation
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 9341c88a336f..27073fd49fee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -140,7 +140,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   
>   /**
>    * dpu_core_irq_callback_handler - dispatch core interrupts
> - * @arg:		private data of callback handler
> + * @dpu_kms:		Pointer to DPU's KMS structure
>    * @irq_idx:		interrupt index
>    */
>   static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)


-- 
With best wishes
Dmitry
