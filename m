Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFAAE72F70B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 09:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbjFNH4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 03:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjFNH4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 03:56:06 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E88CD
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 00:56:04 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f63ab1ac4aso8009310e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686729363; x=1689321363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJPISEmPBy/fFyKK4OdqlG5gkZtasSpnLqvR/QuZsrc=;
        b=Z7GS1eKT8nO7TxFE5M0qMwLUz+EZv2zNcpHm3JpZ8188Zt3tGihoJ40UK/M/+P7P1Z
         1yFkhvNp50dlLGoJWKQdCtY3bQAVdBOKB0tC/+UBZfCJe3XOGO9zUEhazVVS1Iar5ZLi
         2qX/tjowOPZyaZynAzLAI1zvmABYP3Yoo7R1s8k97vYd6unI4pNI5gj3BtdRC44m5Y5p
         0PW7/ypl/lVieTySySLFObOe70melVrKASD+UPl0H/bucy8XP2FJMZ5HcrbRxunTW2xC
         abDHMJScDUZwW5ZpOM4kgN1I8LsIM6ACc+5tDujmhghznXjF99QWvWY2jl6QBfRDjxsN
         31mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686729363; x=1689321363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJPISEmPBy/fFyKK4OdqlG5gkZtasSpnLqvR/QuZsrc=;
        b=E79FA03z6UR4nhNEYtrrFbipsYnZqZrXJuRIFw2EGcDbJpsDCRso4nEUWUfoa/3W09
         GH04XdkPsv6bFFATnOfzYv1X0A2sNAqbU82ByKdjLAEYO9fkUqY1ByOTvIc+//OXibiH
         cA2WJHcwG+YKzWnpoVbIqfQZ8FqkizBuwysW3a7Q56Q4AvQra6XQXNag4J3mv5+Zta4X
         lCfj//QCFN52BRrXf0o+8fsXbl0YVjAk0xBzHzhPrjjTwgk4y2Nee/z9xndx2XXjZ9RQ
         MmcwDZ0lHmeSr1zNj+QXGe9XSyDJ6rvF+PEmpocKl42r3fR12bkT2YkvpYoLIWNE8HDb
         /n0Q==
X-Gm-Message-State: AC+VfDyCmhDntUX396gZb1INkQMgSgoNqnLjmGtdGkOdYz1IuFw7gBjQ
        bsU+6sdRRAaq7x1+orHd1f72jg==
X-Google-Smtp-Source: ACHHUZ6gQl+0Kjo3PkucyLQR6m9PDFEMbrbKq8jhGBsMoylSMxxqYFARW61e25BEd87a5AcAhO1Hzw==
X-Received: by 2002:a19:5619:0:b0:4f3:8196:80cb with SMTP id k25-20020a195619000000b004f3819680cbmr6959270lfb.41.1686729363110;
        Wed, 14 Jun 2023 00:56:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x9-20020ac259c9000000b004f650b03391sm2013241lfn.91.2023.06.14.00.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 00:56:02 -0700 (PDT)
Message-ID: <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
Date:   Wed, 14 Jun 2023 10:56:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: Set DATABUS_WIDEN on command mode
 encoders
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/06/2023 04:57, Jessica Zhang wrote:
> Add a DPU INTF op to set the DATABUS_WIDEN register to enable the
> databus-widen mode datapath.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 12 ++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  3 +++
>   3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b856c6286c85..124ba96bebda 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -70,6 +70,9 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   
>   	if (intf_cfg.dsc != 0 && phys_enc->hw_intf->ops.enable_compression)
>   		phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
> +
> +	if (phys_enc->hw_intf->ops.enable_widebus)
> +		phys_enc->hw_intf->ops.enable_widebus(phys_enc->hw_intf);

No. Please provide a single function which takes necessary 
configuration, including compression and wide_bus_enable.

Also note, that we already have dpu_encoder_is_widebus_enabled() and the 
rest of support code. Please stick to it too.

>   }
>   
>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 5b0f6627e29b..03ba3a1c7a46 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -513,6 +513,15 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
>   
>   }
>   
> +static void dpu_hw_intf_enable_widebus(struct dpu_hw_intf *ctx)
> +{
> +	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
> +
> +	intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
> +
> +	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
> +}
> +
>   static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
>   {
>   	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
> @@ -545,6 +554,9 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>   
>   	if (cap & BIT(DPU_INTF_DATA_COMPRESS))
>   		ops->enable_compression = dpu_hw_intf_enable_compression;
> +
> +	if (cap & BIT(DPU_INTF_DATABUS_WIDEN))
> +		ops->enable_widebus = dpu_hw_intf_enable_widebus;

>   }
>   
>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 99e21c4137f9..64a17b99d3d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -71,6 +71,7 @@ struct intf_status {
>    *                              Return: 0 on success, -ETIMEDOUT on timeout
>    * @vsync_sel:                  Select vsync signal for tear-effect configuration
>    * @enable_compression:         Enable data compression
> + * @enable_widebus:             Enable widebus
>    */
>   struct dpu_hw_intf_ops {
>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
> @@ -109,6 +110,8 @@ struct dpu_hw_intf_ops {
>   	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
>   
>   	void (*enable_compression)(struct dpu_hw_intf *intf);
> +
> +	void (*enable_widebus)(struct dpu_hw_intf *intf);
>   };
>   
>   struct dpu_hw_intf {
> 

-- 
With best wishes
Dmitry

