Return-Path: <linux-arm-msm+bounces-48570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C72A3CB54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08676189AA20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C8D257445;
	Wed, 19 Feb 2025 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c6pH/CO7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2C1DED73;
	Wed, 19 Feb 2025 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740000158; cv=none; b=dlZspGYctIBkiLZxFka5wTcCrD/Au9GzlHAlWFPw3SBMOU0HfYvqJn0b2gcCu87czdvH7IJiCEEP8oiB5xOyzUtl9X/2BjYZNNtjhsmpHhRnC/RlC5KF8lzGyeY2Qq+KSIRq2M2HWX5qvM3od3nUa2lbP9B2+/z/UAIcFJE23R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740000158; c=relaxed/simple;
	bh=AN9J31vW0oQ/9ZSxMNJgEzOqx9d4OxFtKZkgt79tjPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FA/JWA+hSoffDxOD/82TjTO/DhWEblPNRgHpU5qbidH0pbbFN4habQbhfGN4TYirRI8n8rMXUcZ+fIsHJcz5kwf4nuJAPjx1YidUwXj0mFtuLlzyHeuz5l25UB+D7kCAIdhB8LAEF2KXnbNImjJds9/U1vjPOYwIi5KTRA7Qfas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c6pH/CO7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JH6vL5011673;
	Wed, 19 Feb 2025 21:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xHZFgs0gR1i+A1hyCRodklSySviA0ZVGJbSzC8U+evg=; b=c6pH/CO7B91dldw4
	QwKa+xiPiAR1SqqCwdjPdTkd+3a8TN+mSDgoRGsBWgNPIVIcCT4lQA00p231ujRW
	0plcbHqIHqX5wwedlKLb3Hoy0luKvNtgs4UbqL/J5Ky6kZDrldblSdL+Hyl4cxPw
	MH+yIjL+6sT1XlrL5ZGw8MWIJIsJ67jbtvHDIWrmqSXRHT5unaeb+j8TnLPSzv+Z
	FT5l778ZjTUHjWQGC7AbEGa2dM7YAKwwH1eMqFuPZpWRWV9QM+QtiMnqyECA51qu
	AbJ9qS+9DXMXsKKSyUmw67HnjpDbWnuphQCR3f66WvexEDeOPnsVsx5FBG8Ai6Vr
	LiZhmw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3kyta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 21:22:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JLMLN0029381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 21:22:21 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 13:22:21 -0800
Message-ID: <5282d2b8-78fe-43b0-9136-78f41ccdce14@quicinc.com>
Date: Wed, 19 Feb 2025 13:22:20 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "Marijn Suijten" <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek
	<jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Srini Kandagatla
	<srinivas.kandagatla@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: h4vaZr4Zf3dBXHiz3purCafyI_wZQoEr
X-Proofpoint-GUID: h4vaZr4Zf3dBXHiz3purCafyI_wZQoEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_09,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=986 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502190160



On 2/17/2025 8:41 AM, Krzysztof Kozlowski wrote:
> Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
> MERGE_3D blocks.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index ba7bb05efe9b8cac01a908e53121117e130f91ec..440a327c64eb83a944289c6ce9ef9a5bfacc25f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -123,6 +123,7 @@ enum dpu_lm {
>   	LM_4,
>   	LM_5,
>   	LM_6,
> +	LM_7,
>   	LM_MAX
>   };
>   
> @@ -167,6 +168,8 @@ enum dpu_dsc {
>   	DSC_3,
>   	DSC_4,
>   	DSC_5,
> +	DSC_6,
> +	DSC_7,
>   	DSC_MAX
>   };
>   
> @@ -183,6 +186,8 @@ enum dpu_pingpong {
>   	PINGPONG_3,
>   	PINGPONG_4,
>   	PINGPONG_5,
> +	PINGPONG_6,
> +	PINGPONG_7,
>   	PINGPONG_CWB_0,
>   	PINGPONG_CWB_1,
>   	PINGPONG_CWB_2,
> @@ -197,6 +202,7 @@ enum dpu_merge_3d {
>   	MERGE_3D_2,
>   	MERGE_3D_3,
>   	MERGE_3D_4,
> +	MERGE_3D_5,
>   	MERGE_3D_MAX
>   };
>   
> 
> -- 
> 2.43.0
> 


