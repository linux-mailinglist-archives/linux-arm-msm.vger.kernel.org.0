Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C890C68FA4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 23:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjBHWfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 17:35:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjBHWfl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 17:35:41 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9967E83E6
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 14:35:37 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318MU3SZ012711;
        Wed, 8 Feb 2023 22:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kXpdI4DDnp11YwZz0R3Imjuvk4mNgQsQonYUU31yIJM=;
 b=hAXBMX9NdINC+JnHOsToPHeATHT1X/7PQnVDzjR4GStGh2SCSmij0SZUomKSUFP2C93H
 FcMsyATBByjenK7Wf2ovMcewvnjsZqCZxm1Ocn6q1xIsBiDONLnQvEGJ0FHwJDLzBaRr
 j07kUMt+FunvWvNoCZl7yjSuJxIoZYo/tBVM4AE+q7t7ZyEXGUhSunMmbe2AJvsZAwEy
 s6P0WCg8orLK/HFAkt4kxyEhwiEA2UNgg/cVjBhuh/Vw7YSpugfzaxLO9Zi2zTjk13S2
 GpcrQN5xN5yMBhGdGRZd0G7zt4L8/SSHburLJNJIDog5FWXBiysxwaD5/VD3v7uCCR0+ Ug== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm1yf2uhv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Feb 2023 22:35:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 318MZPBJ014741
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 8 Feb 2023 22:35:25 GMT
Received: from [10.110.17.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 8 Feb 2023
 14:34:52 -0800
Message-ID: <ef6b0227-1ac9-331e-1c8e-beb6ce8a0aff@quicinc.com>
Date:   Wed, 8 Feb 2023 14:34:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 25/27] drm/msm/dpu: rework static color fill code
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-26-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-26-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YGSrhXwYyX_FM8bsEF3E0Agdu8H-QNxS
X-Proofpoint-GUID: YGSrhXwYyX_FM8bsEF3E0Agdu8H-QNxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080191
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Rework static color fill code to separate the pipe / pipe_cfg handling.
> This is a preparation for the r_pipe support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 70 +++++++++++++----------
>   1 file changed, 41 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 05047192cb37..e2e85688ed3c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -639,20 +639,54 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
>   				fmt);
>   }
>   
> +static int _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
> +		struct dpu_sw_pipe *pipe,
> +		struct dpu_hw_sspp_cfg *old_pipe_cfg,

Why is this called old_pipe_cfg instead of just pipe_cfg?


> +		u32 fill_color,
> +		const struct dpu_format *fmt)
> +{
> +	struct dpu_hw_sspp_cfg pipe_cfg;
> +
> +	/* update sspp */
> +	if (!pipe->sspp->ops.setup_solidfill)
> +		return 0;

You can just return from here and make this function void?

> +
> +	pipe->sspp->ops.setup_solidfill(pipe, fill_color);
> +
> +	/* override scaler/decimation if solid fill */
> +	pipe_cfg.dst_rect = old_pipe_cfg->dst_rect;
> +
> +	pipe_cfg.src_rect.x1 = 0;
> +	pipe_cfg.src_rect.y1 = 0;
> +	pipe_cfg.src_rect.x2 =
> +		drm_rect_width(&pipe_cfg.dst_rect);
> +	pipe_cfg.src_rect.y2 =
> +		drm_rect_height(&pipe_cfg.dst_rect);
> +
> +	if (pipe->sspp->ops.setup_format)
> +		pipe->sspp->ops.setup_format(pipe, fmt, DPU_SSPP_SOLID_FILL);
> +
> +	if (pipe->sspp->ops.setup_rects)
> +		pipe->sspp->ops.setup_rects(pipe, &pipe_cfg);
> +
> +	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
> +
> +	return 0;
> +}
> +
>   /**
>    * _dpu_plane_color_fill - enables color fill on plane
>    * @pdpu:   Pointer to DPU plane object
>    * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, [7..0] Red
>    * @alpha:  8-bit fill alpha value, 255 selects 100% alpha
> - * Returns: 0 on success
>    */
> -static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
> +static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   		uint32_t color, uint32_t alpha)
>   {
>   	const struct dpu_format *fmt;
>   	const struct drm_plane *plane = &pdpu->base;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
> -	struct dpu_hw_sspp_cfg pipe_cfg;
> +	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
>   
>   	DPU_DEBUG_PLANE(pdpu, "\n");
>   
> @@ -661,34 +695,12 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   	 * h/w only supports RGB variants
>   	 */
>   	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> +	/* should not happen ever */
> +	if (!fmt)
> +		return;
>   
>   	/* update sspp */
> -	if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
> -		pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
> -				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
> -
> -		/* override scaler/decimation if solid fill */
> -		pipe_cfg.dst_rect = pstate->base.dst;
> -
> -		pipe_cfg.src_rect.x1 = 0;
> -		pipe_cfg.src_rect.y1 = 0;
> -		pipe_cfg.src_rect.x2 =
> -			drm_rect_width(&pipe_cfg.dst_rect);
> -		pipe_cfg.src_rect.y2 =
> -			drm_rect_height(&pipe_cfg.dst_rect);
> -
> -		if (pstate->pipe.sspp->ops.setup_format)
> -			pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
> -					fmt, DPU_SSPP_SOLID_FILL);
> -
> -		if (pstate->pipe.sspp->ops.setup_rects)
> -			pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
> -					&pipe_cfg);
> -
> -		_dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg, pstate->rotation);
> -	}
> -
> -	return 0;
> +	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg, fill_color, fmt);
>   }
>   
>   int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
