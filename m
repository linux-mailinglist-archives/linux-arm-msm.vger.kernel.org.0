Return-Path: <linux-arm-msm+bounces-50441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C794EA541F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 06:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D68833AFD62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 05:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6AE19D881;
	Thu,  6 Mar 2025 05:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cga9pjSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE0C199E84;
	Thu,  6 Mar 2025 05:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741238120; cv=none; b=onC98flg4uEVg4n2E9zUQoxwHLUQ+aH8Gc0SNkNZnJNQpz3UrLypIIS0iDs8dozF/wUBn91yOjNsbE9J2wokh0tzh54wL6mEyVckRjO5rWAYpBhNjZoIP6UDNsW8ML+KdRHCRo8AqWUJmzPRFesfgWpthPLHvxXnZhhYlM1yJIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741238120; c=relaxed/simple;
	bh=dgiiOIBu+hF2d/ZZ0OuFxZPtdD6A2/NoU41Y6kY/PxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aYU9hYZeYHOyjRU0XQkzCCWXY64xpRBdRKcoz/r6GOFJPcbNxsIDsiTJj0kozWMinhj214K42mXwycIhHMN2y98InQwWTaW/7jw3des1SgDga0D5ExquRD9QldNHwbtq2GGc8hrbGoTHiWy7kcAmlXy0oc+FJwDCXY+7P01z17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cga9pjSl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525MDdGf005606;
	Thu, 6 Mar 2025 05:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80f/AEITlbGAc8ZWu/rE3dwWyDyqOkwDzNGsDj9Xoa8=; b=cga9pjSlL8bFKQdV
	8i13mJD1F/MxV4M0rXGKElpyFKl9O9LGOVpYzg+EWGZ6/Bgc/MEIU/uxJUfD19Wg
	fY+xNiWiWKSpaWN7qeh1TXZUo/27aVcGudm6UhA3nUL66r6KRpHmLM2s4oY2zewz
	pSQ7Vagzp3j8EsAr6thF47lTm9HXpel9ZbaNmPnhZTZj5YVZThE20FHpCpcuomGN
	qElXCcrQ0Yx8YY2RqurXGlA1+YKcIV2kZtuZosHJdEMgW0t4OVuq9ND+msk06Kc3
	bPQKGx7TYytPkQWOgONSsO7YcWrInX5DsuKHnDagDHpNZfF+zr0NwznGTXaPHg7A
	9Ap3Bg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tqrtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 05:15:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5265FBOR028666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 05:15:11 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 21:15:10 -0800
Message-ID: <f3bfb118-f947-4b09-a368-42c5f0d1373b@quicinc.com>
Date: Wed, 5 Mar 2025 21:15:10 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c92f60 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Zd0Sw-Z5gz-GXOLUdQwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ea9VnE5_586Ht5TT6cWu_dRpCCgoHw_1
X-Proofpoint-ORIG-GUID: Ea9VnE5_586Ht5TT6cWu_dRpCCgoHw_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060036



On 3/5/2025 7:16 PM, Jessica Zhang wrote:
> Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
> dedicated CWB PINGPONGs
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 

Not exactly sure which fixes tag to use here, but
since this should have ideally been addressed together while adding the 
WB mux programming to handle CWB, I am going with

Fixes: a31a610fd44b ("drm/msm/dpu: add CWB support to dpu_hw_wb")

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> index ae1534c49ae0..3f88c3641d4a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> @@ -214,7 +214,9 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
>   	mux_cfg = DPU_REG_READ(c, CDM_MUX);
>   	mux_cfg &= ~0xf;
>   
> -	if (pp)
> +	if (pp >= PINGPONG_CWB_0)
> +		mux_cfg |= 0xd;
> +	else if (pp)
>   		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>   	else
>   		mux_cfg |= 0xf;
> 
> ---
> base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
> change-id: 20250305-cdm-cwb-mux-fix-69ed5297d4f7
> 
> Best regards,


