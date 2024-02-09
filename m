Return-Path: <linux-arm-msm+bounces-10429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EF3850093
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 00:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0504B21E05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 23:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99795364AE;
	Fri,  9 Feb 2024 23:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CvFWhdEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2561836120
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 23:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707519748; cv=none; b=S6VyoaPog399vU3fLtc8O9isG/UOCaJyldPsA+dBpT+SVG9BuHmNS2BTXQ+FkkWnFizMcY7+ft93ucdoaT748SLRsaMD2A5YCkiA9b/aYjZ/hzx19XA3c1mE4GqDiKB+WxAaBkDpnxD1TE5FrlsBX0tMnlYf5kcXZ8eUNdb3yMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707519748; c=relaxed/simple;
	bh=XxVIp3GWf4aDMY9dvKIe7xOjB2/7T9nKcRPhPL24qY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lDdKGF0KVxbolQNGUMyVn2LCV0zDNvhdiYxLA6w9MlkDb3nmhVXnZ0BQr0b5XpRf7L2nTgdwl6JiitU8OmrtlWUf0QT6k6K2F+hnU63V5j8TuwZmGGmDfMsVQAVg8svTGimo4fuIUyReopAzI96Ptehee1ZdzBheQo/JfhB5C4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CvFWhdEC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419M4sGu005660;
	Fri, 9 Feb 2024 23:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sSLaSo7m56c9SdsxX33Gu0N8Loy4ryb2wwKlb4YTLy0=; b=Cv
	FWhdECOCCKHS5BPOWeE8w/OM4LBoHPdAykyA9vMX4UUSXpaLaHyKFEoB2EU7d5uj
	BA6cznAaCcAd9Av4fLEQ4NKgo8vvc+r/nPbXl0mucbKG8TADweJcw4eXimw6d5Se
	BSK4z2DdWn6X8og7yAbeBLFvST3juIXhuWIPH71a6lwjNUJTN+vEenpff7tJEj/8
	UcoeYVt53apqf2PVJpjGdFLDz0qPt8FWt8+IVRwKW5vXMk+Q3qlEVOz6GWIeHbmA
	NFMQ6NMqq1YpH5DojqOjrf7ZlI2awmXz2Tq7JgCMW4zmtZ5tf7q2ZWMAWlt7wsTj
	bbbAdSZFgaW3VGJ21DUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5u4br8t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 23:02:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419N1l8Y011293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 23:01:47 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 15:01:46 -0800
Message-ID: <d2706a41-bd0c-336b-a119-92c77e87644b@quicinc.com>
Date: Fri, 9 Feb 2024 15:01:45 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND 5/5] drm/msm/mdp5: drop global_state_lock
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
 <20231203000532.1290480-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231203000532.1290480-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z71WY4wU3SFeqD6gGZdsL9M2prtMtlGo
X-Proofpoint-GUID: z71WY4wU3SFeqD6gGZdsL9M2prtMtlGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_18,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=618
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402090169



On 12/2/2023 4:05 PM, Dmitry Baryshkov wrote:
> Since the commit b962a12050a3 ("drm/atomic: integrate modeset lock with
> private objects") the DRM framework no longer requires the external
> lock for private objects. Drop the lock, letting the DRM to manage
> private object locking.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 8 --------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h | 1 -
>   2 files changed, 9 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

