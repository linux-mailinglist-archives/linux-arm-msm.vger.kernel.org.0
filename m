Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40D5695388
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 23:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjBMWAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 17:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBMWAv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 17:00:51 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352AB5258
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 14:00:49 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id ml19so35538900ejb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 14:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfMz92HNte4OxYOZHBs0G2ecQ/enNd85Ii98wdoFnJ8=;
        b=ma0Qeuh75j2DffOMVHcLWMPg09xQN9m2Y46fkJ1gtOCPuH/tWPGCqS+EuN/xHJLbQ9
         1WCDW7c05cH+fbu/r2Lu8zdyPWQrstunz3wMlgAP2bFWueuh2PXAC8XKqoPohL0kktjq
         QgKnLXPqkHwM6qDfk7Vp4QH4N9Psw4jDI+AaECtRyZSz+p57UEC4UvdgdUuNdLauj6WX
         ltE4fDPHDk6RyZOZI3F5b+Q2F4AfuQzz/tEE4g6lDNv0dd+qoSC1LuwUPiVvLH75NKZW
         lTQIRIeoPNs8wMFKrQPYqM8LSB/DRBTQWQVGakKRKAJ88Qv+4pOvezsBhXBM8DaEV2zd
         QYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfMz92HNte4OxYOZHBs0G2ecQ/enNd85Ii98wdoFnJ8=;
        b=0UI5JEiOS9JKd5YHJz0YrkcrK+qFomcOmIwEVPWmuJeXhG/kqrMLVfvckHtlxbMAvd
         ZuAOaQApVNqTqSW9QZTtEr5wqUAEJJcv6Of/397lXOx52xA24zE//Kg1D5rU310irpZV
         Ubc0FOxgmDzVP1cEGeCAVRF4IdM97pVSF2TOkIsv8dqY1hiMyks5F6c9qmOe5jBjhKky
         V/UqBV7DO+RFRATIsx35AFyu9zS6QXfM/q5saprYsY0Th2qTVDn7DWV2xVPPbrZRUJ3Y
         ExOZFFj95O3rr2K/S52SwVLRk0YzpVGcFUZuiRMNwBhclTHir9DikDN6D22Xv6J7UbJU
         Lmfg==
X-Gm-Message-State: AO0yUKUJEIP+OaUepizkegZCo718fkJsfRbUHUU3V8KXrgpLhw6UGuJW
        NJof7r5oNyJvt6Eo81glBlJUYGGxAzlRJni5
X-Google-Smtp-Source: AK7set8u37sCkq/3IKGC9gHoChsI2qDVUV1alQ2l0JwZ/lZCteDhdjAGGQXXIATnvlHrXMc9BEuukw==
X-Received: by 2002:a17:906:f9ca:b0:8b1:16b3:303f with SMTP id lj10-20020a170906f9ca00b008b116b3303fmr463054ejb.8.1676325647734;
        Mon, 13 Feb 2023 14:00:47 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906179500b0088a9e083318sm7319016eje.168.2023.02.13.14.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 14:00:47 -0800 (PST)
Message-ID: <40c72da1-18b3-3858-479d-fb149d423e66@linaro.org>
Date:   Tue, 14 Feb 2023 00:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v3 1/4] drm/msm/dpu: Move TE setup to
 prepare_for_kickoff()
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
 <20230213194819.608-2-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213194819.608-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/02/2023 21:48, Jessica Zhang wrote:
> Currently, DPU will enable TE during prepare_commit(). However, this
> will cause issues when trying to read/write to register in

Nit: what issues? SError? reboot to the sahara? board reset?

> get_autorefresh_config(), because the core clock rates aren't set at
> that time.
> 
> This used to work because phys_enc->hw_pp is only initialized in mode
> set [1], so the first prepare_commit() will return before any register
> read/write as hw_pp would be NULL.
> 
> However, when we try to implement support for INTF TE, we will run into
> the clock issue described above as hw_intf will *not* be NULL on the
> first prepare_commit(). This is because the initialization of
> dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].
> 
> To avoid this issue, let's enable TE during prepare_for_kickoff()
> instead as the core clock rates are guaranteed to be set then.
> 
> Depends on: "Implement tearcheck support on INTF block" [3]
> 
> Changes in V3:
> - Added function prototypes
> - Reordered function definitions to make change more legible
> - Removed prepare_commit() function from dpu_encoder_phys_cmd
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
> [2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
> [3] https://patchwork.freedesktop.org/series/112332/
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index cb05036f2916..c6feffafa13f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -40,6 +40,10 @@
>   
>   #define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
>   
> +static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
> +		struct dpu_encoder_phys *phys_enc);

This should not be necessary.


> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc);
> +
>   static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
>   {
>   	return (phys_enc->split_role != ENC_ROLE_SLAVE);
> @@ -611,6 +615,8 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>   			  phys_enc->hw_pp->idx - PINGPONG_0);
>   	}
>   
> +	dpu_encoder_phys_cmd_enable_te(phys_enc);
> +

And this is much cleaner and easier to spot the difference than it was 
in the previous patch. Thank you!

With the dpu_encoder_phys_cmd_is_ongoing_pptx() prototype removed it LGTM.

>   	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
>   			phys_enc->hw_pp->idx - PINGPONG_0,
>   			atomic_read(&phys_enc->pending_kickoff_cnt));
> @@ -641,8 +647,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   	return false;
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_commit(
> -		struct dpu_encoder_phys *phys_enc)
> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_encoder_phys_cmd *cmd_enc =
>   		to_dpu_encoder_phys_cmd(phys_enc);
> @@ -799,7 +804,6 @@ static void dpu_encoder_phys_cmd_trigger_start(
>   static void dpu_encoder_phys_cmd_init_ops(
>   		struct dpu_encoder_phys_ops *ops)
>   {
> -	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
>   	ops->is_master = dpu_encoder_phys_cmd_is_master;
>   	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_cmd_enable;

-- 
With best wishes
Dmitry

