Return-Path: <linux-arm-msm+bounces-55995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA448A9FE80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 02:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1174176095
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 00:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499FF1DF97A;
	Tue, 29 Apr 2025 00:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JniuNjHy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D471DE2C6;
	Tue, 29 Apr 2025 00:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745887055; cv=none; b=cvpwFPyUm7eF5BGK2AiQrLWAyJWiOvoI1k5PyEFBGhrfpY9hzVXaIqkqoHQBgBxWjwLHVQp+9zPNwiA/FRWw68aGamYolRoJxkmURlanQVSMVMHyhioL+JXWPBRRyrXcKrePSVwnlISEe+1ZwlXgmOo4KE9i9Zt0/XOHwbP7NAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745887055; c=relaxed/simple;
	bh=VPJnbm9ofSRd+PYgtnAqWBQ5wVJDwJuZ2BgWufFrA/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NnjZVxlSzLNE89YtQRiBRQaJaFA4klZA5b/08fPfSO1wThN466pI3m/xG06gvagSMoGnZ0eB54s8dz4zwkiCld9TJOyZ+57S58B2vNVv7DF9Ew+8xL9qs3VAM6SysBU3sM5gI9h8sqUJeMgoWYgBk3TqdONxFM/IK7CrKlkAqas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JniuNjHy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqni1001785;
	Tue, 29 Apr 2025 00:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	psXrmKyxbRBwpbmTOJvAdED66voICAJ+SwqB0hGQ7HE=; b=JniuNjHyAIBxPS84
	9YXGUP0HifIXTfyN7iF7pSpp66bgxOxwRtY64UZSCToEERW1VtepRyi+o+sHCKJD
	W7nuY4k9HbTFkApZMdcjhWio0fu8CtnJjfOu+jUNF6GxBCEDDyTyI4c/vecmZCzq
	+BOoR9P/86SAWcV3k5EAEBfDa6T2JK2FGGo44P31bsQBrD9MzS2kG46zxazBy6MZ
	v0nxRSGHo7ePD1YNvb1VmpFtuaRRxiN25YoMZbhuaC/7ckazhJ097t/Se7ObQ6nB
	dOIpyWG1yvPy/nlZM3FlbqJmaUIu4ENuY3+MFyqIjbj1/dw+jpq+8VWuHg5zoplC
	ziD7TQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9jqp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 00:37:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T0bL7n032059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 00:37:21 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 17:37:20 -0700
Message-ID: <4fb243c8-87aa-4114-8867-937a45ae3670@quicinc.com>
Date: Mon, 28 Apr 2025 17:37:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/msm/dpu: remove DSC feature bit for PINGPONG
 on MSM8937
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?=
	<barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
 <20250301-dpu-fix-catalog-v2-1-498271be8b50@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250301-dpu-fix-catalog-v2-1-498271be8b50@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=68101f42 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=iTZM9pQ1TWb8sfHiNRoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 31yn-E73McJ-lA7Pt-ydn3PewTO4hj1E
X-Proofpoint-ORIG-GUID: 31yn-E73McJ-lA7Pt-ydn3PewTO4hj1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAwMiBTYWx0ZWRfXyS2SukoHCVI0 fsn3RsbESYO+c05Rl6Cri/vBT8d+l6TEDz7TurQKLccI6FIvi2cTIk4aNqr2Tm/ll+EQ66iLPMC tS4IRCqS73HFRR5SkI7dd7xWzeiayKUoh+4oFfRq7HWVYh8wMjuFJ37acVUyN0uWoWG85S/ejeU
 cT9l03dKQcf462cNeI8FrMeYYiTj8ZFAFURRBcoF4RZfF55ppvHyybEYBvhv1fc8Hh02B5nJM0J Qr/7pPM8kBNrzVaDcqFlzle5EmlbJsnCE8hbuq6K7DO5APAG25qNI8/hgUGcHoAIfSbKziGFTOJ xq9O0qoqVc7umjZh8u20OvR3DGK90CfGrLFv+j3fGyO/J/OvgmTL0EjWHIyQG2ez4jHLK3RQVEi
 2YumrAAOEp7lh+IIG3tu6TxFXJfQrSUhB4fSZpgYtR9KoAKgOuRjNHTJD7qqJvrqh8UairSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=977 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290002



On 3/1/2025 1:24 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 2 --
>   1 file changed, 2 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

