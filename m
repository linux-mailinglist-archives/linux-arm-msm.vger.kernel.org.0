Return-Path: <linux-arm-msm+bounces-78523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0910C00568
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4861882621
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3129F309F19;
	Thu, 23 Oct 2025 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DU4i7kTL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3234305976
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761212778; cv=none; b=pgrcYUOTQ5aZHUnLHBZRmfg5RywQoy3kBpLO656IWQjmLha32Tj2mYzSmcOHI0nCrvhQrZFFgEGgWd/ETeyBRvmhqsHfVTN3eqwUQOB9f8w+rSpaWd8nyVG+LNiwnshD8AQRQSZZsqdFF7Ydkx9YMJLN02guj60Wqi4YyNir46A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761212778; c=relaxed/simple;
	bh=/zzyfqI1GWC6rbxv6U3DhjywDwjjR1Wgryy0JdaC0vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFHOWNoUkDuPzbVpKJM0dnvNgUPVdIk7jLACGVKMjmU2LgJCWWOuENLyhZxeqf35DnUU6k35CItVw0sfLVOivb74mYn1QWlMG04Mq0MnRTzvkNBv41i6meuhnydlIK3xMoUUCTKa6SNUXfghYEZPp5QQCr2WozaJb+qKyepYORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DU4i7kTL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N72JNh011684
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/rdWFEDoY0e0ccprEgn3vcjXMen3ykKbsVJ0M/ZEss=; b=DU4i7kTLq98cjMxY
	gmRIbSOYDDK98w5tvRcP2nMdMia2r53Mma3Tl1UlCKtSWfCjaxIgJa8OAxNer8G0
	fN7jxwIN+ePqG+m53Fm+xSdmUq/eRmuWYCgEXifGsur4Ww+BDWXqxH2Scy4D6f8f
	NyC2vkH1x0sLUklOPSxoZrv7Kn7oIvqNfdhlIvDR1sHRsb+dWUMDGlnqu+rWuZ0q
	gIWNV/89kRc4LoMHv/2YRb2wCWPcDZLAInP/P+hgBe0M8ebPqyd6TDt552Qs5lrW
	lmYiUJGHAtI1OkbkPRUfG3kz7Vv5gVaz8+7Nv5vnj0GOCnbeRwBu40THdZmKaPNZ
	MmcOJA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524a2wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:46:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290992f9693so16310865ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761212775; x=1761817575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/rdWFEDoY0e0ccprEgn3vcjXMen3ykKbsVJ0M/ZEss=;
        b=QwgFE/9CSvBJlM3vGHJA5kCLY2C0ThLVxAffrOvFn7Myb2+JtfisHYhdThhBXzU/w9
         To8clrz9q9kyz9sBnX8jJ/V0WUmT6lw1EpunkL/LnozYez76/EqaVZHCTgGTbNGIqK2r
         p7rpzxYfLzKirL8kKj4XCKZxZKT6mWEWcWnSr2Bv/FJNsQQPSqFTAnjjJrBfMn57vOOL
         AO8IAKqWdJauothGP6iV3aLdWDLBJ0M4nP6pSJS+jPALKsPum/L4ydkJ1u+EVWdSreHe
         cPahMaiYvdxHa8szz799VWdaI7mx14rcavusSsM8Ssmsbu0NizjXkWrsfJOgzxfUOToh
         ccpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUshAUgNT/BHHBuw1eQ31WOT1fC6WLbIWEbAhRypLEB87zgi5ILHtnfKcFpRDwmYGqIA6dR3ZgeWjyNqWuQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUhWRUhdN3Tkm2BvKeWvzD0X/QFDmr4H6H8eTTpSJ/srxut43
	WPFR3BOzBK1lzdbuIYV8oDyMMnkjlr53tXB04Jv32GTk10PRT+COXC6bd5nNQyLUGKOsSMFiWh9
	D6XXTGCixsNq/57CTYvNL7BUA516KaOcQy/r4Pbx/SXKV8imTHzzgh81T/sgunrtyrtRx
X-Gm-Gg: ASbGncvgoDzzCX1C1EfsQOCvpA/i2SqubIwXERmifxDI/zOE9ncOhWgMvFbJr62k19u
	N/UeC0glv72Ku8+r411A7zG3XpWyX0I3itykcGqryG1FDCMxaJ87lKpzsYjvUTVXEltAFoQfCnY
	5VwzPLZiZJnwSTiW5hNeZn6gb4Eq395O4G6DijypHGdLVzMjdnr9KfjKC/T7gc0kMkPfBNvjLCm
	+bFGoEY7u3MCTb91oBmCltT4UgoXcDOi2/JTZ54kqcGsMmEphLrL4hSo//RA4folieCIUcr0rxo
	fH4odGdXAqAUarRItPi7LccHNdU3Zzh8ZPqd/YCTz5Ru2xQKSecXokBVSMnvBFLGLTFc5ryZS1k
	VIeVwp0SqMSUwM8OSCx/kyhY=
