Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6869A68A665
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 23:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbjBCW5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 17:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbjBCW5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 17:57:21 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E2B7BBFA
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 14:57:20 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313MXY9t030364;
        Fri, 3 Feb 2023 22:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mUHlG9Np1tis5O1U7XonaD92sh00FZcP/pXph2YmwXE=;
 b=YZAu2s4J7tjtvwuoRqCtu5o5lr/wjjtzNyth0BsO6tfyURdmuHPA84b+FHAZ235W0TP6
 9wMtDSYmwyCCFu623BRyNWlbd5UvG2oEgWe12c7ie5YMYE/ZNIlk6VQkkp9drCe6CPOu
 22oDH6SJYeJQmZ/Qn2G40vwZ98j7cE2GXmcTeV6uQi/WlMx89ckhbMVw1A7tC2sFBp16
 mw7a1aKKlizuJbrGy2O6RDnVBXEXd9TjxNnvXUVGoSSrokg0mFtRkJ2o5Jkb1hzrcn6V
 NQmX1zAWgkn2dpaU3QSd0Waz/ZgRG/9n+qYJDj3IVDXTeh15MEFqUOAjbTQpORojTiNI pQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngncv2r0d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Feb 2023 22:57:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313Mv9KT023271
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Feb 2023 22:57:09 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 14:57:09 -0800
Message-ID: <aacaa878-67d1-20d6-e91a-5c9c76247cec@quicinc.com>
Date:   Fri, 3 Feb 2023 14:57:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 16/27] drm/msm/dpu: drop redundant plane dst check from
 dpu_crtc_atomic_check()
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
 <20230203182132.1307834-17-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-17-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LSiRjk5y95mB6zSQ6SwMMw7Pchv2NVPH
X-Proofpoint-GUID: LSiRjk5y95mB6zSQ6SwMMw7Pchv2NVPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 mlxlogscore=998 mlxscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030206
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> The helper drm_atomic_helper_check_plane_state() already checks whether
> the scaled and clipped plane falls into the CRTC visible region (and
> clears plane_state->visible if it doesn't). Drop the redundant check
> from dpu_crtc_atomic_check().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index bd09bb319a58..73e1a8c69ef0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1132,11 +1132,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   
>   	const struct drm_plane_state *pstate;
>   	struct drm_plane *plane;
> -	struct drm_display_mode *mode;
>   
>   	int rc = 0;
>   
> -	struct drm_rect crtc_rect = { 0 };
>   	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>   
>   	if (!crtc_state->enable || !crtc_state->active) {
> @@ -1147,7 +1145,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   		return 0;
>   	}
>   
> -	mode = &crtc_state->adjusted_mode;
>   	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
>   
>   	/* force a full mode set if active state changed */
> @@ -1157,13 +1154,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	if (cstate->num_mixers)
>   		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
>   
> -	crtc_rect.x2 = mode->hdisplay;
> -	crtc_rect.y2 = mode->vdisplay;
> -
>   	/* FIXME: move this to dpu_plane_atomic_check? */
>   	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
>   		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
> -		struct drm_rect dst, clip = crtc_rect;
>   
>   		if (IS_ERR_OR_NULL(pstate)) {
>   			rc = PTR_ERR(pstate);
> @@ -1176,15 +1169,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   			continue;
>   
>   		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
> -
> -		dst = drm_plane_state_dest(pstate);
> -		if (!drm_rect_intersect(&clip, &dst)) {
> -			DPU_ERROR("invalid vertical/horizontal destination\n");
> -			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
> -				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
> -				  DRM_RECT_ARG(&dst));
> -			return -E2BIG;
> -		}
>   	}
>   
>   	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
