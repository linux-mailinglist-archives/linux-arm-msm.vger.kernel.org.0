Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64CF768A6C1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Feb 2023 00:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjBCXHj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 18:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjBCXHi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 18:07:38 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA1C1E5EC
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 15:07:36 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313Mn2Op022249;
        Fri, 3 Feb 2023 23:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WRYe/tiz7zEkd++2klfIRGgaE/0G4y0ppBJUAjliJ0A=;
 b=laNhFN8+PEmCcXDs0vq4fHx1knRluhiO0B4G/t6dCVBg9Zkb4pJjDOPNzbb6BfXp3fg5
 m7B4W8fSak47j1KhfN2twdzdg1ubVZcgdD4QayN5oqcJdquBjdmxMC1u9sD5te3pXrMc
 k2b010vFeyoKwlCtpTPOmovgnlSNAmnag4IL+RMRC+b9U3SaahYIXK7/rfZqGFsD3iqv
 3m5msGNxsyfT50QRRSFzFCSXEmxJwnl2XlkuiDHS0rAh3NM8pCFSm86UU+J7OkgFDATE
 eO42qa+v4di7QlZDYUbELPg9UL7GHacJYIbYO/8zAUcRt4Y9JjrJdNPSSImFIwAjuj/q 1w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngxedhrwh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Feb 2023 23:07:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313N7SKU022107
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Feb 2023 23:07:28 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 15:07:27 -0800
Message-ID: <767e71a1-2041-7b12-ffa6-22568f849e2a@quicinc.com>
Date:   Fri, 3 Feb 2023 15:07:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 17/27] drm/msm/dpu: rewrite plane's QoS-related
 functions to take dpu_sw_pipe and dpu_format
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
 <20230203182132.1307834-18-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-18-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 099ZBpFeJwXTT_w_k0IN0FCcs97a2AlN
