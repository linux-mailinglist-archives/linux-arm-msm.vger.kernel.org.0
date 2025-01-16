Return-Path: <linux-arm-msm+bounces-45184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF1A1309B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 02:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 520361888B67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 01:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A247C1E487;
	Thu, 16 Jan 2025 01:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bjUVNhM0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBE729A1;
	Thu, 16 Jan 2025 01:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736990236; cv=none; b=Zk9f+N6zB486s9tfSp7/5GtnkVLDrea/pyg/Npjx6yZPtqjDWsZ9sUBE5tr/vzZaDLEdGcsH0kXxeBqWYOarpNWOJKgNpNWmK0a0oL6/te28kkc8nMpECzG9uOwkAvvKuBjtf4RMqIvqSdGM4WbNUYQgbqV3bhetJ9FbHDzVhNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736990236; c=relaxed/simple;
	bh=3cskU3RhZqgeESoAtce6mw0CAomT1DZkKm6L1YXyxPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=umoI9IzxYR9/iLwR8Gpea9iHVhS5spMYhRB/tveUQvSzChgi/q/CpOxQxWtcfH4hE7TpSawsnAaGZ0wSIrfV7DFLc5SebWhFiXm5yXX2IxaOagqNwU1P98pwUEO9QPyu33wYLbZmpH9A5o9kuAoen5OZ+kDmxYxCtq1+y/Cm5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bjUVNhM0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FKrbJf009208;
	Thu, 16 Jan 2025 01:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	saJ1fk4vOLxGWYtDZMmSkpZrxzipQvGL3nYDUcAsoyg=; b=bjUVNhM0NGfD3KqT
	gk9ZypCy7lH3t/uEDa1dclcVTO5yj1WFoIOqgAVLCKtQfPpqG2tsYRHQ5YAgsjTf
	JL5NFMv6akWIzr1dF44lDOo31PzM7S+B10QFHi172CTpEAJnn2rPRmSpCiO2z92r
	SFQ8Tu9TovbxI5l0rwWMt3fy8kzguDjQhTWfR+iZ3L4iSKNFTD4JtU95Sa/3rBOu
	LQbdGz4zf+0NX5h9CdUf2fFTfpFVfkgn2KYtYxEZ6nNFPsDT1a6o8laMPHLOdQJW
	qmicfYaIJBOwZlD+Ya1hCuWpdOEc3pstXXuRkWaAt+9grUbxy8xrvtt9egNeOugO
	ywDX5A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446mf2gefn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 01:17:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G1H6rG018181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 01:17:06 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 17:17:05 -0800
Message-ID: <4d4fcf77-8730-4c5c-bc33-53b8d8575c57@quicinc.com>
Date: Wed, 15 Jan 2025 17:17:05 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/35] drm/msm/dpu: drop INTF_SC7280_MASK
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
 <20241214-dpu-drop-features-v1-4-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-4-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qjRL1pekM4dZOdcFhTZqeBSnYaNa5Bk4
X-Proofpoint-GUID: qjRL1pekM4dZOdcFhTZqeBSnYaNa5Bk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_11,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160007



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> The INTF_SC7280_MASK is equal to the INTF_SC7180_MASK. Stop defining a
> separate symbol and use the INTF_SC7180_MASK instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 +++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 18 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  8 ++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 18 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 --
>   9 files changed, 45 insertions(+), 47 deletions(-)
> 

I think when 781452286aeb ("drm/msm/dpu: drop DPU_INTF_DATA_COMPRESS 
from dpu catalog") was made, we had only two chipsets using those masks, 
sc7180 and sc7280, and since then all newer ones went with 
INTF_SC7280_MASK leading to this duplication.

We can drop this now,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

