Return-Path: <linux-arm-msm+bounces-85664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4975CCB24E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 10:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27B03303067B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E680D2D838B;
	Thu, 18 Dec 2025 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfCdrK5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0mQVVy1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086DA221FBA
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049724; cv=none; b=iGxqCwe82KFW3Qz7Ime91y61qpj+EDum95cV/K5V+SeSYNnSLHp72+0n1mfQAvhxgeolglKKjCxvaicIr03wBh46Bg/HN3gD3YbMuuLjbtNUgR7E2c8HANhBiR45z3QMVAypR8AtXyjuSK4Tb2oVzjncfqGTlofyqfBelxxY5xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049724; c=relaxed/simple;
	bh=ILkKnSgdx1Vjr/GQRK0eoewm5hFuzy/lM1yy6pf6u+0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bG/Pkp8RA4SkqFVli+BxXrgRsM6k8776q/H7XCcQrS/GNzUZV1LDB8FnbFk14Ah1F8ESdcI86xrZRE53S5ESWgLOZm7aBkEwAWNi+cfyypLXMSMiCkKrACDVE/0ucZrZk77izXIj8E89BjfpRTcrPk0J1ZIy8j9l2gmETnF9oxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfCdrK5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0mQVVy1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI3ap3r754967
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 09:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgHX9pYcPQfW6md0ZjUE2FQJois1n68EFQVDIEMBBjg=; b=jfCdrK5Qy9sptl4L
	eSYM8EMuNaZnUfittbO1PRwkmwAGkEHNtcZz7wLDjeqVTpJj7aeqfhd2XoD/pEf9
	rhHt1AOYlKHsYeKcBujcqlShpB/02x4zLIJCcWw9t1oNUHNdkvA4ZFLKbQcPPues
	OB1vX/hiyyT5EoJ3+3mnIX35xYuc/LeHDZAqsvS6yx9Vep7Y4IVRhXAm9yaYddBu
	JNuP1Q4E0exEAepbvHth8xMgDL8IRHSGhIXo7Dt5M+FTOiBwWfxrSKQxDWdXHBCd
	b4/4Wu5jGebUSPXQ1ZTcijHGlNfFGcy0Pb6ZymYu6Zv9PG8Z/y/ZM7Q711ukz3cv
	/66ZOQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0rxmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 09:22:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11ddcc9f85eso2475468c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766049720; x=1766654520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgHX9pYcPQfW6md0ZjUE2FQJois1n68EFQVDIEMBBjg=;
        b=j0mQVVy1T3fjXSKPy2MDwkVCKHT8adMf2Dgup5w2UTpw0qny52U22QHYNzKWpQgg3S
         6T8xsxk1oXGweCdgbG/VUl7/cHW16/q1pJzLXYC5WbfNCQY5RDythowuwWuiN4r9xKEb
         yc95UpjqP5lTRJ1H08JSrZIP046rW5Y+kdmAtoAnxXurrFl9PFyoDNpT3DGNY0wZhXn5
         W2SLFYexEekWQMecCu+HTvJ1Rb12aTMJLXEiVFIZyrSZyF+zCGoXbBhf5w3spEzg/ZTV
         9Msdj62FYVgR8LS9Ylf6jDCuXHWUHIcK3Aa0ywnuLi24Gfbarim1p7e54WukTUX7MzZR
         bMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766049720; x=1766654520;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgHX9pYcPQfW6md0ZjUE2FQJois1n68EFQVDIEMBBjg=;
        b=TQ3aWvTZw0jTvtG42nSyMZKje544Kb1lqIdOiFFj8e+ZSLlz5OqEGHXaZbNgFpOlkf
         AgQsYWb0SIsW2T1RfN/dKXaoP2xi6mdl7wZvtDTZ0qfDnm8W2oXZXKsfd+94TB9YddKV
         Tkr+GOX7zgVOe966M0sndmy7GXZgLHxA37xUeD74hYVqY2pCnLuwE+wKhUIg23Fuwb/D
         3Iaf+28fURwrvlpBzebwkI+KIpgPnRXS5t7LPpvSCfl5Kj70j8vPiaDNpDBGc3wlC2hP
         +T0gtkGM5yO/tIkD/RCpIqWX7jJ/YWENMHfDFAr2YRf4GicZrdRBDQW4y0+RkDMRBYU2
         +AKg==
