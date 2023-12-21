Return-Path: <linux-arm-msm+bounces-5832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8281C223
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 00:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3B7828811D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 23:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C4B7947C;
	Thu, 21 Dec 2023 23:52:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784DE79460
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 23:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 95E7E404FD;
	Fri, 22 Dec 2023 00:36:43 +0100 (CET)
Date: Fri, 22 Dec 2023 00:36:42 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [RFT PATCH v2 2/4] drm/msm/dpu: enable writeback on SC8108X
Message-ID: <hv4w6w23nlgnma6fdxpkwucj2nagu5vegxiztsf5qey2ssocij@ndi7a5ossul4>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
 <20231203003203.1293087-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203003203.1293087-3-dmitry.baryshkov@linaro.org>

Title typo: SC8108X -> SC8180X :)

On 2023-12-03 03:32:01, Dmitry Baryshkov wrote:
> Enable WB2 hardware block, enabling writeback support on this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 9ffc8804a6fc..d4b531752ec2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sc8180x_mdp = {
>  		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
>  		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
>  		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
>  	},
>  };
>  
> @@ -298,6 +299,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>  	},
>  };
>  
> +static const struct dpu_wb_cfg sc8180x_wb[] = {
> +	{
> +		.name = "wb_2", .id = WB_2,
> +		.base = 0x65000, .len = 0x2c8,
> +		.features = WB_SDM845_MASK,
> +		.format_list = wb2_formats,
> +		.num_formats = ARRAY_SIZE(wb2_formats),
> +		.clk_ctrl = DPU_CLK_CTRL_WB2,
> +		.xin_id = 6,
> +		.vbif_idx = VBIF_RT,
> +		.maxlinewidth = 4096,
> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +	},
> +};
> +
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
>  	{
>  		.name = "intf_0", .id = INTF_0,
> @@ -411,6 +427,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>  	.pingpong = sc8180x_pp,
>  	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
>  	.merge_3d = sc8180x_merge_3d,
> +	.wb_count = ARRAY_SIZE(sc8180x_wb),
> +	.wb = sc8180x_wb,
>  	.intf_count = ARRAY_SIZE(sc8180x_intf),
>  	.intf = sc8180x_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -- 
> 2.39.2
> 

