Return-Path: <linux-arm-msm+bounces-8673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F29A83F3FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 06:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BE9A1F21567
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 05:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB1D6117;
	Sun, 28 Jan 2024 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fVAcKIGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1DA611B
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 05:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706418989; cv=none; b=mZvWGUr6yC4NIhaMhdbbXXXyc7G82eWaVeNqxeXHbwUOWMx4SbbjhPZrOL/SMkwwzEfBxkAPVLBkBElbmtDGc48PepHsiFnAo2dpqWmi7f75uy96Ry8nKCAhg+6Cq6V0VOKC8f7Ab1nXwBZVb0/BZQYFewwlPaZa3SBTiQPNflI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706418989; c=relaxed/simple;
	bh=hn7Bvu4N6bobwyOLtX9tpTh2RdUU0xZLnC6hSz3Wyjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WpcIG7vOj6PQguAWZ9C+XRkAy85JeiSn/++0A2U5J/6iWhC03oZXEq15llE3mNryG89BfdeBufDSy3sdj0ulgc50Gp/AfFmJZXdIFUtUhL95Th8GmzGthpdxW31aHZmvtLZ+eh3XgmRjAiUKIYH97lrKvN4akbt1iPjp1oiBTRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fVAcKIGh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40S5BmOh010569;
	Sun, 28 Jan 2024 05:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5PorBcSO2UUCs8UUeFNkHsL5bYWEKnkSS7kWjHLe91Y=; b=fV
	AcKIGhcbvsbmH4PuY57Z1PUrVlwzO1wmAQkMt1XtuMPOD+ZMKalFBk1JEH2FjxjV
	BHeIS2I8cSfSrJmO1pIcuAjB5p0o1V8445yviGVWICdv33fvV0Zp37s9MZqd/gMb
	4CEurnPsAwVoEtFSYZzLYb2wWtmiyNHdFI1Y/AePn4VvcEI98152JP1YCmkKABmi
	JENDX45fM0btYtUn339ZRcEuoWcKVBHiSFoJqMNEpLxOaq8XaLgbwMRCFurec9KQ
	Uw/fZuyQDAfV0Csx+mqd2NzLCyqaBgMTIWcmIFG4g21ljeOHVkYDruP+RCN0cAYl
	D7OcSZ6aRe1Tvl6Cfx/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvs5p1f96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jan 2024 05:16:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40S5G95I004357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jan 2024 05:16:09 GMT
Received: from [10.110.54.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 27 Jan
 2024 21:16:08 -0800
Message-ID: <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
Date: Sat, 27 Jan 2024 21:16:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_khsieh@quicinc.com>, <marijn.suijten@somainline.org>,
        <neil.armstrong@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
 <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OBew_lW3sh45d77HJtqTngLkSyxLqwRA
X-Proofpoint-ORIG-GUID: OBew_lW3sh45d77HJtqTngLkSyxLqwRA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=562 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401280036


On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
>> YUV420. Therefore, program the INTF to send 1 ppc.
>
> I think this is handled in the DP driver, where we disallow wide bus 
> for YUV 4:2:0 modes.
Yes we do disallow wide bus for YUV420 modes, but we still need to 
program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add 
this check.
>
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 6bba531d6dc41..bfb93f02fe7c1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -168,7 +168,9 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>        * video timing. It is recommended to enable it for all cases, 
>> except
>>        * if compression is enabled in 1 pixel per clock mode
>>        */
>> -    if (p->wide_bus_en)
>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>> +    else if (p->wide_bus_en)
>>           intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>>         data_width = p->width;
>

