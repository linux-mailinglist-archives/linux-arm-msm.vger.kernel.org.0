Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 321AF501E40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 00:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiDNW3T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 18:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237769AbiDNW3S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 18:29:18 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A04AC31EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 15:26:51 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 506773F6DE;
        Fri, 15 Apr 2022 00:26:49 +0200 (CEST)
Date:   Fri, 15 Apr 2022 00:26:42 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, markyacoub@chromium.org,
        quic_jesszhan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH 06/12] drm/msm/dpu: make changes to dpu_encoder to
 support virtual encoder
Message-ID: <20220414222642.f7wy3wdbsgmrqrxj@SoMainline.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-02-04 13:17:19, Abhinav Kumar wrote:
> Make changes to dpu_encoder to support virtual encoder needed
> to support writeback for dpu.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 57 +++++++++++++++++++++--------
>  1 file changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index e977c05..947069b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -974,6 +974,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> +	enum dpu_hw_blk_type blk_type;
>  	int num_lm, num_ctl, num_pp;
>  	int i, j;
>  
> @@ -1061,20 +1062,36 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>  		phys->hw_pp = dpu_enc->hw_pp[i];
>  		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>  
> +		if (phys->intf_mode == INTF_MODE_WB_LINE)
> +			blk_type = DPU_HW_BLK_WB;
> +		else
> +			blk_type = DPU_HW_BLK_INTF;
> +
>  		num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
> -			global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
> +			global_state, drm_enc->base.id, blk_type,
>  			hw_blk, ARRAY_SIZE(hw_blk));
> -		for (j = 0; j < num_blk; j++) {
> -			struct dpu_hw_intf *hw_intf;
>  
> -			hw_intf = to_dpu_hw_intf(hw_blk[i]);
> -			if (hw_intf->idx == phys->intf_idx)
> -				phys->hw_intf = hw_intf;
> +		if (blk_type == DPU_HW_BLK_WB) {
> +			for (j = 0; j < num_blk; j++) {
> +				struct dpu_hw_wb *hw_wb;
> +
> +				hw_wb = to_dpu_hw_wb(hw_blk[i]);
> +				if (hw_wb->idx == phys->intf_idx)
> +					phys->hw_wb = hw_wb;
> +			}
> +		} else {
> +			for (j = 0; j < num_blk; j++) {
> +				struct dpu_hw_intf *hw_intf;
> +
> +				hw_intf = to_dpu_hw_intf(hw_blk[i]);
> +				if (hw_intf->idx == phys->intf_idx)
> +					phys->hw_intf = hw_intf;
> +			}

It appears the original bit of code iterates j from 0 to num_blks yet
only uses i as iteration value.  All of this code seems reentrant
meaning that executing it more than one times is redundant.  You've
adopted this mistake, though I'd argue it should use j in hw_blk[i] as
that follows the number of elements in hw_blk returned by
dpu_rm_get_assigned_resources.

I suggest to address this in a separate patch (I can send that too, feel
free to add my Reported-by otherwise) and rebase this patch on top of
that, substituting i with j here as well.  It seems to have been
introduced by b954fa6baaca ("drm/msm/dpu: Refactor rm iterator").

- Marijn

>  		}
>  
> -		if (!phys->hw_intf) {
> +		if (!phys->hw_intf && !phys->hw_wb) {
>  			DPU_ERROR_ENC(dpu_enc,
> -				      "no intf block assigned at idx: %d\n", i);
> +				      "no intf or WB block assigned at idx: %d\n", i);
>  			return;
>  		}
>  
> @@ -1224,15 +1241,22 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>  	mutex_unlock(&dpu_enc->enc_lock);
>  }
>  
> -static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
> +static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
>  		enum dpu_intf_type type, u32 controller_id)
>  {
>  	int i = 0;
>  
> -	for (i = 0; i < catalog->intf_count; i++) {
> -		if (catalog->intf[i].type == type
> -		    && catalog->intf[i].controller_id == controller_id) {
> -			return catalog->intf[i].id;
> +	if (type != INTF_WB) {
> +		for (i = 0; i < catalog->intf_count; i++) {
> +			if (catalog->intf[i].type == type
> +				&& catalog->intf[i].controller_id == controller_id) {
> +				return catalog->intf[i].id;
> +			}
> +		}
> +	} else {
> +		for (i = 0; i < catalog->wb_count; i++) {
> +			if (catalog->wb[i].id == controller_id)
> +				return catalog->wb[i].id;
>  		}
>  	}
>  
> @@ -2096,6 +2120,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  	case DRM_MODE_ENCODER_TMDS:
>  		intf_type = INTF_DP;
>  		break;
> +	case DRM_MODE_ENCODER_VIRTUAL:
> +		intf_type = INTF_WB;
> +		break;
>  	}
>  
>  	WARN_ON(disp_info->num_of_h_tiles < 1);
> @@ -2128,11 +2155,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>  				i, controller_id, phys_params.split_role);
>  
> -		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
> +		phys_params.intf_idx = dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
>  													intf_type,
>  													controller_id);
>  		if (phys_params.intf_idx == INTF_MAX) {
> -			DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id %d\n",
> +			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
>  						  intf_type, controller_id);
>  			ret = -EINVAL;
>  		}
> -- 
> 2.7.4
> 
