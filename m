Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6B2B6910BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 19:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjBISwH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 13:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjBISwD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 13:52:03 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D565327494
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 10:52:01 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id dr8so9197647ejc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 10:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5LJPiqpx/vp1jhgzIqa9eAFSN89bT759X1KZY+TEZo=;
        b=Ht7Af3YVfTldlZXfDso2azYDl/h3WKteOjJpfbBnDV/O/JD/NgnEJqn0DFuRLjNbB7
         EInowGaec0IzBOoAZAtH467z69qvpy2J33AOgjH2GR8Jfxze2lNCmU9hLsEDsdkw/W6r
         kEbsIIj6dEiVVRRSnRDZ7rC2H/VwxDD1i0O9MvNFcipt0z0MDONKguNu4nn6M2Kl14QK
         8snvOyLCStxxGw45DPhaFeZL2g/3xWVjRvSNTldIiACYLEH4KuDa4IzpdVQKTwHt412w
         I6AETGhuguMkB9dAppFz66r1hWEeSSlzZXQOJq7xB6jqplnBWtVrxjERGbZvhBKxtZjO
         iI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5LJPiqpx/vp1jhgzIqa9eAFSN89bT759X1KZY+TEZo=;
        b=WgCF5+mdE3acssyy2w+EodBTUEJcGbyXfg0UbNMXvgU9xsraDgZAYkJuIHKYm5znLA
         SYbDBqGVwaGTV6C1ycYnom9h1RtyexNaLLcxkRsOn2QOxSRE3oRwrZ5lfPXKd6VdFXe3
         R9jBJNLpVj4Jnbw44Rd9eUjR2lRPiI+UT9Z8CN3RNuwDzSyKQ9njGfR/N6ExU6mp6zTs
         Pc05WQaFlo2DsyfymSBT0clJdjtRHh7Qs0efWXSoUDamUfFpJNjDg5TTYr7tyQaI1x/D
         9qKJeSohkknpatgbXTYTg1GqhGRMCnygni+kQ3Xza+Rpnp4htAkJTzcSpzeo+L9ELqzt
         /0JQ==
X-Gm-Message-State: AO0yUKURTzOqUdK45zMhCr5LYWN3VJm6cz+vi4Deq/tcLRmgDnuP/Xto
        V1ti2xegGBlYwqnCICHUl2OQXg==
X-Google-Smtp-Source: AK7set+Bl2xY5ebDAUqfkzSEeNxk/3Iuo7DLKdu5mlmIDj3DtDRQMnu7WF7nIQFpjUEYq/fAOBxdtA==
X-Received: by 2002:a17:906:fb98:b0:870:3c70:8c8d with SMTP id lr24-20020a170906fb9800b008703c708c8dmr11180821ejb.17.1675968720418;
        Thu, 09 Feb 2023 10:52:00 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906368b00b0088519b9206bsm1199304ejc.130.2023.02.09.10.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 10:52:00 -0800 (PST)
Message-ID: <4d11cb36-96eb-36ac-e86e-7a0947e4bdcf@linaro.org>
Date:   Thu, 9 Feb 2023 20:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 1/4] drm/msm/dpu: Move TE setup to
 prepare_for_kickoff()
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-2-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209184426.4437-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 20:44, Jessica Zhang wrote:
> Currently, DPU will enable TE during prepare_commit(). However, this
> will cause issues when trying to read/write to register in
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
> [1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
> [2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
> [3] https://patchwork.freedesktop.org/series/112332/
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 78 ++++++++++---------
>   1 file changed, 43 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index cb05036f2916..561406d92a1a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -583,39 +583,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
>   	kfree(cmd_enc);
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> -		struct dpu_encoder_phys *phys_enc)
> -{
> -	struct dpu_encoder_phys_cmd *cmd_enc =
> -			to_dpu_encoder_phys_cmd(phys_enc);
> -	int ret;
> -
> -	if (!phys_enc->hw_pp) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
> -	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
> -		      phys_enc->hw_pp->idx - PINGPONG_0,
> -		      atomic_read(&phys_enc->pending_kickoff_cnt));
> -
> -	/*
> -	 * Mark kickoff request as outstanding. If there are more than one,
> -	 * outstanding, then we have to wait for the previous one to complete
> -	 */
> -	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
> -	if (ret) {
> -		/* force pending_kickoff_cnt 0 to discard failed kickoff */
> -		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> -		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
> -			  DRMID(phys_enc->parent), ret,
> -			  phys_enc->hw_pp->idx - PINGPONG_0);
> -	}
> -
> -	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
> -			phys_enc->hw_pp->idx - PINGPONG_0,
> -			atomic_read(&phys_enc->pending_kickoff_cnt));
> -}
> -
>   static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -641,8 +608,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   	return false;
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_commit(
> -		struct dpu_encoder_phys *phys_enc)
> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_encoder_phys_cmd *cmd_enc =
>   		to_dpu_encoder_phys_cmd(phys_enc);
> @@ -700,6 +666,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>   			 "disabled autorefresh\n");
>   }
>   
> +static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> +		struct dpu_encoder_phys *phys_enc)
> +{
> +	struct dpu_encoder_phys_cmd *cmd_enc =
> +			to_dpu_encoder_phys_cmd(phys_enc);
> +	int ret;
> +
> +	if (!phys_enc->hw_pp) {
> +		DPU_ERROR("invalid encoder\n");
> +		return;
> +	}
> +
> +
> +	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
> +		      phys_enc->hw_pp->idx - PINGPONG_0,
> +		      atomic_read(&phys_enc->pending_kickoff_cnt));
> +
> +	/*
> +	 * Mark kickoff request as outstanding. If there are more than one,
> +	 * outstanding, then we have to wait for the previous one to complete
> +	 */
> +	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
> +	if (ret) {
> +		/* force pending_kickoff_cnt 0 to discard failed kickoff */
> +		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> +		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
> +			  DRMID(phys_enc->parent), ret,
> +			  phys_enc->hw_pp->idx - PINGPONG_0);
> +	}
> +
> +	dpu_encoder_phys_cmd_enable_te(phys_enc);
> +
> +	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
> +			phys_enc->hw_pp->idx - PINGPONG_0,
> +			atomic_read(&phys_enc->pending_kickoff_cnt));
> +}

Quoting v1:

Could you please move the function back to the place, so that we can see 
the actual difference?

> +
> +static void dpu_encoder_phys_cmd_prepare_commit(
> +		struct dpu_encoder_phys *phys_enc)
> +{
> +}

This is not necessary and can be dropped. There is a safety check in 
dpu_encoder_prepare_commit().

> +
>   static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
>   		struct dpu_encoder_phys *phys_enc)
>   {

-- 
With best wishes
Dmitry

