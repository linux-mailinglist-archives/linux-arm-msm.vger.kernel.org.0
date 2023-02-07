Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A0668E1AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 21:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBGUFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 15:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjBGUFk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 15:05:40 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C92438B58
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 12:05:39 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317I02YD018446;
        Tue, 7 Feb 2023 20:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TVn1cKFSFCh8fANtfEe6qHSAoBDsdhsGnEbmWq7Z5ME=;
 b=GlnPMKuB90Y8RmE2m2+Q01g5JWpLhT9yz3oNBkiIOeAb3QXxgEET6eHHhBnHObA5dMDk
 gt0+Kwuw4CoBS+6oXVaBRKfTsrznlotgYZFNLbn0xFu/BC1z2mMPn6j/LBzS5fQ+wjzS
 sb21BAp6/8uT42uaUMyTR/T8YdeoMn07XBSaCRe8KIO4W7J/TeRqzDniduVm4uWTVSfB
 CMB6PsqAqUvhCLJYJPe42aWFcmS2dHlrvIrEQfapQxlcg2Pqxi1k/60rBbxcKoX2Ek9/
 dAZqIkRTaRztcHcnRQkS0v45MkojqnNUxq0u3ig9k89MhfjX5k5SpTRweR5brcZnJcSO nA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkgafj3b6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Feb 2023 20:05:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 317K5V6B013615
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Feb 2023 20:05:31 GMT
Received: from [10.110.44.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 12:05:30 -0800
Message-ID: <b4dbe036-81c4-e56f-12fb-75cb8bb59173@quicinc.com>
Date:   Tue, 7 Feb 2023 12:05:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 24/27] drm/msm/dpu: rework plane CSC setting
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
 <20230203182132.1307834-25-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-25-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2zC8IxglB6W_bevsOzeIIWLQcu7OPgpp
X-Proofpoint-ORIG-GUID: 2zC8IxglB6W_bevsOzeIIWLQcu7OPgpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 mlxlogscore=694 mlxscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302070175
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Rework the code flushing CSC settings for the plane. Separate out the
> pipe and pipe_cfg as a preparation for r_pipe support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 45 +++++++++++++----------
>   1 file changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index e69499490d39..05047192cb37 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -576,29 +576,18 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
>   	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
>   };
>   
> -static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
> +static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe, const struct dpu_format *fmt)
>   {
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
>   	const struct dpu_csc_cfg *csc_ptr;
>   
> -	if (!pdpu) {
> -		DPU_ERROR("invalid plane\n");
> -		return NULL;
> -	}
> -
>   	if (!DPU_FORMAT_IS_YUV(fmt))
>   		return NULL;
>   
> -	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe.sspp->cap->features)
> +	if (BIT(DPU_SSPP_CSC_10BIT) & pipe->sspp->cap->features)
>   		csc_ptr = &dpu_csc10_YUV2RGB_601L;
>   	else
>   		csc_ptr = &dpu_csc_YUV2RGB_601L;
>   
> -	DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
> -			csc_ptr->csc_mv[0],
> -			csc_ptr->csc_mv[1],
> -			csc_ptr->csc_mv[2]);
> -
>   	return csc_ptr;
>   }
>   
> @@ -1049,6 +1038,27 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	return 0;
>   }
>   
> +static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> +{
> +	const struct dpu_format *format = to_dpu_format(msm_framebuffer_format(pdpu->base.state->fb));
> +	const struct dpu_csc_cfg *csc_ptr;
> +
> +	if (!pipe->sspp || !pipe->sspp->ops.setup_csc)
> +		return;
> +
> +	csc_ptr = _dpu_plane_get_csc(pipe, format);
> +	if (!csc_ptr)
> +		return;
> +
> +	DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
> +			csc_ptr->csc_mv[0],
> +			csc_ptr->csc_mv[1],
> +			csc_ptr->csc_mv[2]);
> +
> +	pipe->sspp->ops.setup_csc(pipe->sspp, csc_ptr);
> +
> +}
> +
>   void dpu_plane_flush(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu;
> @@ -1072,13 +1082,8 @@ void dpu_plane_flush(struct drm_plane *plane)
>   	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>   		/* force 100% alpha */
>   		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> -	else if (pstate->pipe.sspp && pstate->pipe.sspp->ops.setup_csc) {
> -		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
> -		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
> -
> -		if (csc_ptr)
> -			pstate->pipe.sspp->ops.setup_csc(pstate->pipe.sspp, csc_ptr);
> -	}

Do we need to check for pipe being valid too (pstate->pipe) && 
(pstate->pipe.sspp) && pstate->pipe.sspp->ops.setup_csc) ?

Before moving the pipe_hw/sw pipe to the state the code used to check 
for pdpu->pipe_hw to be valid. Since dpu_plane_flush() can be called 
from other files too , dont we need to check for (pstate->pipe)?

> +	else
> +		dpu_plane_flush_csc(pdpu, &pstate->pipe);
>   
>   	/* flag h/w flush complete */
>   	if (plane->state)
