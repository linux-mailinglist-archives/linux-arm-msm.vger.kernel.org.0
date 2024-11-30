Return-Path: <linux-arm-msm+bounces-39743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1601F9DF315
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 21:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C13BA162D4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 20:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413331AA79C;
	Sat, 30 Nov 2024 20:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Py46m11q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829317BD3;
	Sat, 30 Nov 2024 20:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732999220; cv=none; b=VR3u1OqL4mk2otNNHyS7zh71Au7SO+HZ2C2oSDrRtC0Frx5leM+Kr2V5z7An94VUwwqRjrPHPvJeHAQEXlheNod4I10QYz0v9IMmFAIZ9mY7lBTbtJxyTxrnw7zBHu6j382MBojShpf2RRtYzU/w6B/wB/h23HU1uaLKPrXfaiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732999220; c=relaxed/simple;
	bh=AGgw7bUaxLs40W+V8rhQeGaF++UwW6ua6eP0UO6jARg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k4R07TmcB4CxBX5aGhAEctta0PM/OWFTmZKMMyqlgfx9Dym1azSNZWqlVQfqfT+QT2QHEqAJdnK//K+BrVRZlHU1ZtZa1c0O5ca0FYCxZJOwW7YqnS0pg6qiyrw2Fq4xzTpKCduMba7NPNM3BVoOzl7mphgz4mxW2AuZFr+7AL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Py46m11q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AUJsSms012522;
	Sat, 30 Nov 2024 20:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkfM4jPIEkOSfi0KqwHeWHaLc1IN4qtuXoiy4NOqbJM=; b=Py46m11qyoMALde2
	/2BMYyreKCWHak1EoSjw2GNRqq+HfiKak2554zfX+FdbWIw8ZO24aTJMONXk8Gpz
	CxDepR88AArCspX3adlKKPLZMVdGPxeGFr83Gs2/ZgglnuJCizE5cMrPIqLLm0KH
	RRF+ny1TykaeMUUhZYmCjicKwIr6GnoPy6BJdcKP1/s0CSrvaJhplpnE62E5FnIF
	LKf6Ki+hvJaIObBXyufvk+aoggspZJ6PE27YotGb8ipCqr3e+QsbNKJFhkkwiArM
	vsxsAyf1JfiwN9ReKu+5Ki8A1kx2xx5ntmpExSjpv2sTLcAuawGNM1LJ1rRSODlS
	4LIIEw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u3698at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Nov 2024 20:40:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AUKe9Vf000494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Nov 2024 20:40:09 GMT
Received: from [10.216.58.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 30 Nov
 2024 12:40:03 -0800
Message-ID: <cbbaba67-cc17-49ea-8c76-6fdf401cde23@quicinc.com>
Date: Sun, 1 Dec 2024 02:09:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/msm: adreno: add defines for gpu & gmu
 frequency table sizes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-1-81d60c10fb73@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-1-81d60c10fb73@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cw0hmv0RyJZ5DAUWt21PmKMBRbJK7duU
X-Proofpoint-ORIG-GUID: Cw0hmv0RyJZ5DAUWt21PmKMBRbJK7duU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411300175

On 11/28/2024 3:55 PM, Neil Armstrong wrote:
> Even if the code uses ARRAY_SIZE() to fill those tables,
> it's still a best practice to not use magic values for
> tables in structs.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..88f18ea6a38a08b5b171709e5020010947a5d347 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -19,6 +19,9 @@ struct a6xx_gmu_bo {
>  	u64 iova;
>  };
>  
> +#define GMU_MAX_GX_FREQS	16
> +#define GMU_MAX_CX_FREQS	4
> +
>  /*
>   * These define the different GMU wake up options - these define how both the
>   * CPU and the GMU bring up the hardware
> @@ -79,12 +82,12 @@ struct a6xx_gmu {
>  	int current_perf_index;
>  
>  	int nr_gpu_freqs;
> -	unsigned long gpu_freqs[16];
> -	u32 gx_arc_votes[16];
> +	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
> +	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
>  
>  	int nr_gmu_freqs;
> -	unsigned long gmu_freqs[4];
> -	u32 cx_arc_votes[4];
> +	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
> +	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
>  
>  	unsigned long freq;
>  
> 


