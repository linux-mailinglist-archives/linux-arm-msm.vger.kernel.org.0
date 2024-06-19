Return-Path: <linux-arm-msm+bounces-23249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE490F4E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1EC3281646
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 17:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1439155398;
	Wed, 19 Jun 2024 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ekGT27V+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E5E1C3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718817041; cv=none; b=X9lsaImDzKUR52s1gbctwJ/WuTbW2JAXIIgoTO73aU67tcp7ZuuzjF2TsKxbT9Pyq44arp3FBEdbIPP+A/i2ordu+IolnTlhzW4hEEYlDp7zujPZ+IRlY8o394fO8gmytSWXZqwOvyR9sb6WplDzuXr3egm1PLuaDJXCRQfZLAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718817041; c=relaxed/simple;
	bh=IyE0WoDDjIcz1B1bPL4/iu4N8WKQziLMN2qhsg+2Krc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qKFmuw5KCWX61qxLCkAAm859WDWWaY2wFrrGNawoZBM5BsvZvZ8AR68HWJo9OI+wG1/GX6HZ+MGL5dZ8QbgiXSy+1ksmOUqKy0niogJgzSntHrETVXYIMTalcvfXqGkizJJYtDr85xN1RrcEXzNh5be09qCi2avVGhhFQJZHgno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ekGT27V+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9ldBd007546;
	Wed, 19 Jun 2024 17:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZsgzIn+zVgY/Kk4fsUNo4tl4zkPz+zbkXnarQECeJM=; b=ekGT27V+uUeIDwnh
	1zTJQPJX1SDhwgbEWGXls/8B6LfCO93/SVRQhnIXIQ+J0iUteR6yku9x809oVKrr
	rFIvC7ZibTB2a3w1u/eXczGhnlL/w7oCLLBHmCe7ssaBMsN0hpfDhejppItpVKQN
	Mv3pybxFnr2bk1c3meGzlJB+3BWfG8pcxu5j8DovwiTssGMg3mcOVMlTk4bNS002
	UpbWnWlY600z9ypKM6sN2KnkR9BKZ3Q3mAtTkirm0hdINjVUmgbfru8PjAhBenKK
	nVaIfI413st6BIpHyvC1bCjoVRi7H9zb9EzSPamG7skI/8LWLDEmcRYOpUbPxf1U
	LobGbw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja7aajp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 17:10:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JHASJK011807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 17:10:28 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 10:10:25 -0700
Message-ID: <88886ed2-d92c-ae0b-e0b6-06576e7862a2@quicinc.com>
Date: Wed, 19 Jun 2024 10:10:23 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 7/9] drm/msm/dpu: drop
 _dpu_crtc_check_and_setup_lm_bounds from atomic_begin
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan
 Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-7-29ec4069c99b@linaro.org>
 <e191758e-3fb2-947f-09c6-71f37ab34891@quicinc.com>
 <f9b63458-6d85-b8d4-f9f8-5e1966323a54@quicinc.com>
 <CAA8EJppDcjf1JYi+iCheNt7XR-vfYx+JQ_QsBkXbR3wJD2egpg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppDcjf1JYi+iCheNt7XR-vfYx+JQ_QsBkXbR3wJD2egpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1vytl_ajXRbSNJIvA5acobjBMK8Vl39b
X-Proofpoint-GUID: 1vytl_ajXRbSNJIvA5acobjBMK8Vl39b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190129



On 6/18/2024 8:26 PM, Dmitry Baryshkov wrote:
> On Wed, 19 Jun 2024 at 01:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> On 6/13/2024 4:20 PM, Abhinav Kumar wrote:
>>> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
>>>> The dpu_crtc_atomic_check() already calls the function
>>>> _dpu_crtc_check_and_setup_lm_bounds().  There is no need to call it
>>>> again from dpu_crtc_atomic_begin().
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
>>>>    1 file changed, 2 deletions(-)
>>>>
>>>
>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>
>> This change is causing a small regression on sc7280 chromebook.
>>
>> I have tested and concluded that this is causing the chrome boot
>> animation to disappear.
>>
>> I have tested a couple of times and without this change it works fine.
>>
>> If this change was meant as an optimization, can we drop this one and
>> investigate later why this is causing one? I have not spent time
>> investigating why it happened. Rest of the series works well and I dont
>> see any dependency as such. Let me know if that works for you. Otherwise
>> I will have to spend a little more time on this patch and why chrome
>> compositor does not like this for the animation screen.
> 
> Oh, my. Thank you for the test!
> I think I know what's happening. The cstate->num_mixers gets set only
> in dpu_encoder_virt_atomic_mode_set(). So during
> dpu_crtc_atomic_check() we don't have cstate->num_mixers is stale (and
> if it is 0, the check is skipped).
> 

Yes, it is a possible explanation for this.

> I guess I'll have to move cstate->mixers[] and cstate->num_mixers
> assignment to the dpu_encoder_virt_atomic_check(). And maybe we should
> start thinking about my old idea of moving resource allocation to the
> CRTC code.
> 

I wonder if thats the right fix though because it seems correct to me 
that num_mixers is set in mode_set after the atomic_check phase.

Perhaps the right way would be to breakup check_and_set() to check() and 
set() respectively and call only the check() part in atomic_check() and 
keep the set() part in atomic_begin to avoid duplication.

Either way, I think we should re-visit this as this patch by itself is 
an optimization and I am totally fine if you want to merge the rest of 
this series just dropping this one for now.

