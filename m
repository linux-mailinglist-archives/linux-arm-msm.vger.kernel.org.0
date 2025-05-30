Return-Path: <linux-arm-msm+bounces-59925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E2BAC9547
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 19:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B7461C22B7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 17:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB53F1A0B08;
	Fri, 30 May 2025 17:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7lEtrD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2153F275869
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627465; cv=none; b=hCPBDqEkSiTWrnw24fbplZs0HW2V39ZVw1oGiZm/2b9M6FMmxKLgedy82XRSCBWZcwldnawvHfXKIVmGsswlGXLsn8CdPePYogRois1ZDIemw/9gTXUzFxS0AJ442Ka5MtHAWwj8FLIXZIuNKn4Wy9GPZt4MPxe5QQpixvV+9nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627465; c=relaxed/simple;
	bh=qKEHTJmkgISJ+di64Xg84D1hR6RLj2RPWKKSH2rcvPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVvNhO2iBoQLD0ySj5hEK/oQTVQBHVTU0iyIWuacWfYfL5Mo+dZenNZDDhWHJZB1SQ4/4ZlIWqyVY3I0WwtaMNl2fdNU+S6YBxRSEbjx1ihzvvcmJcMJLgMYeOM92H46nQWDCzuNVuenvoLC6COweVjZhGA0IUMjE9vInFTCgDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7lEtrD/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBKTfN006941
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 17:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQNFg2RO+LuLXzx8pk9NGhNaS/HpbKAbCtu9O+9m2sY=; b=W7lEtrD/CG96Vxv3
	GiGPxu0NcoUR+0qAucrXHsDZLUtNGOWZI5hvunacTBqazvCX6E7EZ3qZFyl9FgFh
	nIr7efHmJKJU0Yz3ZxlofhBdxURc/wCcyEL74ST+mY7qQLAFm50RGfzsf43gqZJQ
	QgCLTo8SXpOxjARtnRrEYSd4LJO3dxVm2yIK8A0lrC3aa6WvVE59F0PNVprr4ZTi
	MHhaXpz7lRNni9UXYOUngJW05NddlRJxe8J31JLv0x5+QfGgjSaLbr5++SmzWLVw
	aujBuH69n+w/zjOOqv9PWxXwTtXQGVl3uO2tngANh4NUW/U5zzD07TX3tQbIObPg
	NlaejA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqj5uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 17:51:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742c7227d7dso1815107b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627461; x=1749232261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQNFg2RO+LuLXzx8pk9NGhNaS/HpbKAbCtu9O+9m2sY=;
        b=qCFbJk/8Gxj8vPCuvbDlY0CqTZhK8T4GJExfDvbbld6/NetcnVHCoGd6f6lIr7bDzI
         Zb+nvjz+5ziqUgPptloc7iqm0vCu29JGCq5Jqm+gxyVFJkaq/d+yi8RYfJdc/U7QXZRP
         J2//ZUw5ohnXw21WuIlqhZINDdhjjCw3byiVqztVYYoigB/wLrSo0fOCsjXZD4rEYa5c
         Yjrb98KxszIVMLjrVL3Mpx019MUar/YEo/edEhxtX0UQDMzTUXRI9xpjlhC7bj/KahIg
         CishHjC+0XLRHmZdPcophpj30HCvgD7LnjvQQEaJ+tQw9i+/c7/7nyIlLJfBggqvWGZU
         HvNA==
X-Forwarded-Encrypted: i=1; AJvYcCXUTDE8AWCjn9Q37iVN43cIJjQm2zZx+ovT34yfE1W6Y1TSMcGSczTCf5QNwsCKAe4kaNFeVhp4eVU0JSOE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz7dkermf1oo2tZEw/KYcaD0Zst8i2vwFctx3We1/uLtHsYTDY
	O1u6j21deBj8xLga4plJRO7BXVOdM06aLqZG5tNjVs9mVfFxaUby64hI/vqYTrCEbHyLuQm0lRK
	8e98lUcv35qL8xqcinrtL7tcJC7qpIChnsyaaqNaFqde6ER+V/xTS6roeIi20wmSTfkRF
X-Gm-Gg: ASbGncsT4F4lfQ9v2RNYF/Momhh5sJd6xpdO3NcFY/+jm6AKr7qAubqp/VhfQUBJbFN
	CISAL9563gY/BqIPfp+hGp7Lyz1MLpC/BO2BFjsAnF7ThwDSV5vVeMpkHlJWAdb/6lyFpgh8RQI
	yLB8dNa1wp7XZ5M+2dLOkJeN+0WP/u2LbVNXypCXvYt1w5KL2ngJN8wTEkl01H6/hGvTs1oqHmC
	mY9Od4iN43FYx63SJI0DWx/lAZMvb1vcRxVLGzCsC9fkGciCYgsH+K//BxZQ+us5LuPlD/VJiEG
	WICmFMGgVqzCOIRFPYq4ny88wNPHMdFsCYwvuF4Cp0v1ou0S1CI2biyMRqje0PcXIX7X2A==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr4146208b3a.2.1748627461441;
        Fri, 30 May 2025 10:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0/DxhVchUsP3GUuQR+rz8hEa1EHtonG4n9LVY8g10f4TVSCbT7ApT+IY723JWbTdA27KRXA==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr4146178b3a.2.1748627461002;
        Fri, 30 May 2025 10:51:01 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafbedsm3439014b3a.102.2025.05.30.10.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:51:00 -0700 (PDT)