X-Forwarded-Encrypted: i=1; AJvYcCUm1xnLL6qp9GU0li6QkupZy4OMINsZdfyqFYjb99TzuHC/doOWXXPaPS+dDH5HhpELaG74NDNVOTAiUzM9@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPAVolsuP8cekl52+dIRAKkzRIRhIDE0UMkQzlowM1vFQsiv3
	Qnie3PSguHR7hnkTMY0msbizRx471bQ1WMlHhnCpZw4/3LnwZwdveiKC4mqxogxr/CrpkI4vqOS
	UruVS81s7eeREkdLHaMdsl1tGkY+UNZlLXvH2GbqT79RWtp72kiz9Hx7oN4uT9hZo+fZ/PbPLnt
	WvjEs=
X-Gm-Gg: AY/fxX4ibACCWrN75L8lMepzM81n3t/gq9TFcJBAbaGSTip8Upo38SDv8J1Ubnn8zFp
	kQp4iON4A+03OgtcMhJn4Z4Qs3yVPWXH+QxP7+qxhJT6QaxljNt/CBXIKW3PZ+ypGHhpz8cgyOu
	NHaIEcI3mKM2wx3LB97AygeP99wFmC3t/P+NH6cUkZUjVzw8mQMV5LZyh22u4cqfYyFBSdQpg6r
	Pq41AkONCPnkISJXWlCa3A7k9yl4IpLsIsuYo5NjQ/CR8H1ro/GqyiyjzshsdtXuOmDJGDqN0kX
	tGRmR91J0YF83j4zmIb6XBo04FA/LPCZOQZl/VznuRK264EG7qch8uAYw1airRDuQoEeX08B2vN
	grEr2+IuWhFHza1bRUQmYTXtBpYgjCVibmHR7+gtoWDu65Mm1CckCXHG+5lUzE2rYd1Ur
X-Received: by 2002:a05:7022:4091:b0:119:e569:f850 with SMTP id a92af1059eb24-12061939389mr1496440c88.7.1766049719428;
        Thu, 18 Dec 2025 01:21:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWZwU7+MwWlNRSFY7/Wt7vS7Q5ni8+brmu5szTk2tVEMpkap34gTrYXnw0ZGnEDSVoE64K1Q==
X-Received: by 2002:a05:7022:4091:b0:119:e569:f850 with SMTP id a92af1059eb24-12061939389mr1496422c88.7.1766049718848;
        Thu, 18 Dec 2025 01:21:58 -0800 (PST)
