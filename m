Return-Path: <linux-arm-msm+bounces-14767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F2A885FDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 18:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E87BF1C21432
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 17:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E3884A28;
	Thu, 21 Mar 2024 17:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pLsl1lFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B1128E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711042582; cv=none; b=EXLZavxi8eYWkSUYq31GdTpneGCYluX+BfO6q/HeUz+As3uWeHQntyUDghVpM73rkhZD5SnxTH/BUostTZ2aD00Sj8oNUx5lRT1kIi0HwH2JG207kQXMgQK0+4xn25FY5K2ZanbShmSxrrnUEMOwyyZElttei1HWIfh9osceOCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711042582; c=relaxed/simple;
	bh=470OBBVsO3jt8ezDziKuLV15PUxch078PlWsLGkY38M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=krcxlttooyOetg358K9oiYpHd0BbzMZGOnOcKHVGJpeb+olCZwIsVFSlMD6w9/YdQywd1ixfYCKwX/g+I9vf/xH7FhDcw9GsSIdlgE/cN0ZYZxYO5y2iDvN8xcSTHdmIU7xaESB3I6HYhUq0K8nzZLHjM6sXx4v8uOLa9dydplw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pLsl1lFM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LHV4gs011997;
	Thu, 21 Mar 2024 17:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sL5JC6R9UoOuQr92O3O8DL9F/Ylfm91tNbgFrV41SKI=; b=pL
	sl1lFMGdg+JWyvkoJDWo+o168bITkI5mg0fuYO84YqLC7RCY7pZAMavZeL5FznrC
	bVTWOj1J7+TD68WU83dXbhPRjZc0Llm8ub6cq9LbTJww4yqRyQDE6T9yH4iLNy5K
	oU8Puh4blAN3uVKOfMZZAOA1DG0eq6vnFj39XuSKrJZsbNLRNeFhNtNeL17UtoHm
	KZJryeXP5tBtpEPsgZ5kEVOOzAyzEUjOARFZc3Iepf9yMoQuEJyXI3ldOKKIRsQB
	4DGIQrmNreJ9AqYU+/Ap7a/f2m6DjWQRYMI9FA5ODdv/L+/DdZFhElQWls2x/0kn
	+UDw3M7nfAwmqQSpojRg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0f1nhph7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 17:36:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LHa5n8015969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 17:36:05 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 10:36:02 -0700
Message-ID: <9bac0e8c-d14d-a759-dc02-2e38301e4ef1@quicinc.com>
Date: Thu, 21 Mar 2024 10:35:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
 <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
 <CAA8EJpqxkY=Bk8_iAq6Yj6VGNO2UYmF2Hm6XOeE5EhJFKUpaPQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqxkY=Bk8_iAq6Yj6VGNO2UYmF2Hm6XOeE5EhJFKUpaPQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Aupp1nZBHeEEljZIx3mUTyoJ-Qrbj_KO
X-Proofpoint-ORIG-GUID: Aupp1nZBHeEEljZIx3mUTyoJ-Qrbj_KO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_10,2024-03-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=669 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210127



On 3/21/2024 8:43 AM, Dmitry Baryshkov wrote:
> On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
>>> The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
>>> Extend it to also support 4:2:2 and 4:4:4 plat formats.
>>>
>>
>> I checked myself and also internally on this. On sm8250, the DPU planes
>> do not support YUV444 and YUV422 (and the corresponding YVU formats).
>>
>> May I know what was the reference to add these formats to DPU
>> considering that even downstream sources didn't add them?
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
>>> the clock inefficiency factor from 105 to 117. I'm not sure that it is a
>>> correct way to handle it, so I'm sending this as an RFC. If we agree
>>> that bumping the .clk_inefficiency_factor is a correct way, I'll send
>>> v2, including catalog changes.
>>>
>>> I had no such issues for the YV16/YU16 formats.
>>
>> We don't support this too on sm8250. But interesting it worked.
> 
> I have been cross-checking DPU formats list against the format list
> from the display overview docs.
> The DPU (and SDE FWIW) drivers supported NV16/61 and
> UYVY/YUY2/YVYU/VYUY formats for ages, although overview does not
> mention these semi-planar formats at all and interleaved YUV formats
> are marked as unsupported.
> 
> For reference, NV24 and NV42 also seem to work.
> 

Thanks for the update.

I cross-checked sm8250 format list in our internal docs to make sure 
there is no discrepancy between those and the display overview doc.

NV16 / NV61 (linear) are marked "NOT supported" by DPU.

UYVY/YUY2/YVYU/VYUY (linear) are also marked "NOT supported".

So the markings are correct.

If you notice a discrepancy between our dpu formats list in the driver 
and what is marked as "supported" in the display overview docs, that is 
something we can investigate and get fixed.

If you are running some standalone tests and reporting that formats 
marked as "unsupported" in the display overview docs still work, we 
cannot simply add those formats on the basis of your modetest validation 
as your validation alone shall not supersede the marking of the design 
teams as the system level validation of those formats is what we have to 
go by.

The formats marked unsupported shall remain unsupported by the driver 
and QC shall not ack adding any of those.




> 
> --
> With best wishes
> Dmitry

