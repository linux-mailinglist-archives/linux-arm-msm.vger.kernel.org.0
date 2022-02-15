Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5712D4B70B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 17:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiBOPor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 10:44:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237834AbiBOPo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 10:44:28 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C754FEACAE
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:38:38 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id g4-20020a9d1284000000b005acec6d2d26so993715otg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=79WoF2L7ukRve2muk/tu/qHceOSi7bzysI2aa/CMOXA=;
        b=u+qiAmMOMV006XAEAVy3+E51xvWwpbl/M44DS9AVHJQYZ//BkQvjVaCX2SED2bSXRa
         FZYV3PLwmtaF7OXCdmRAtrXZFnVZfWtxrMfv8hvMpT8038Hec3Tv4OZ4cIhVCBa/4SkQ
         yswmsguvYLWFlJGabBCCfIG2axLhmtPaTA5tevam0QWEP3PE06ZAntBv0NFkVfYNuDMN
         nFezDI1R4ZkuoZ1rOV8AKY4cMKh2BPDm/loCi+o+YAHzOf/l4bf3cj5BmR8LCuvBtN3Z
         IrC4iu1ZMOVqk/AdYbUgcHrEe3rVQCR3ILiGQv9LzIlCDtWo5PG3RVWBbiVDPhDwUqRD
         fkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=79WoF2L7ukRve2muk/tu/qHceOSi7bzysI2aa/CMOXA=;
        b=syHXgsBaNMyksOHrk+fUwkKJ5HKZE/l6Jx1DaAvAkh0+pyzReiYipHE/hnsbnjSG5V
         igXOK5v20EM2WKgMGQdKwWgN4CvBpXYksGIdzzMhr5+2h98O8c8BVzgkQ/hgwE9P8j9K
         USIlGT9uYofDJ/9Nj2479zZ8IaC98gU3ExbT7/Cjw0ynUaWh7kl5rHR1xj5ewxABIrPg
         wa/nIGvBboBArtpr80IAbvFKRlT9/M+rygRACEVQb7rrsU/qrLJjoYE/r4+c2hvpqYgO
         KaXvk/gittk/Zm621mHeLpNYvclyn25jS2qO5RV8AmgrIbGsp8YhCtxiekbK9bGF6bn8
         oGVg==
X-Gm-Message-State: AOAM531PSYlD8QSa+gOmF9TZk5pgiJFyiWckgzWYrb8o1zLRv9cwtkA5
        HuFZXSqdpJncUMl0UQmAiUpogg==
X-Google-Smtp-Source: ABdhPJyL8e6CearK0+dFt9ezcISvk12UqF5WTlFgl2h6Btw5pZx1UfT+UVx6fy6p8BwzPrP8YAqiig==
X-Received: by 2002:a9d:7017:: with SMTP id k23mr1508338otj.63.1644939517851;
        Tue, 15 Feb 2022 07:38:37 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
        by smtp.gmail.com with ESMTPSA id t31sm16069416oaa.9.2022.02.15.07.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:38:37 -0800 (PST)
Date:   Tue, 15 Feb 2022 09:38:35 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/8] drm/msm/dpu: remove msm_dp cached in
 dpu_encoder_virt
Message-ID: <YgvI+0vqMp5ZPDU0@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
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

> Stop caching msm_dp instance in dpu_encoder_virt since it's not used
> now.
> 
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c59976deb1cb..401e37f50d54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -168,7 +168,6 @@ enum dpu_enc_rc_states {
>   * @vsync_event_work:		worker to handle vsync event for autorefresh
>   * @topology:                   topology of the display
>   * @idle_timeout:		idle timeout duration in milliseconds
> - * @dp:				msm_dp pointer, for DP encoders
>   */
>  struct dpu_encoder_virt {
>  	struct drm_encoder base;
> @@ -207,8 +206,6 @@ struct dpu_encoder_virt {
>  	struct msm_display_topology topology;
>  
>  	u32 idle_timeout;
> -
> -	struct msm_dp *dp;
>  };
>  
>  #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
> @@ -2123,8 +2120,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>  		timer_setup(&dpu_enc->vsync_event_timer,
>  				dpu_encoder_vsync_event_handler,
>  				0);
> -	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> -		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
>  
>  	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>  			dpu_encoder_off_work);
> -- 
> 2.34.1
> 
