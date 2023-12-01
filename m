Return-Path: <linux-arm-msm+bounces-2943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA218013B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 20:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7AB01F20FA1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 19:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CE74EB4D;
	Fri,  1 Dec 2023 19:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lzdssPC/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D341D67
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 11:49:40 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1ILBKH002619;
	Fri, 1 Dec 2023 19:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xN1py9cHnutJpVCIpNXt4MgccbHkV8Sj1sDoGQejqJ8=;
 b=lzdssPC/xECmU6PH/cBWCwGy+DCnYi16Fbma6CvuBaAwbOtFQANheDfa5g3cwTPeoVJB
 xHhqGxNObKLDkIdcCMtswqtejg1DgFxDATEtBfxThPyZhcWtLEOSQI0wtsaIg5tLyFXR
 e/MGOIExOXluAPMo3lumyS1xvpWBA//plWiAsGm9Mqjbvr0iqQY34jS0Ghey3etYR73s
 7MRbylrNsHOJX8GCA7rhUXITGPg+g0JORETvzQ2zro1D3bUllVFyspqRDbR+ev7Oe4sq
 MACjacayF1szCKXehqfgqG6mVYbIa4l9R3qGuDl2FDPiWWc7dCNAsz8GhvSnEKGBP0bw ag== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqjf1rjc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 19:49:16 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1JnFff027782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 19:49:15 GMT
Received: from [10.71.109.160] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 11:49:14 -0800
Message-ID: <cfe7803b-c28d-4cb4-8b4f-323c03aed9a7@quicinc.com>
Date: Fri, 1 Dec 2023 11:49:14 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] drm/msm/dpu: remove QoS teardown on plane
 destruction
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
 <20230730011920.354575-9-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230730011920.354575-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0Zk1ZDwJofs7YXx_KAHDV8roWRKRH0bh
X-Proofpoint-GUID: 0Zk1ZDwJofs7YXx_KAHDV8roWRKRH0bh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_18,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=935 mlxscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312010125



On 7/29/2023 6:19 PM, Dmitry Baryshkov wrote:
> There is little point in disabling QoS on plane destruction: it happens
> during DPU device destruction process, after which there will be no
> running planes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index aba5185e1d66..f114efee1b57 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1173,17 +1173,10 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
>   static void dpu_plane_destroy(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
> -	struct dpu_plane_state *pstate;
>   
>   	DPU_DEBUG_PLANE(pdpu, "\n");
>   
>   	if (pdpu) {
> -		pstate = to_dpu_plane_state(plane->state);
> -		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
> -
> -		if (pstate->r_pipe.sspp)
> -			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
> -
>   		/* this will destroy the states as well */
>   		drm_plane_cleanup(plane);
>   
> -- 
> 2.39.2
> 

