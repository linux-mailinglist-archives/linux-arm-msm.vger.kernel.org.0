Return-Path: <linux-arm-msm+bounces-59515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A741AAC4CC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4D93BF1FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF13253F3C;
	Tue, 27 May 2025 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xhac2tSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C9223E35E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344278; cv=none; b=kuvJIHFrHJBC+Swei2MekFoJPlMzb6bdD7pVTGlCCTO+3eyh8hY/7xNDvrisMSyP9lV/r9u18Yx/Z/5CFyqEPET4x4+OUTimuwwpSAL+/73W0da5xMYE+++8dTgem++kQNlyrOHZw8+mU5QtTq+JX4g/uWo/h+osWFhJfKS3H9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344278; c=relaxed/simple;
	bh=FpczGp8RbMHvucMtA6eVbMd4JpRzTIshwjXMkvAmexc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptcLGtoYmswUwg011osxIyIWMWQOfkav35oAlkdpgAhAWw2w53ilN5sYVz6xbMFsCgoKXYmYq9DBhf5y9EAltL0b/nrFGK0r+UjDgm+dZZcf5/LVloI0eQMi0XKBA6ZNlrVHHRTTGxSs6m9bTwLS625hW9i2vFHg7bvDOs+HxmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xhac2tSD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9YxP8002206
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wxu/TiS7w60udZYPhI7bm5MyIilaLqI8XYTNdOjf2qs=; b=Xhac2tSDdUdKr0PB
	qZnQYKuWSW0x5pQQGDnKPX38EFLIJWCECi/SbSe/GtCbdbpp9NC3PfHkWfefklDs
	6E5igb2dP6NqLhswcfL3wflGyA7koo0wgbm+4rcTSOGLKwMaf5Y2N3nH524LM6MJ
	oV2+wl6clU6CRkPtHhnfNKbu9ikl0M170r0yPaBpHwQfLdEjyi9d169uYhZuL70q
	hgyegrcFwvectaLJJ92n5rFfZJ+UvZ+Rdi6uDTfkdT/62Es3L+N6tVIiBCslVYe4
	7oNYqUhnor4NTcAjPI6XfpZKNe7gab4GqmnaQMfl9TnIC5inxv7QPnXrjAA6orBV
	j8iu4Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkr946-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:11:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa016252bso11311306d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 04:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748344273; x=1748949073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxu/TiS7w60udZYPhI7bm5MyIilaLqI8XYTNdOjf2qs=;
        b=BJGFtfv50mNyQFMVqw45bSx7b4D03GU5ctReqXlJ4nPm2hb5vJq3mRTcf8GGqq/UAB
         T4yGOWVzXWgUEuB1gzgQmpF59FlOFE6G4m4BDw3Z/UglnXx5uoZ+/EPCgVpSvajy4eQh
         jz/NhDx+hSEN/OVVWRvSKG44eY0Mr4rgLFwBm683g8FdC3vlsju00Hzpoal54AKLSvp3
         1n6vuDxDNtcBKAY3IizPo+3jXG3begy0tPXY3UmoEyASF2t0OqZgqgaXR3BPxR/HlAv6
         dq0AIugbZ0S+DkKN2w4x0GomoUO0hcfnHeHSwNVX4mkw68OsrS//SndGtVDk9JmYUDjv
         ruIw==
X-Forwarded-Encrypted: i=1; AJvYcCU/sfCplvB/ZbwPPLx8xf11nvm10BjfVUuKoC/FXTs+gMP1ctruwpmxDlK4UdbJPDO/X4h0y8UB/HSXooJ3@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWQ/ISM8Z86gy8SQKdwU09Si9GmOWcs5ybIpexpHqdK0OwTyp
	KzMkhAlWxSSIDP9Zng4HYoyrEJ3t/NwPIzJIRPYUQfJxadxfq3PjT27b8xVOXuJ6a4je7HCiueS
	r34accUhKuUJAgOtWNtwc92T0hY26k3kuc5Ol0bMVJZOuwv2g+s+9B44NQ3MBiXnpePBk