Received: from [10.110.90.237] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061fc5613sm5821179c88.11.2025.12.18.01.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 01:21:58 -0800 (PST)
Message-ID: <3427ac3e-671e-4c5b-99aa-69eb7927df8c@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 17:21:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
References: <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <gpfcofdq3yhudisyhgu5r7rjwc66bxdjvbj7vyyrgby77uxs5u@mfkxgck3ll6y>
 <aUO1k06T3YUGX7kV@hu-qianyu-lv.qualcomm.com>
 <84b14cdf-8549-4a00-8dcc-bb5bd1918cfe@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <84b14cdf-8549-4a00-8dcc-bb5bd1918cfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5759AUkQ5QKDSTymwmUSJfYkoAsCruNY
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=6943c7b8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UKmd_gf9YB3IPwsdKd8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 5759AUkQ5QKDSTymwmUSJfYkoAsCruNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA3NiBTYWx0ZWRfX39+/0pdcvEIJ
 ziadvvioV6zVOo8K+Blqw3Fyulj1qg4QI8wzsX4ICHyB0NMS8I4/jmg+8yINIIt/CnS1m0ykM2F
 p/2W/2fSzLDHcJSEPM6hwr4Zqb2f/RFQQt//r44njmpV7n0cdPNaU0RLClu06nfiHbmqguNzl31
 /B6FISLDUC7uulPebYd2d4icgzI0bJ620yDklsGoj8+cBagheRvp6d731aRSZEoyfn50idusqJC
 MJML0pcK0GIsRn/UUeBMyWCbh3Gy/MEhTPnFGhq2D1xUSTKNRmx1gJkyT7tc86WXdmMeoZ/RBHB
 BUDnWCdL+Q7mKsPmrMfyzKEoq3lQYrBGmNWy9eqPc0nq1Xq0eiNO+L6WGRStezcpkOSlnPjBz4l
 Q/rtT1VJUg0xpBJ95L2GEkv74kbj7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180076



