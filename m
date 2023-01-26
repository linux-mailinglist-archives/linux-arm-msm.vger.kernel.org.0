Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 418E667D553
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbjAZT0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjAZT0R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:26:17 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 576915C0C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:26:16 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QI0wKm005688;
        Thu, 26 Jan 2023 19:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0GdW4PZJXZnnIK8H4ksTg6zGY5UcrgFpOaZYlC+dy9s=;
 b=B2SnSotuXIbPwD4xrEyp23/XZv7F7yun4H9He06eZWtbWia0FyL4/qCwe2GedAa3FhIw
 bEaYIcD9/BghxLFxMMcHzXK/bNN60HKmciL0iAj3pjqZAVPcs4uClXUvN8r9bfiN403X
 T8EFlQ2iYRxSoPP0xV1fB2F0g8VDrEhtVvvJoeNNIkqZUGiWjWdklEFHBOvr+Yp1hpuy
 IRpehY3IIon3kd8yETyIUwYI3WLDkXnuoylRRNoLVuJa/g/X7emMpgxprN4cNw3R5DDo
 pNyulM/jkCyvw377f2eI3xA6SPatZZHY3hKaxYR6plbty5BXnAPp1rxH7LLywppG2T+x 5g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nasr0ky49-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Jan 2023 19:26:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30QJQ8OV012002
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Jan 2023 19:26:08 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 11:26:07 -0800
Message-ID: <b6683f79-65be-ccad-7b74-f8dae37fe2b9@quicinc.com>
Date:   Thu, 26 Jan 2023 11:26:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 01/27] drm/msm/dpu: set pdpu->is_rt_pipe early in
 dpu_plane_sspp_atomic_update()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221229191856.3508092-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DVGYUeo6d4ey-H2FVFkDqUdcDzfo1MiI
X-Proofpoint-ORIG-GUID: DVGYUeo6d4ey-H2FVFkDqUdcDzfo1MiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260182
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> The function dpu_plane_sspp_atomic_update() updates pdpu->is_rt_pipe
> flag, but after the commit 854f6f1c653b ("drm/msm/dpu: update the qos
> remap only if the client type changes") it sets the flag late, after all
> the qos functions have updated QoS programming. Move the flag update
> back to the place where it happended before the mentioned commit to let
happended ---> happened
> the pipe be programmed according to its current RT/non-RT state.
> 
> Fixes: 854f6f1c653b ("drm/msm/dpu: update the qos remap only if the client type changes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

With that nit fixed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Looks much cleaner now, thanks !

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 86719020afe2..bfd5be89e8b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1126,7 +1126,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>   	struct drm_crtc *crtc = state->crtc;
>   	struct drm_framebuffer *fb = state->fb;
> -	bool is_rt_pipe, update_qos_remap;
> +	bool is_rt_pipe;
>   	const struct dpu_format *fmt =
>   		to_dpu_format(msm_framebuffer_format(fb));
>   	struct dpu_hw_pipe_cfg pipe_cfg;
> @@ -1138,6 +1138,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	pstate->pending = true;
>   
>   	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
> +	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
> +	pdpu->is_rt_pipe = is_rt_pipe;
> +
>   	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
>   
>   	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> @@ -1219,14 +1222,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
>   	}
>   
> -	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
> -			pstate->needs_qos_remap;
> -
> -	if (update_qos_remap) {
> -		if (is_rt_pipe != pdpu->is_rt_pipe)
> -			pdpu->is_rt_pipe = is_rt_pipe;
> -		else if (pstate->needs_qos_remap)
> -			pstate->needs_qos_remap = false;
> +	if (pstate->needs_qos_remap) {
> +		pstate->needs_qos_remap = false;
>   		_dpu_plane_set_qos_remap(plane);
>   	}
>   
