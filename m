Return-Path: <linux-arm-msm+bounces-36631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D209B85EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 23:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 906DC1F2231A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 22:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8278D1CEE86;
	Thu, 31 Oct 2024 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZfJlibne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601A81CC16B;
	Thu, 31 Oct 2024 22:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730412774; cv=none; b=M7HIyLsvyuf/aUudDXABzWKPvphT3JI20+J5u+LzDZEHxKC59n/RVHkV4lJGIHKIy+zVpK08TiyVYhZTIG9fcrZef/rUoka2ZZLdEb5Gfmn0z0dj0YIuaBPh0Rqo59WNmPGnMFW419yflnXJTzPRN9L/OzvurVuielHtlUzz06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730412774; c=relaxed/simple;
	bh=Mnps1z9CZtcTCg/nw8sc3JoBrVpV1M2y3lSJa3PYIrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KL+Q30PC3xWPTwfutAOTGCZsm5E3ZY/69uYuvUMsOsGxFCbFPc3+cZWszJYEvCNcuVjiIMhxzweFCnjjF7kyhBDS4B67SPAfZkmGBOwbdnF4ihbCBRl5+/FPBKMxR4KVTSjLRIOs3FeSo037v7uoYEBC0sVZ9ClRAc8Q9SJzA3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZfJlibne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VHf4dV004296;
	Thu, 31 Oct 2024 22:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qazp29QFIHfzgw2taJxyDQXXd2ZNnIt+g2Q+yY9pOes=; b=ZfJlibneOalJElAB
	skxx8vAuePmAU8qv5jC+ysfauIn53a2H8VRbRjgvtFzvRRKWVLoFG2HdtRov7jN7
	l214IcFSggXBaKwZS5/m7yDfdTULAYdI3G2IU4IhIHVtD7HoqfdYGK+Zhl7p2LAg
	fnmHCd56lomkQqkTPehPXRwfN9YjEapYwPV7lAePpzFDuVjpVyX1+Oy0KeqNOYkc
	5mX1dRVqTFl8/0H/2urOV3iP9FG8Y00sl32UbiFPipOR1aYmK/Daq3PSkbEBB4DN
	6YtRTNI8eaz5ZvmrHvkPGE7x04MSRl9Cvsfn4m+CGOy424tDr9gBVxgHtkvR+8KC
	bWaRTw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m65pa7sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 22:12:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VMCdpg003479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 22:12:39 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 15:12:36 -0700
Message-ID: <5ff5e7fe-0901-4099-9e9a-890c2001b46e@quicinc.com>
Date: Thu, 31 Oct 2024 15:12:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/msm: move msm_display_topology to the DPU driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
 <20241031-dpu-move-topology-v1-1-8ffa8122d3b6@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241031-dpu-move-topology-v1-1-8ffa8122d3b6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: t9xJaZ_xNQO7h3tl6vMk-C5Dr7vKhoN3
X-Proofpoint-GUID: t9xJaZ_xNQO7h3tl6vMk-C5Dr7vKhoN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=893 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310168



On 10/31/2024 2:44 PM, Dmitry Baryshkov wrote:
> The struct msm_display_topology is only used by the DPU driver. Remove
> it from the global header and move it to DPU-specific header.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h | 16 ++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h          | 16 ----------------
>   2 files changed, 16 insertions(+), 16 deletions(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

