Return-Path: <linux-arm-msm+bounces-17119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19A8A006B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 21:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12ADD1C22AEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 19:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544911802CF;
	Wed, 10 Apr 2024 19:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k/1OTCWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84B917F370
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 19:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776568; cv=none; b=hfD0c8qVo4ggE97V+cquWw74NzACgxDI2asZRBAFt9wpZf/KkDQ2U7bgLVevbv/icvFcy8ro8Voi6QGc+JYsMYagcuYT6u7iXbN38Cigxv8RmB9LLflMcpJAopHuHO3K5WXNku7YaxcrVsdg5OvNS3gw9+KklaZOnG+Sbgbj3P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776568; c=relaxed/simple;
	bh=wBr9NqDJv0ZuEHlxdgSUAAqnOayUA1J4uZ/OCn17kv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hKnot2jmDOH/dzU0F4V3ut/g0SVlIoPjYt7c6OyocFV1nExs3B40foN+5KecQg2TJYjNOVec29jC0KGr6TDWottDrSwnbF1foDY8in3PSzsL+LUB/OR12seIMRzjw7dAgyLK88nxF5kdAQkCEM6Kvik2uWaE2uHgcafGMyNASNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k/1OTCWt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AJ7Jwa031087;
	Wed, 10 Apr 2024 19:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=3SWPpukViIY0sQ2aqkLXqWAo9nR5ackHJyG2D+3W6Uc=; b=k/
	1OTCWtPHHJyMD1T1tvy/2qchEgLvCsDrTxZ0b9eBfT+ET5dKVNFSAYlDrjPqK9rp
	CxTr03vUzxUWcx/K8+GlhPafYcvqPQ8QJDz2beyK/SFqWOcx0CbIcxabx9EdKajl
	70WcuGDoW9CVhvazbGYlVwrGkMOtTQzChQTG415hM+ackNfwj0yudlmDkwD3nJlV
	clbWDf14Gl05QUegABEizPflcIG7TlGk3f7kR4V4w1pMxe8QqjHa5f0ZDgxLUqs0
	bOFqT9kjZon+P2lkAQS9vs1XpASjJUp2ZUsyfh/voq2uS/Zyz2HJMw0AObwboBcM
	UAAhjaOJBGn11to9cr4A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xe0hu81mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 19:15:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AJFm0E006761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 19:15:48 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 12:15:47 -0700
Message-ID: <bcdb4994-a11a-f80f-15a0-c82c9e34a0ea@quicinc.com>
Date: Wed, 10 Apr 2024 12:15:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/12] drm/msm: fix BPC1 -> BPC4
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n54uQs6Qb9M60lTG6xAgqeEEv7U-jnjD
X-Proofpoint-ORIG-GUID: n54uQs6Qb9M60lTG6xAgqeEEv7U-jnjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404100141



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> Fix enum mdp_bpc::BPC1 value to be BPC4 instead (as shown in the DPU
> driver). This commit should be replaced with the registers sync with
> Mesa instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp_common.xml.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

