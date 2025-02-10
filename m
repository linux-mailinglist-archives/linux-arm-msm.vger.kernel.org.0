Return-Path: <linux-arm-msm+bounces-47489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4ADA2FCBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 23:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E2271652A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 22:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EA124E4B8;
	Mon, 10 Feb 2025 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bKgYrG2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD7A26460A;
	Mon, 10 Feb 2025 22:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225675; cv=none; b=FbWwICmwKRRKA7Jmd0UA9eNMmXOSlOTP13R3Y3vJjTjCouwA4UKbhV6YzPiXC6Fqndi4r68ks3sYtL3lVDRo7xlmJ5bkJj0k5cXLzWH5ieV6G68N9zA8HaIsoKpxHt/6TFlgcnpBBJ/Mwfgl5QuJo07MTYlpMJkEluoVvDaGIvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225675; c=relaxed/simple;
	bh=wAlco3KgE3b5Zm2KxeQSUCDAHvlWIRWuWCxaZuyhKIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o/O0PzvduXHusGhsOk6OQN46nsQY50bwxoG9EIdADRt1L9wzyDLHI7slFCJ/HKCIAwHabz6J5QV60QxOJqvpmOAlI7hHR90c0QFRdQaWyLVXKu1dk2PIVSLNfaQT9O6DVoD6BmlYtHop5+UoEnaZ5vq/Qp/lXXYqSO8qJPez2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bKgYrG2O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AFWGNv010537;
	Mon, 10 Feb 2025 22:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY50FlbYh4+8a/VdeObjeHxe9rwAB0wgSpExAfUGU9c=; b=bKgYrG2O14NkcbVZ
	cGs/N0lLBDOJLBYcof8s/qxsUf1UpBGHpGGzfQEF+LFCdZIbZXQQ764YyGJoSx8E
	n67QtCKeY8HVZgQPARVUQgUU0sk9YC+aOetSTfSh5BHIhHdvoCn7ysXEm1BH+3Bv
	OwQWran9q1WadH1zhCv2LNtt61VZnansqLLHeXWBWJF/tAPGn7jKE+G8adTJU6kd
	s52HcoX2UoAcGEZBnpPdMVTsXh0Mj0I3zlVzlbc6x4gRk4J57fHIJG7G58YUa4fY
	bpT87AZVOoKSmvYVcXzUofi+NucLIqg15dAGS9Q2sSIkCfXyQL4rWdFPQMAdHjnG
	/P/z1w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5actr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 22:14:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AMEGmp031662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 22:14:16 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 14:14:15 -0800
Message-ID: <8e40c1bf-6da7-46b1-925c-53d1fa25f3ce@quicinc.com>
Date: Mon, 10 Feb 2025 14:14:14 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie
	<airlied@gmail.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Simona Vetter <simona@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6dQVsI2Oq7WzMD3NmrriezMEIldBAUks
X-Proofpoint-GUID: 6dQVsI2Oq7WzMD3NmrriezMEIldBAUks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_11,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1011 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100175



On 2/9/2025 7:51 PM, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
> Changes in v2:
> - Return explicit 0 when no error occurs
> - Add hardening mailing lists
> - Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 

Thanks for your patch, this was addressed with

https://patchwork.freedesktop.org/patch/631567/ but since this is better 
I am fine with this, will pick this one up

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 098abc2c0003cde90ce6219c97ee18fa055a92a5..af3e541f60c303eb5212524e877129359b5ca98c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1164,7 +1164,6 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>   			       unsigned int num_planes)
>   {
>   	unsigned int i;
> -	int ret;
>   
>   	for (i = 0; i < num_planes; i++) {
>   		struct drm_plane_state *plane_state = states[i];
> @@ -1173,13 +1172,13 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>   		    !plane_state->visible)
>   			continue;
>   
> -		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> +		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>   							 state, plane_state);
>   		if (ret)
> -			break;
> +			return ret;
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> 
> ---
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> change-id: 20250209-dpu-c3fac78fc617
> 
> Best regards,


