Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D33E7322FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 01:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjFOXEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 19:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjFOXEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 19:04:34 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE727270E
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:04:32 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F3BC540424;
        Fri, 16 Jun 2023 01:04:30 +0200 (CEST)
Date:   Fri, 16 Jun 2023 01:04:29 +0200
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
Subject: Re: [PATCH v2 06/22] drm/msm/dpu: simplify peer LM handling
Message-ID: <cjspdreamae7wvvxo45yiru2b6f57faxguf3er5vdmj62zesej@hwwik7mps7ru>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613001004.3426676-7-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-13 03:09:45, Dmitry Baryshkov wrote:
> For each LM there is at max 1 peer LM which can be driven by the same
> CTL, so there no need to have a mask instead of just an ID of the peer
> LM.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: I think you can describe the the patch contents in the title:

    Replace LM peer mask with index

Instead of the vague (IMHO) "simplify handling".

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 34 +++++++------------
>  3 files changed, 15 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0de507d4d7b7..30fb5b1f3966 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -394,7 +394,7 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>  	.features = _fmask, \
>  	.sblk = _sblk, \
>  	.pingpong = _pp, \
> -	.lm_pair_mask = (1 << _lmpair), \
> +	.lm_pair = _lmpair, \
>  	.dspp = _dspp \
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index b860784ade72..b07caa4b867e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -554,14 +554,14 @@ struct dpu_sspp_cfg {
>   * @features           bit mask identifying sub-blocks/features
>   * @sblk:              LM Sub-blocks information
>   * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
> - * @lm_pair_mask:      Bitmask of LMs that can be controlled by same CTL
> + * @lm_pair:           ID of LM that can be controlled by same CTL

Of *the* LM
By *the* same CTL

But then the rest of these comments have this borked hard-to-read style
as well.

>   */
>  struct dpu_lm_cfg {
>  	DPU_HW_BLK_INFO;
>  	const struct dpu_lm_sub_blks *sblk;
>  	u32 pingpong;
>  	u32 dspp;
> -	unsigned long lm_pair_mask;
> +	unsigned long lm_pair;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 471842bbb950..e333f4eeafc1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -253,28 +253,19 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
>  }
>  
>  /**
> - * _dpu_rm_check_lm_peer - check if a mixer is a peer of the primary
> + * _dpu_rm_get_lm_peer - get the id of a mixer which is a peer of the primary

... mixer?

>   * @rm: dpu resource manager handle
>   * @primary_idx: index of primary mixer in rm->mixer_blks[]
> - * @peer_idx: index of other mixer in rm->mixer_blks[]
> - * Return: true if rm->mixer_blks[peer_idx] is a peer of
> - *          rm->mixer_blks[primary_idx]
>   */
> -static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
> -		int peer_idx)
> +static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>  {
>  	const struct dpu_lm_cfg *prim_lm_cfg;
> -	const struct dpu_lm_cfg *peer_cfg;
>  
>  	prim_lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[primary_idx])->cap;
> -	peer_cfg = to_dpu_hw_mixer(rm->mixer_blks[peer_idx])->cap;
>  
> -	if (!test_bit(peer_cfg->id, &prim_lm_cfg->lm_pair_mask)) {
> -		DPU_DEBUG("lm %d not peer of lm %d\n", peer_cfg->id,
> -				peer_cfg->id);
> -		return false;
> -	}
> -	return true;
> +	if (prim_lm_cfg->lm_pair >= LM_0 && prim_lm_cfg->lm_pair < LM_MAX)
> +		return prim_lm_cfg->lm_pair - LM_0;
> +	return -EINVAL;
>  }
>  
>  /**
> @@ -351,7 +342,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  	int lm_idx[MAX_BLOCKS];
>  	int pp_idx[MAX_BLOCKS];
>  	int dspp_idx[MAX_BLOCKS] = {0};
> -	int i, j, lm_count = 0;
> +	int i, lm_count = 0;
>  
>  	if (!reqs->topology.num_lm) {
>  		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
> @@ -376,16 +367,15 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  		++lm_count;
>  
>  		/* Valid primary mixer found, find matching peers */
> -		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
> -				lm_count < reqs->topology.num_lm; j++) {
> -			if (!rm->mixer_blks[j])
> +		if (lm_count < reqs->topology.num_lm) {
> +			int j = _dpu_rm_get_lm_peer(rm, i);
> +
> +			/* ignore the peer if there is an error or if the peer was already processed */

I would not call this an "error" (though it is -EINVAL): 0 (out of range
of LM_0 <= x M LM_MAX) is a valid value meaning "LM has no peer" and
maybe another error code is more fitting?

> +			if (j < 0 || j < i)
>  				continue;
>  
> -			if (!_dpu_rm_check_lm_peer(rm, i, j)) {
> -				DPU_DEBUG("lm %d not peer of lm %d\n", LM_0 + j,
> -						LM_0 + i);
> +			if (!rm->mixer_blks[j])
>  				continue;

This seems silly now, why would an existing LM have a pair to an LM that
might not be in the catalog?  Return -EINVAL?

Nits aside, this is some tight cleanup:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

- Marijn

> -			}
>  
>  			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
>  					global_state, enc_id, j,
> -- 
> 2.39.2
> 
