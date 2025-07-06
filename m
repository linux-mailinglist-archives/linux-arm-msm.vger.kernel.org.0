Return-Path: <linux-arm-msm+bounces-63861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54775AFA63F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 17:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53DF167BEA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 15:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5042627713;
	Sun,  6 Jul 2025 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lz/iyNl/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1DE2AE6F
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751816959; cv=none; b=s4f2DeR0QcckaHvzJdcgVDU0OrIjd0XC2s4vDPTuYaQeT4aCu8+OmOc8ESCISSyL10E87INBjFE8ht0MBQEDd9o7gtEZfrIcBnWeEhWGnZ1n5UWG4/Ecf3AEMsEvKAnfZKU2MXrzR2WKoD9ZdGTxnB9whFDOzBguImlG63QPlVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751816959; c=relaxed/simple;
	bh=cieKeTW7sxZrANoBfT0pl2UQfcrvI1ussoOX7pNgN9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8rhqTSGeaUHjTD+/J5S92N8UEb3oCp8C88wyv1A/iQQoOxbppP2YQvDouACrh6wf/CnFHliuAxGlObombntiK6ZePHb6q5KAssjj8tVV0pkOBaDBdgb/0f+IQRDSdU0k+O/gn6USmarV4dprJgm8yqlIaZ/TQvrlfQB0TC2ZfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lz/iyNl/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Ewv6I016093
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 15:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ThkIhhBJ5fwEX1d3VOih6G8zDuT1c+BI7IZw68KecMw=; b=lz/iyNl/N9CHjE0p
	3apskZunHVG9s0rLAZRWu2ZJF2uszP8tCShA6f5IPW5x48s0jSl++5qLS+ryGluD
	86FPRQp0KaIQxIZO9xbzPZnsDifbzk0zM22nXQB1onxatgHh1f3l/oPzyCrTCVLw
	OuHGYJXBnk6vGiSlzph31Jm78bZEzTd1w44bb3vC+QPYzSVXvgFhpr2L00ZyvXlo
	llctYe5p/01s/78rcm5NtHFHwQDiu8lPj9ozI/6yJwiPlbW07fZSDz3nDKVTSOzy
	74SoNKMi5RlIFr4DUSZHx0/WpVO8Ti8595b5LQcSFrdR73vVqtTJP4SRpIjUAVHQ
	WBXbQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmd7ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 15:49:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso338206085a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 08:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751816956; x=1752421756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThkIhhBJ5fwEX1d3VOih6G8zDuT1c+BI7IZw68KecMw=;
        b=G9/bSu+NMajpCalF3j5b6PzvSgOVeCnAk3yHkje42o6kaxifH9ZDkhXABQ2kAnyJ4n
         /WdnvpOzk4gXnxPNG+lcDYLtczDgFAkmXiGDvEztep7hTKUDTmH8mNiQK06p+TVgRO2Y
         yGdkxg6BSP8NW5akhH7lHLwp9BqEqkorPuKTPJX4IzXO8GJ852rONGW7MpeKA+7F1LhW
         fnzYksXrUws8UuhZYt6lNCnvnsDfXoiMqNX1cOeIYUcIZmbyIrHVfD594XxRcQYbAblS
         LtnaRGTNKq1UozHH8GvrB5JlgDFJp7aUTtIaPl3A9lR6UqBLpNi7sigemcb1qNs8Gb+V
         DOOA==
X-Forwarded-Encrypted: i=1; AJvYcCV8IkKAugtSilC1E9x4QfpuUvhRQgVFfuey0C2ZyxuTYzDVyhk0eYDNaa2uXdhN4xCOgXz7UBkjBzg7DEuD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb61qTqyJlNsxEZ+w6UKC4MossZCH+2csjCNukA5ZFfEBGodPt
	xV5wNRAtWaec2+bcFqZm5J25AJwyXuDCglk/pFIu4Y4lsLartNw3st72yafkWb387HqN2Aqx1Ic
	iFtPGESyugbDPNT2NB9XBOBFgfFrYYw8pXDZDsYHZCSnKXGYJhBI7iNwjHAEWl/D4/tf4
X-Gm-Gg: ASbGncuVUwDHeg5K0xneaSGVi2b+K4l5BTqMR+3HiENf0i9e4p/QI9ZD6000+3bf3ng
	wy881qmRHGamwC8QUEGWkGYYiN8ziugwtjf7fSlYiSUBL/wsn1xlmuxzrWFjPAIn5DsCHpCgR8W
	wM4W3B+GatXTveVahoEwoALpCQtdRwcbhV9beK53pTwY6keLtXXvcjfSSA++QLNdfzySe9yrSNQ
	7Z8h+UWq/5hnzSehRSmHao5t0dALqFEuiikT/FZPeCs6z4G6G0qN77rLOb44OnM0JalkCNPA77n
	dP3dJEqtWfv0ZFLKRdYwgP+ix/YYeCLTNmdJa3tAJekHujAtVm5zu+HoG285VDRMDzrczivlOZb
	qkzWdzaq81Drz2kHCjv6KThITlw==
X-Received: by 2002:a05:620a:2705:b0:7d3:9012:75b7 with SMTP id af79cd13be357-7d5f28776d5mr604201385a.31.1751816955604;
        Sun, 06 Jul 2025 08:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGmoz2irg953lfmYPzSg/oryohS4RfR4eZsTBB966t6LMzMt5vdU+OciSZSHFurHT6z3Gtzw==
