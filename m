Return-Path: <linux-arm-msm+bounces-67430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284FB189AF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 01:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 637FB7A1C38
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 23:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED1F241661;
	Fri,  1 Aug 2025 23:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o07yc4Li"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A83EB644
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 23:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754092741; cv=none; b=H1gf7KDFLPCHEhQ+3EaNnlFxMUXngFDlTWErHqSMCEh9zsB4tUtVgXEpXhDaWgoZpDhbqfQuKk0v+VOT4g+aWkSfykwatq3PdyS9deam5e4dnf3ERvGdIeLWD3H6rVVqQ6cU/qUD3ryI5LF5wFD3CuDoDya47gKgMLYHI33pWUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754092741; c=relaxed/simple;
	bh=+2n+5mKKJyn6pwbw4cuuyFzV70cIuy5ALlq5+ukAC24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nut6BADPWYqIPv3pfodxaZpaPUbJbsbarK1hQrLSoAdJnPZib7gUzJrHCZ7Mn/IK/ZISqbdd2WwcwjqEYCmLAbUUpPuuzuM9+AjJF9kW+0A6E3qLfsh82ROtinru91sqMT7ilCJtQFyJGoI4qZwYj1XJTg15SLY+2qrvNk488VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o07yc4Li; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571LfGsa018314
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 23:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sJil9fuANTIpmKQE7cP4cPGJ+csBLlaXLdFVNl5IgEY=; b=o07yc4LiXSNMEQ0m
	tPDQtTL9RKOocu7P/FqueYPSICyprAmwRxEO1PpDp3wZBie5R28tFQA/JcOhmbDi
	Fl1a5SRYUKy8/7LKsBp35BZISo7WN7qQHh68eCQmOx/v9FDCf3uo8lhxObDy9spF
	hMBTocTUEY4TIfIhvBayY9jAa/oHlow2IGFHABxhTWIl2/EfDVrOOXR9dzu2VUVf
	/a+JfVVphcxWsIwUuSr577sD+CQthPSeXG1UdkYl/SrwMLzTEW79t7gHcnaK7hee
	yPvuiWwmhH+qxzdU8kfDV4AVa2B2NFqZDB8f2cXIhAnRMpyrCU4/NdOvFUT8+Nmy
	DAp7Pg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489423rd3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 23:58:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bca6c73f3so3747487b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 16:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754092737; x=1754697537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJil9fuANTIpmKQE7cP4cPGJ+csBLlaXLdFVNl5IgEY=;
        b=t6k+JRotZaykMIXJ+rz8DqJOixMAN6t7C4UVOTiUL95GGHtcs+wSKssA980vbEy+W4
         BbNKl/azCY7F1jDxj/JFA4Wg1DcbfzUmWbYqRU64TRYfyMEf6ecwBlVnv6VI0nxFo4ui
         943OK1qOx2uT+Mq+k04vE4+nicveLChaI/Gq6KAOWPkoezEG8kwAKzTvvJljpLoX7Pox
         eXQSKKZyGyPcOxLrhUgPh9Y+vlhuQhJxaez/le2iKbP9le8ADZ28hiDL9XVp2mTKecRe
         YKkqn7gbqKT/t8Ffpmync7K9L+TV3B8/74QbvgLS0wdQdwrcGADXdVFCKf16mNSIp+HI
         0izg==
X-Forwarded-Encrypted: i=1; AJvYcCUap0nON8n/Ee/ikepJS10aI8mQY5KhEhuPry3lQqkPN8h8aNdjjQcrkU9yO4o4ywshcdhy1MyVxiAn8FmY@vger.kernel.org
X-Gm-Message-State: AOJu0YwWcC/V4O1xZERU4WIVZql/laSbC/Y8FXmBWi3ZzvvkG47TKcMC
	UhCudigvaT3rVaUkL0PlsUX4HxZ9FETkT0gsLvp1jfpJzFsfMcY8S99K56Jm5fblERZXQn9PZrC
	Fx3MYATU/Nnbz7VCvAwXuFgtIcd2cJd/U58dphr9qyjeNjQtdXLejS7DTUPqjONXmnkSW
X-Gm-Gg: ASbGnctvN4Ivwgcg8vKHcT6NuC0kbVLU0O9cMDZ90b53YPVhGiSRdHUin19gIFRU41p
	qpWhySX2D5+gDo/W/klkna5PtPeLwd7OJcqcNrxSFeJ8Mv8eYdfmeLHam7G62Rg67arWUOefbva
	W//dA3bJFU7WwSsDa6x6ngjK0xwgL7qWJpbnEJcMtFlmzADeDdSBd2wmqfnu/dLxOgHum8U68Fc
	2eHxLC+g3XGN2+sSu3pXJQonXvoNYKLvTB1L1IFR2red6BIeDHSfe4kpET1iAjScohz8RSHKgZD
	NCrrl4lJdh1ZmlvnweGNAt8GboY6tgCkUwA4a5+1wM9H5bKU0lJKN3ly/2r/AZoxB3Y45ZaA2bN
	EsJylreSoLO/pCOsNb2LwlA==
