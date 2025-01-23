Return-Path: <linux-arm-msm+bounces-45878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B202A19BD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 01:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9C1E3AD742
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 00:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F94A46B5;
	Thu, 23 Jan 2025 00:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZDTU3Llu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E4E1C2BD;
	Thu, 23 Jan 2025 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737592409; cv=none; b=tIN5IErmw8jxfayg/XF95Q7RcV1CxcP26Awo6K5oAV8LP0kA9r6siCSkgeJwwGSjQE5QLi0sOb0kSsFqAIQtgGH9GtcHplZ9ufrCzYYEjHSdyeF2I+bXXJ+4iZfOjPKrg+fbU6Xul1mUPNTtG/BHBTLmEx+SonY8WBsTKylXiII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737592409; c=relaxed/simple;
	bh=lBEu328frgPB/u5rKnyUpwqj3KPJ/YQfiEBEQWJBDTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jzpbNQHyyGjUiaSKRF8XMhUHOISZLERn63pgxoDaAlcRlDZOeKzRkqrKxxK4BFIzrhT8z8Y6U/8Ad+CEBHsVx/mvGIqKpdYWJ78V/ThpreGaPerzMAoRAZ9KbbF0G6hWZfjfqPHyA2wxRusRtqI/jJtUTXcwyPmJ87hbkKP+c50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZDTU3Llu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MKr4mR022782;
	Thu, 23 Jan 2025 00:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHySjB5cfCh8s4854tdEMWBxK56jJ5ZgbOSLjJRPjdU=; b=ZDTU3LluR6KHc8Fa
	7lPiuupbKyiJSmLa6rbEH+qfoi8O8r1ayXdzaCojW6Mi/OqJvYg70hbRdLRI1RoG
	oPEpjq5gVgzVutXKlxO+XvVLSjkEfn/z9XDEtieUJKjJYdH50FXpq7hSWJFinjNI
	h2J2PWxHe87v/JIWavVn4o7B8UzzIDL2uy05pxD1yu35lR784qSJ0WTbIAimKHhF
	rAG0CfDsDycOG+jDuulCFCmgpzRuhrehQRuN4yf4jvqPb1lHB6u4xfWYrH4DqqaT
	VdBOMeRJkqSNfIZDweKehxyGQVT1K4hq/b+KclVsQ2/VdxRWl2FwCfymSW1M7F4b
	vW+Xyg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44b834rb4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 00:33:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N0XGox001669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 00:33:16 GMT
Received: from [10.110.95.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 16:33:16 -0800
Message-ID: <049c50ca-a2f1-4e5d-9e93-16d51d6ae835@quicinc.com>
Date: Wed, 22 Jan 2025 16:33:15 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/35] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-11-988f0662cb7e@linaro.org>
 <9d86517e-b05c-4cd6-925e-11c859fcb91d@quicinc.com>
 <obrwhv2a4ubg4updrimszy7b7dwjsixuwzf5gutjahgdim6nxh@pin7heiwmco7>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <obrwhv2a4ubg4updrimszy7b7dwjsixuwzf5gutjahgdim6nxh@pin7heiwmco7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PhTd1HFNG8279v9r0bc1I8QFiMb4NTzd
X-Proofpoint-ORIG-GUID: PhTd1HFNG8279v9r0bc1I8QFiMb4NTzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_11,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230002



On 1/22/2025 1:53 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 21, 2025 at 04:58:03PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
>>> Continue migration to the MDSS-revision based checks and replace
>>> DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 8 ++------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 8 ++------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 8 ++------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 8 ++------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
>>>    15 files changed, 13 insertions(+), 50 deletions(-)
>>>
>>
>> <snip>
>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index e9bbccc44dad8b391cd51daf902307105b2598fc..e16b0a0c57da4a1aa77064ca2214e37cd9ee4baa 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -66,7 +66,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>    	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>>    	/* setup which pp blk will connect to this intf */
>>> -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
>>> +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
>>>    		phys_enc->hw_intf->ops.bind_pingpong_blk(
>>>    				phys_enc->hw_intf,
>>>    				phys_enc->hw_pp->idx);
>>
>> Was it intentional to drop the DPU_CTL_ACTIVE_CFG here but not replace it
>> with core_major_rev >= 5?
> 
> The bind_pingpong_blk is only defined for 5.x+ platforms, so the check
> is useless.
> 

ack

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

