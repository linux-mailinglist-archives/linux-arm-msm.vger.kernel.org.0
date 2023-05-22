Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 438EF70CD9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 00:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjEVWPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 18:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233683AbjEVWP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 18:15:29 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DAE9E
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 15:15:27 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8EB9F3F20F;
        Tue, 23 May 2023 00:15:25 +0200 (CEST)
Date:   Tue, 23 May 2023 00:15:24 +0200
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
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/6] drm/msm/dpu: drop now-unused mdss_irqs field from
 hw catalog
Message-ID: <jvyy32g67ekqycdx4dpjkvucxe7trvu2aqjfkxui3ca7x72gux@q4wnhcjtbics>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522214527.190054-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-23 00:45:26, Dmitry Baryshkov wrote:
> Now as the list of the interrupts is constructed from the catalog
> data, drop the mdss_irqs field from catalog.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 --------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  9 ---------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 11 -----------
>  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 13 -------------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 10 ----------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  6 ------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  5 -----
>  .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  5 -----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  9 ---------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 -------
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 14 --------------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  9 ---------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  9 ---------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  3 ---
>  14 files changed, 118 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 3c732a0360c7..ff7c3d522046 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -204,14 +204,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>  	.vbif_count = ARRAY_SIZE(msm8998_vbif),
>  	.vbif = msm8998_vbif,
>  	.perf = &msm8998_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_INTF4_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 36ea1af10894..c4ccd742690a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -202,15 +202,6 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sdm845_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_AD4_0_INTR) | \
> -		     BIT(MDP_AD4_1_INTR),

I don't think you're adding AD4 back anywhere?  Not that there is
any code handling AD4 (e.g. registering those interrupts) anywhere, but
that should be done and documented in a separate patch then.

After dropping that from this patch and describing it in a preliminary
one:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index b5f751354267..fb7069d470ff 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -231,17 +231,6 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sm8150_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF2_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_AD4_0_INTR) | \
> -		     BIT(MDP_AD4_1_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 8ed2b263c5ea..bd7422e597aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -237,19 +237,6 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sc8180x_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF2_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_INTF4_INTR) | \
> -		     BIT(MDP_INTF5_INTR) | \
> -		     BIT(MDP_AD4_0_INTR) | \
> -		     BIT(MDP_AD4_1_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index daebd2170041..75a5c1b5a74a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -239,16 +239,6 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
>  	.wb_count = ARRAY_SIZE(sm8250_wb),
>  	.wb = sm8250_wb,
>  	.perf = &sm8250_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF2_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_INTF4_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 0b05da2592c0..84be02ce9c9c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -149,12 +149,6 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sc7180_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index ba9de008519b..71d6e036a7a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -122,11 +122,6 @@ const struct dpu_mdss_cfg dpu_sm6115_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sm6115_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 92ac348eea6b..d80b383d874d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -112,11 +112,6 @@ const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &qcm2290_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 320cfa4be633..649784aa6567 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -223,15 +223,6 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sm8350_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 9306c7a115e9..1e87c7f4775d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -163,13 +163,6 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sc7280_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF5_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index fc1e17c495f0..3082657f06f2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -225,20 +225,6 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sc8280xp_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_7xxx_INTR) | \
> -		     BIT(MDP_INTF4_7xxx_INTR) | \
> -		     BIT(MDP_INTF5_7xxx_INTR) | \
> -		     BIT(MDP_INTF6_7xxx_INTR) | \
> -		     BIT(MDP_INTF7_7xxx_INTR) | \
> -		     BIT(MDP_INTF8_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index eb72411c16db..ca5b82bc8322 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -231,15 +231,6 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sm8450_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 8209ca317bdc..dd7c87f772ea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -235,15 +235,6 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sm8550_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 72530ebb0ae6..6d8c2fa8558a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -777,7 +777,6 @@ struct dpu_perf_cfg {
>   * @dma_formats        Supported formats for dma pipe
>   * @cursor_formats     Supported formats for cursor pipe
>   * @vig_formats        Supported formats for vig pipe
> - * @mdss_irqs:         Bitmap with the irqs supported by the target
>   */
>  struct dpu_mdss_cfg {
>  	const struct dpu_caps *caps;
> @@ -825,8 +824,6 @@ struct dpu_mdss_cfg {
>  	const struct dpu_format_extended *dma_formats;
>  	const struct dpu_format_extended *cursor_formats;
>  	const struct dpu_format_extended *vig_formats;
> -
> -	unsigned long mdss_irqs;
>  };
>  
>  extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
> -- 
> 2.39.2
> 
