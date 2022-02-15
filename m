Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FECA4B7147
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 17:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239237AbiBOPpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 10:45:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240579AbiBOPpT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 10:45:19 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E879C128654
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:39:24 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso23638099oon.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ct2CVk6dUJW6dVZvAitEWHitS32Y2YFZk5FB7uFmIkA=;
        b=Wbr4Z8oY9Wk174KQbQfXQmjU3nl9K/c77mQlOg0xxlaCLv3PRvl8y/y7QDDJL6Iaat
         ci7Osr0N2e20RQt8UeGWh8V1AuyHVbloc6K+KMVFch0gxjQHUza+fdPka9LTZ1r7Eg3H
         v0JruiSEVTAeabclJQkoNVS3z4SNHOoneJ1zHfTomTA3rf5spL3GvW0bs/kkUqDGFRPD
         zG5d+lXwUwKj4cn+sRR6Qr1m1qnMOoRE/rLOu2cZGOt45fvBhp0eCrVK3N+vOtEXYjm9
         FhT8X1xshi+v5iWD0QZhmCY1RpddpiGi21Rdc1AmYeH4ndISxQvYBv/eKXC4F1AYAipX
         5XMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ct2CVk6dUJW6dVZvAitEWHitS32Y2YFZk5FB7uFmIkA=;
        b=e2j5w5hpx9D97B/fOUJaEVJ3WZcruc4mHcK5rxCBFx+fSCRHztiQo9Au7KRUvnGwlJ
         z8NtQvkpGBhwOXnvQhqQKOEeUlhzfzO9x7Hvpzz+KkOEaBKTW8/qeAGcNzKBXKY4++tH
         b0PZaewWZV1a/CLgVpWPnNKAVzdy5SgCLrtt1+bhd5VQ5LdeAbpcqaQ2qNFreStBN8sH
         goW/HItOhMN1luwSwCNcdK97y+NR0gBgROUk3BChlwR+IuZiJVeOHQG3wYfa1KGaxbYy
         WHXRYBPdK4pONJO8+54hlFtz9z9iS8aOsjuqXYklCsUzwTjUaVvjKQ7P7ru7hvQSiOR7
         /VgQ==
X-Gm-Message-State: AOAM531NOMV6ZJ82L8KusJ8U8KV2exTs+Nqe01CMsczOE2vzsVV4ZcGk
        NMiPtz+73N+nRWmKcg2qwyGDFA==
X-Google-Smtp-Source: ABdhPJx99EY0s2c9a0LXYT8GJQ4ktSsFxhDi1MKrSF0rWNSksyFko+sP7QeJGy50N9kHKTagjworsg==
X-Received: by 2002:a05:6870:1147:: with SMTP id 7mr1556476oag.252.1644939564237;
        Tue, 15 Feb 2022 07:39:24 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
        by smtp.gmail.com with ESMTPSA id y2sm11710607oao.10.2022.02.15.07.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:39:23 -0800 (PST)
Date:   Tue, 15 Feb 2022 09:39:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: encoder: drop unused mode_fixup
 callback
Message-ID: <YgvJKZxp/K8YKCHk@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Feb 08:16 CST 2022, Dmitry Baryshkov wrote:

> Both cmd and vid backends provide useless mode_fixup() callback. Drop
> it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  4 ----
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 10 ----------
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 --------------
>  4 files changed, 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 480d02ccff8c..394916e8fe08 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -602,10 +602,6 @@ static int dpu_encoder_virt_atomic_check(
>  		if (phys->ops.atomic_check)
>  			ret = phys->ops.atomic_check(phys, crtc_state,
>  					conn_state);
> -		else if (phys->ops.mode_fixup)
> -			if (!phys->ops.mode_fixup(phys, mode, adj_mode))
> -				ret = -EINVAL;
> -
>  		if (ret) {
>  			DPU_ERROR_ENC(dpu_enc,
>  					"mode unsupported, phys idx %d\n", i);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb6b84b..7b14948c4c87 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -84,7 +84,6 @@ struct dpu_encoder_virt_ops {
>   * @is_master:			Whether this phys_enc is the current master
>   *				encoder. Can be switched at enable time. Based
>   *				on split_role and current mode (CMD/VID).
> - * @mode_fixup:			DRM Call. Fixup a DRM mode.
>   * @mode_set:			DRM Call. Set a DRM mode.
>   *				This likely caches the mode, for use at enable.
>   * @enable:			DRM Call. Enable a DRM mode.
> @@ -117,9 +116,6 @@ struct dpu_encoder_phys_ops {
>  			struct dentry *debugfs_root);
>  	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>  	bool (*is_master)(struct dpu_encoder_phys *encoder);
> -	bool (*mode_fixup)(struct dpu_encoder_phys *encoder,
> -			const struct drm_display_mode *mode,
> -			struct drm_display_mode *adjusted_mode);
>  	void (*mode_set)(struct dpu_encoder_phys *encoder,
>  			struct drm_display_mode *mode,
>  			struct drm_display_mode *adjusted_mode);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 35071964d0f6..1796f83b47ae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -45,15 +45,6 @@ static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
>  	return (phys_enc->split_role != ENC_ROLE_SLAVE);
>  }
>  
> -static bool dpu_encoder_phys_cmd_mode_fixup(
> -		struct dpu_encoder_phys *phys_enc,
> -		const struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> -{
> -	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
> -	return true;
> -}
> -
>  static void _dpu_encoder_phys_cmd_update_intf_cfg(
>  		struct dpu_encoder_phys *phys_enc)
>  {
> @@ -756,7 +747,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>  	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
>  	ops->is_master = dpu_encoder_phys_cmd_is_master;
>  	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
> -	ops->mode_fixup = dpu_encoder_phys_cmd_mode_fixup;
>  	ops->enable = dpu_encoder_phys_cmd_enable;
>  	ops->disable = dpu_encoder_phys_cmd_disable;
>  	ops->destroy = dpu_encoder_phys_cmd_destroy;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ddd9d89cd456..1831fe37c88c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -225,19 +225,6 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
>  	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
>  }
>  
> -static bool dpu_encoder_phys_vid_mode_fixup(
> -		struct dpu_encoder_phys *phys_enc,
> -		const struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> -{
> -	DPU_DEBUG_VIDENC(phys_enc, "\n");
> -
> -	/*
> -	 * Modifying mode has consequences when the mode comes back to us
> -	 */
> -	return true;
> -}
> -
>  static void dpu_encoder_phys_vid_setup_timing_engine(
>  		struct dpu_encoder_phys *phys_enc)
>  {
> @@ -676,7 +663,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>  {
>  	ops->is_master = dpu_encoder_phys_vid_is_master;
>  	ops->mode_set = dpu_encoder_phys_vid_mode_set;
> -	ops->mode_fixup = dpu_encoder_phys_vid_mode_fixup;
>  	ops->enable = dpu_encoder_phys_vid_enable;
>  	ops->disable = dpu_encoder_phys_vid_disable;
>  	ops->destroy = dpu_encoder_phys_vid_destroy;
> -- 
> 2.34.1
> 
