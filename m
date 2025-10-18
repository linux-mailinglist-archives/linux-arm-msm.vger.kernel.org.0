Return-Path: <linux-arm-msm+bounces-77862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 867ABBEC8B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 08:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BCFC404BD3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 06:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375E628506F;
	Sat, 18 Oct 2025 06:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+wlj0e1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F128467D
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 06:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760769909; cv=none; b=CTueLvBR9q4WYvd69TUiRaYLhIs5cZjtfSVuOb2LW1SLfSN7cKD7r/0ibLk3wQAbbsdwCxAYXBncThX5pLL5T/X4skAEa9lDK3JSg1pcOmHn0ZunPDm4Knf4vW2KeNpulzO5H+CjnlS1p+GqVGCQfrFTdFa6WtnjaWeGaST5Tbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760769909; c=relaxed/simple;
	bh=83l92vGmnsTeooPFsXEiJR9HzVXaE+jXwSQU0y/tF6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEHoW8Jo0V0T/8rjJ7TpUWekymofonDd7W+1gAY3n7BmKpa4IuR2/1EoW4fZMpVWsqMOm00YYHQLVGbe00DhCQY79u79h4FaA2BTVDz1EqSaT8VAVSWi8EuAwoRrRu8QXcLZQpdK6pBQbQKVCh9QA20qOF7mUE6hb/yBUeT5wGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+wlj0e1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I5Q5Pc012114
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 06:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	83l92vGmnsTeooPFsXEiJR9HzVXaE+jXwSQU0y/tF6U=; b=Y+wlj0e174++TBKy
	yiPDXyDSEQf2U01eo7nHIRKk2r3ZqPud+QcgRX1jUgkOnIQ/e32SqTBVSAmtPTU+
	HJCilGA67lkzJmVq/fdrDylSkP961OSS7puYG5/D4g4k+5qMyiltnrzI+/GWwfil
	J5Rqb5Q2vdqTkg3kF7L8j7smmJGSf9XfTUC+qTsZeZWQJYJjC4G0mJLx5IiJu4Uw
	+FZk1gIVB0/HVSmQrNhYSCx7zwYcr63KCzkH57roKOgGwpi8pNCeK0CRBksLZEvj
	3OhRig5ztZOEgO3EdjzYgeT9Swwzyj5snnE3O2+devlxNiIqasQ3Q6VFiANcOvcs
	4WP6xg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hrb5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 06:45:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27ee41e062cso34860785ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 23:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760769905; x=1761374705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83l92vGmnsTeooPFsXEiJR9HzVXaE+jXwSQU0y/tF6U=;
        b=ZJ7sCsx27VwhJFjGtLg76c8oeLMtnpFvagVu8bS2ZdPKKEIulSfHmI9AY9WGT7iCts
         mUojKuNm/F8ujPuQZ6aJvq3RP1oJUYN504p0/8LMPXxy/uo7ZR4ad5HXxmN2xlvWW790
         0hXDwZMGBT7XM6BAIzLi2JQCZi+DJbl1+hH5GsEyXvyW48itteBytNfaPySUpyYHlDyS
         QuF1FN3a4AJZn5poz8VwsLvqgbZLD2XID5kSOBJsSUN2E1Qlz2IkgCN4NCDgV3bJjm5w
         X0fU9xPsX18ORKG1/lnKllpyrVQ3UgQs1UKN0Bo3LKdeKNCExQGmFlTSenlzDdhWLKde
         FeBA==
X-Forwarded-Encrypted: i=1; AJvYcCX8JnDSCCWCwXTYTK8IrlPupJrlgAQW+sHApsV2ppIo8kXiVBaCgcq4orOW+yGZoaxbR9k/CS9fbw5oEJ2X@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ2B4rFssIziNBuHD3iWTn3VqcuF2IGGZN31qUoR5cDtPuzA7h
	hBpY0eoki/LMRFkGgwb0T40QxthhX5SDba2kFxs0vXJnq7YnmMAqhd7qGciewzQhiy9Oburv+Ka
	yxfwSuu7iZHgV5OXHnANsvO6wCywnthX2MXxQ13s+1Vpp9mAU7OhIKK8hyk7SqWRzYou8
X-Gm-Gg: ASbGncuwAz/6P2NtEummom0ERDd2tTyM6goRTvpohuwQDvvEQlACjY1HBU8MfX4s5uQ
	WYt+Zzyfn/y7Ix/Uzch54mU0rSRmRSQeQyupu4CY3g53FQK+NlxgMTnNju1vt12FzG2BhWLzab7
	HMtZC6234c71kYzqlDoIHcm/5HB5nVC/9QA03h6M8uP7tl91aIvtcGe0rW2CwtNqKPnu3uVnYMY
	Ykag+sNqUNBg8zbEQTKB9l8sDhWbJFUG/N6Uwa9g8GV3pgrmj8xAl8cQTWRzOoSbvIDdcFYbZmP
	RdOhdifhHt4RPr6p0HggaAVfHkj69dnu7IhX1QJ1r+ndVT4rVyxdiqeVppSgV2ia91fbBqkHybT
	b7NAqPMVZj6VO+jXlP0l0xUKg8bPv
