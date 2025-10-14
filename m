Return-Path: <linux-arm-msm+bounces-77162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97271BD8BE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 72C784F4A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B630E2F747C;
	Tue, 14 Oct 2025 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHDK2r3o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BAD2F6588
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437410; cv=none; b=O/JfYVfjLgizb0gNRLhBGJLcLf0c9MzBm1c9o1MHskZqlXr0Psf2PLd0Mtwtwg/Bxy+0JgfTZeAdbn4aXNuvWu15GwA5pw/5DrQO0olaQtigCrlYFhM8hHdI8helMwO8AJpU5y6aOzuahTMMl5AE5DBStnHNl+Way6EphwfWw8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437410; c=relaxed/simple;
	bh=bKxqC7Urx8BIjnGRET3RTd4P1I214hzlRG3kPzTTWhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQDM7i+01WYvkmNmFjp4knTJMBAe8AnUFrA7gCfRdbDxX0StORd+ePFQBwdU3blzbQFSq70r8kFMe55l8agrRmsfyD9zxveRStAPey4F082aZUqO5JWj7gl9apNol5RCmQsM5hSXlPZGH8/3HRYxvltpXOLlkml7TbNMfjO+1J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHDK2r3o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87JwS030999
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syFSpr3eCh99bFPl9T/VouB+NcW33TkqI4ZtatFCBVw=; b=XHDK2r3oIjrw4w34
	9O5IOphziKK/7yQymh2KsEmHn2Xa1nn9VmcOWhcRccKASzi+6kFJeRteaOXYSkE4
	A9SwKfMt51aMCrcZT9thYKj1RyTN97ZG7OkVOpnXIe25YZ4cxlQ6KBOjszUU+u7a
	CKxLDvk5sAj1+46qCDtxk6PrAGEaMO9YYau8z0gYxv8D36NelPvvqQi9A/t1qY0v
	emfg96JL+j/LnVSO2uTtk5A2nijNDOsU4SObulARmfEmFx3fWvfz5b5LbpownBS4
	fm/rE5kjDqnhOKcU0HR70JnUMq8zcDQ+uExRkblzLSw7BxObX2eBmh7mjXPf3u6F
	RNSd5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0r2kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:23:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8247c6738edso26945466d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760437407; x=1761042207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=syFSpr3eCh99bFPl9T/VouB+NcW33TkqI4ZtatFCBVw=;
        b=Bogy6192P0WEq6OPMDJzReNgI1dEUl2rScO14jjn/K9NnuNSAtmfHz7skszvxmD48x
         oPErpU/NxbwfpVG8THm6wnpMptHGT7U+QWSs2XDeRE/Q4mwmfO0TQt+gVKGfy75wzgtC
         Qw/nwG7oKHRSGcVYE8hRZIEtOkvGFJuVYg1qD8jNh0z3RWVuEPIA8VsUwrl7JPvD/KtP
         b6joSkrBNWr58C9qYOxBZl3YKTU2Iphh3vLaNiXxzQSsE6EZe+OgEavqT2ni0j4dQgt/
         s8WkWXw1JIqMoZ9GU8f1e454ajCDrgnXto1kMurRPbM/Jt95ZwXnqtv9uYBd2jOAJ0Hm
         Lpdg==
X-Forwarded-Encrypted: i=1; AJvYcCWD+la4sTgOL9McFhf+mrBTvwh6ulVKUNQbdeoMD33VrBgLfaI4XGu0nbRHpw2NHdAxmBdFKLrXBLYJmYGt@vger.kernel.org
X-Gm-Message-State: AOJu0YyPoROwtx+x4rMGGZcrinKh/HaL2qcP8LHr6NYkFp05yYQcVux9
	fYY7rlWuvbjowBpHVYCezLocTu/1JE2AR609FawW3R5QZ7lWRCCkn4FXR87IASnjrDK6aTI9+sn
	3FHVbj2deOBPF/I84iNqOkL4xFCRu4RiE5B/oZgMSRdL74n47NMsjgki+e/W+0Dyh98dn
X-Gm-Gg: ASbGncuRBT9u5NOvjsw17VRXb0UqM6urk61dgOI0aBmrh7LsEA5OLWd4s7OoNp9ycwH
	J0eaKCCJDzdBhHtKStQJMEEyVtTWZwnLIm1f311PwseC2YgbXxYLgub+gmD/x9VKD6zeMdRQJXk
	rSquXwvaTdiM4YhRQOdz0AfhyBdfVcpXg9+wBK/wx3tlwLro3Dc1nS+KtJEHdMx2M/l46S+gWSA
	/OMZ+T1CH7KuFpjVwBIrZvesid0N+XFbaAEu/YbX/Bsg/gtaBfDUrH5lrWq/xDa0zb58pQ+m2n2
	HVjaBpefFSj/KulvhPbrNMURD7ZOuL9dB2S09OlqJ+GOpZ26BxlX/zKZcz4NFhk6WnYIhuHh7dL
	vkHCnti5z/vys1ikDxNh6nA==
