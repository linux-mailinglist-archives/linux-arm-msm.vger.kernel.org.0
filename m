Return-Path: <linux-arm-msm+bounces-65555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B247AB0964D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 23:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED5681701BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 21:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8147F224AEB;
	Thu, 17 Jul 2025 21:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXOrs4di"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D134452F88
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 21:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752786626; cv=none; b=qe7MYS/U07+9RD0cr1sh58R5VoMJpgAXidVnoHIzeEqUG0iCH2tBtLcdpb41KeJexKGnoGeyjayvocZc5YhDGYXR24txdArHlzIeWqLk1V2XQ7CXp8dXO0j99Vd21N3goLaSrkbvTSZE9gxzpbQQqJT9fKzu5Hlbz9m/4vacvO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752786626; c=relaxed/simple;
	bh=sC4zn7OGcF1ZUumZy1Ahb3fgo5TZ1U3H6sFZGSJK2fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xv88fQKSdzOcO+WwC3oqj3vjuAGyzvCxx06z73xeoQbrefCE+BGyFUeJlX6wdCYz+/B9Adx5ts0Yajvt4bVv0rQE06TDlvXZjqBDzFPaBeVHfitTMoF63atOeB1oc+zg/fKEiIQJPSIe8I6sYTpaAqLBxoO4TsjzMCvSVYOfmq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXOrs4di; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJelxH022228
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 21:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ldNEIALVCE8XNEzWAt9SINrTSS3as+SspmXHlLaDBs=; b=TXOrs4dib/Gxqxkx
	KltjMvnvAVbEzK1LeiSKna4NJfoxFwewPxkfsOw1/niszEfEPhuZJxVnBBs2HXvJ
	E49mESdGWjkTiXOcorXnvxk2el9AfNww+WpJMgcWPKQ9ffhT0Bh99V0Egq51yIQo
	q7pqQ3JgJ/vGMZYxw2oAy7M+Jggu5AMCTikdCRrLjwWOIIZTHFkWj/6Pb50I/zbb
	B0r12Tlcds3driRrMN3cF/K5pN0HDZQAqeTiahN/VG4UjR61wlQ3R4AjoXv/G40O
	A01TBqmtkdM+q1OgjeanVYXjdq0fD+4C71vPIAZFfa9xFY+xKoRR8fL74zszkD3l
	F9n9tw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy94vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 21:10:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e344f333beso16560285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752786622; x=1753391422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ldNEIALVCE8XNEzWAt9SINrTSS3as+SspmXHlLaDBs=;
        b=VWdlgx6aZMVt5dMHbREHWhO9FtJbbt7LngpaX7FU3NO5F2S9D4xruaV2Cgv3N+X+2+
         tNezj08SiRcdnm/rnw5/xrbh+I9+gnM4xQfDUHKlz1T1zAb+KynGntTcuB4Un2ZkS1UK
         0zDHhPCEq5aPm5s6k6sFiLdV03AF6SJu8RhpxezIqszMAjFNXwoL2BatEbls8+rzwCF9
         ZU3wAP/qxYTE1kpIJH60lJqV2sSN+ClCDHElkUQVMae1kUj3mhhhViFXP956xRi4DpNB
         0LnjhkjHMFDE77x1cnq91YDjYOSAGMb5PXBQF9yQz1818pha49XBXqTZ8wEoS84BPGJ3
         raew==
X-Forwarded-Encrypted: i=1; AJvYcCVP2hLu3Kti+COW25aawqB/DQDsfyJWyW4gM1SbdzMXOYy9KgavCRDUNB4eXnsm4sOFiBF07g9VDQUdWEn8@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWAeOte+JwhdyNMOkWyN7N2/zXfBGkp1RzRCZXaDmHzuKE6TV
	5JFo164geASruksSv8UKX5t9ZZ1IF1PTxwdmyi4eJ6P/KLq+OIgkdaxdAJDu8FCWvxxHpQ1hefM
	I6DyoPmfabzgPZ+XRFhMRWQ2s8Jn7YPLLH/hIjRfQcPmGNQ6BU04FY69aq6uif0v5LsJ8
X-Gm-Gg: ASbGnctkRb21sSSfGFIoK8FlnSFyVpalTlehQbqp2OF0aBw2iIF826zpqqYpky2CCSW
	Ecf8AhN9F6yFTkQLBbp3V0e1W5pO4RLzT5KJkjTv0RVczzCgN2mvB6mJNAL8uM7lovAcrYr4xmd
	wQewRHSga3UHfcT3TCclZ9hSe9KAx1oDLc4rfVPi1iBCwZliK6RKZ9e8UrMV3K5QwSpDmCZ9iGw
	cyTyn3rCPYYe3sXlOZYfS11C80IHVeW7I2h74XP4/3d5tfpgcAzK/MF5ASVXsHghch20MLe6jGT
	kTNtreJ2427kPlk8dpEWD37ADUT47GxkOU2UPLh/nPbKm/7Wnq1mzNs1q7XxF3N92aAWD6IhRhu
	Kc31SK/Tcvt2b0Zivk8xy
