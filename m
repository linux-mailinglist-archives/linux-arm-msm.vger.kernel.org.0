Return-Path: <linux-arm-msm+bounces-44220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E729CA04D62
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 00:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78E7F3A32AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 23:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEC71E0DF5;
	Tue,  7 Jan 2025 23:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R0pHjnEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA9273F9;
	Tue,  7 Jan 2025 23:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292087; cv=none; b=YrsARfigyvpQrjugkHVDlwnwjDa3pUFClbGp+VFSfUJshMBzRLhFc9g/s3U5KDO5vRh/DT0hNzNmmlBCZpMV7xkg8Km5dzbSRL/HdZ0Rl82b/MPPuwNyr1Y+fKLRsbpcpNgkxewMs/+lm1/AxU7psQ6X2av9/Mj1uPouLEqnHkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292087; c=relaxed/simple;
	bh=yxXQX+MTPjA0nG1/Pg2mmOwUUCf59TOTKrySKX+9RVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L4LmCmr7Jk3VQAWlLn1XYse3dAbk7WtvrXEcPWH23jsa5kjnDQ+Q/XK+B7evNa59J+lTss3jf7qHIlXkBCtqJrlUj9/C6R7V1+K01lpCXSq3tIP4Fj8m8er6GXCfFKtlcLxElOQWGyz0cqB5JuUQvAfx0RK+Vk3Vz2phAcYgK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R0pHjnEa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507IriTW017648;
	Tue, 7 Jan 2025 23:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ys/wEUlbkhJxvNz71/1sae7E40uHC/lNpQ9DjVRGmfM=; b=R0pHjnEanml7kdJ2
	kAChsqjGaphyZzPjBOQi3lKPURIMW9K8rkEM9uyuVCyUM72+LihKJx+yJEGuwK22
	LrWS4yJyfw/jG/FQD48al3NaBEFPT2PkbHtwJyJrh4VukiruXNQtcaBRTtuYm9Hl
	aoCdQd6iwzGmQ+ApUNz4EQ2k7S6QHIfqTFJ/lsCoBwaP+qGAl6zOycGCP+IlKLP4
	nu9TiXezIvDyJoCzK0nvbSnPwOGKAEpOuT4ULBj0cMjwIPhicefh/24F2c6NHPjZ
	9PmSC3dvGThoqv/mVcDhNghsamCYeZJiJAfguFapJ1gBwBWYKpHnY1RZO7LwC9J4
	smkksg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4419xurftf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 23:21:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507NL0KZ021974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 23:21:00 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 15:21:00 -0800
Message-ID: <8c779fd0-abd4-4f21-83c3-8295db9f0584@quicinc.com>
Date: Tue, 7 Jan 2025 15:21:00 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dpu: rename CDM block definition
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <20241224-dpu-add-cdm-v1-1-7aabfcb58246@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241224-dpu-add-cdm-v1-1-7aabfcb58246@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AyQsoODxgWe01guQLZDeXrkQ6Cf0J55Y
X-Proofpoint-GUID: AyQsoODxgWe01guQLZDeXrkQ6Cf0J55Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxlogscore=782 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070191



On 12/23/2024 8:25 PM, Dmitry Baryshkov wrote:
> The CDM block is not limited to SC7280, but it is common to all
> platforms that are known up to this point. Rename it from sc7280_cdm to
> dpu_cdm_0.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

