Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145DE76D821
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 21:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjHBTr0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 15:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjHBTrZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 15:47:25 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99C4E5C
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 12:47:23 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BCE6C3F20C;
        Wed,  2 Aug 2023 21:47:21 +0200 (CEST)
Date:   Wed, 2 Aug 2023 21:47:20 +0200
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
        Ryan McCann <quic_rmccann@quicinc.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Message-ID: <z7jhbgeng6ded4nzrn5khu6pzbrsfcibulzzt5huujm6m3nk3y@kmhk6wfoe3h2>
References: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-08-02 21:36:54, Dmitry Baryshkov wrote:
> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
> This includes the common block itself, enc subblocks and some empty
> space around. Change that to pass 0x4 instead, the length of common
> register block itself.
> 
> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
> Reported-by: Ryan McCann <quic_rmccann@quicinc.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
> 
> Changes since v1:
>  - Rebased on top of the catalog changes
> 
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  8 ++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 ++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 ++++----
>  5 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index c906b6864b5e..f8d16f9bf528 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -283,22 +283,22 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>  static const struct dpu_dsc_cfg sm8350_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_0_1", .id = DSC_1,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_1_0", .id = DSC_2,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_1_1", .id = DSC_3,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_1,
>  	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 2bf9f34e54c6..3b5061c4402a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -163,7 +163,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>  static const struct dpu_dsc_cfg sc7280_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index ccd0477f4877..58f5e25679b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -286,32 +286,32 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>  static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_0_1", .id = DSC_1,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_1_0", .id = DSC_2,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_1_1", .id = DSC_3,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_2_0", .id = DSC_4,
> -		.base = 0x82000, .len = 0x29c,
> +		.base = 0x82000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_2_1", .id = DSC_5,
> -		.base = 0x82000, .len = 0x29c,
> +		.base = 0x82000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 2b2e9d4800f8..1b12178dfbca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -305,22 +305,22 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>  static const struct dpu_dsc_cfg sm8450_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_0_1", .id = DSC_1,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_1_0", .id = DSC_2,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_1_1", .id = DSC_3,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_1,
>  	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 833be1167499..f2ab02d04440 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -320,22 +320,22 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>  static const struct dpu_dsc_cfg sm8550_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_0_1", .id = DSC_1,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_1_0", .id = DSC_2,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_1_1", .id = DSC_3,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_1,
>  	},
> -- 
> 2.39.2
> 
