Return-Path: <linux-arm-msm+bounces-49097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DFFA41393
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 03:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4F773B2CD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 02:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1852D1EB3E;
	Mon, 24 Feb 2025 02:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="inKikSb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004634A08;
	Mon, 24 Feb 2025 02:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740364520; cv=none; b=fPUJCN/4GWhHnEF0SJtoqf0LH/ZZVZ/bCLaLOvDjuQYPoCl4p0gSuOSK8rrWP56phUNWQ9k2GbEdgVRzhlTMfHI7X/uUO8bTfkb7etDmerJNezH/eaeeT9isdN3MqoPNWesqvII7XVXz3S0BE7wV8zAWN3gxSKS1OQtdZamPNDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740364520; c=relaxed/simple;
	bh=rhaFiCjUXS1yxvVkRrS0/4pV7RkOkNYZVL20dFAMjbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X5akMwzvqIzKgyXpqeL3iXUv9w6jWPRGgws2gSHv4TcMfsYxSbXQQFHFhb8nv6oIl83V6vUDUd+hliTIWu9UgdqZVVbDBsbBoFvxhDZzEHmsFiTFhy0Z9DImkxvp+U9X1c6BQxitD/jyTgAnpq4HlTu2yFDQKH6w8FSVUpB2t8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=inKikSb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNPYwa013401;
	Mon, 24 Feb 2025 02:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDjpF9wv5THn1Su5bkxiSJ/+ZI2FB+8RpTy0OM/Vqy8=; b=inKikSb7P4olJKGu
	j/PxpcqwKUSdyuxtqOokqEHnGHSU9zGSHwHZgjg2rVjrYqyoTQDjDc1galQR9J6A
	uLyGw2Zz/P/EvBX0WzdT6bpnry/NRCJyxegJ5B9hhaxhE+eN9AAZ2MDr96Y5AZhb
	CsGTBFikN6dUoFTIfI6ksdKvVXWtRjGRauw+NIzVjZSxP80NRTKRPRgv/qU0Qicc
	YOeQrkyjRhsHCvhkJ7C7kKwtGiTXDdfgRZdw46lA75Bjn1bh4IaqxB+v2vmLoHxO
	/Lh03lzhUgxuoSEOAnSvk9mSOsEvEB+cd9T9XAFaVDmFwucT4yvu8X3T7x1+1WJF
	84RdQQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5hrub3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 02:33:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O2X68O004256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 02:33:06 GMT
Received: from [10.110.85.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Feb
 2025 18:33:05 -0800
Message-ID: <0b387a53-a67f-400d-b8a0-8c904496a558@quicinc.com>
Date: Sun, 23 Feb 2025 18:33:05 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/msm/dpu: enable CDM_0 for DPUs 5.x+
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
 <20250220-dpu-add-cdm-v2-2-77f5f0df3d9a@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250220-dpu-add-cdm-v2-2-77f5f0df3d9a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3GD14BWOHkiae9x-jYkXwfM72cntEPcK
X-Proofpoint-GUID: 3GD14BWOHkiae9x-jYkXwfM72cntEPcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-23_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=770
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240018



On 2/19/2025 7:59 PM, Dmitry Baryshkov wrote:
> Enable the CDM_0 block on DPU generations starting from 5.x as
> documented in the vendor dtsi file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  | 1 +
>   11 files changed, 11 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

