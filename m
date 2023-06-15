Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384AE73229D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 00:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjFOWTk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 18:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjFOWTj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 18:19:39 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E662DAC
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:19:38 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1C44220A8B;
        Fri, 16 Jun 2023 00:19:37 +0200 (CEST)
Date:   Fri, 16 Jun 2023 00:19:35 +0200
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
Subject: Re: [PATCH v2 01/22] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG
 done interrupts
Message-ID: <sjbbl5gp3ecs5e33tv5lsu4j42mojp7eaoe7xohmxe3snfkerm@z53wfuz46vgh>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613001004.3426676-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-13 03:09:40, Dmitry Baryshkov wrote:
> During IRQ conversion we have lost the PP_DONE interrupts for sc7280
> platform. This was left unnoticed, because this interrupt is only used
> for CMD outputs and probably no sc7[12]80 systems use DSI CMD panels.
> 
> Fixes: 667e9985ee24 ("drm/msm/dpu: replace IRQ lookup with the data in hw catalog")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Agreed.  I never really understood why these were missing, as if there
was no cmd-mode support.  The code prior to the Fixes: commit was indeed
returning interrupts without looking at hardware support at all.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++++--
>  .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 16 ++++++++++++----
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 0b05da2592c0..67566b07195a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -80,8 +80,12 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc7180_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			-1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			-1),
>  };
>  
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 9c5a3fe9cfde..6ea1cb551348 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -88,10 +88,18 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc7280_pp[] = {
> -	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			-1),
> +	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			-1),
> +	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			-1),
> +	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			-1),
>  };
>  
>  static const struct dpu_wb_cfg sc7280_wb[] = {
> -- 
> 2.39.2
> 