X-Received: by 2002:a05:6a00:2ea4:b0:76a:d724:d712 with SMTP id d2e1a72fcca58-76bec302327mr1652004b3a.3.1754092737426;
        Fri, 01 Aug 2025 16:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTfKbPm8IV20xoihIcyGu1iRejGkZ8MwdHaIanUdy4YR9la0eA1aJYMT5RSic/HhKvru8Tzg==
X-Received: by 2002:a05:6a00:2ea4:b0:76a:d724:d712 with SMTP id d2e1a72fcca58-76bec302327mr1651981b3a.3.1754092736990;
        Fri, 01 Aug 2025 16:58:56 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd02csm4934867b3a.62.2025.08.01.16.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 16:58:56 -0700 (PDT)
Message-ID: <a085fb45-91e2-4827-b8e9-8af90796cc49@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:58:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
 <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE5NCBTYWx0ZWRfX1RqZtl9KUoiL
 HUARjCp/NHr6YoPJhSvNHQkQ0lYBE2um37udfR/4JD4XNYzQORCDnFYx052LYv+4tWOZ+vDBdxb
 NSDD1AtYDhkH9g9Dl0NALODuVjq89niKsiEkkIFw6CyLHfW8PsqzDILhqit1Aqo4pGlaV4d36Y+
 aVHS3Sl2MbO4pGAJKJ9BWRXrFkVQdfGrQnogCiUgGMzAoyyfsO6rJ7ghawcV+E+GNQMPlj61Ne7
 zGtpgtwh1xycXrTRs+C4Q1rSzp7ZHwdDOvLIHoV62hzpltbfPwbDbOFA2FHK5NkOObBdyuIaWHb
 c8S75r757NwhGhv4cuW2YphvEerv/n5qyhoWkqcPqvIA6Dtg/LIJzTmSt3ACg5AAKtOuXfP98XR
 Ji02XwabE7N3rmLSm8GD4lgmxgsFJL5fUlC7sfNdwLEDk+rMNyWSS5yVPbwE6ig+veOkVDbI
X-Proofpoint-GUID: 0gKqPLXupCVZz8k0CDgPKjzbbGzX6ekx
X-Authority-Analysis: v=2.4 cv=MKJgmNZl c=1 sm=1 tr=0 ts=688d54c2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=yJ1ceeCYH-zBWwCu-X0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 0gKqPLXupCVZz8k0CDgPKjzbbGzX6ekx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010194



On 7/14/2025 4:54 AM, Dmitry Baryshkov wrote:
> On Fri, Jul 11, 2025 at 05:58:23PM -0700, Jessica Zhang wrote:
>> Currently, the DP link training is being done during HPD. Move
>> link training to atomic_enable() in accordance with the atomic_enable()
>> documentation.
>>
>> In addition, don't disable the link until atomic_post_disable() (as part
>> of the dp_ctrl_off[_link_stream]() helpers).
>>
>> Since the link training is moved to a later part of the enable sequence,
>> change the bridge detect() to return true when the display is physically
>> connected instead of when the link is ready.
> 
> These two parts should be patch #2 in the series.
> 
>>
>> Finally, call the plug/unplug handlers directly in hpd_notify() instead
>> of queueing them in the event thread so that they aren't preempted by
>> other events.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
>>   2 files changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 87f2750a99ca..32e1ee40c2c3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>   
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
>> -	if (rc) {
>> -		DRM_ERROR("failed to complete DP link training\n");
>> -		goto end;
>> -	}
>>   
>>   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>>   
>> @@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   		force_link_train = true;
>>   	}
>>   
>> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
>> +	if (rc) {
>> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
>> +	}
>> +
>>   	msm_dp_display_enable(msm_dp_display, force_link_train);
>>   
>>   	rc = msm_dp_display_post_enable(dp);
>> @@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>   		return;
>>   
>>   	if (!msm_dp_display->link_ready && status == connector_status_connected)
>> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>> +		msm_dp_hpd_plug_handle(dp, 0);
>>   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
>> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>> +		msm_dp_hpd_unplug_handle(dp, 0);
> 
> This chunk should be separated from this patch. I'd ask to drop
> EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT completely and call DRM functions
> all over the place instead. You can do it in a single patch, which comes
> after this one.

Hi Dmitry,

Sure I can split this into a separate patch.

Is the goal here to remove the event queue entirely?

I can drop EV_USER_NOTIFICATION, but I'm not sure if I can completely 
drop EV_HPD_[UN]PLUG_INT entirely without major refactor of the 
plug/unplug handlers since they are used for the HPD IRQ handling.

Thanks,

Jessica Zhang

> 
>>   }
> 


