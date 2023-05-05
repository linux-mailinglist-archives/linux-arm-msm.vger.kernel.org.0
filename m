Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41CFB6F8771
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 19:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbjEERVB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 13:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjEERVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 13:21:00 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B6813288
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 10:20:59 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345FeVaS006566;
        Fri, 5 May 2023 17:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tjx9D13CdxQb0yOXN6AHrLDUzsQYxB1uuLV5XpQuX8s=;
 b=WEQF8b1qnyceSNBnNO4O5nSEN25y0a5jQ20K0eVJlSHCbA297QXDIi1X+daZiW92Gu0f
 zsQzsDkyQ6/kpd1qPCZ/SVccnFedJT6jD80Z+fHu6pAO1ZSpXSXWmW9onMAwOiwfDwI6
 3og3GCg+qULQZdVM3OBuOYPbKscD0LUSjY52sZfPb46A8BZU8DQv7+rwgxCPyDK4xZ6L
 z8O6NOEmZI0GIn3sCbByQSsjlaKdRJbf5iu1zaCSHX+NV84qFYsajJjC6WXazBTySLKs
 V5xjPvwDWdymyT6r6KVOotW89D0uJZLoPwGGzuuxDtDrP5kQNZ5N8GLkUjq3ZTOtSJsM FQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qcwdeh70s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 17:20:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345HKnKH017876
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 5 May 2023 17:20:49 GMT
Received: from [10.110.37.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 10:20:49 -0700
Message-ID: <da9939a1-4249-7e0c-69fb-294125efab45@quicinc.com>
Date:   Fri, 5 May 2023 10:20:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 6/9] drm/msm/dpu: simplify qos_ctrl
 handling
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
 <20230502150533.3672840-7-dmitry.baryshkov@linaro.org>
From:   Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230502150533.3672840-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tioyjZvHuy4hEbxJwP7Ig-2V3_DlBz6-
X-Proofpoint-GUID: tioyjZvHuy4hEbxJwP7Ig-2V3_DlBz6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2305050142
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
> After removal of DPU_PLANE_QOS_VBLANK_CTRL, several fields of struct
> dpu_hw_pipe_qos_cfg are fixed to false/0. Drop them from the structure
> (and drop the corresponding code from the functions).
> 
> The DPU_PLANE_QOS_VBLANK_AMORTIZE flag is also removed, since it is now
> a NOP.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 17 ++---------------
>   3 files changed, 2 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index b198def5534b..341e3a8fc927 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -575,16 +575,6 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>   	if (!ctx)
>   		return;
>   
> -	if (cfg->vblank_en) {
> -		qos_ctrl |= ((cfg->creq_vblank &
> -				SSPP_QOS_CTRL_CREQ_VBLANK_MASK) <<
> -				SSPP_QOS_CTRL_CREQ_VBLANK_OFF);
> -		qos_ctrl |= ((cfg->danger_vblank &
> -				SSPP_QOS_CTRL_DANGER_VBLANK_MASK) <<
> -				SSPP_QOS_CTRL_DANGER_VBLANK_OFF);
> -		qos_ctrl |= SSPP_QOS_CTRL_VBLANK_EN;
> -	}
> -
>   	if (cfg->danger_safe_en)
>   		qos_ctrl |= SSPP_QOS_CTRL_DANGER_SAFE_EN;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 86bf4b2cda77..aaf6f41d546c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -165,15 +165,9 @@ struct dpu_sw_pipe_cfg {
>   
>   /**
>    * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
> - * @creq_vblank: creq value generated to vbif during vertical blanking
> - * @danger_vblank: danger value generated during vertical blanking
> - * @vblank_en: enable creq_vblank and danger_vblank during vblank
>    * @danger_safe_en: enable danger safe generation
>    */
>   struct dpu_hw_pipe_qos_cfg {
> -	u32 creq_vblank;
> -	u32 danger_vblank;
> -	bool vblank_en;
>   	bool danger_safe_en;
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 3cb891917b65..0ed350776775 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -73,12 +73,9 @@ static const uint32_t qcom_compressed_supported_formats[] = {
>   /**
>    * enum dpu_plane_qos - Different qos configurations for each pipe
>    *
> - * @DPU_PLANE_QOS_VBLANK_AMORTIZE: Enables Amortization within pipe.
> - *	this configuration is mutually exclusive from VBLANK_CTRL.
>    * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
>    */
>   enum dpu_plane_qos {
> -	DPU_PLANE_QOS_VBLANK_AMORTIZE = BIT(1),
>   	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
>   };
>   
> @@ -359,25 +356,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>   
>   	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
>   
> -	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
> -		pipe_qos_cfg.vblank_en = false;
> -		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
> -	}
> -
>   	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
>   		pipe_qos_cfg.danger_safe_en = enable;
>   
> -	if (!pdpu->is_rt_pipe) {
> -		pipe_qos_cfg.vblank_en = false;
> +	if (!pdpu->is_rt_pipe)
>   		pipe_qos_cfg.danger_safe_en = false;
> -	}
>   
> -	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] is_rt:%d\n",
> +	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
>   		pdpu->pipe - SSPP_VIG0,
>   		pipe_qos_cfg.danger_safe_en,
> -		pipe_qos_cfg.vblank_en,
> -		pipe_qos_cfg.creq_vblank,
> -		pipe_qos_cfg.danger_vblank,
>   		pdpu->is_rt_pipe);
>   
>   	pipe->sspp->ops.setup_qos_ctrl(pipe->sspp,
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