X-Received: by 2002:ad4:5d6e:0:b0:797:1974:b824 with SMTP id 6a1803df08f44-87b20ff9b4bmr223114956d6.2.1760437407123;
        Tue, 14 Oct 2025 03:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKxzrsLzDobgemeKdhYZPqXgWpoyRHcy59dE7ifDngcUZZgvHwzQzsiHxDFmOXhQjkcSYcbw==
X-Received: by 2002:ad4:5d6e:0:b0:797:1974:b824 with SMTP id 6a1803df08f44-87b20ff9b4bmr223114816d6.2.1760437406612;
        Tue, 14 Oct 2025 03:23:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c3218a8sm11273684a12.40.2025.10.14.03.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 03:23:26 -0700 (PDT)
Message-ID: <49004d3e-7914-48ee-8705-ee86d1944166@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:23:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] arm64: dts: qcom: glymur-crd: Avoid RTC probe
 failure
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-17-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdi0+c_FqinVA0gzoyqG6FVFp0jq5WSLsWWKiT12VVs3Q@mail.gmail.com>
 <CADhhZXaB310hVo_w8_CoJLQ3j9dy1eeTwbmk0q=vUV2ga1PAYA@mail.gmail.com>
 <8f81289d-7672-42e6-b841-6514607cdb38@oss.qualcomm.com>
 <20251013110407.dqpjdrdaw4gzpcy4@hu-kamalw-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251013110407.dqpjdrdaw4gzpcy4@hu-kamalw-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXz1cLM4/nPJTj
 H29YwwA2yOHKGRkwVWmfVXYMtSAhUulaaQlkyaEt8//54J7u5zREZhOgGDZMCl847NYh1MKgl5q
 +gFjCoxE9FBAxNeA4A6Eng7+yqk/jlig/qneqMAvuCLPJ3OPmtfmkYz2LYJlUPnjAd6+MEyDNQK
 Y9hu89YOqVVqxAui+S70WTq2619iLCviP6R2R2fCHqwfuUCn+bWtVXetsMMToMAGHG+H1A2q6R6
 uUWRuB58DsNChrIJ2vf1ZcO4XxvAeYCjlz3BLOiYS79/2yY6vuaJQ+hmac4xUgo14d6dYyGtrqk
 v/rvfCXm+oOJByf73JwwGvIHqJUWIUB2Co3pF30nxNs1CPUwtuc5HzfZD1+TChAOCa9dOwY/Vqo
 6hY+E16LU2NBA3BMavrFyJ6H+pQ23w==
X-Proofpoint-GUID: hflCaHETrEN4S89Uv7Ctty-xGMWDDYgv
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ee24a0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dw0t6H4-AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=42BIMu8lzX7HwdldZjoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=wVJa4CU9-Z26yuRAZDil:22
X-Proofpoint-ORIG-GUID: hflCaHETrEN4S89Uv7Ctty-xGMWDDYgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/13/25 1:04 PM, Kamal Wadhwa wrote:
> On Mon, Oct 06, 2025 at 04:28:59PM +0200, Konrad Dybcio wrote:
>> On 10/1/25 2:23 PM, Kamal Wadhwa wrote:
>>> Hi Krzysztof,
>>>
>>> On Thu, Sep 25, 2025 at 1:41 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
>>>> <pankaj.patil@oss.qualcomm.com> wrote:
>>>>>
>>>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>>>
>>>>> On Glymur boards, the RTC alarm interrupts are routed to SOCCP
>>>>> subsystems and are not available to APPS. This can cause the
>>>>> RTC probe failure as the RTC IRQ registration will fail in
>>>>> probe.
>>>>>
>>>>> Fix this issue by adding `no-alarm` property in the RTC DT
>>>>> node. This will skip the RTC alarm irq registration and
>>>>> the RTC probe will return success.
>>>>
>>>>
>>>> This is ridiculous. You just added glymur CRD and you claim now that
>>>> it's broken and you need to fix it. So just fix that commit!
>>>
>>> I'm afraid, but this is an actual limitation we have for Glymur
>>> (compared to Kaanapali).
>>> The RTC is part of the pmk8850.dtsi that is common between Kaanapali and
>>> Glymur. On Glymur (unlike Kaanapali) the APPS processor does *not* have the RTC
>>> IRQ permission for the RTC peripheral.
>>
>> This is interesting.. is that a physical limitation, or some sort of
>> a software security policy?
> 
> This is mostly a limitation for all compute targets(like Glymur). On compute
> targets we need to support ACPI TAD feature[1] this feature uses the RTC alarm.
> In a nutshell, this feature implements 2 times - AC ( adaptor power) and
> DC (battery power) timers, and based on active power source(AC or DC?) at the
> time of timer expiry device will either go for a full bootup or stay in power
> down.
> 
> This feature is implemented on a different subsystem (SoCCP subsystem), and
> since the SPMI `IRQ` permissions can only be assigned to only one subsystem,
> so we can't use the alarms on APPS. This is why we use no-alarms DT to register
> RTC device without alarm-irq support.
> 
> [1] TAD specification - https://uefi.org/sites/default/files/resources/ACPI_5.pdf
> section 9.18

Hm, is there maybe some sort of an interface to talk to the SoCCP
and set the RTC as we wish, from the OS?

Konrad