On 12/18/2025 5:13 PM, Baochen Qiang wrote:
> 
> 
> On 12/18/2025 4:04 PM, Qiang Yu wrote:
>> On Thu, Dec 18, 2025 at 10:25:08AM +0530, Manivannan Sadhasivam wrote:
>>> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
>>>> On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
>>>>> On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
>>>>>> On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
>>>>>>> On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
>>>>>>>>> On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
>>>>>>>>>>> On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
>>>>>>>>>>>>> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
>>>>>>>>>>>>>>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Currently, the FBC image is a non-standard ELF file that contains a single
>>>>>>>>>>>>>>> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
>>>>>>>>>>>>>>> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
>>>>>>>>>>>>>>> separate ELF headers for SBL and WLAN FW segments due to TME-L image
>>>>>>>>>>>>>>> authentication requirement.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Current image format contains two sections in a single binary:
>>>>>>>>>>>>>>> - First 512KB: ELF header + SBL segments
>>>>>>>>>>>>>>> - Remaining: WLAN FW segments
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The TME-L supported image format contains two sections with two elf
>>>>>>>>>>>>>>> headers in a single binary:
>>>>>>>>>>>>>>> - First 512KB: First ELF header + SBL segments
>>>>>>>>>>>>>>> - Remaining: Second ELF header + WLAN FW segments
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Download behavior:
>>>>>>>>>>>>>>> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
>>>>>>>>>>>>>>>           2. Full image via BHIe
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
>>>>>>>>>>>>>>>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
>>>>>>>>>>>>>>> supported image format. When set, MHI skips the first 512KB during WLAN FW
>>>>>>>>>>>>>>> download over BHIe as it is loaded in BHI phase.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> What is standard about it?
>>>>>>>>>>>>>
>>>>>>>>>>>>> The TME-L requires standard elf image format which includes single EFL
>>>>>>>>>>>>> header and WLAN FW segment.
>>>>>>>>>>>>>
>>>>>>>>>>>>> The "standard_elf_image" seems misleading. Since the new image format is
>>>>>>>>>>>>> required for TME-L image authentication, how about using 
>>>>>>>>>>>>> tme_supported_image?
>>>>>>>>>>>>
>>>>>>>>>>>> Just elf_image?
>>>>>>>>>>>
>>>>>>>>>>> Is it too generic for this specific use case. Current image format also
>>>>>>>>>>> contains elf header.
>>>>>>>>>>
>>>>>>>>>> upload_elf_image?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
>>>>>>>>> defines that an ELF executable can have only one ELF header. So I'd prefer
>>>>>>>>> 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
>>>>>>>>> used previously.
>>>>>>>>
>>>>>>>> What kind of ELF image was used previously? Could you please explain
>>>>>>>> what do 'First ELF header' vs 'Second ELF header' mean here?
>>>>>>>>
>>>>>>>
>>>>>>> I don't have the details of it, but Qiang should be able to explain. But AFAIC,
>>>>>>> that was a non-standard ELF image and the new one is going to be spec
>>>>>>> conformant.
>>>>>>>
>>>>>> Previous image format:
>>>>>> ELF header + SBL segments + WLAN FW segments
>>>>>>
>>>>>> The TME-L supported image format:
>>>>>> First ELF header + SBL segments + Second ELF header + WLAN FW segments
>>>>>
>>>>> What is the Second ELF header in this context? ELF files usually have
>>>>> only one header. Are we repeating the same ELF header or is some kind of
>>>>> an embedded ELF-in-ELF.
>>>>
>>>> The "Second ELF header" refers to a separate, complete ELF file embedded
>>>> within the FBC image, not a duplicate header. The TME-L supported format
>>>> contains:
>>>>
>>>> FBC Image Structure:
>>>> ┌─────────────────────────────────────┐
>>>> │  Complete ELF File #1 (SBL)        │
>>>> │  ┌─────────────────────────────┐   │
>>>> │  │ ELF Header                  │   │ ← First ELF header
>>>> │  │ Program Headers             │   │
>>>> │  │ SBL Segments                │   │
>>>> │  └─────────────────────────────┘   │
>>>> ├─────────────────────────────────────┤
>>>> │  Complete ELF File #2 (WLAN FW)    │
>>>> │  ┌─────────────────────────────┐   │
>>>> │  │ ELF Header                  │   │ ← Second ELF header
>>>> │  │ Program Headers             │   │
>>>> │  │ WLAN FW Segments            │   │
>>>> │  └─────────────────────────────┘   │
>>>> └─────────────────────────────────────┘
>>>>>
>>>>>>
>>>>>> As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
>>>>>
>>>>> pointer?
>>>>
>>>> The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
>>>> ELF excutable file, I can not point out a specfic sentence or phase that
>>>> tell us the previous image format is standard. But at least there is an
>>>> example we can refer to: Figure A-4. Executable File Example. And I can
>>>> also use readelf cmd to parse the image.
>>>>
>>>>>
>>>>>> is also standard elf image. But it doesn't meet the requirement of TME-L
>>>>>> because we need separate elf header for SBL and WL FW for TME-L
>>>>>> authentication.
>>>>>>
>>>>>> So the commit message stating "Currently, the FBC image is a non-standard
>>>>>> ELF file that contains a single ELF header, followed by segments for SBL,
>>>>>> and WLAN FW" is not correct and standard_elf_image is not accurate.
>>>>>>
>>>>>> Can we avoid saying anything about standard in commit message? Flags eg.
>>>>>> separate_elf_header and tme_supported_image are more accurate.
>>>>>
>>>>> Please define, what is the supported image.
>>>>
>>>> The supported image refers to an image format that TME-L can authenticate.
>>>> Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
>>>> format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
>>>> authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
>>>> first 512KB of fbc image) is loaded over BHIe and also authenticated by
>>>> TME-L.
>>>>
>>>
>>> So what makes it different here is that you are now sending the two FWs
>>> separately as standalone ELF image to the device for authentication by TME-L,
>>> but those are combined in a single image file in the host. But what makes you to
>>> combine two images in the first place? Why can't they be separate ELF files?
>>>
>>> I think you can avoid the hassle if you could just have separate ELF images for
>>> SBL and WLAN FW and say that the TME-L just expects individual ELF image.
>>>
>> Yes, they are two separate images combined into a single file. I'm not
>> sure of the specific reasons for this design choice, so I can't comment
>> on it. The WLAN team provides a single file for both SBL and WLAN FW, and
>> I don't know whether they're willing to change.
>>
>> Baochen, do you have any comment on this?
> 
> Hmm, sorry, no idea :(

I mean I don't know the reason behind the design choice.

> 
>>
>> - Qiang Yu
> 


