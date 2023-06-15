Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14F717322BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 00:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbjFOW1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 18:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239485AbjFOW1N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 18:27:13 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B679294D
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:26:56 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0421F20512;
        Fri, 16 Jun 2023 00:26:53 +0200 (CEST)
Date:   Fri, 16 Jun 2023 00:26:52 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 04/22] drm/msm: enumerate DSI interfaces
Message-ID: <wozcijpgqmpyavcfkvtkmtvho3jenjswx32djzv7wq7r7ko6xb@ejncq7zfm7un>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613001004.3426676-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-13 03:09:43, Dmitry Baryshkov wrote:
> Follow the DP example and define MSM_DSI_CONTROLLER_n enumeration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nice, that'll be cleaner.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/msm_drv.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e13a8cbd61c9..ad4fad2bcdc8 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -65,6 +65,12 @@ enum msm_dp_controller {
>  	MSM_DP_CONTROLLER_COUNT,
>  };
>  
> +enum msm_dsi_controller {
> +	MSM_DSI_CONTROLLER_0,
> +	MSM_DSI_CONTROLLER_1,
> +	MSM_DSI_CONTROLLER_COUNT,
> +};
> +
>  #define MSM_GPU_MAX_RINGS 4
>  #define MAX_H_TILES_PER_DISPLAY 2
>  
> @@ -117,7 +123,7 @@ struct msm_drm_private {
>  	struct hdmi *hdmi;
>  
>  	/* DSI is shared by mdp4 and mdp5 */
> -	struct msm_dsi *dsi[2];
> +	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
>  
>  	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
>  
> -- 
> 2.39.2
> 
