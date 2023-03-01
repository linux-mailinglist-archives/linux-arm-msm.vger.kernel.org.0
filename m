Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1114F6A6A69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 11:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjCAKGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 05:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjCAKGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 05:06:10 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D230E36087
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 02:06:08 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C56133F8BB;
        Wed,  1 Mar 2023 11:06:06 +0100 (CET)
Date:   Wed, 1 Mar 2023 11:06:05 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com
Subject: Re: [PATCH v4 4/4] drm/msm/mdp4: Remove empty prepare_commit()
 function
Message-ID: <20230301100605.gnevoxc4xgxfbilu@SoMainline.org>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-5-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221184256.1436-5-quic_jesszhan@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-02-21 10:42:56, Jessica Zhang wrote:
> Remove empty prepare_commit() function from MDP4 driver.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 9a1a0769575d..6e37072ed302 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -84,10 +84,6 @@ static void mdp4_disable_commit(struct msm_kms *kms)
>  	mdp4_disable(mdp4_kms);
>  }
>  
> -static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *state)
> -{
> -}
> -
>  static void mdp4_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
>  {
>  	/* TODO */
> @@ -154,7 +150,6 @@ static const struct mdp_kms_funcs kms_funcs = {
>  		.disable_vblank  = mdp4_disable_vblank,
>  		.enable_commit   = mdp4_enable_commit,
>  		.disable_commit  = mdp4_disable_commit,
> -		.prepare_commit  = mdp4_prepare_commit,
>  		.flush_commit    = mdp4_flush_commit,
>  		.wait_flush      = mdp4_wait_flush,
>  		.complete_commit = mdp4_complete_commit,
> -- 
> 2.39.2
> 