X-Proofpoint-ORIG-GUID: 099ZBpFeJwXTT_w_k0IN0FCcs97a2AlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030207
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Rewrite dpu_plane's QoS related functions to take struct dpu_sw_pipe and
> struct dpu_format as arguments rather than fetching them from the
> pstate or drm_framebuffer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nothing wrong with the change as such but why is this needed?
I looked through tne next patches in the series briefly and unless I am 
missing something, I am not able to see how this rewrite is helping or 
needed for the remaining patches.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 98 +++++++++++------------
>   1 file changed, 47 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 5aabf9694a53..ee261a591d45 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -128,19 +128,18 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
>   /**
>    * _dpu_plane_calc_bw - calculate bandwidth required for a plane
>    * @plane: Pointer to drm plane.
> - * @fb:   Pointer to framebuffer associated with the given plane
> + * @fmt: Pointer to source buffer format
>    * @pipe_cfg: Pointer to pipe configuration
>    * Result: Updates calculated bandwidth in the plane state.
>    * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
>    * Prefill BW Equation: line src bytes * line_time
>    */
>   static void _dpu_plane_calc_bw(struct drm_plane *plane,
> -	struct drm_framebuffer *fb,
> +	const struct dpu_format *fmt,
>   	struct dpu_hw_sspp_cfg *pipe_cfg)
>   {
>   	struct dpu_plane_state *pstate;
>   	struct drm_display_mode *mode;
> -	const struct dpu_format *fmt = NULL;
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   	int src_width, src_height, dst_height, fps;
>   	u64 plane_prefill_bw;
> @@ -152,8 +151,6 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>   	pstate = to_dpu_plane_state(plane->state);
>   	mode = &plane->state->crtc->mode;
>   
> -	fmt = dpu_get_dpu_format_ext(fb->format->format, fb->modifier);
> -
>   	src_width = drm_rect_width(&pipe_cfg->src_rect);
>   	src_height = drm_rect_height(&pipe_cfg->src_rect);
>   	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
> @@ -217,25 +214,25 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_sspp_cfg
>   /**
>    * _dpu_plane_calc_fill_level - calculate fill level of the given source format
>    * @plane:		Pointer to drm plane
> + * @pipe:		Pointer to software pipe
>    * @fmt:		Pointer to source buffer format
>    * @src_width:		width of source buffer
>    * Return: fill level corresponding to the source buffer/format or 0 if error
>    */
>   static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
> +		struct dpu_sw_pipe *pipe,
>   		const struct dpu_format *fmt, u32 src_width)
>   {
>   	struct dpu_plane *pdpu;
> -	struct dpu_plane_state *pstate;
>   	u32 fixed_buff_size;
>   	u32 total_fl;
>   
> -	if (!fmt || !plane->state || !src_width || !fmt->bpp) {
> +	if (!fmt || !pipe || !src_width || !fmt->bpp) {
>   		DPU_ERROR("invalid arguments\n");
>   		return 0;
>   	}
>   
>   	pdpu = to_dpu_plane(plane);
> -	pstate = to_dpu_plane_state(plane->state);
>   	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
>   
>   	/* FIXME: in multirect case account for the src_width of all the planes */
> @@ -251,7 +248,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
>   				((src_width + 32) * fmt->bpp);
>   		}
>   	} else {
> -		if (pstate->pipe.multirect_mode == DPU_SSPP_MULTIRECT_PARALLEL) {
> +		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_PARALLEL) {
>   			total_fl = (fixed_buff_size / 2) * 2 /
>   				((src_width + 32) * fmt->bpp);
>   		} else {
> @@ -261,7 +258,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
>   	}
>   
>   	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s w:%u fl:%u\n",
> -			pdpu->pipe - SSPP_VIG0,
> +			pipe->sspp->idx - SSPP_VIG0,
>   			(char *)&fmt->base.pixel_format,
>   			src_width, total_fl);
>   
> @@ -271,25 +268,22 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
>   /**
>    * _dpu_plane_set_qos_lut - set QoS LUT of the given plane
>    * @plane:		Pointer to drm plane
> - * @fb:			Pointer to framebuffer associated with the given plane
> + * @pipe:		Pointer to software pipe
> + * @fmt:		Pointer to source buffer format
>    * @pipe_cfg:		Pointer to pipe configuration
>    */
>   static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
> -		struct drm_framebuffer *fb, struct dpu_hw_sspp_cfg *pipe_cfg)
> +		struct dpu_sw_pipe *pipe,
> +		const struct dpu_format *fmt, struct dpu_hw_sspp_cfg *pipe_cfg)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
> -	const struct dpu_format *fmt = NULL;
>   	u64 qos_lut;
>   	u32 total_fl = 0, lut_usage;
>   
>   	if (!pdpu->is_rt_pipe) {
>   		lut_usage = DPU_QOS_LUT_USAGE_NRT;
>   	} else {
> -		fmt = dpu_get_dpu_format_ext(
> -				fb->format->format,
> -				fb->modifier);
> -		total_fl = _dpu_plane_calc_fill_level(plane, fmt,
> +		total_fl = _dpu_plane_calc_fill_level(plane, pipe, fmt,
>   				drm_rect_width(&pipe_cfg->src_rect));
>   
>   		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
> @@ -301,7 +295,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
>   	qos_lut = _dpu_hw_get_qos_lut(
>   			&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
>   
> -	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,
> +	trace_dpu_perf_set_qos_luts(pipe->sspp->idx - SSPP_VIG0,
>   			(fmt) ? fmt->base.pixel_format : 0,
>   			pdpu->is_rt_pipe, total_fl, qos_lut, lut_usage);
>   
> @@ -310,20 +304,20 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
>   			fmt ? (char *)&fmt->base.pixel_format : NULL,
>   			pdpu->is_rt_pipe, total_fl, qos_lut);
>   
> -	pstate->pipe.sspp->ops.setup_creq_lut(pstate->pipe.sspp, qos_lut);
> +	pipe->sspp->ops.setup_creq_lut(pipe->sspp, qos_lut);
>   }
>   
>   /**
>    * _dpu_plane_set_danger_lut - set danger/safe LUT of the given plane
>    * @plane:		Pointer to drm plane
> - * @fb:			Pointer to framebuffer associated with the given plane
> + * @pipe:		Pointer to software pipe
> + * @fmt:		Pointer to source buffer format
>    */
>   static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
> -		struct drm_framebuffer *fb)
> +		struct dpu_sw_pipe *pipe,
> +		const struct dpu_format *fmt)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
> -	const struct dpu_format *fmt = NULL;
>   	u32 danger_lut, safe_lut;
>   
>   	if (!pdpu->is_rt_pipe) {
> @@ -332,10 +326,6 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>   		safe_lut = pdpu->catalog->perf->safe_lut_tbl
>   				[DPU_QOS_LUT_USAGE_NRT];
>   	} else {
> -		fmt = dpu_get_dpu_format_ext(
> -				fb->format->format,
> -				fb->modifier);
> -
>   		if (fmt && DPU_FORMAT_IS_LINEAR(fmt)) {
>   			danger_lut = pdpu->catalog->perf->danger_lut_tbl
>   					[DPU_QOS_LUT_USAGE_LINEAR];
> @@ -362,29 +352,30 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>   		danger_lut,
>   		safe_lut);
>   
> -	pstate->pipe.sspp->ops.setup_danger_safe_lut(pstate->pipe.sspp,
> +	pipe->sspp->ops.setup_danger_safe_lut(pipe->sspp,
>   			danger_lut, safe_lut);
>   }
>   
>   /**
>    * _dpu_plane_set_qos_ctrl - set QoS control of the given plane
>    * @plane:		Pointer to drm plane
> + * @pipe:		Pointer to software pipe
>    * @enable:		true to enable QoS control
>    * @flags:		QoS control mode (enum dpu_plane_qos)
>    */
>   static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
> +	struct dpu_sw_pipe *pipe,
>   	bool enable, u32 flags)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
>   
>   	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
>   
>   	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
> -		pipe_qos_cfg.creq_vblank = pstate->pipe.sspp->cap->sblk->creq_vblank;
> +		pipe_qos_cfg.creq_vblank = pipe->sspp->cap->sblk->creq_vblank;
>   		pipe_qos_cfg.danger_vblank =
> -				pstate->pipe.sspp->cap->sblk->danger_vblank;
> +				pipe->sspp->cap->sblk->danger_vblank;
>   		pipe_qos_cfg.vblank_en = enable;
>   	}
>   
> @@ -410,33 +401,34 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>   		pipe_qos_cfg.danger_vblank,
>   		pdpu->is_rt_pipe);
>   
> -	pstate->pipe.sspp->ops.setup_qos_ctrl(pstate->pipe.sspp,
> +	pipe->sspp->ops.setup_qos_ctrl(pipe->sspp,
>   			&pipe_qos_cfg);
>   }
>   
>   /**
>    * _dpu_plane_set_ot_limit - set OT limit for the given plane
>    * @plane:		Pointer to drm plane
> + * @pipe:		Pointer to software pipe
>    * @crtc:		Pointer to drm crtc
>    * @pipe_cfg:		Pointer to pipe configuration
>    */
>   static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
> +		struct dpu_sw_pipe *pipe,
>   		struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	struct dpu_vbif_set_ot_params ot_params;
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   
>   	memset(&ot_params, 0, sizeof(ot_params));
> -	ot_params.xin_id = pstate->pipe.sspp->cap->xin_id;
> -	ot_params.num = pstate->pipe.sspp->idx - SSPP_NONE;
> +	ot_params.xin_id = pipe->sspp->cap->xin_id;
> +	ot_params.num = pipe->sspp->idx - SSPP_NONE;
>   	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
>   	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
>   	ot_params.is_wfd = !pdpu->is_rt_pipe;
>   	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
>   	ot_params.vbif_idx = VBIF_RT;
> -	ot_params.clk_ctrl = pstate->pipe.sspp->cap->clk_ctrl;
> +	ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
>   	ot_params.rd = true;
>   
>   	dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
> @@ -445,19 +437,20 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
>   /**
>    * _dpu_plane_set_qos_remap - set vbif QoS for the given plane
>    * @plane:		Pointer to drm plane
> + * @pipe:		Pointer to software pipe
>    */
> -static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
> +static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
> +		struct dpu_sw_pipe *pipe)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	struct dpu_vbif_set_qos_params qos_params;
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   
>   	memset(&qos_params, 0, sizeof(qos_params));
>   	qos_params.vbif_idx = VBIF_RT;
> -	qos_params.clk_ctrl = pstate->pipe.sspp->cap->clk_ctrl;
> -	qos_params.xin_id = pstate->pipe.sspp->cap->xin_id;
> -	qos_params.num = pstate->pipe.sspp->idx - SSPP_VIG0;
> +	qos_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
> +	qos_params.xin_id = pipe->sspp->cap->xin_id;
> +	qos_params.num = pipe->sspp->idx - SSPP_VIG0;
>   	qos_params.is_rt = pdpu->is_rt_pipe;
>   
>   	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
> @@ -1144,7 +1137,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
>   	pdpu->is_rt_pipe = is_rt_pipe;
>   
> -	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
> +	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
>   
>   	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
>   			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> @@ -1213,20 +1206,20 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   		}
>   	}
>   
> -	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
> -	_dpu_plane_set_danger_lut(plane, fb);
> +	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pipe_cfg);
> +	_dpu_plane_set_danger_lut(plane, pipe, fmt);
>   
>   	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
> -		_dpu_plane_set_qos_ctrl(plane, true, DPU_PLANE_QOS_PANIC_CTRL);
> -		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
> +		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
> +		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pipe_cfg);
>   	}
>   
>   	if (pstate->needs_qos_remap) {
>   		pstate->needs_qos_remap = false;
> -		_dpu_plane_set_qos_remap(plane);
> +		_dpu_plane_set_qos_remap(plane, pipe);
>   	}
>   
> -	_dpu_plane_calc_bw(plane, fb, &pipe_cfg);
> +	_dpu_plane_calc_bw(plane, fmt, &pipe_cfg);
>   
>   	_dpu_plane_calc_clk(plane, &pipe_cfg);
>   }
> @@ -1263,11 +1256,13 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
>   static void dpu_plane_destroy(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
> +	struct dpu_plane_state *pstate;
>   
>   	DPU_DEBUG_PLANE(pdpu, "\n");
>   
>   	if (pdpu) {
> -		_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
> +		pstate = to_dpu_plane_state(plane->state);
> +		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
>   
>   		mutex_destroy(&pdpu->lock);
>   
> @@ -1395,13 +1390,14 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   
>   	if (!pdpu->is_rt_pipe)
>   		return;
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	_dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
> +	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
>   #endif
