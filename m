Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48AEC4AFFDA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 23:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbiBIWDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 17:03:16 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbiBIWDM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 17:03:12 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D88FC0F8692
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 14:03:14 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id f23so6836830lfe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 14:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Itlsq3+hS5Y9iy3ygo9I7us+gV+aSgo7u4P79ICKVnY=;
        b=BxtvxGZwH9hhHiy8OqyqqNmLvOfu7ij2Mqnmp1/5TkvYA1LfHMseH8fEdM/KqWrykN
         Xm0Q88VB32Y9XlGI2Abv9KXlMdTaG38aIFCdiCuKZojEob2BNqc0PwmETvRdBGt18eNO
         YE2ukUodr4x8Krd0cGDZkTU1gsIkbZNtmCqMaBd3FAqf+BUmkEYElvzH6rLgbqXy/n8z
         t5sLgvnrGB4CX7TiB7d5NG++iEGROz5rrn7xBhS88wDTcJvPGjDeAfCHiPJ+FszE/K1i
         jBF5N31tpafZqL88FgpKmSEWb8qWkdE8RukMSS6pQoW7SgonlfQy6YPimpMCYckSiRVK
         XjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Itlsq3+hS5Y9iy3ygo9I7us+gV+aSgo7u4P79ICKVnY=;
        b=5xgQCsNAJzG+NxWESTVCmXc17lSIuhNSBxl8d27FxvChBpT2mD8C1QaoJ5wj6jR8Qj
         ydoeQan15WAQli7iHP5ZQjGtf7lQXJtoCVLVtKdEi/jCM0wZqvYd5SEBicxxAMymvliC
         FAsfpugK1Lp98cxYIqd6Ca9huXUc76KgCo18PqlqJXO5buAHMzldvyTHjcG6OKQfnlGs
         mdgT/SX+tOsCT9IEowzGxysrMMfLoaxceuCXLEgtMecl2HMF6lmnROgt0i9/yoMPQwpn
         TtrnB9jh78HgQFasaWU4GAj7u3DSB58t4ZFN3d5Lv3Fzr7JIcM9ezK6vSePEwZ7/wtqR
         x3qQ==
X-Gm-Message-State: AOAM533z2xDwfWhnRg1uS5un4F6z31XU+0PDU0zNI347BOW0ljPIvTdl
        0I+IbE9CAoYzYJPBNGEqsW3PIQ==
X-Google-Smtp-Source: ABdhPJxlN+/1YXu/VKKNfgOkXudTxUBopzACvjjI7nQLgtidHg+iQN17+32xjG9smnA2peFinqqZPQ==
X-Received: by 2002:ac2:5185:: with SMTP id u5mr3138375lfi.589.1644444192609;
        Wed, 09 Feb 2022 14:03:12 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n9sm914012lft.2.2022.02.09.14.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 14:03:11 -0800 (PST)
Message-ID: <346cb67b-a5bb-b4ad-a15d-d2cfc850ccf5@linaro.org>
Date:   Thu, 10 Feb 2022 01:03:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: Remove spurious IRQF_ONESHOT flag
Content-Language: en-GB
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220201174734.196718-1-daniel.thompson@linaro.org>
 <20220201174734.196718-2-daniel.thompson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220201174734.196718-2-daniel.thompson@linaro.org>
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

On 01/02/2022 20:47, Daniel Thompson wrote:
> Quoting the header comments, IRQF_ONESHOT is "Used by threaded interrupts
> which need to keep the irq line disabled until the threaded handler has
> been run.". When applied to an interrupt that doesn't request a threaded
> irq then IRQF_ONESHOT has a lesser known (undocumented?) side effect,
> which it to disable the forced threading of irqs (and for "normal" kernels
> it is a nop). In this case I can find no evidence that suppressing forced
> threading is intentional. Had it been intentional then a driver must adopt
> the raw_spinlock API in order to avoid deadlocks on PREEMPT_RT kernels
> (and avoid calling any kernel API that uses regular spinlocks).
> 
> Fix this by removing the spurious additional flag.
> 
> This change is required for my Snapdragon 7cx Gen2 tablet to boot-to-GUI
> with PREEMPT_RT enabled.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 6b3ced4aaaf5d..3a3f53f0c8ae1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1877,7 +1877,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   
>   	/* do not autoenable, will be enabled later */
>   	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
> -			IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
>   			"dsi_isr", msm_host);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",


-- 
With best wishes
Dmitry