X-Received: by 2002:a05:620a:84c1:b0:7e3:3029:44c with SMTP id af79cd13be357-7e342aebd89mr515759985a.7.1752786622226;
        Thu, 17 Jul 2025 14:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVTebp2sXm1zQJMaQUIUz460FvBUXOo4sBrkg5PyJ5Ii2pC0RKVIfE3V/DxUtak4hYNe7EDA==
X-Received: by 2002:a05:620a:84c1:b0:7e3:3029:44c with SMTP id af79cd13be357-7e342aebd89mr515757185a.7.1752786621660;
        Thu, 17 Jul 2025 14:10:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826469asm1413336666b.85.2025.07.17.14.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 14:10:20 -0700 (PDT)
Message-ID: <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 23:10:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Xilin Wu <sophon@radxa.com>
Cc: Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4NyBTYWx0ZWRfX7+EOhv7vUGmb
 9WcKLzKHuLcyWyqmN4231gth8/C+W/Ux43G01CqQYv8QDlf+XX3kgKqTCp3wlvL8A6GyseQDsTI
 5WMbd7tLSfAptVIuTk6J2GThe0unx73MfDckbzq6uYB4p7bphTrAz68tkk12SAqW4xe7FUG8+8r
 A9U1ai34ZC5qxOKKBLM+N+IZLMivClVD0C8lx17OwO9nNQdsaSc5xXYMB7q6e4k279ddOKgB5J1
 LqfF8XM+PePIY+X2m2ozAODevi1U+lt7r1xVwqO1/bbG+i9eV9Z5WrjN0NeGJqBftesxTt3IUJf
 jEub+NWDAGYffszAXiVCzC4tMqnGztLQ81CZGdAgRs1wHzAERP0VRqwJDA7pqmAvpOyjKte6Edf
 ncDwLhnCdOCM4dcsvPL0rbI5qyF1qZF0/1Tl+cmmKWa9ruujn1rH38jkW72uxOncY2ojbgic
X-Proofpoint-GUID: GsghYMOazj0a_uE4YPkZzLDNGTid6AiG
X-Proofpoint-ORIG-GUID: GsghYMOazj0a_uE4YPkZzLDNGTid6AiG
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687966bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=ksxQWNrZAAAA:8 a=pGLkceISAAAA:8 a=LffbBSGFapktDZBAnWwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170187

On 7/17/25 10:27 PM, Jérôme de Bretagne wrote:
> On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
>>
>> On 2025/7/15 01:35:42, Dale Whinham wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> The OLED display in the Surface Pro 11 reports a maximum link rate of
>>> zero in its DPCD, causing it to fail to probe correctly.
>>>
>>> The Surface Pro 11's DSDT table contains some XML with an
>>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
>>> (8.1Gbps/HBR3).
>>>
>>> Add a quirk to conditionally override the max link rate if its value
>>> is zero specifically for this model.
>>>
>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> index 4e8ab75c771b..b2e65b987c05 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> @@ -11,6 +11,8 @@
>>>   #include <drm/drm_of.h>
>>>   #include <drm/drm_print.h>
>>>
>>> +#include <linux/dmi.h>
>>> +
>>>   #define DP_MAX_NUM_DP_LANES 4
>>>   #define DP_LINK_RATE_HBR2   540000 /* kbytes */
>>>
>>> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
>>>       if (rc)
>>>               return rc;
>>>
>>> +     /*
>>> +      * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro 11
>>> +      * reports a max link rate of 0 in the DPCD. Fix it to match the
>>> +      * EDPOverrideDPCDCaps string found in the ACPI DSDT
>>> +      */
>>> +     if (dpcd[DP_MAX_LINK_RATE] == 0 &&
>>> +         dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
>>> +         dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edition")) {
>>> +             dpcd[1] = DP_LINK_BW_8_1;
>>> +     }
>>> +
>>
>> My Galaxy Book4 Edge with the ATNA60CL07-0 panel also reports a max link
>> rate of 0. But I think eDP v1.4 panels need a different way to retrieve
>> supported links rates, which could be found in the amdgpu [1], i915 [2]
>> and nouveau [3] drivers.
> 
> Thanks Xilin for the sharing and pointers into 3 other drivers, that
> would explain the current limitation for Adreno GPUs. Fixing it would
> require a big contribution independent of the actual SP11 enablement.

FWIW Adreno is a wholly separate (from DPU - the display engine) block

> 
> Is it a feature planned in the short-medium term within the MSM driver?
> If not, would a quirk like [4] be acceptable upstream in the meanwhile?

I'm not a display guy, but this looks like yet another block of code
begging to be commonized across DP drivers, so I wouldn't expect it to
be a big blocker.

Adding a panel quirk doesn't seem in order, as the panel is /probably/
very much in spec, and it's the driver bit that's missing.

Konrad

> 
> [4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb
> 
> Thanks a lot,
> Jérôme
> 
> 
> 
>> [1]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c#n2098
>> [2]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/i915/display/intel_dp.c#n4281
>> [3]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/nouveau/nouveau_dp.c#n101
>>
>>
>>>       msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
>>>       link_info = &msm_dp_panel->link_info;
>>>       link_info->revision = dpcd[DP_DPCD_REV];
>>
>>
>> --
>> Best regards,
>> Xilin Wu <sophon@radxa.com>
> 

