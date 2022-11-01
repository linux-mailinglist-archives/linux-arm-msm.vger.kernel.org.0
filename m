Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10117614A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Nov 2022 13:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiKAMPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Nov 2022 08:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbiKAMPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Nov 2022 08:15:10 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C957F15827
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Nov 2022 05:15:09 -0700 (PDT)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 947E13EEFE;
        Tue,  1 Nov 2022 13:15:07 +0100 (CET)
Date:   Tue, 1 Nov 2022 13:15:06 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
        quic_bjorande@quicinc.com, quic_aravindh@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
Subject: Re: [PATCH v8 12/15] drm/msm/disp/dpu: get timing engine status from
 intf status register
Message-ID: <20221101121506.eyzsepukm6smwvxh@SoMainline.org>
References: <1665576159-3749-1-git-send-email-quic_vpolimer@quicinc.com>
 <1665576159-3749-13-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1665576159-3749-13-git-send-email-quic_vpolimer@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-10-12 17:32:36, Vinod Polimera wrote:
> Timing gen status can be read reliablly from intf status

Typo. "reliably read from the intf status register..."

> register rather than from the timing gen control register,
> which will readback as "0" after disable though the timing
> gen is still under going disable path. This support was

undergoing*, and it's still rather unclear what behaviour you're trying
to describe.

It seems like you're stating that INTF_STATUS (in the first bit...) will
read zero when the timing engine (in hardware) has finished disabling
rather than reading zero as soon as dpu_hw_intf_enable_timing_engine()
writes a zero.

> added from DPU version 5.0.0.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 +++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    |  8 +++++++-
>  3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 27f029f..0332cea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -77,7 +77,8 @@
>  
>  #define INTF_SC7180_MASK BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE)
>  
> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
> +#define INTF_SC7280_MASK \
> +	(INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_STATUS_SUPPORTED))
>  
>  #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>  			 BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38a..21ae3cf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -203,17 +203,19 @@ enum {
>  
>  /**
>   * INTF sub-blocks
> - * @DPU_INTF_INPUT_CTRL         Supports the setting of pp block from which
> - *                              pixel data arrives to this INTF
> - * @DPU_INTF_TE                 INTF block has TE configuration support
> - * @DPU_DATA_HCTL_EN            Allows data to be transferred at different rate
> -                                than video timing
> + * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
> + *                                  pixel data arrives to this INTF
> + * @DPU_INTF_TE                     INTF block has TE configuration support
> + * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
> +				    than video timing

Use spaces instead of tabs.

> + * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>   * @DPU_INTF_MAX
>   */
>  enum {
>  	DPU_INTF_INPUT_CTRL = 0x1,
>  	DPU_INTF_TE,
>  	DPU_DATA_HCTL_EN,
> +	DPU_INTF_STATUS_SUPPORTED,
>  	DPU_INTF_MAX
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 7ce66bf..2394473 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -62,6 +62,7 @@
>  #define   INTF_LINE_COUNT               0x0B0
>  
>  #define   INTF_MUX                      0x25C
> +#define   INTF_STATUS                   0x26C
>  
>  #define INTF_CFG_ACTIVE_H_EN	BIT(29)
>  #define INTF_CFG_ACTIVE_V_EN	BIT(30)
> @@ -297,8 +298,13 @@ static void dpu_hw_intf_get_status(
>  		struct intf_status *s)
>  {
>  	struct dpu_hw_blk_reg_map *c = &intf->hw;
> +	unsigned long cap = intf->cap->features;
> +
> +	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
> +		s->is_en = BIT(0) & DPU_REG_READ(c, INTF_STATUS);

It is more clear to write `& BIT(0)` at the end.

- Marijn

> +	else
> +		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
>  
> -	s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
>  	s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) & BIT(31));
>  	if (s->is_en) {
>  		s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> -- 
> 2.7.4
> 
