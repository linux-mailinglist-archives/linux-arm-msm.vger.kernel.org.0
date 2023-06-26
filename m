Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA52773DF30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 14:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjFZM3V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 08:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjFZM3G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 08:29:06 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D742FE75
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 05:29:03 -0700 (PDT)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl [82.72.63.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CEA333F5A8;
        Mon, 26 Jun 2023 14:28:59 +0200 (CEST)
Date:   Mon, 26 Jun 2023 14:28:58 +0200
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
Subject: Re: [PATCH v4 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
Message-ID: <wod5o5hktuos45i7reudz4jb2hc2cumghaa32bgb5gysd5yhyg@k2bo366v6rtq>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619212519.875673-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-20 00:25:04, Dmitry Baryshkov wrote:
> There is always a single MDP TOP block. Drop the mdp_count field and
> stop declaring dpu_mdp_cfg instances as arrays.
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
<snip>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> index a1a9e44bed36..c89746c6f500 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> @@ -146,13 +146,11 @@ struct dpu_hw_mdp {
>  
>  /**
>   * dpu_hw_mdptop_init - initializes the top driver for the passed idx

No index is passed anymore, only a pointer directly to const catalog
data.  After fixing that:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> - * @idx:  Interface index for which driver object is required
> + * @cfg:  MDP TOP configuration from catalog
>   * @addr: Mapped register io address of MDP
> - * @m:    Pointer to mdss catalog data
>   */
> -struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
> -		void __iomem *addr,
> -		const struct dpu_mdss_cfg *m);
> +struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> +				      void __iomem *addr);
>  
>  void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa8499de1b9f..882f20fc51cc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1092,8 +1092,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  
>  	dpu_kms->rm_init = true;
>  
> -	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
> -					     dpu_kms->catalog);
> +	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
> +					     dpu_kms->mmio);
>  	if (IS_ERR(dpu_kms->hw_mdp)) {
>  		rc = PTR_ERR(dpu_kms->hw_mdp);
>  		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
> -- 
> 2.39.2
> 
