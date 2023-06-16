Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C29733CB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 01:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbjFPXAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 19:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjFPXAi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 19:00:38 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741583A8B
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 16:00:37 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 966452147A;
        Sat, 17 Jun 2023 01:00:33 +0200 (CEST)
Date:   Sat, 17 Jun 2023 01:00:32 +0200
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
Subject: Re: [PATCH v3 08/19] drm/msm/dpu: drop zero features from
 dpu_ctl_cfg data
Message-ID: <sx4hzaybb65qoar2cd6ergzs2oromywfs7g4clvifjgiy5ttlq@bmt4oobpeq75>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-9-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-16 13:03:06, Dmitry Baryshkov wrote:
> Drop useless zero assignments to the dpu_ctl_cfg::features field.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 3 ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 757ac648a692..e0cc1ce3f3e2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -54,7 +54,6 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0x94,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
> @@ -66,13 +65,11 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0x94,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0x94,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 9fb8ef21c7f0..f52e1fa27e2c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -58,19 +58,16 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0xe4,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0xe4,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0xe4,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  };
> -- 
> 2.39.2
> 
