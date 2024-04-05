Return-Path: <linux-arm-msm+bounces-16582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8289989A401
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 20:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC8EF1C22346
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A26D171E72;
	Fri,  5 Apr 2024 18:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j3ti8y4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F56171E64
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 18:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712341086; cv=none; b=S8aS5A9JB4b4OGecNc1G5Q2ECQM8e96dO6u0Ot5TqkA4HVZmFNrZIWhepsnRSA7P5wo0mL2ToMLmKs7+GmM4rHada/EDRz0w85JLfjfsjqUfy7MzeikEU04+W7zy3iDMcrfT1G+oYLosgnubbKk31g9MFYHSSgjFX+mgYsPJ0cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712341086; c=relaxed/simple;
	bh=ZrvBiwi/SBxkBoOoPVfDqSSepRYpEQnSqI8Zf3lB4iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ihYjAS/9sbB4uW5quvhy52cyYbTRjJwEb63ASOFVl6ksBjRyDIPJqn6HTZhDEDymLTTvbrK4zyxlcJWL7tm2hO4sjxOPYFKMvC11Fhizm06zKgJtxeppEdlXopi/cPIKXSKWFuluEsqQgM2VyancaVri2E0ePOAvhtKI+mBPiHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j3ti8y4W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435I7rq9027126;
	Fri, 5 Apr 2024 18:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NybGbudn9z6p56W6c03m9KOMAa5PIk7QwfVxW2w9RrA=; b=j3
	ti8y4W+ajXAnbaabwoVQ0zFJOcrjSTnr4qX6Jsq+YTpBwEULCwP6bvquw0ts4Hrl
	pNfNK3LYRr0u/cBL5o9NQR5NzY6F4vK84+VsiqABmzOSaVce7jWCkhg/0RTCjiqX
	dhJ52AL3b9bd4s+6r2NsuujyNcBYWqvMG78IoJ7VwmcHEvQXbd/GW2B+yv4GimXw
	ODjSPs/p2NDMgqs5oQ7H98LzdeXRHyeyqplTd7faTHaeQ/N8tXm6W2uLoQLaWMyb
	hiAonq/JQ1G9KFn/Ty3fchryr/PbGl8YwxH2a+um3cFIVa3YMCmRWVEzfvqihAfV
	ldEUN7VXSRzbcbUVa8Ug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa8fc1ykt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 18:17:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435IHuYv005471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 18:17:56 GMT
Received: from [10.110.24.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 11:17:52 -0700
Message-ID: <363efce2-5540-b81a-31be-b5919635b586@quicinc.com>
Date: Fri, 5 Apr 2024 11:17:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm/dsi: remove the drm_bridge_attach fallback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org>
 <88b3722e-aa46-1ffe-9f0f-1939d43e0100@quicinc.com>
 <CAA8EJppbETLONx8pEdT1kT1Hp1i405m-4PfgumvvOa9N2mh6CA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppbETLONx8pEdT1kT1Hp1i405m-4PfgumvvOa9N2mh6CA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vXpjRoCUPaNKGkj1ptZln3kEAJaapKpF
X-Proofpoint-ORIG-GUID: vXpjRoCUPaNKGkj1ptZln3kEAJaapKpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_19,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=712 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050128



On 4/5/2024 11:16 AM, Dmitry Baryshkov wrote:
> On Fri, 5 Apr 2024 at 20:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
>>> All the bridges that are being used with the MSM DSI hosts have been
>>> converted to support DRM_BRIDGE_ATTACH_NO_CONNECTOR. Drop the fallback
>>> code and require DRM_BRIDGE_ATTACH_NO_CONNECTOR to be supported by the
>>> downstream bridges.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 36 +++++++++++------------------------
>>>    1 file changed, 11 insertions(+), 25 deletions(-)
>>>
>>
>> There are the bridges I checked by looking at the dts:
>>
>> 1) lontium,lt9611
>> 2) lontium,lt9611uxc
>> 3) adi,adv7533
>> 4) ti,sn65dsi86
>>
>> Are there any more?
>>
>> If not, this LGTM
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>  From your message it looks more like Tested-by rather than just Reviewed-by
> 

No, I only cross-checked the dts.

So, its only Reviewed-by :)

But I wanted to list down all the bridges