X-Received: by 2002:a05:620a:2705:b0:7d3:9012:75b7 with SMTP id af79cd13be357-7d5f28776d5mr604199085a.31.1751816955160;
        Sun, 06 Jul 2025 08:49:15 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384a9123sm974422e87.168.2025.07.06.08.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 08:49:14 -0700 (PDT)
Message-ID: <fad0bbf0-e229-4614-9b68-e3e49ea1f801@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 18:49:13 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
 <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
 <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
 <CACSVV01QLz40_sU4-jD6EHpnZ8ECRgxqQTaRjNdtRtgrDbAMCA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CACSVV01QLz40_sU4-jD6EHpnZ8ECRgxqQTaRjNdtRtgrDbAMCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686a9afc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cS33hYv70hVWqaF04D4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: n5TvM5gqyrBAMzgnyB2EdVk7eoY__dms
X-Proofpoint-ORIG-GUID: n5TvM5gqyrBAMzgnyB2EdVk7eoY__dms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDEwMSBTYWx0ZWRfXzKAi2fAZf01Q
 jeCWhwjQjYRj2rVYCaNoutLmz6ipZODdej/fhWUqjT69BZddeUAVxorbXDP616ePafMym9Xaic+
 V/m2YdhMb3YeaabtoBhNuBxdSh5AvljSQdxi5CW4nE0OAv6Gg4LwLQJLJ6owMKmhYNtWUnqPA3F
 MS9mn/8XmczgNQxqUrWyqS4xHEnbBwUhwXVQyH/fQ36tKnvwYmv2VrR9ASaIcEWEYHgUhfIplLh
 EHs8gtnC3r9k2N8GNEHiVpqQdquxHEQi0tg97u57TnWk4K0sGClIlyu4r8o+csRMNIFgTfQqhFH
 7PUcBR8uO4PRK3jtk/JSAhKBWwDdakNvlD98kRX5Zg2Jvi1eBB6i3UVmgBi2Cr8ZPhrTG3xBLyb
 wI/4lRAiZ0SBz5tRkOKsbjOjigjNEVpEvFdVAs9xPjsWVNNwpOUja9R8WUosyYDA6gbsIEpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060101

On 06/07/2025 18:11, Rob Clark wrote:
> On Sun, Jul 6, 2025 at 7:02 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, 6 Jul 2025 at 16:11, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>>
>>> On Sun, Jul 6, 2025 at 3:50 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> Use the msm_kms_init_vm() function to allocate memory manager instead of
>>>> hand-coding a copy of it. Although MDP4 platforms don't have MDSS
>>>> device, it's still safe to use the function as all MDP4 devices have
>>>> IOMMU and the parent of the MDP4 is the root SoC device.
>>>
>>> So, originally the distinction was that mdp4 didn't have the mdss
>>> wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
>>> returns true?
>>
>> Yes, as expressed in the cover letter.
> 
> Right, but with this patch, I think nothing is enforcing that, so we
> could end up dereferencing mdp_dev->parent if the device did not have
> an iommu.
> 
> I guess you could solve that with an extra device_iommu_mapped() in
> mdp4_kms_init()

... or adding have_mdss arg to msm_kms_init_vm().

Anyway, let's probably get first two patches in, I'll repost the third 
patch later on.

> 
> BR,
> -R
> 
>>>
>>> BR,
>>> -R
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++----------------------
>>>>   1 file changed, 5 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>> index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a59052529f36fadf15cd7 100644
>>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>> @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
>>>>
>>>>   static int mdp4_kms_init(struct drm_device *dev)
>>>>   {
>>>> -       struct platform_device *pdev = to_platform_device(dev->dev);
>>>>          struct msm_drm_private *priv = dev->dev_private;
>>>>          struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
>>>>          struct msm_kms *kms = NULL;
>>>> -       struct msm_mmu *mmu;
>>>>          struct drm_gpuvm *vm;
>>>>          int ret;
>>>>          u32 major, minor;
>>>> @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev)
>>>>          mdp4_disable(mdp4_kms);
>>>>          mdelay(16);
>>>>
>>>> -       mmu = msm_iommu_new(&pdev->dev, 0);
>>>> -       if (IS_ERR(mmu)) {
>>>> -               ret = PTR_ERR(mmu);
>>>> +       vm = msm_kms_init_vm(mdp4_kms->dev);
>>>> +       if (IS_ERR(vm)) {
>>>> +               ret = PTR_ERR(vm);
>>>>                  goto fail;
>>>> -       } else if (!mmu) {
>>>> -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no longer supported\n");
>>>> -               ret = -ENODEV;
>>>> -               goto fail;
>>>> -       } else {
>>>> -               vm  = msm_gem_vm_create(dev, mmu, "mdp4",
>>>> -                                       0x1000, 0x100000000 - 0x1000,
>>>> -                                       true);
>>>> -
>>>> -               if (IS_ERR(vm)) {
>>>> -                       if (!IS_ERR(mmu))
>>>> -                               mmu->funcs->destroy(mmu);
>>>> -                       ret = PTR_ERR(vm);
>>>> -                       goto fail;
>>>> -               }
>>>> -
>>>> -               kms->vm = vm;
>>>>          }
>>>>
>>>> +       kms->vm = vm;
>>>> +
>>>>          ret = modeset_init(mdp4_kms);
>>>>          if (ret) {
>>>>                  DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
>>>>
>>>> --
>>>> 2.39.5
>>>>
>>
>>
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry

