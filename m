Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E7C72BBFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbjFLJWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbjFLJV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:21:59 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0FD4C21
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:14:43 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D48423F0E3;
        Mon, 12 Jun 2023 11:14:40 +0200 (CEST)
Date:   Mon, 12 Jun 2023 11:14:39 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Degdag Mohamed <degdagmohamed@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Message-ID: <aenzh4vscayeqvyjpbxifog7l3yuxv5lh5cizcie7dk7awx5z7@nuajlsildlw6>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-12 06:16:15, Dmitry Baryshkov wrote:
> Since commit 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
> overhead") the drm_fb_helper_funcs::fb_dirty helper is required for
> proper dirty/damage processing. The drm/msm driver requires that to
> function to let CMD panels to work. Use simplified version of
> drm_fbdev_generic_helper_fb_dirty() to fix support for CMD mode panels.
> 
> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
> Fixes: 93e81e38e197 ("drm/fb_helper: Minimize damage-helper overhead")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks, this solves the following warning:

    msm_dpu ae01000.display-controller: drm_WARN_ON_ONCE(!helper->funcs->fb_dirty)
    WARNING: CPU: 0 PID: 9 at drivers/gpu/drm/drm_fb_helper.c:381 drm_fb_helper_damage_work+0x1c0/0x20c

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Note that drm_fb_helper_funcs documents this as "This callback is
optional": is it no longer optional, or are we enabling a damage feature
that makes it not-optional?

- Marijn

> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index fa9c1cbffae3..b933a85420f6 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -139,8 +139,28 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
>  	return ret;
>  }
>  
> +static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
> +			      struct drm_clip_rect *clip)
> +{
> +	struct drm_device *dev = helper->dev;
> +	int ret;
> +
> +	/* Call damage handlers only if necessary */
> +	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
> +		return 0;
> +
> +	if (helper->fb->funcs->dirty) {
> +		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
> +		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>  	.fb_probe = msm_fbdev_create,
> +	.fb_dirty = msm_fbdev_fb_dirty,
>  };
>  
>  /*
> -- 
> 2.39.2
> 