X-Gm-Gg: ASbGnctSSUixvhJwICc1Cpa6mYgVsDF57+cMnbdffJbeb4HMdVj2WbGQ6M1p3baEYia
	uNHxo9SV08x23ZiRkrNyU4uMhsGH0zKqWJ1AJbhND4vuYuyGY/ZLszOFKo5P4FwgTZ9ojlow6ET
	dARgaRYXpRm28zOkH+P0y9pQLhKL11UnbcDanYG47c/JR3rAPdjzcbdNIQ2tRvhAsF+pUSHEPFw
	es6j6zQPOAB/JiUpC+DNHmXDOKBXFjB+K6bfrI08kl/1wWdBSU7+AXelyL4EAemZu3qGgXDoJi2
	AamcVCl/ZbwW55xNvcpiEUosgWT/R5X8NkQUOLoOdMPhEOViGGAA/BNrHTpUmCTseg==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr73647676d6.8.1748344273490;
        Tue, 27 May 2025 04:11:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm0tLT/ILRYm9vnaH4+VaVshgcILjv9/Iad9lY7Qmlvc5zr6pF2bh9UDD8e2ltnacri2Wluw==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr73647486d6.8.1748344273142;
        Tue, 27 May 2025 04:11:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6048f06d915sm3382500a12.70.2025.05.27.04.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:11:12 -0700 (PDT)
Message-ID: <2e052c11-f22c-4d95-841e-cb4665d02451@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:11:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad
 Pro (caihong)
To: Pengyu Luo <mitltlatltl@gmail.com>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <53e1127d-77fb-4bb7-a125-18d7afc0d843@oss.qualcomm.com>
 <20250525105144.1328104-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525105144.1328104-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mtZJiSnfIX_2JJXFt0SHDkGBlYc8cn70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MiBTYWx0ZWRfX6KfoGAx5j5mn
 mVrQ2jj7Xl8g5HhKY2iEjM/uykgs6fID5BCDRTDOpvmTKO0SsqAf1knVOBfUkPmRAIIHOkyIVFS
 BC3lrbmCQEoeq56WCHKLHgZ0v1R2DDWEu6wcREYJUG4LnG/UevCv3qaGDmqKYxDYkLMEGgtUsVn
 XCxis3/FHuzD1K53BsiqClyGajFH/RPgB/S1+UfAFUpH7HBhewoTYGGwoFGSthlKfrQuVdUX3wp
 ZtfLpCWdSfQ04Qrp+Kd1Dz5m/U6Cnwhyr0dKanSPDoCnMISi49GA6yCe853kDSQaIFEqTZwwO5g
 HRRCAbOkhNZbi71mjaLHV+PvSO2vmPkgJRxZgOANOpxjI622zLgR0nILLmrARoL2abfqBJEeJi0
 6Q+aNlTPF5jqsNH3JzR7Qpt5k4vrxUcs7OQntSW1hyhYKF2ZEczkWHWYnsDQBOAoUJdmMuyC
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68359dd2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=jYZJvsQXSSxwn8BSTVsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: mtZJiSnfIX_2JJXFt0SHDkGBlYc8cn70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270092

On 5/25/25 12:51 PM, Pengyu Luo wrote:
> On Thu, May 22, 2025 at 11:05 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 5/21/25 10:37 AM, Pengyu Luo wrote:
>>> On Wed, May 21, 2025 at 5:54 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>> On 5/20/25 6:42 PM, Pengyu Luo wrote:
>>>>> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
>>>>> platform. Its device codename is "caihong". This patch adds an initial
>>>>> devicetree for basic functionality.
>>
>> [...]
>>
>>>>> +&i2c2 {
>>>>> +     status = "okay";
>>>>> +
>>>>> +     /* secondary kinetic,ktz8866@11 */
>>>>
>>>> You can describe it, the driver sets some nonzero default brightness
>>>>
>>>
>>> But the backlight framework won't index them, which causes sysfs
>>> collision when the second instance is registering.
>>
>> Have you talked to the backlight maintainers? This shouldn't be too
>> complex to figure out
> 
> Last time I tried to touch ktz8866 source, the reviewer advised me to
> add an backlight API to register the secondary devie. Since I am still
> working on the other parts when I am free, it remains unresolved. Now
> that you reminded me, then I tried to do it.
> 
> https://lore.kernel.org/linux-fbdev/20250525104022.1326997-1-mitltlatltl@gmail.com/

I think this should be made more generic, so that devices with e.g.
quad backlight can be easily accommodated for too.. Perhaps you could
do something like PLATFORM_DEVID_AUTO with incrementing suffixes and
make `backlight = <&foo>;` on the panel accept an array of devices
that would be controlled together

Konrad

