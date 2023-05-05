Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B606F8776
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 19:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjEERWI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 13:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbjEERWH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 13:22:07 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22FD1C9
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 10:21:53 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345Du77J010420;
        Fri, 5 May 2023 17:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=90N93nbzOQFxJYD4Lo1kqY8drznGoip6vXCYzLH1PE4=;
 b=Hne1+5tGZ3zD0Q8TO4/xe/eU0AaPRDmMx66Hhwcsw2mNKNQVxCkY+V8e1M3+0zhOwfLJ
 hBlk70m7BqBJamuzY6a/o2oe7nr7gHJr54GSiDBnZwYBNgNWqCJJx9/GGFwu6SNs57GL
 tcsu/qmqwTCJ+aHPVApSRiEDtTDy3JqTkEqVeo5sAYOoxbP7mpTh+kgGIQv81FUrjKYZ
 x8JFbQGTwPMSL0ibAYrTRIt+yIGiqxkTEj2PXcdDzYJXHo4Tgz9y+lROKcsJsmtTY7nT
 u506edjoNi2NRbAlMPfahCgSwogAWkGQpO7KJL3hsLdBih0EEc9nY4MLXF9RjhMHiduY Ew== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qctsv1kyf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 17:21:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345HLQrX025949
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 5 May 2023 17:21:26 GMT
Received: from [10.110.37.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 10:21:25 -0700
Message-ID: <5b61c139-f505-bc54-a14a-38d74cbeab43@quicinc.com>
Date:   Fri, 5 May 2023 10:21:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 7/9] drm/msm/dpu: drop
 DPU_PLANE_QOS_PANIC_CTRL
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
 <20230502150533.3672840-8-dmitry.baryshkov@linaro.org>
From:   Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230502150533.3672840-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SmWHi_VokH2Fvs1wDSVe-mwz4OXQueBT
X-Proofpoint-GUID: SmWHi_VokH2Fvs1wDSVe-mwz4OXQueBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305050143
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/2/2023 8:05 AM, Dmitry Baryshkov wrote:
> This flag is always passed to _dpu_plane_set_qos_ctrl(), so drop it and
> remove corresponding conditions from the mentioned function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 +++++++----------------
>   1 file changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 0ed350776775..d1443c4b2915 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -70,15 +70,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
>   	DRM_FORMAT_P010,
>   };
>   
> -/**
> - * enum dpu_plane_qos - Different qos configurations for each pipe
> - *
> - * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
> - */
> -enum dpu_plane_qos {
> -	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
> -};
> -
>   /*
>    * struct dpu_plane - local dpu plane structure
>    * @aspace: address space pointer
> @@ -349,15 +340,14 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>    */
>   static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>   	struct dpu_sw_pipe *pipe,
> -	bool enable, u32 flags)
> +	bool enable)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
>   
>   	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
>   
> -	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
> -		pipe_qos_cfg.danger_safe_en = enable;
> +	pipe_qos_cfg.danger_safe_en = enable;
>   
>   	if (!pdpu->is_rt_pipe)
>   		pipe_qos_cfg.danger_safe_en = false;
> @@ -1058,7 +1048,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>   
>   	/* override for color fill */
>   	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> -		_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
> +		_dpu_plane_set_qos_ctrl(plane, pipe, false);
>   
>   		/* skip remaining processing on color fill */
>   		return;
> @@ -1104,8 +1094,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>   	_dpu_plane_set_danger_lut(plane, pipe, fmt);
>   	_dpu_plane_set_qos_ctrl(plane, pipe,
>   				pipe->sspp->idx != SSPP_CURSOR0 &&
> -				pipe->sspp->idx != SSPP_CURSOR1,
> -				DPU_PLANE_QOS_PANIC_CTRL);
> +				pipe->sspp->idx != SSPP_CURSOR1);
>   
>   	if (pipe->sspp->idx != SSPP_CURSOR0 &&
>   	    pipe->sspp->idx != SSPP_CURSOR1)
> @@ -1224,10 +1213,10 @@ static void dpu_plane_destroy(struct drm_plane *plane)
>   
>   	if (pdpu) {
>   		pstate = to_dpu_plane_state(plane->state);
> -		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
> +		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
>   
>   		if (pstate->r_pipe.sspp)
> -			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
> +			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
>   
>   		mutex_destroy(&pdpu->lock);
>   
> @@ -1384,9 +1373,9 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>   		return;
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
> +	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
>   	if (pstate->r_pipe.sspp)
> -		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
> +		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
>   #endif
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