X-Received: by 2002:a17:903:1107:b0:271:9b0e:54ca with SMTP id d9443c01a7336-2935e04b272mr57496415ad.13.1761212774888;
        Thu, 23 Oct 2025 02:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+rCl4FXeidBANxzSUeLVvoA72I8aUoNHILGqf6sbGJKMCWJxjC37VjIhDYOs2bxv5z0xp0A==
X-Received: by 2002:a17:903:1107:b0:271:9b0e:54ca with SMTP id d9443c01a7336-2935e04b272mr57496205ad.13.1761212774412;
        Thu, 23 Oct 2025 02:46:14 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb0196831sm1843255a91.20.2025.10.23.02.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 02:46:14 -0700 (PDT)
Message-ID: <9a227c15-dc60-4086-8d81-f80e3398a083@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 15:16:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <litd6qcxuios7uwwcrz55ea24kj26onrjo2aekouynsce6wslj@vatjbulg64mb>
 <4831d12b-a42a-464a-a70f-e0e40cf4ae4b@oss.qualcomm.com>
 <5c0b4712-4a54-4a1a-ad73-dc3bdb21a0ff@oss.qualcomm.com>
 <cb361d77-6845-45c9-b418-67649880495e@oss.qualcomm.com>
 <ef247fe6-6d9c-4a74-b3f8-a56857332758@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ef247fe6-6d9c-4a74-b3f8-a56857332758@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX4JuCNoUGObFO
 vwG2VKcpH2Vk7W4bXLIHaM/lEG+TbvLsGJCicc18z8aVY2U59dolFQcZD9WRE8zUYATjACUUseF
 G4Gi9YH3VvaP4vHPrrr9JD9xG1Haz7xVwRCuMG5zUDv5FVZ+XaB0EA8zKgT5tdROhA7+Xxne25L
 79iyRKwpdrGmpiY0QTIkSaikIybahuWDqthqd7n2UbWhSnzxyoFaG77rsAbxFUsFk27P9a+lbg6
 8eXnTZmvdcC+AoogOR8YIJe6Kan0859uBQJNUeH8yGZVbaWjjgQIf1gaa1R0OHyq3b8pQ9YZO7n
 cz6r8ijgJss1L+cE79eGHk/8EnveUUmBmLbikcSzWTJgScBXYXf5XrNbxvNKPEKnGs306QUd5jy
 mng5cx63N2UYdUcLzel6eIb0K6oJiA==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68f9f967 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YAA2XIu200uozTIaui8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: fKbE-3f51sEazbJHad3kxw0-7N2GQTAI
X-Proofpoint-ORIG-GUID: fKbE-3f51sEazbJHad3kxw0-7N2GQTAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155



On 10/23/2025 2:39 PM, Konrad Dybcio wrote:
> On 10/23/25 10:57 AM, Maulik Shah (mkshah) wrote:
>>
>>
>> On 10/23/2025 1:47 PM, Konrad Dybcio wrote:
>>> On 10/23/25 6:46 AM, Maulik Shah (mkshah) wrote:
>>>>
>>>>
>>>> On 10/23/2025 2:51 AM, Bjorn Andersson wrote:
>>>>> On Wed, Oct 22, 2025 at 02:38:54AM +0530, Kamal Wadhwa wrote:
>>>>>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>>>>
>>>>>> All rpmh_*() APIs so far have supported placing votes for various
>>>>>> resource settings but the H/W also have option to read resource
>>>>>> settings.
>>>>>>
>>>>>> This change adds a new rpmh_read() API to allow clients
>>>>>> to read back resource setting from H/W. This will be useful for
>>>>>> clients like regulators, which currently don't have a way to know
>>>>>> the settings applied during bootloader stage.
>>>>>>
>>>>>
>>>>> Allow me to express my disappointment over the fact that you sat on this
>>>>> for 7 years!
>>>>
>>>> This was a dead API (even in downstream) with no user since SDM845/ 7 years.
>>>> Read support was eventually removed from downstream driver too for the same reason.
>>>> There were early discussions to remove read support from RSC H/W, due to lack of users.
>>>> Its not realized yet and all SoCs still supports read.
>>>
>>> Can we read BCM states from HLOS this way too?
>>
>> Yes, Any of ARC/BCM/VRM can be read to get HLOS/DRV2 votes.
> 
> Wow this is amazing..
> 
> Do you have code for this already, or should I hack on it?

No, it won't be of much help, as i said above it gets HLOS/DRV2 votes only for a given resource.
More specifically, the read does not give the aggregated vote result across all the DRVs.

Thanks,
Maulik

> 
> Konrad


