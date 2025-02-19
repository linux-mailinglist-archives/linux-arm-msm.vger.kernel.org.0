Return-Path: <linux-arm-msm+bounces-48571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12816A3CB5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E580B169E9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B587725742B;
	Wed, 19 Feb 2025 21:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HfFRiya9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390881B87EF;
	Wed, 19 Feb 2025 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740000303; cv=none; b=WJCNDeITldUkSx5plLLW/v876BnUQqyKCgJrR/nH0luRqzXRYzvp0U+xBu4RD7HDV/vOoVvI65lPlzscbIvy+/hPY6nXXNtJ3CYy4FZRiuALIYaXx0nJuMYLQRKM/uMjENKl8PqeiCUZpNe0gpYE7R4yNU12UUP5Hf+tkkrO1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740000303; c=relaxed/simple;
	bh=AN9J31vW0oQ/9ZSxMNJgEzOqx9d4OxFtKZkgt79tjPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=njCI7rgGWRiJ4UVXHdgBGjJ7G04t/azFpaPoMy4jzPPwp57zjoWSF6OGg6vCqw3ilHNR8FJ9ul92veA6krJcbAxfslVtzc/X6pIyBBlFs4fhybeMXkFc+cbgWQ1adm86jnnv3UuaYX2Wch35QxH6wCtjh+YRaXZSloeBpehyW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HfFRiya9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JB9eKU031470;
	Wed, 19 Feb 2025 21:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xHZFgs0gR1i+A1hyCRodklSySviA0ZVGJbSzC8U+evg=; b=HfFRiya9wgGPnnLf
	Sr77Sj9TP0DJtA+5hxp+U15QhB03cn6qhbwId3SmG4fnn9nc+2Ov18MK/4O9wGvj
	SnMKcR27/Xbnc/r4QRNmUEGvpszbJAU0xbsBbEWXveETSwwnfzrJYpbCIkwFiPJq
	dfg04eAz3oE9L3GW4xpxvAiyAIBc0658KnffWhBdKmuqa9GA893gdubL1wW/TK2T
	4NdjYwuG5WDr8xsn7EIMGd+VxMvmEKPxwjxfj6j4qrmJbU+tapnLfYDD+NWiUxSO
	QXH0wapr7mNdh9esCqSDMqbYdf0vG85HtMSkfFevtyxQ5mDhGJlWbwgfLYBtfxy9
	/XAcVQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44we69hp93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 21:24:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JLOmEX009719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 21:24:48 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 13:24:47 -0800
Message-ID: <ca83cec4-bf6c-46f5-994d-60be667399d8@quicinc.com>
Date: Wed, 19 Feb 2025 13:24:47 -0800
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TWSIJTRe_UKCv8OqxGGENui9mX0gjrHH
X-Proofpoint-ORIG-GUID: TWSIJTRe_UKCv8OqxGGENui9mX0gjrHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_09,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=986 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190160



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


