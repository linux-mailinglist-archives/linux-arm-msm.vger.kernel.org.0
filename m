Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2677076F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 02:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjERAfg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 20:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjERAfg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 20:35:36 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447FF272B
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 17:35:34 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ac785015d6so14520681fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 17:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684370132; x=1686962132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7H9lyxDxkDg61JKpVX8LIy2P7Ao18JUXxapxUbMICc=;
        b=Xk0Qw5NSWZMJW3vyY1uJCjV3ljtw/lISS3MHID/Ixq3DNVIBvOBgHA/CqW5JXhtrQh
         dRLbFCWM21ZVDplBv0Czt5VyQfs5IUH2T6+JJ+Kdwa+tqUtBMXNZt1/YtaP7zbqdhU3g
         ICnMZ3SFYQEFwt3tZ+DFogNIvxVW6NhGIArUKoIgfOrema/xiO9YkqmJbbwwjN1jS7Fm
         rCYpsnuZFNwEwOEJ+X9zYd3UmXlH53sr11BKSuZW6ju4KEXtGBYBzwV0xNEWXizhp5Z3
         udT38AGLyBLWIfgAlQGNhvI49jp6oUrQiLOmLnySNdzqi5vB481DoYDXg/PRetVnc9uB
         4LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684370132; x=1686962132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7H9lyxDxkDg61JKpVX8LIy2P7Ao18JUXxapxUbMICc=;
        b=bdR/K+DDtELxQqUD4Noozm+/86U6rRZOAOBejpBW6QEP6j0yae2owvitRAKHiemqpm
         9YZOKdPJ0RMnEkp/5o5Q0SshEgFFjRGP+QVXhbDCU8+bJ+OJRSd0GlNRfst6pEVZUe9Q
         6jzziynnxyLsTXGpVg9MVmGiZBMv2oIInIg6RUKoXpLoXbTAAF7XSwmaBGiBNWtwjr39
         Z7wrqqjA8kW5scLOdDroHePAYTP5KD2zVywH5jrxFqhpXEFc445ie/5iplk55xcHHxHp
         4K1TA0XVuL5sZHWFnyeSKBvzpos+G60oTAokJ6AOY3R1KGTjVe0UgR/E4Qp8yOST1kSa
         2LuQ==
X-Gm-Message-State: AC+VfDyDqUlST95IQoqj+9xHzdO6R94tmN9pFhKCxYXTfYCnHqnWJcFr
        7cqmdaR7jTubuJU4jLpzcwV9ag==
X-Google-Smtp-Source: ACHHUZ6/bBHV4OVUk6eVqbH/BFUswLQE8b3ckWHp/5nr6Ou60zCjGmQc81O9FiaSfjPUSzHUeLNMQg==
X-Received: by 2002:a05:651c:212:b0:2a8:c75c:96cb with SMTP id y18-20020a05651c021200b002a8c75c96cbmr10096891ljn.1.1684370132479;
        Wed, 17 May 2023 17:35:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w26-20020a19c51a000000b004eb3b6da6f5sm55081lfe.228.2023.05.17.17.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 17:35:31 -0700 (PDT)
Message-ID: <82be767c-1c61-7685-5432-2f5f62bee9e8@linaro.org>
Date:   Thu, 18 May 2023 03:35:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 6/8] drm/msm/dpu: separate DSC flush update out of
 interface
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2023 01:01, Kuogee Hsieh wrote:
> Currently DSC flushing happens during interface configuration at
> dpu_hw_ctl_intf_cfg_v1(). Separate DSC flush away from
> dpu_hw_ctl_intf_cfg_v1() by adding dpu_hw_ctl_update_pending_flush_dsc_v1()
> to handle both per-DSC engine and DSC flush bits at same time to make it
> consistent with the location of flush programming of other DPU sub-blocks.
> 
> Changes in v10:
> -- rewording commit text
> -- pass ctl directly instead of dpu_enc to dsc_pipe_cfg()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 ++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 13 +++++++++++++
>   3 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ffa6f04..1957545 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1834,7 +1834,8 @@ dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
>   	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
>   }
>   
> -static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
> +				     struct dpu_hw_dsc *hw_dsc,
>   				     struct dpu_hw_pingpong *hw_pp,
>   				     struct drm_dsc_config *dsc,
>   				     u32 common_mode,
> @@ -1854,6 +1855,9 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>   
>   	if (hw_pp->ops.enable_dsc)
>   		hw_pp->ops.enable_dsc(hw_pp);
> +
> +	if (ctl->ops.update_pending_flush_dsc)
> +		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
>   }
>   
>   static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> @@ -1861,6 +1865,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   {
>   	/* coding only for 2LM, 2enc, 1 dsc config */
>   	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
> +	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>   	int this_frame_slices;
> @@ -1898,7 +1903,8 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> -		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
> +		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i], dsc,
> +					 dsc_common_mode, initial_lines);

Moving dsc to the next line would be more logical.

>   }
>   
>   void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4f7cfa9..4e132d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -139,6 +139,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   				CTL_DSPP_n_FLUSH(dspp - DSPP_0),
>   				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>   		}
> +
> +	if (ctx->pending_flush_mask & BIT(DSC_IDX))
> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
> +			      ctx->pending_dsc_flush_mask);
> +
>   	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>   }
>   
> @@ -285,6 +290,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>   	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
>   }
>   
> +static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
> +						   enum dpu_dsc dsc_num)
> +{
> +	ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
> +	ctx->pending_flush_mask |= BIT(DSC_IDX);
> +}
> +
>   static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>   	enum dpu_dspp dspp, u32 dspp_sub_blk)
>   {
> @@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>   		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>   
> -	if (cfg->dsc)
> -		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
> -
>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>   		mode_sel |= BIT(17);
>   
> @@ -524,10 +533,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> -	if (cfg->dsc) {
> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> +
> +	if (cfg->dsc)
>   		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> -	}
>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> @@ -630,6 +638,8 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>   		ops->update_pending_flush_merge_3d =
>   			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>   		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
> +		ops->update_pending_flush_dsc =
> +			dpu_hw_ctl_update_pending_flush_dsc_v1;
>   	} else {
>   		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>   		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 6292002..d5f3ef8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
>   		enum dpu_dspp blk, u32 dspp_sub_blk);
>   
>   	/**
> +	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
> +	 * No effect on hardware
> +	 * @ctx: ctl path ctx pointer
> +	 * @blk: interface block index
> +	 */
> +	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
> +		enum dpu_dsc blk);

Please align to the opening parenthesis.

> +
> +	/**
>   	 * Write the value of the pending_flush_mask to hardware
>   	 * @ctx       : ctl path ctx pointer
>   	 */
> @@ -229,6 +238,9 @@ struct dpu_hw_ctl_ops {
>    * @pending_flush_mask: storage for pending ctl_flush managed via ops
>    * @pending_intf_flush_mask: pending INTF flush
>    * @pending_wb_flush_mask: pending WB flush
> + * @pending_merge_3d_flush_mask: pending merge_3d flush
> + * @pending_dspp_flush_mask: pending dspp flush

These two can go to a separate patch.

> + * @pending_dsc_flush_mask: pending dsc flush
>    * @ops: operation list
>    */
>   struct dpu_hw_ctl {
> @@ -245,6 +257,7 @@ struct dpu_hw_ctl {
>   	u32 pending_wb_flush_mask;
>   	u32 pending_merge_3d_flush_mask;
>   	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
> +	u32 pending_dsc_flush_mask;
>   
>   	/* ops */
>   	struct dpu_hw_ctl_ops ops;

-- 
With best wishes
Dmitry