X-Received: by 2002:a17:902:f691:b0:25c:e895:6a75 with SMTP id d9443c01a7336-290ca121a2cmr76756755ad.28.1760769904551;
        Fri, 17 Oct 2025 23:45:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE46DudyU1Od1eBACT3pMY31QTZQHpLNGdzqT+17P2QerlcjwRKGiUCYVWUl4eUkOU0pL/1g==
X-Received: by 2002:a17:902:f691:b0:25c:e895:6a75 with SMTP id d9443c01a7336-290ca121a2cmr76756345ad.28.1760769904006;
        Fri, 17 Oct 2025 23:45:04 -0700 (PDT)
Received: from [192.168.1.14] ([58.84.62.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcc2e0sm16037715ad.34.2025.10.17.23.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 23:45:03 -0700 (PDT)
Message-ID: <677b59f4-5732-43ad-83af-c670f6fb999d@oss.qualcomm.com>
Date: Sat, 18 Oct 2025 12:14:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/2] ufs: ufs-qcom: Disable AHIT before SQ tail update
 to prevent race in MCQ mode
To: Bart Van Assche <bvanassche@acm.org>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        peter.griffin@linaro.org, krzk@kernel.org, peter.wang@mediatek.com,
        beanhuo@micron.com, quic_nguyenb@quicinc.com, adrian.hunter@intel.com,
        ebiggers@kernel.org, neil.armstrong@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com
References: <20251014060406.1420475-1-palash.kambar@oss.qualcomm.com>
 <20251014060406.1420475-3-palash.kambar@oss.qualcomm.com>
 <f2b56041-b418-4ca9-a84a-ac662a850207@acm.org>
 <CAGbPq5dhUXr59U_J3W4haNHughkaiXpnc4kAZWXB0SjPdFQMhg@mail.gmail.com>
 <bb9c7926-4820-4922-a67d-65a6b1bace9a@acm.org>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <bb9c7926-4820-4922-a67d-65a6b1bace9a@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX4+c8Cl9sGSd2
 QPIyWGxcJM4mvMhkUcjQZORivUZrdF0VcEFWQYtTZnRCf2nI72FLEg3Sy1Yvs7pIl32dwvzfWXy
 EmJTt1CKv/smF3/ES4Y+lV0+LkbN6m1axu2LennPfqeu6WcC78+uhSAv6/2ewpQ2lSxm+0jlx8J
 jsZb9Mye094VgL07BDt25AK956rBQ0FERuGUnY0GcL6mQg0DZ1AQDDp1QQjzDhIQF6R+gv3qEWy
 wrpsnTJtMuk4ygIhzHS03GWnC8xuj+3OucDR8Z904IIocmBljw4JIk5DaHjwVMH1xJ6hwukSkJ0
 xAow4Q3d72mSu+2EEZACxdPnDY2yenvfv99FDx4OOLYQLsBS2NNWE0MCt1Q+KO9/x0xbRUZ6gKE
 jiltdTfJ4Qf7z2pURliKtJWVKdm1IQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f33771 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IrkFCgFlEHDHcOs+Gij41Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P3EupyyZPr0bXwnpvzAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: EXkta4lk_q033ovxpcJP69AW2t3a_GVt
X-Proofpoint-ORIG-GUID: EXkta4lk_q033ovxpcJP69AW2t3a_GVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018


On 10/15/2025 9:15 PM, Bart Van Assche wrote:
> On 10/15/25 7:08 AM, Palash Kambar wrote:
>> Since AHIT is a hardware-based power-saving feature, disabling it entirely
>> could lead to significant power penalties. Therefore, this patch aims to preserve
>> power efficiency while resolving the race condition.
>> We have tested this change and observed no noticeable performance degradation.
>> Also, adding in RPM callbacks will not solve the power penalty as it autosuspend timer is
>> 3 secs in comparision to AHIT timer which is 5ms.
>
> The runtime power management timeout can be modified. Please verify
> whether the power consumption with AHIT disabled and the runtime power
> management timeout set to 5 ms is acceptable.
>
> Thanks,
>
> Bart.

Thanks for the feedback, Bart. However, I believe setting the runtime suspend delay to 5ms
 might be overly aggressive for the system and may have below side effects:

1. Short autosuspend timeouts can cause the UFS device to enter low-power states even 
during brief idle periods. This results in resume latency, introducing delays when the 
device needs to wake up for subsequent operations.
2. Frequent suspend and resume cycles may disrupt data flow, particularly in workloads
with bursty or intermittent I/O, leading to performance degradation.
3. When the autosuspend timer is overly aggressive, the UFS device may repeatedly 
transition between active and low-power states. These transitions themselves consume power, 
and if they occur too often, they can offset or even negate the intended power savings.

Please let me know your thoughts on this.

Regards,


Palash K

>  

