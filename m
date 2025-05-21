Return-Path: <linux-arm-msm+bounces-58936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5618EABF82B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D31B27A84E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AF91D63C2;
	Wed, 21 May 2025 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Km/MRYd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7774A1E260C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838971; cv=none; b=Fxl1UhQf18n7YFgwUHgK0OJE3gNKr/9cxFUsE1ZWDSC8IQRyGtJ9KBjFNoWNcRXK4dfUTv08CU5LcdnNkzN8QqEsKIW90XFUPFtmlsUPSTeK7rBxEfROXg4cEP4iS1/H7JYmDOR2kJOqPb5qCbwVbKNGGoXUJF6NxUTCYPXysHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838971; c=relaxed/simple;
	bh=9LDK/QKPWZKQXdNon4+5Vf1nRHt0rEU96RIWKx4oniI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dl01205R9zYBhSfjUL6SIFlwttBDlzP1XXQnpVnvtjBFHaIMFQFOpklMjx+5ZNRkT/BgzW2EDcPzI01b8IUGlbTxwfou50FKi6AMVSkiuCD0U0rn6kfN/eJyzYS1rq5CI+p4gKkaRS9qfO6qONM2aws8b6EGvhk/WSNu4Wkd6Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Km/MRYd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XrJh011672
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzz8YAG+jzGwPnznc9rRApuGlOIZqX/coqLODea7HoY=; b=Km/MRYd+hcUDDrDD
	y2JpRVEC8uUzuLODglF5ZCmkBbVr0EFGud/9aCGtCxGjUPQsyXiD0gNLyl6UskEe
	Up++paC6g0Ah7kj7zDJX8mPwBb/W5DVPWMWk+p4RSdADVkdW8Lb3nQaNiUqiNVqy
	xD8Bn1RqvaWeXLg0K1yNheHjuA4IKODc1V4T3ZD8GvhAj4CpA4BVCrmnsn4gBRci
	nDyEC1IWHCU/NU8+Dn7UvntEpM3RUAeKIYZsBw4+VJqqUdZ9wA0yo+p0E5B+3tsd
	5l2WIy/F1ZqjiAvUnhoho8ReIbcrPCuB51zsJibIQnLExs3oGsVykdg01zFiLQgJ
	1b90GA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb390e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:49:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8dfae341eso57283786d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838967; x=1748443767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzz8YAG+jzGwPnznc9rRApuGlOIZqX/coqLODea7HoY=;
        b=TXw9z2hCuTyy8I3Df2eW+kBBI/tyIsWy4P06WePqRDSXOH0YpWCpN7CCbGPphQ+cKA
         Y6GosOBY3KcvlXf5s1a/mB6+qAv+H3BZIW7UqwLCKYy3OTlYJ1Pumjb/Fc+JeiSHrHVl
         uQNjbUjuMPUOdBxNkEXYX9xaqFzWRIn5FflDir7M1n5+rkedkq9t29hih3Kpg8xKVt2i
         lzbRJzZaQ2QdIDHB6GAU/IxD7DiDJ6lC4CECO/kY6x5qij8566kuZfk0OFmddiXFjlAD
         y6uAGMjqsu0SK3Hv2ZLU86cZsRfdBQKD565etsHRqxkyxGvSIT15pFFk7XTs0du05tt5
         Dtrg==
X-Forwarded-Encrypted: i=1; AJvYcCXIO927pHT+av+q73nLGwv/cShGKpceHRNPceKKHbySvSjCKX6RqvkaA9gMtd+CXG401J7+t3VN1qByY499@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOHzfgV3CCAvHspPmNF6YC914tWx/v7Q+0ZDD/M0ONqq/SX/7
	UnF/FnwBzm2Urrl+oVTJhZGQpm6sgRU02+OCzIhkI1Z0HhTtnWmYqgiacr15xlLrXGOvPP8cdLi
	q5kK4CYSk5qsi5XvGIbyJNH7iga9HihSbTQukpEG27BcQMzYJJE0q9Kquqxv64s67UgVh
X-Gm-Gg: ASbGncuZilXWMXxFgKlW+ljz5091BR4GQMhfix11utFkC7A2kgHU0qwqjl12EYxR+zt
	94NWqQ6PNkwTWh1MFOt0hSwmU5nhAnXKQlev5gH2Ns5u9t6aOuPmZrvqm0N+8l7b9MFsI6O3+nc
	jKdCDDRK4v5bBK7SmTYR6q/nAzAbm2SRQUNfg/uX7lI1Yg2U+6SV9noV77PeLr51toLGYDM8LY8
	YPS59dNzKWV+Z+9qtPV7QH76xV/TD7J4s8Fmppgn6+GZVBWlgRF4OwHHHot5gB9NvF73rylkvXp
	WnYr+DYyJ6f8gZ5B6QFrBhZRJMShB1FFhoSg50kQjMR6GN94za6PpY6hIVLD1VOsXG3z294FsFh
	SrTrsrHn3SjGVcPtNfbBQaIqyIDP25RbPGh5e92/ojlCgpMYrNh+mkKEL3nwQ7NkW
