Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81A5F68FA30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 23:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbjBHWSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 17:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbjBHWSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 17:18:15 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA6B22DD6
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 14:18:14 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id m2so1095582ejb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 14:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+j6KFfx3Qmji48Cg2CDZ+WAkdPyel9k/170nDiJ78M=;
        b=yjjwHJecKsnyrg8KPmSqiXjjFu98Uu2LRvMN+REP94WD9IEggEzD9t0Cd5M7EHC9DK
         zbxuE7uh/LUmtv+EJxvgaOGw+/a9xq3YTPtr/P/4MHaSMTPkvRWmmkDjXGpbr59YlL5v
         qLkhOmLNlDiJX8Dd0UYSu0MCYIyeUeoRg/vPtCGuFiLdAGzeUJeZgUSf0IYCow4FzI5Z
         sJSaQjEOKJJbq06HlrU/EizpM4dx09aADyIp2M/3Lg6p39w2AbZpW5a10KEGocCq9z+0
         bNyBbIqrXiPBpQS+xVQXPgpLrl2e0LW5lBDMWV1VJpRBHwIqHQbHrRW5KkohheflL/aF
         WNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+j6KFfx3Qmji48Cg2CDZ+WAkdPyel9k/170nDiJ78M=;
        b=PqMehEeNWpO5CfU/s7dQrl04EZY9U3CH+nzV+6ZptajYUmJ2yXuuK1u/s0m8CTWFn7
         lPRr5jw7/R7/7z+TUA0kN0xYz734N0BTkNk0aupDlUH2SPFCsl/hDMivzlTBqILopq75
         oyiLnsazcU+0H+uFpKX9cWWwP7kicNHRJpKPVL4HL1WA3pHCQc8Xkh6KihiVorvoIMuW
         HzOOVEEcEmKda7yTSr3wiv5RIzLOpc/pqdH92GMpQV72iKDKMe1d2YRCKwAKpb4r/syq
         HXHsjAXOPFOk4oiALsqdwwoOO+RWEwv1KqiZK1Wot+BsmXOdVeVUG6tTVxdYojxdgk0Q
         QJqw==
X-Gm-Message-State: AO0yUKVEZEfZE6xuDg46hvjlHDzIyz4/jWBTrSFFqJNvypF0AVTQhAIF
        y4kFPfIRP25d/x8Ub6t0PlAJtw==
X-Google-Smtp-Source: AK7set+S1W2pAxZxf43mLeE36cu3JKEoD8I483Ygu7n6ijkNwN48EBk193sZSV5rlHbyvl6slS1QVg==
X-Received: by 2002:a17:906:c9d2:b0:8aa:9831:6eb6 with SMTP id hk18-20020a170906c9d200b008aa98316eb6mr6806195ejb.18.1675894692495;
        Wed, 08 Feb 2023 14:18:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ko3-20020a170907986300b0088b93bfa782sm13274ejc.176.2023.02.08.14.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 14:18:12 -0800 (PST)
Message-ID: <884097ab-41c7-2889-5b11-91451e2f994a@linaro.org>
Date:   Thu, 9 Feb 2023 00:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230208213713.1330-1-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230208213713.1330-1-quic_jesszhan@quicinc.com>
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

On 08/02/2023 23:37, Jessica Zhang wrote:
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
> index 279a0b7015ce..746250bce3d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -587,39 +587,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
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
> @@ -645,8 +612,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   	return false;
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_commit(
> -		struct dpu_encoder_phys *phys_enc)
> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_encoder_phys_cmd *cmd_enc =
>   		to_dpu_encoder_phys_cmd(phys_enc);
> @@ -704,6 +670,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>   			 "disabled autorefresh\n");
>   }
>   
> +static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> +		struct dpu_encoder_phys *phys_enc)

Could you please move the function back to the place, so that we can see 
the actual difference?

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
> +
> +static void dpu_encoder_phys_cmd_prepare_commit(
> +		struct dpu_encoder_phys *phys_enc)
> +{
> +}

There is no need to have the empty callback, you can skip it completely. 
Actually, if it is not needed anymore for the cmd encoders, you can drop 
the .prepare_commit from struct dpu_encoder_phys_ops. And then, by 
extension, dpu_encoder_prepare_commit(), dpu_kms_prepare_commit(). This 
sounds like a nice second patch for this rfc.

> +
>   static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
>   		struct dpu_encoder_phys *phys_enc)
>   {

-- 
With best wishes
Dmitry