Message-ID: <3b5fa433-e3a3-4c77-b502-096576ecc2e3@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:50:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson
 <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
 <CAO9ioeUi59PNmRSYzyVbxcifhPKxYbtW9EuouOVXkT84SPOuwQ@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUi59PNmRSYzyVbxcifhPKxYbtW9EuouOVXkT84SPOuwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yzFK35K5PMeI0i0lV2FcVNl0ddplBB6m
X-Proofpoint-ORIG-GUID: yzFK35K5PMeI0i0lV2FcVNl0ddplBB6m
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6839f006 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=ryANHwUXtzQLBLkujfsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NyBTYWx0ZWRfXyejiWqU6gL4F
 Ma+MHVp5Iah9GuxOI/FFeC5CIgiEa4UtBjQwG6F4Mpl2IbqLyOnUvf4pdZWzKh0yOetetH9ag1Z
 92miMZ5d12YjrycGGZahDXNqGDVtbtUQHBQ5uIe41BLfG0I5zExfN1QIfZ4W3coj3IluTCwqToR
 /S51CsHW6Y0NZPvEAkd67FndQdlmTeIiYjBuTlcPKDqTJ5tt+HdxhHRu3nJO4baMjH7KdWQh4Ls
 lHccwF82GjzgfyuHZLTDaVGTs4Ge67ERkRiIJFu9BSvFdn10J1SkgKSURpnd0y/0+M4JaMVaDbP
 MX1A6fmOc6Wi5U7Bif1Y+fdji9fa5o0gnO0q1+eRkDPBQXY3kb9AQVJassj3OAZ3MHn6TeSKdrg
 bvwDf+zlgrbJoY1hkOLZpTg1s3VURkEyHm6Cd1UwJBG0YHheP8OWrhlD9GPu6t6ZaWGYGfqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300157



On 5/30/2025 9:05 AM, Dmitry Baryshkov wrote:
> On Fri, 30 May 2025 at 02:15, Jessica Zhang
> <jessica.zhang@oss.qualcomm.com> wrote:
>>
>> HPD state machine in msm dp display driver manages the state transitions
>> between various HPD events and the expected state of driver to make sure
>> both match up.
>>
>> Although originally done with the intent of managing userspace interactions
>> and interactions with compliance equipment, over period of time,
>> changes to this piece of code has become quite difficult to manage.
>>
>> Although, unwinding this logic will take some time and will be spread over
>> various changes, to start things, this series tries to get rid of the
>> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
>> of the display overall. Coupled with this, there are quite a few checks
>> in the current code, the origins of which need to be re-visited OR are unclear
>> which seem unlikely or redundant. With DP controller on newer chipsets supporting
>> multiple streams, this has become increasingly difficult to work with.
>>
>> This series removes the redundant state checks and simplifies the logic as an
>> attempt to get rid of this ST_DISPLAY_OFF state.
>>
>> Note: This series has been tested with sa8775p and sc7180 devices with multiple
>> monitors and also multiple dongles with no noticeable regressions.
>> Both of these devices use native DP PHY though. Hence, if this series can
>> be verified on some devices with USBC-DP combo PHY with the help of the other
>> developers, that will be great.
>>
>> ---
>> Changes in v2:
> 
> The series is not marked as v2 though.

Hi Dmitry,

Sorry for the confusion -- had pulled the v1 [1] using `b4 prep -F` but 
forgot to force the revision number to v2.

[1] https://patchwork.freedesktop.org/series/142010/#rev1

Thanks,

Jessica Zhang

> 
>> - Rebased on top of next-20250523
>> - Change atomic_enable() to return early if ST_DISCONENCT_PENDING
>>    instead of completely dropping the
>>    if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) check (Dmitry)
>>
>> ---
>> Abhinav Kumar (4):
>>        drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>>        drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
>>        drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>>        drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
>>
>>   drivers/gpu/drm/msm/dp/dp_display.c | 19 +++----------------
>>   1 file changed, 3 insertions(+), 16 deletions(-)
>> ---
>> base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
>> change-id: 20241202-hpd_display_off-6051aa510f23
>>
>> Best regards,
>> --
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 
> 
> --
> With best wishes
> 
> Dmitry


