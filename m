Return-Path: <linux-arm-msm+bounces-23275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD1290F6C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B06D1C2337A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B14E158A33;
	Wed, 19 Jun 2024 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ERPjjMVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031DC158A09;
	Wed, 19 Jun 2024 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718824283; cv=none; b=ravlayM73SIp29URPNbRT65MLfZcCfTtaSguRgjis7pxhoDSwcjPvRcAd6nTrBsu7XwyBIZ1kArpTu4mnirpVejL4J3wBTgK2Z5xEXKXOi2BKj46PFDx6i61An9UXN551TMw+loTP+BkdmIe6uthA+NZ8J3cRSD38RUyBbcJdQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718824283; c=relaxed/simple;
	bh=VNxSNegupEYKM2YFqLDS0FUisV3PMfi7IQq4d6qIONE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tmSe7D26OfWodjokenk8GrBGF5BCqOOKR6VpsZxwj0pMRzsAFi0b8Vugbrw3EtfMyk9BJzhC/DdwUMct6iWp1wa+qCWIkDeBHTdrIwUBxmxfnYTy9kNxPGQyJhCo9NKo5kRuU2ursff2I5KsZKsYL/eTaybDkPEuxrjwGodwO1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ERPjjMVX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9sr0s026875;
	Wed, 19 Jun 2024 19:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLWvP3wherCnNBDdVqPKizH2QRxxIHXaH9Pc7s0yqL8=; b=ERPjjMVXEdD6NcPH
	zEFZq/tOhUGX4iZqXoJo/fWoguJpxeETXIKo2RoA5921ss+sag3rBMA+SMmIzcZx
	J1e0Ng9ssI2TCKCT0+G9uqwk3T+3eHYDtKAjs18SpYB03wm4na8Loqzt0ZRoxVHk
	SkamPBZw1EsjYtPVwV96WXpCHC46L/LHTix4cU9yJfPkAt03C/JyfTLEjT2NU4kP
	h/smH+Y9WkB+eHi4fgiARQxNPMJ/zRTRvyKzT9GY4Y8DqW6v/mU8+Ub1do5i12DC
	9yxXZx6XDBwGxIg9xAMAj69wmc8I49BDPfcy3L03LU9zYAZnDfFmHsYcGKBpNemC
	UCzsEw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9ytkwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 19:11:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JJB7Jb028650
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 19:11:07 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 12:11:02 -0700
Message-ID: <49657577-5248-2ecf-75d9-13bc6e70b937@quicinc.com>
Date: Wed, 19 Jun 2024 12:11:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 8/8] drm/msm/dpu: rename dpu_hw_setup_vsync_source
 functions
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-8-67a0116b5366@linaro.org>
 <3dnyvit6734itykxxgvmu5z3jn4niywnttym4tcwiwbuf7vikd@dps2an3ksigb>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <3dnyvit6734itykxxgvmu5z3jn4niywnttym4tcwiwbuf7vikd@dps2an3ksigb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -dQnrCgAcyuCpDUw9wWqkQXgTO6NF6Qf
X-Proofpoint-GUID: -dQnrCgAcyuCpDUw9wWqkQXgTO6NF6Qf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190145



On 6/13/2024 11:29 AM, Marijn Suijten wrote:
> On 2024-06-13 20:05:11, Dmitry Baryshkov wrote:
>> Rename dpu_hw_setup_vsync_source functions to make the names match the
>> implementation: on DPU 5.x the TOP only contains timer setup, while 3.x
>> and 4.x used MDP_VSYNC_SEL register to select TE source.
> 
> Yeah that was never really clear anymore after I split this function in two in
> commit a2ff096803b3 ("drm/msm/dpu: Disable MDP vsync source selection on DPU
> 5.0.0 and above").
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> index 05e48cf4ec1d..6e2ac50b94a4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> @@ -107,8 +107,8 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
>>   	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
>>   }
>>   
>> -static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>> -		struct dpu_vsync_source_cfg *cfg)
>> +static void dpu_hw_setup_wd_timer(struct dpu_hw_mdp *mdp,
>> +				  struct dpu_vsync_source_cfg *cfg)
>>   {
>>   	struct dpu_hw_blk_reg_map *c;
>>   	u32 reg, wd_load_value, wd_ctl, wd_ctl2;
>> @@ -163,8 +163,8 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>>   	}
>>   }
>>   
>> -static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
>> -		struct dpu_vsync_source_cfg *cfg)
>> +static void dpu_hw_setup_vsync_sel(struct dpu_hw_mdp *mdp,
> 
> Maybe keep setup_wd_timer_and_vsync_sel()?  OTOH it doesn't always set wd_timer,
> only when vsync_source calls for it.
> 

Yeah, I think this name is fine.

>> +				   struct dpu_vsync_source_cfg *cfg)
>>   {
>>   	struct dpu_hw_blk_reg_map *c;
>>   	u32 reg, i;
>> @@ -187,7 +187,7 @@ static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
>>   	}
>>   	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
>>   
>> -	dpu_hw_setup_vsync_source(mdp, cfg);
>> +	dpu_hw_setup_wd_timer(mdp, cfg);
>>   }
>>   
>>   static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
>> @@ -239,9 +239,9 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>>   	ops->get_danger_status = dpu_hw_get_danger_status;
>>   
>>   	if (cap & BIT(DPU_MDP_VSYNC_SEL))
>> -		ops->setup_vsync_source = dpu_hw_setup_vsync_source_and_vsync_sel;
>> +		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
>>   	else
>> -		ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>> +		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
> 
> Should the callback also be renamed - and the docs improved?  Seems the
> vsync_sel register is used to selsect a vsync_source (plus some other bits like
> the pingpong block).
> 
> - Marijn
> 

Its a good thought but then we will also have to change the callers of 
setup_vsync_source to check we have ops->setup_vsync_source || 
ops->setup_watchdog_timer in dpu_encoder.c

This way, the caller does not know because whether to use TE or watchdog 
as the setting the source will happen under the hood.

So I think this is okay actually, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


>>   
>>   	ops->get_safe_status = dpu_hw_get_safe_status;
>>   
>>
>> -- 
>> 2.39.2
>>

