Return-Path: <linux-arm-msm+bounces-45169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E4A12E1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 23:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0732B3A5E58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A78E1DACB8;
	Wed, 15 Jan 2025 22:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yu5wcRtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8293132C38;
	Wed, 15 Jan 2025 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736979006; cv=none; b=B6qXyK4sDLgKY9TVQ/k24/YqZtueTDPNqVWyUPYWVVHh3DOyu3p75iDmw2CWvTHvE/SaV2FNVwmEvzsxzmJkEDLW2nJ9qXNmoCTstMfWa48zfLOiOc4wt/zPLA+dGEMzHrTmWl2dNQsIa20FxLmQbXEQUwC6DtPEewRIh67+n+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736979006; c=relaxed/simple;
	bh=9fKFHQVl62Tfj8JkIGIcubtHMKKVjGT2togEH6zF6lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VVDqQNxPZWIPJh/1hEGWiFHq4judauiQrprij5GOohqbOU6WWF/ZAjUn3AzYifYk7L1h0/tQ0oRLlNcNsCdME6xJYeVnR70mW97MJk2e7uYh+c+e5ukQPDjNiMh+YJKoRQwJPsApFstYOQnHsZKgaOSkJqmNZzCbZmeCC0ydoOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yu5wcRtZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FKraCu009166;
	Wed, 15 Jan 2025 22:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+DtFjjBpGn7l+yMjgex2NMxwUK05TJEkOHVdfu9o/c=; b=Yu5wcRtZwb0/uA4B
	m3sTlqnv2wO6kckQOMv1oeMB5KtscL25uaXvCbVXe+gnlfN3jkCbuyy1TsG1NurW
	oM+Yz3sEoiMynd3HAHySimL8bkGpCVt/uwpw9ljlT8N+YEX0OvnUxzgHg4cfVDQp
	N43D0W6VE7+pNwgKADznAu56OFqo9v4FBMercjmUujnqHkC49FMFjdnQK+U75/Xk
	a1tEHDW+o1Hs8xuMe33JK0fWeKPhmVEWrikzdMulby0wgNvA3QAR3qO6rUBsXUwQ
	T6dCiLPNdOR2lmIHLrZihVxnEX0NGwHol9SQxnH2GghCTGkzoY6uzS89jd1xrB8G
	gwt/2g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446mf2g4e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:09:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FM9nI0024929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:09:49 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 14:09:49 -0800
Message-ID: <92b1bd35-28ea-4bf5-82a4-de95f9ffc248@quicinc.com>
Date: Wed, 15 Jan 2025 14:09:48 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/35] drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-2-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-2-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 06yCehkHFxE5-NTYRmOfEr9QZqcEn9a4
X-Proofpoint-GUID: 06yCehkHFxE5-NTYRmOfEr9QZqcEn9a4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=827 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150158



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> Several DPU 5.x platforms are supposed to be using DPU_WB_INPUT_CTRL,
> to bind WB and PINGPONG blocks, but they do not. Change those platforms
> to use WB_SM8250_MASK, which includes that bit.
> 
> Fixes: 1f5bcc4316b3 ("drm/msm/dpu: enable writeback on SC8108X")
> Fixes: ab2b03d73a66 ("drm/msm/dpu: enable writeback on SM6125")
> Fixes: 47cebb740a83 ("drm/msm/dpu: enable writeback on SM8150")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 

Change LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Basically, it means that WB was not validated on those chipsets before 
enabling them something which should be more strongly enforced moving 
forward.