X-Received: by 2002:a05:6214:f05:b0:6e8:ed7f:1a79 with SMTP id 6a1803df08f44-6f8b08d8672mr389818326d6.32.1747838966182;
        Wed, 21 May 2025 07:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGADVYs6P1p5D3eHx76IOayTjYi+ijzrqjc/PCEns20DtYTMFID31WEtYs4tZlh7+gviqZqpg==
X-Received: by 2002:a05:6214:f05:b0:6e8:ed7f:1a79 with SMTP id 6a1803df08f44-6f8b08d8672mr389816406d6.32.1747838963560;
        Wed, 21 May 2025 07:49:23 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c7:69ba:b852:d3f4:8957:5a1e? (2001-14bb-c7-69ba-b852-d3f4-8957-5a1e.rev.dnainternet.fi. [2001:14bb:c7:69ba:b852:d3f4:8957:5a1e])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b30easm28014581fa.6.2025.05.21.07.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 07:49:22 -0700 (PDT)
Message-ID: <c1ebdaf1-92bb-4f73-bca9-35246d7c10e1@oss.qualcomm.com>
Date: Wed, 21 May 2025 17:49:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@quicinc.com
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
 <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
 <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
 <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
 <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com>
 <ehgjdszjr34xppmkrkicb4pnq326nor26tqu2ekop6ew2j3y3h@pm45aiipzuc5>
 <48c73675-a73f-46f1-81a9-f701a2cf00a5@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <48c73675-a73f-46f1-81a9-f701a2cf00a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c0fgfT6HBm1CJI5WV1c0WTTpBqxnsAEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0NSBTYWx0ZWRfX1UP19CI2M5K5
 jVs2/IE9FaxrWy5rhRibzvGrdSI5i+sHhnejMGPZU5Qh9HihWUP30tPB6QGztSEPvJRQKZt330F
 KwF2GbwpY9u90Fl3L3vRdsd+0ABT0Yo8DcVikJqVXF3+50nBcYYMyj6OiPqkdGOsIq4v1DLYu9R
 KP2N3DeenQ7UgmfcFa0iy9Lh3hnlN+VFhjVu2Vcmi7bYl9Fb6ovkF5EPvaL5kX1oEnSLzVy3JK5
 eki1y/myJ1HkduIhRiGFUohyvMscOhQUDfbW6NmGaGGJbgoIDGvxS5+8iBn2zH75j4un625clPk
 HG793gtSJiPPlsBGm2008yD6spZ+ETFem+2KnD3nWh6P9Xd1BxWCyEdqkigO0BztX8/5aFmcePR
 H8Nu6bgob8VSxqHbt3NAwucF1cn1ZHLT5H2aoHHk/cjlNSD5G/IQlfkG1JnhmVT/JmmtfR4x
X-Proofpoint-GUID: c0fgfT6HBm1CJI5WV1c0WTTpBqxnsAEK
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682de7f8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=3-RhneuVAAAA:8
 a=JVpan6spTK3LsyV6_coA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210145

On 21/05/2025 17:35, Sarthak Garg wrote:
> 
> 
> On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
>> On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
>>>
>>>
>>> On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
>>>> On Fri, 15 Nov 2024 at 12:23, Sarthak Garg 
>>>> <quic_sartgarg@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
>>>>>>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>>>>>>> This enables runtime PM for eMMC/SD card.
>>>>>>
>>>>>> Could you please mention, which platforms were tested with this 
>>>>>> patch?
>>>>>> Note, upstream kernel supports a lot of platforms, including 
>>>>>> MSM8974, I
>>>>>> think the oldest one, which uses SDHCI.
>>>>>>
>>>>>
>>>>> This was tested with qdu1000 platform.
>>>>
>>>> Are you sure that it won't break other platforms?
>>>>
>>>
>>> Thanks for your valuable comment.
>>> I am not sure about the older platforms so to avoid issues on older
>>> platforms we can enable this for all SDCC version 5.0 targets ?
>>
>> No, there are still a lot of platforms. Either explain why this is
>> required for all v5 platforms (and won't break those) or find some other
>> way, e.g. limit the change to QDU1000, explaining why it is _not_
>> applicable to other platforms.
>>
> 
> Thanks for your comment.

No need to.

> I agree with your concern but for me also its not possible to test on 
> all the platforms.

Sure.

> Lets say if I want to enable this caps for QDU1000 for which it has been 
> tested and on any other upcoming target after testing, then how can I 
> proceed to enable?

Let's start from the beginning: why do you want to enable it on QDU1000?

> 
> One option I had thought of was to implement this using compatible 
> string, then for all the upcoming platforms using this compatible string 
> as a fallback.
> But this doesn't look optimal to use compatible string for just one flag 
> and also this capability is not platform specific and we will be needing 
> for all the platforms. Please share your opinion on this.
> 
> Another option that I could have thought of is using device tree based 
> approach but seems that was not accepted earlier :
> https://patchwork.kernel.org/project/linux-mmc/ 
> patch/20230129023630.830764-1-chenhuiz@axis.com/
> 
> So it would be helpful if you can suggest some approach?

Worst case, just tie it to the SoC-specific compat string that is 
already a part of the bindings.


-- 
With best wishes
Dmitry

