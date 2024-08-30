Return-Path: <linux-arm-msm+bounces-30308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ACB9669FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 21:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 693E61F24C3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB4C1BCA1E;
	Fri, 30 Aug 2024 19:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FpGoxpbY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF1933CD1;
	Fri, 30 Aug 2024 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725046973; cv=none; b=FbmG8tkYThVbt9s1UnpxseHZDzR1CgdAHeYJ15V8smbkALv65chRW9ATOqEAs764ZRwdH/jDZSZu0Tw2VzgLRFjSXLhc8RzDj1fGyLd6qxkOMgbMSKVfbCYYrPO24sLpcUnEQ/GDrlZsFZa0m0ukd2uDTT4S0P7k0fBU+tKA+5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725046973; c=relaxed/simple;
	bh=VkvmwOBTAbY4H3cu7EBu9vnJCjHiUPba1qZ0hdED++4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rqye/j6rIUqT7BYgodNDCD0PaskDremtY52zL67xUxiiRgrrbWaADZ2CEoU+EtXAhSQFUTNk/lpt1HiLIZ3bluFn2bXk73VtPtQob7pgZp6PDaQfVPKYkBkwz+kwW7AwSPDqE6HXyDOxoKhXly0fbzlg/A/ffvQQ7b/XZxr3qvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FpGoxpbY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UFNwNf026547;
	Fri, 30 Aug 2024 19:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WQgQSOmOou41lnjoOVdQJ1WiykWFVVUCp0NkH8CM0ck=; b=FpGoxpbYrTu5QaY/
	A0UvBNbYdubJ6iwapbNkHL9YOf+v7DNSP+y/BVoiWYUrdtmTbvWARrVRhFEbii0H
	jhucTi5kSxS0ISL4np8zvqJVCHNkZXUDWZmuVkV2AQBc0c069uTm34pmS0OKWT3Y
	xqDEbi1FPGqe1Zak7TW1FubbRIYeFqLfmQkILBV1MFzwdxLFRKTJQp7l07+xb4vr
	99VPp7GZrWh8ug05ic3XfMxI4hxZYhT0KzyP2rTpZNH+Q5Wa35noDDF+7jffBqEA
	ogx0Q16MMcjRBAJIQA0F3EeB4nfb6GeOD4o36Keb0++WYK0lpDl9mZG0xyT3mYHn
	MSnWaw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puvj0mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 19:42:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UJgbCr000412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 19:42:37 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 12:42:30 -0700
Message-ID: <092a7427-8971-4ee4-a417-52653ed892a4@quicinc.com>
Date: Fri, 30 Aug 2024 12:42:26 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] drm: print clone mode status in atomic state
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-2-502b16ae2ebb@quicinc.com>
 <e3moledbfob2xkgxpbta3onlzc5yi6u7cbsmuo5ao4qq7nyyhj@lr32vqnjzkbi>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <e3moledbfob2xkgxpbta3onlzc5yi6u7cbsmuo5ao4qq7nyyhj@lr32vqnjzkbi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q3rFbF65V4GUkrvwZWoJL0bf-rlb0wYf
X-Proofpoint-GUID: Q3rFbF65V4GUkrvwZWoJL0bf-rlb0wYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300151



On 8/30/2024 9:38 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 01:48:23PM GMT, Jessica Zhang wrote:
>> Add clone mode status to the DRM atomic print state
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index 07b4b394e3bf..145d6a758d4d 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -455,6 +455,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
>>   	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
>>   	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
>>   	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
>> +	drm_printf(p, "\tin_clone_mode=%d\n", drm_crtc_in_clone_mode(crtc->state));
> 
> We have encoder_mask two lines above. What is the benefit of having the
> separate in_clone_mode?

Hi Dmitry,

I was thinking that this would be an easy way to note if a CRTC was in 
clone mode, but I can see why this is redundant.

Will drop this patch.

Thanks,

Jessica Zhang

> 
>>   
>>   	if (crtc->funcs->atomic_print_state)
>>   		crtc->funcs->atomic_print_state(p, state);
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry

