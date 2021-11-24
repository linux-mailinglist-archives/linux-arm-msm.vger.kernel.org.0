Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B97445C958
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 16:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbhKXQDA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 11:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242613AbhKXQC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 11:02:59 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA78C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:59:49 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id e11so6370237ljo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i1aAlgTWC7o1TRTW3GB5LGAPe7B/TYCcCKb3j77hRy8=;
        b=U76uZt/tiJ2WpcfSpd7h3Qjfdx4yLqSSpQnfKu4uO3PwIB9AMemP/uXCWNhN7lHJ4D
         rBWNKbx55/v/inVsge2r2RNrNecpJ4V+SpIwr3/H1xvkqC7GM6wXgICTnND7EoRpex4r
         fargROcTgvutU7m/iOONZkCwSRi5lx+HT10EEa/61L0XfYZt/3aln4RDJINW/toCmFk7
         NyVcV+etxfYPDlIo7tmnwOoWRS6jsQK1NSw8n8lPtHfd2YZNM80VcuVutSiryj2/wXuZ
         ENjSQeJf9J6FlieVAty5gWR7t2DGOg/jIsoPiBJz07Peymg9UqoxkteFLxJZUJb/qJxx
         kL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i1aAlgTWC7o1TRTW3GB5LGAPe7B/TYCcCKb3j77hRy8=;
        b=t/Mx+zvqmusJ5d+Gk/tweoErzf7M+qZoU2WJzSWr8ogmiZGPks+TJ3+sz17WDnfon9
         KuIYTBLBRM2oHVgQO13oNfzPrfuBq03IehxEFEK5N8usE3B+Mw4SzRBjw/oI24C0pir8
         S2E33Olu0cjjOAsYiDYNFx1kf56BmpxEPcD3JK9D5yrZlFVELhKkp5eerMp+jsjyxE9E
         5Kd4jFj8ncNeF/nDAqQSeAsXQagQD35XGcITR5CEvUnGYSc/cB5y0QAgeguDQTC2tbCd
         QKOF0lii0V5XYqMk0I9q9Mf3wVjY28I3OTgnKRDfk6ItDdRml4WsNxGi4mWa+4/VkINa
         UuvQ==
X-Gm-Message-State: AOAM531EcOjJMSaKOlgtzqXdZ7knWnd1XtC8fjBEYAc+JqhqNIXs0vFF
        ymcGdh8vJOzSxXTxFSf/jRh0DYfzrZSCbQ==
X-Google-Smtp-Source: ABdhPJzrNrodPNLP0mgs7f8iAojbhBZDqrfMbnxIRTdvEiaoD5152vfchrspwbIq6TFk+tug1B/kXQ==
X-Received: by 2002:a2e:7216:: with SMTP id n22mr16512022ljc.44.1637769588092;
        Wed, 24 Nov 2021 07:59:48 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m11sm25361ljc.108.2021.11.24.07.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 07:59:47 -0800 (PST)
Subject: Re: [PATCH v3 09/13] drm/msm/disp/dpu1: Add support for DSC in
 topology
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-10-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <539990a0-70e4-2deb-7e30-0855ab3bbfae@linaro.org>
Date:   Wed, 24 Nov 2021 18:59:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-10-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2021 09:22, Vinod Koul wrote:
> For DSC to work we typically need a 2,2,1 configuration. This should
> suffice for resolutions up to 4k. For more resolutions like 8k this won't
> work.
> 
> Also, it is better to use 2 LMs and DSC instances as half width results
> in lesser power consumption as compared to single LM, DSC at full width.
> 
> The panel has been tested only with 2,2,1 configuration, so for
> now we blindly create 2,2,1 topology when DSC is enabled
> 
> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 ++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h               |  2 ++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f2ff8a504918..12f58de88ac7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -533,6 +533,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   			struct drm_display_mode *mode)
>   {
>   	struct msm_display_topology topology = {0};
> +	struct drm_encoder *drm_enc;
> +	struct msm_drm_private *priv;
>   	int i, intf_count = 0;
>   
>   	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> @@ -567,8 +569,24 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
>   
> +	drm_enc = &dpu_enc->base;
> +	priv = drm_enc->dev->dev_private;
> +	if (priv && priv->dsc) {
> +		/* In case of Display Stream Compression DSC, we would use
> +		 * 2 encoders, 2 line mixers and 1 interface
> +		 * this is power optimal and can drive up to (including) 4k
> +		 * screens
> +		 */
> +		topology.num_enc = 2;
> +		topology.num_dsc = 2;
> +		topology.num_intf = 1;
> +		topology.num_lm = 2;
> +		priv->dsc->dsc_mask = BIT(0) | BIT(1);

dsc_mask is still hardcoded here. We should use DSC indices returned 
from RM.

> +	}
> +
>   	return topology;
>   }
> +
>   static int dpu_encoder_virt_atomic_check(
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index c4a588ad226e..d6b25d77700e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -103,12 +103,14 @@ enum msm_event_wait {
>    * @num_enc:      number of compression encoder blocks used
>    * @num_intf:     number of interfaces the panel is mounted on
>    * @num_dspp:     number of dspp blocks used
> + * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>    */
>   struct msm_display_topology {
>   	u32 num_lm;
>   	u32 num_enc;
>   	u32 num_intf;
>   	u32 num_dspp;
> +	u32 num_dsc;
>   };
>   
>   /**
> 


-- 
With best wishes
Dmitry
