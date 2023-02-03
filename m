Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F27FE68A3B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 21:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjBCUmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 15:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjBCUmm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 15:42:42 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E009E9AFC2
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 12:42:41 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313HHeC8013028;
        Fri, 3 Feb 2023 20:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rpVL0v6OIHKIrXRe2BusUPjTUNPgjxiRO8EmUWMmoks=;
 b=JLcPwy6kh8HR8uQv+DFufhC7wlETOt2dhZASJ7xWpijHX2mPvdSiWU0Gvbxzv9O38ah9
 ipAAZvBYzGZ3ELV3lj7x0HLXu4vNk5hFg0abqa6D8ToUOw/FdXsDOxpQulDSVwkoqhR2
 xfo7VTPxhBM6Uk+9DS1PJhktDbI64DM4a6KU83mnB0JQm6Mg4dx8s9dVNkM8d2Ub5CLb
 bZKz+eM51v2qVWJLIeofpus1Lnb9LG3KTRiPx385LqSbjfql4lnDhcPg2TM5jqMgTB3p
 +A0wZqsz6uq/p8Ue1nZpvrw5DjheItfLCz/rVHs5BFJrw2RVXFA9ObYSVqkxWl9q4Wxi 8Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngns4jg01-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Feb 2023 20:42:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313KgY81013238
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Feb 2023 20:42:34 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 12:42:33 -0800
Message-ID: <e4b2a6ac-1d73-c010-e436-c595ad2d3883@quicinc.com>
Date:   Fri, 3 Feb 2023 12:42:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 14/27] drm/msm/dpu: don't use unsupported blend stages
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
 <20230203182132.1307834-15-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VxTt-cp7npvSkFmhQbmQ7gD6D45GitaP
X-Proofpoint-ORIG-GUID: VxTt-cp7npvSkFmhQbmQ7gD6D45GitaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030185
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> The dpu_crtc_atomic_check() compares blending stage with DPU_STAGE_MAX
> (maximum amount of blending stages supported by the driver), however we
> should compare it against .max_mixer_blendstages, the maximum blend
> stage supported by the mixer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c1579d6f5060..b485234eefb2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1129,6 +1129,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   									  crtc);
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
> +	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>   
>   	const struct drm_plane_state *pstate;
>   	struct drm_plane *plane;
> @@ -1164,7 +1165,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
>   		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
>   		struct drm_rect dst, clip = crtc_rect;
> -		int z_pos;
> +		int stage;
>   
>   		if (IS_ERR_OR_NULL(pstate)) {
>   			rc = PTR_ERR(pstate);
> @@ -1189,17 +1190,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   			return -E2BIG;
>   		}
>   
> -		z_pos = pstate->normalized_zpos;
> -
> -		/* verify z_pos setting before using it */
> -		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
> +		/* verify stage setting before using it */
> +		stage = DPU_STAGE_0 + pstate->normalized_zpos;
> +		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
>   			DPU_ERROR("> %d plane stages assigned\n",
> -					DPU_STAGE_MAX - DPU_STAGE_0);
> +					dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
>   			return -EINVAL;
>   		}
>   
> -		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
> -		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
> +		to_dpu_plane_state(pstate)->stage = stage;
> +		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
>   
>   	}
>   
