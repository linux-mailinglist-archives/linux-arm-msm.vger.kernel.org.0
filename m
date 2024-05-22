Return-Path: <linux-arm-msm+bounces-20276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C6F8CC9FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 01:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4115CB21EA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 23:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD5914C5BF;
	Wed, 22 May 2024 23:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CBGkbXje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69E2E631;
	Wed, 22 May 2024 23:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716422294; cv=none; b=HJb8fk3scxtY/tsvEY0WSSsOGDLtXbh1w7ApQJT96vgKRj2baxMcgZmiSIPLM7fXUX9uHYAPz7xhfePYBM7pA75i7cvys5VmT4loGSsY5S0nYnWRWas/4jbRDxYSkBhAfrq9w1xoRQUZmbttI4fX9tg1b7zcJI20m5pn+Oe5aH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716422294; c=relaxed/simple;
	bh=ZAVSP3yzZ4wrVzdhtS2jvHQiY/CcVt+bR2AXRZnwF2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g0chndSH2+t26jIxbedNvrFY0PEkTu7OHJf9Vf5hFSeU6lNdRKCDYg6s5UrC9d1wPCD1hY2fKjMlfHxnZOnTekBVhMHIXKse94XI2KSOiPV5c4JA/rE5yB4HvNS3njDPPNDTPH5wEdW/VBKd6b2Cgdaf34O4f8iCMKS2yy/FAUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CBGkbXje; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MACgMF006537;
	Wed, 22 May 2024 23:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=F/ZnYrCb3qGaZihRO2W6UBMFUSWUgT7/CKhy/l77VXo=; b=CB
	GkbXjeDgW7rNe6JhOE80FcDgazS772D28cy/8kz10ewKndnYxr5BWmn2XuqJTNhp
	z2z/1O9k7H6yhlZcDs+sQdnPGY7pXNmqVZQr7mfS4oFQ2MNTXCobWaX+uJ/tqPKe
	mlxCAu8gSTniaFWAkc5ZuchmK1dPs1ixiWJ/Upfa/s8ZaBpCl9vnXqdKpgrQzj3G
	Y20GNmQwQtSF2sRfLimYIxqoLv4KeN4mwQGgZwPrlmHoOO/wohE2I4CP7bHV6E7L
	k8reZIzoYDVdBer/ZE1HjpXdY8isprbHaY4eoBWz5mRLO2+Lgt0e1+YB/b9374xJ
	kBPfo0Bful9kpLI2iKIQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqca22j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:57:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MNvvkC002299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:57:57 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 16:57:56 -0700
Message-ID: <b573401b-98b9-b3f0-f965-67b5d04cd2cb@quicinc.com>
Date: Wed, 22 May 2024 16:57:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/7] drm/msm/dpu: convert vsync source defines to the enum
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-2-f273b42a089c@linaro.org>
 <a349dda7-8af5-0996-0057-9da30f39dfb1@quicinc.com>
 <CAA8EJpo7MdFqFUS0jcs3v4bSOoi6WWnbjahqn4r045CX8CTcOg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpo7MdFqFUS0jcs3v4bSOoi6WWnbjahqn4r045CX8CTcOg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sWDS3iXY3WaCJBmRYKfbijVW8INX3EJ2
X-Proofpoint-GUID: sWDS3iXY3WaCJBmRYKfbijVW8INX3EJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_13,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220166



On 5/22/2024 1:01 PM, Dmitry Baryshkov wrote:
> On Wed, 22 May 2024 at 21:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
>>> Add enum dpu_vsync_source instead of a series of defines. Use this enum
>>> to pass vsync information.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
>>>    5 files changed, 18 insertions(+), 16 deletions(-)
>>>
> 
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>> index 66759623fc42..a2eff36a2224 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>> @@ -54,18 +54,20 @@
>>>    #define DPU_BLEND_BG_INV_MOD_ALPHA  (1 << 12)
>>>    #define DPU_BLEND_BG_TRANSP_EN              (1 << 13)
>>>
>>> -#define DPU_VSYNC0_SOURCE_GPIO               0
>>> -#define DPU_VSYNC1_SOURCE_GPIO               1
>>> -#define DPU_VSYNC2_SOURCE_GPIO               2
>>> -#define DPU_VSYNC_SOURCE_INTF_0              3
>>> -#define DPU_VSYNC_SOURCE_INTF_1              4
>>> -#define DPU_VSYNC_SOURCE_INTF_2              5
>>> -#define DPU_VSYNC_SOURCE_INTF_3              6
>>> -#define DPU_VSYNC_SOURCE_WD_TIMER_4  11
>>> -#define DPU_VSYNC_SOURCE_WD_TIMER_3  12
>>> -#define DPU_VSYNC_SOURCE_WD_TIMER_2  13
>>> -#define DPU_VSYNC_SOURCE_WD_TIMER_1  14
>>> -#define DPU_VSYNC_SOURCE_WD_TIMER_0  15
>>> +enum dpu_vsync_source {
>>> +     DPU_VSYNC_SOURCE_GPIO_0,
>>> +     DPU_VSYNC_SOURCE_GPIO_1,
>>> +     DPU_VSYNC_SOURCE_GPIO_2,
>>> +     DPU_VSYNC_SOURCE_INTF_0 = 3,
>>
>> Do we need this assignment to 3?
> 
> It is redundant, but it points out that if at some point another GPIO
> is added, it should go to the end (or to some other place, having the
> proper value).
> 

Ack, makes sense.

>>
>> Rest LGTM,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

