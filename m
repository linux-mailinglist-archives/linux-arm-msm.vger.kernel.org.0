Return-Path: <linux-arm-msm+bounces-77335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8CBDD6EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2BBE1883045
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 08:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DD529B8C7;
	Wed, 15 Oct 2025 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DR2gI/ld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A22526E153
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760517143; cv=none; b=nL5bRMIRMVEzlzNlDpLUW1Ur4Qa1kcvEQ7bbWhvNzMWTbQVJiLMVSGVKRZliPYgLNK1W8OrYX9kBKnPizcV/Whr8xwTKYZHX4WYdusOoSG41lJdqJoIrPc00KYIhRlyxl0rd73QwnMtjC05lEph0GYRTG50QxZDgrWm+0ATk9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760517143; c=relaxed/simple;
	bh=54EuQoS6B8UL0Pg86Y4r8hyQKoaP9PLNiqeT+28m+OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVfNLlGq0t/rPJu3M0wPAZOcEe7YSdW9Ja8sO9RAK6zHGBNvl58iHiHAP3e7MX8XpxQnP4FY4TniD7FrUOX2DDUyVBELD5IhJg561ocP2Dyhh9wFz+YYq/+y/Z7jnMvIEQXzNS6CvocOdwXzklkFlCOOruY7hVaxSh05+YigRCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DR2gI/ld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7ps024771
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	loSZb3UKRcnqLSPzPJ5d/twBrUq6/Tgr8WaTEX2esuA=; b=DR2gI/ldkCoJyP87
	tvCtRESPm+2rixHdyswGAqnO/O4XRMMtIVMlcyq5f4FBXYlr+61LSfQe3BFfhaCQ
	p4I823eBlizhhm9zOMX/WTNdKuVg/wfnbYciM7DibQL/yKXBZZsLE9x/Pgjub0O6
	+MeEKKnru66y3hLlqDAuGWuTeckpOKiaItCaOZgBrUBckxO2Hti7eBEh7yjNJKFo
	Opf6JhdNfKSTHtj+BzAahKTiZVWuRclrAP0iT0lBH1RFfqlqjDDtxSyYgVU/WvSe
	C++6Yd5v8o39OWzLNNlIY2CP7+GaPXxPZntFSI0qz5/d98HKaKFjHdCeB3FFlpZ2
	BDmEZg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0undk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:32:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55283ff3fcso8220968a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760517140; x=1761121940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loSZb3UKRcnqLSPzPJ5d/twBrUq6/Tgr8WaTEX2esuA=;
        b=GevKEeHJUeEIqy0NZF9BgBrIiPg6mAv5h+djGjyIIn4msIAVLtsVFj6jCcNxkdx+/C
         k8+3aAQX7cx84vroESaU4HOxP4KoifWOLVT7z3e/9B8eB79dLyVTF/kb5nw9EV8DHfWV
         YDTQyeanxFITjn/oUAs3PfNjnvwF2gAR/uMwm4FXmb/e7Ag/hCCqSPwBqQw3ER4rrxLN
         nQFoQ43PzLvCwJgrXr0ji5UiEkMFt1XDIM0JDubzvxeDEnuWtx4Fv87e0kNBTDS4WhPo
         Ie6+jN0AoxOwgrZD9EJe0T1/zGXPNJYU2cHEYP5R4XSUEv0bDmSQO9PWoEers1gVaLNh
         3Baw==
X-Forwarded-Encrypted: i=1; AJvYcCXD/of6kh7DFQTXU1Vy/hwSJM5wwZceQWOF/FFu4JdzMCKA+yWCQAK/B2z4EdXonERa7j0XOKFGNXsv4HWN@vger.kernel.org
X-Gm-Message-State: AOJu0YyhdgdmYC0Q4xqhhS/XoTokp+3Okv16mZVsP13czBCqaHW/TgZ0
	i73RyGML+6dhDEaxPb6u7jH4fMex+5mERdFwitOJYM7QIqEFob+pt23qAkxKCz3Gmolqcze55T0
	RNbtma+DElZIrTWEm535oZBjrguSLcDEnLFEEhGNKmSid4gV+7nlI7ORdOjafbrDgFDlv
X-Gm-Gg: ASbGncsoZ8J94l27fHbG7j0m2/CTdSCarncOHaNtIJFTA69h+xh7hdOfkDMXKhCIy92
	GnIZ8sdshESN3sQtKE4nZqQr12RGdIuCe/8BimEo3fg+a4LJzr2nba/6A4tsz0GuM/DD5DL2cge
	hO0l/kKx+Y4I/2fWkyvRAsbPgroZ4d88c5j5PLuS4hfmzM226ushK23Xh81Sh5htVS3hTM1CVvC
	VSZCE+V6lz96uFneEzifV+ukh2vJ6doR0ZducPuWno4nVN+0k10mpRS8paD0tvlicoZsJ1Y8IeJ
	LmL9sZuzpnCyT/9EA6XTKtrVaLLsGww0TUVs0JwQ0aeK02FntBjMlscYAFCtLGW47Cvb
X-Received: by 2002:a17:90b:33ce:b0:32b:ab04:291e with SMTP id 98e67ed59e1d1-33b513cf7bbmr33605547a91.25.1760517139321;
        Wed, 15 Oct 2025 01:32:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBGKNI7RjllXhh9cgP5cCIUvBLZPFYGB5ZHbyhFXQ8/pQ0I27Uf1HDvN8vcgRVQvrZ0himhw==
X-Received: by 2002:a17:90b:33ce:b0:32b:ab04:291e with SMTP id 98e67ed59e1d1-33b513cf7bbmr33605506a91.25.1760517138634;
        Wed, 15 Oct 2025 01:32:18 -0700 (PDT)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm1571899a91.20.2025.10.15.01.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:32:18 -0700 (PDT)
Message-ID: <3394e094-ffb5-4503-adde-7c382e3f2f6e@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 14:02:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: joro@8bytes.org, will@kernel.org, saravanak@google.com,
        conor+dt@kernel.org, robh@kernel.org, mchehab@kernel.org,
        bod@kernel.org, krzk+dt@kernel.org, abhinav.kumar@linux.dev,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
 <zcgn4xw2xghyna2eysavujbzbiydyki7p7upzzv7one5mdyjy6@sj7f75kc4vwu>
 <58790287-4787-4763-a979-69df60de9263@arm.com>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <58790287-4787-4763-a979-69df60de9263@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2wPicagyllZo
 /PaTBH4OMsj4Kbp56mN4ES+VqffMXxK5TBs1ME/TVnmgSyG9ugnfAgHyTU3rJypAmg+4ZC8T8Of
 PXnDwHNXb/azNBgHv35ZEyMRtA/LaKD0V2/qMN47LY3hfGhnnVMZlgwi9fBc2Zn3SgWRVzxcGJp
 NJ4rdFr/AOhfJADlMh7IHsv89XQCFhPg1bVSCJ009mVk2yrZLRdUawOgB2z+ikm1uPrvvEbrBi+
 JVUcA2F98133rdfvYEPaPpFYkQZiFsZfnWfch7Vson8Uh46pZZtWIYwdEX41NtmGWk7CV7hfCu5
 +V8SZ4w6vjcsCFh/j12RpV7czM1z1F4onJ0abmvdg==
X-Proofpoint-GUID: yJDiZ3T7RUIbmsk8H_p7UenlKbOJHTNk
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ef5c14 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=7mb4BiczrQXTlraynU4A:9
 a=HDNzt_P4dw__9pUd:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yJDiZ3T7RUIbmsk8H_p7UenlKbOJHTNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 10/14/2025 7:37 PM, Robin Murphy wrote:
> On 2025-10-13 1:31 pm, Dmitry Baryshkov wrote:
>> On Mon, Oct 13, 2025 at 12:20:54PM +0100, Robin Murphy wrote:
>>> On 2025-10-09 7:25 pm, Dmitry Baryshkov wrote:
>>>> On Thu, Oct 09, 2025 at 06:03:29PM +0100, Robin Murphy wrote:
>>>>> On 2025-10-09 2:19 pm, Dmitry Baryshkov wrote:
>>>>>> On Thu, Oct 09, 2025 at 11:46:55AM +0100, Robin Murphy wrote:
>>>>>>> On 2025-10-08 8:10 pm, Charan Teja Kalla wrote:
>>>>>>>>
>>>>>>>> On 9/29/2025 3:50 PM, Robin Murphy wrote:
>>>>>>>>>> USECASE [1]:
>>>>>>>>>> -----------
>>>>>>>>>> Video IP, 32bit, have 2 hardware sub blocks(or can be called as
>>>>>>>>>> functions) called as pixel and nonpixel blocks, that does
>>>>>>>>>> decode and
>>>>>>>>>> encode of the video stream. These sub blocks are
>>>>>>>>>> __configured__ to
>>>>>>>>>> generate different stream IDs.
>>>>>>>>>
>>>>>>>>> So please clarify why you can't:
>>>>>>>>>
>>>>>>>>> a) Describe the sub-blocks as individual child nodes each with
>>>>>>>>> their own
>>>>>>>>> distinct "iommus" property
>>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks Robin for your time. Sorry for late reply as I really
>>>>>>>> didn't have
>>>>>>>> concrete answer for this question.
>>>>>>>>
>>>>>>>> First let me clarify the word "sub blocks" -- This is just the
>>>>>>>> logical
>>>>>>>> separation with no separate address space to really able to
>>>>>>>> define them
>>>>>>>> as sub devices. Think of it like a single video IP with 2 dma
>>>>>>>> engines(used for pixel and non-pixel purpose).
>>>>>>>>
>>>>>>>> I should agree that the child-nodes in the device tree is the
>>>>>>>> easy one
>>>>>>>> and infact, it is how being used in downstream.
>>>>>>>>
>>>>>>>> For upstream -- Since there is no real address space to interact
>>>>>>>> with
>>>>>>>> these sub-blocks(or logical blocks), does it really qualify to
>>>>>>>> define as
>>>>>>>> child nodes in the device tree? I see there is some push back[1].
>>>>>>>
>>>>>>> Who says you need an address space? Child nodes without "reg"
>>>>>>> properties,
>>>>>>> referenced by name, compatible or phandle, exist all over the
>>>>>>> place for all
>>>>>>> manner of reasons. If there are distinct logical functions with
>>>>>>> their own
>>>>>>> distinct hardware properties, then I would say having child nodes to
>>>>>>> describe and associate those properties with their respective
>>>>>>> functions is
>>>>>>> entirely natural and appropriate. The first example that comes to
>>>>>>> mind of
>>>>>>> where this is a well-established practice is PMICs - to pick one
>>>>>>> at random:
>>>>>>> Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
>>>>>>
>>>>>> Logical function, that's correct. And also note, for PMICs that
>>>>>> practice
>>>>>> has bitten us back. For PM8008 we switched back to a non-subdevice
>>>>>> representation.
>>>>>>
>>>>>>> For bonus irony, you can't take the other approaches without
>>>>>>> inherently
>>>>>>> *introducing* a notional address space in the form of your
>>>>>>> logical function
>>>>>>> IDs anyway.
>>>>>>>
>>>>>>>>       > or:
>>>>>>>>>
>>>>>>>>> b) Use standard "iommu-map" which already supports mapping a
>>>>>>>>> masked
>>>>>>>>> input ID to an arbitrary IOMMU specifier
>>>>>>>>>
>>>>>>>>
>>>>>>>> I think clients is also required to program non-zero smr mask,
>>>>>>>> where as
>>>>>>>> iommu-map just maps the id to an IOMMU specifier(sid). Please
>>>>>>>> LMK if I
>>>>>>>> am unable to catch your thought here.
>>>>>>> An IOMMU specifier is whatever the target IOMMU node's #iommu-
>>>>>>> cells says it
>>>>>>> is. The fact that Linux's parsing code only works properly for
>>>>>>> #iommu-cells
>>>>>>> = 1 is not really a DT binding problem (other than it stemming
>>>>>>> from a loose
>>>>>>> assumption stated in the PCI binding's use of the property).
>>>>>>
>>>>>> I really don't like the idea of extending the #iommu-cells. The
>>>>>> ARM SMMU
>>>>>> has only one cell, which is correct even for our platforms. The fact
>>>>>> that we need to identify different IOMMU SIDs (and handle them in a
>>>>>> differnt ways) is internal to the video device (and several other
>>>>>> devices). There is nothing to be handled on the ARM SMMU side.
>>>>>
>>>>> Huh? So if you prefer not to change anything, are you suggesting
>>>>> this series
>>>>> doesn't need to exist at all? Now I'm thoroughly confused...
>>>>
>>>> Hmm. We need changes, but I don't feel like adding the FUNCTION_ID to
>>>> #iommu-cells is the best idea.
>>>
>>> What? No, any function ID would be an *input* to a map, not part of the
>>> output specifier; indeed it should never go anywhere near the IOMMU,
>>> I don't
>>> think anyone suggested that.
>>
>> It was Bryan, https://lore.kernel.org/linux-arm-
>> msm/9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org
> 
> Ah, I wasn't on that thread. But indeed, as I hopefully explained
> before, that whole idea is a non-starter anyway due to who the consumers
> of "iommus" actually are.
> 
>>>>> If you want to use SMR masks, then you absolutely need #iommu-cells
>>>>> = 2,
>>>>> because that is the SMMU binding for using SMR masks. It would
>>>>> definitely
>>>>
>>>> I'm sorry. Yes, we have #iommu-cells = <2>.
>>>>
>>>>> not be OK to have some magic property trying to smuggle
>>>>> IOMMU-driver-specific data contrary to what the IOMMU node itself
>>>>> says. As
>>>>> for iommu-map, I don't see what would be objectionable about
>>>>> improving the
>>>>> parsing to respect a real #iommu-cells value rather than hard-
>>>>> coding an
>>>>> assumption. Yes, we'd probably need to forbid entries with length > 1
>>>>> targeting IOMMUs with #iommu-cells > 1, since the notion of a linear
>>>>
>>>> This will break e.g. PCIe on Qualcomm platforms:
>>>>
>>>>                           iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
>>>>                                       <0x100 &apps_smmu 0x1401 0x1>;
>>>>
>>>>
>>>> But this seems unlogical anyway wrt. apps_smmu having #iommu-cells =
>>>> <2>. It depends on ARM SMMU ignoring the second cell when it's not
>>>> present.
>>>
>>> Urgh, yes, that's just broken already 🙁
>>>
>>> At least they all seem to be a sufficiently consistent pattern that a
>>> targeted workaround to detect old DTBs looks feasible (I'm thinking, if
>>> iommu-map size % 4 == 0 and cells n*4 + 3 are all 1 and cells n*4 + 1
>>> are
>>> all the same phandle to an IOMMU with #iommu-cells == 2, then parse
>>> as if
>>> #iommu-cells == 1)
>>
>> How do we handle the case of #iommu-cells = <2>? I.e. what should be the
>> "fixed" representation of the map above? Should we have usual cells and
>> one extra "length" just for the sake of it?
> 
> It's not really "for the sake of it", it is the defined format of the
> "iommu-map" binding - IMO it would be far more horrible if each entry
> did or didn't include a length cell depending on the size of the
> preceding IOMMU specifier. It's also far from infeasible to have *some*
> well-defined relationship between a non-singular input ID range and a
> multi-cell base IOMMU specifier, it just needs more IOMMU-specific
> interpretation in the consumer than Linux cares to bother with. Thus it
> is appropriate for the binding to be able to describe that even though
> Linux as a consumer continues to refuse to support it. The binding does
> not describe Linux, or the property would be named "linux,iommu-map".
> 
>>                 iommu-map = <0x0   &apps_smmu 0x1400 0x0 0x1>,
>>                             <0x100 &apps_smmu 0x1401 0x0 0x1>;
>>
Dmitry,  Wanted to understand if you did consider to include additional
#iommu-map-cells in the above representation? or it is just based on the
#iommu-cells?

And this is the same representation for PCI devices as well or it is
still parsed as if #iommu-cells = 1 just for old dtbs based on the
workaround by Robin above?

so, it will be like:
iommu-map = <rid/func-id phandler sid_base <mask> len>;  and if mask is
not defined, treat this as if #iommu-cell = 1.

>>
>> I really like the idea of fixing iommu-map as that would remove the need
>> for other properties, but
>>
>>>
>>>>> relationship between the input ID and the output specifier falls
>>>>> apart when
>>>>> the specifier is complex, but that seems simple enough to implement
>>>>> and
>>>>> document (even if it's too fiddly to describe in the schema
>>>>> itself), and
>>>>> still certainly no worse than having another property that *is* just
>>>>> iommu-map with implicit length = 1.
>>>>>
>>>>> And if you want individual StreamIDs for logical functions to be
>>>>> attachable
>>>>> to distinct contexts then those functions absolutely must be
>>>>> visible to the
>>>>> IOMMU layer and the SMMU driver as independent devices with their
>>>>> own unique
>>>>> properties, which means either they come that way from the DT as
>>>>> of_platform
>>>>> devices in the first place, or you implement a full bus_type
>>>>> abstraction
>>>>
>>>> Not necessarily. Tegra display driver creates a device for each context
>>>> on its own.
>>> No, the *display* driver does not; the host1x bus driver does, which
>>> is the
>>> point I was making - that has a proper bus abstraction tied into the
>>> IOMMU
>>> layer, such that the devices are correctly configured long before the
>>> actual
>>> DRM driver(s) get anywhere near them.
>>
>> Ack. I agree. it's drivers/gpu/host1x/context, not drivers/gpu/drm/
>>
>>>
>>>> In fact, using OF to create context devices is _less_
>>>> robust, because now the driver needs to sync, checking that there is a
>>>> subdevice, that it has probed, etc. Using manually created devices
>>>> seems
>>>> better from my POV.
>>>
>>> Huh? A simple call to of_platform_populate() is somehow less robust than
>>> open-coding much of the same logic that of_platform_populate() does
>>> plus a
>>> bunch of hackery to try to fake up an of_node to make the new device
>>> appear
>>> to own the appropriate properties?
>>>
>>> Having entire sub-*drivers* for child devices or not is an orthogonal
>>> issue
>>> regardless of whichever way they are created.
>>
>> I was (again) looking at host1x. It doesn't fake of_node (nor does it
>> have actual OF nodes). Instead it just mapps IOMMUs directly to the
>> context devices. Compare this to misc/fastrpc.c, which has subdevices
>> and drivers to map contexts. The latter one looks less robust.
>>
>> And from DT perspective compare:
>>
>>         fastrpc {
>>             compatible = "qcom,fastrpc";
>>             #address-cells = <1>;
>>             #size-cells = <0>;
>>
>>             compute-cb@3 {
>>                 compatible = "qcom,fastrpc-compute-cb";
>>                 reg = <3>;
>>                 iommus = <&apps_smmu 0x1803 0x0>;
>>             };
>>
>>             compute-cb@4 {
>>                 compatible = "qcom,fastrpc-compute-cb";
>>                 reg = <4>;
>>                 iommus = <&apps_smmu 0x1804 0x0>;
>>             };
>>
>>             compute-cb@5 {
>>                 compatible = "qcom,fastrpc-compute-cb";
>>                 reg = <5>;
>>                 iommus = <&apps_smmu 0x1805 0x0>;
>>             };
>>         };
>>
>> VS (note, it doesn't have 'length', it can be added back with no issues):
>>
>>         fastrpc {
>>             compatible = "qcom,fastrpc";
>>             #address-cells = <1>;
>>             #size-cells = <0>;
>>
>>             iommu-map = <3 &apps_smmu 0x1803 0x0>,
>>                     <4 &apps_smmu 0x1804 0x0>,
>>                     <5 &apps_smmu 0x1805 0x0>;
>>         };
>>
>>
>> I think the latter is more compact, and more robust.
> 
> For that particular case I concur that iommu-map might fit just as well,
> since it appears similar to the Tegra one - essentially just a pool of
> identical hardware contexts with no special individual properties, whose
> purpose is defined by the software using them (be that the driver
> itself, or the firmware on the other end). IOW, the DT really isn't
> describing anything more than a mapping between a context ID and an
> IOMMU specifier either way.
> 
> That said I also see nothing immediately wrong with the fastrpc driver
> as-is either; if anything it looks like a pretty ideal example of the
> "self-contained" non-bus approach I was alluding to. The "fake of_node"
> notion only applies to the idea of trying to keep that same driver
> structure but just replace of_platform_populate() with conjuring
> platform_devices out of thin air.
>> Note, to make a complete example, it should be probably something like
>> (sc7280, cdsp, note duplicate IDs in the map, again, I omitted length):
>>
>>            fastrpc {
>>             compatible = "qcom,fastrpc";
>>
>>             iommu-map = <1 &apps_smmu 0x11a1 0x0420>,
>>                     <1 &apps_smmu 0x1181 0x0420>,
>>                     <2 &apps_smmu 0x11a2 0x0420>,
>>                     <2 &apps_smmu 0x1182 0x0420>,
>>                     <3 &apps_smmu 0x11a3 0x0420>,
>>                     <3 &apps_smmu 0x1183 0x0420>;
> 
> Note that as another orthogonal issue, Linux also doesn't support 1:many
> maps like that - we'll only parse the first matching entry. However this
> specific example (and the current DTs) doesn't make sense anyway, since
> each pair of SMRs encodes the same set of matches (0x118x, 0x11ax,
> 0x158x, 0x15ax), so at best it's redundant while at worst it's a stream
> match conflict fault waiting to happen?
> 
>>             dma-coherent;
>>         };
>>
>>
>>>>> which will have to be hooked up to the IOMMU layer. You cannot make
>>>>> IOMMU
>>>>> configuration "internal" to the actual client driver which is only
>>>>> allowed
>>>>> to bind *after* said IOMMU configuration has already been made.
>>>>
>>>> I'm not sure I follow this, I'm sorry.
>>> I mean IOMMU configuration is designed to happen at device_add()
>>> time, and
>>> client drivers must not assume otherwise (the mechanisms for handling
>>> IOMMU
>>> drivers registering "late" from modules are internal details that can
>>> and
>>> will change). If you're under the impression that a straightforward
>>> platform
>>> driver for the video codec itself would be able to invoke IOMMU
>>> configuration for the video codec platform device (without unacceptable
>>> levels of hackery) then you are mistaken, sorry.
>>>
>>> Again, to be able to assign StreamIDs to different contexts, those
>>> StreamIDs
>>> must uniquely belong to different struct devices. Thus in terms of
>>> how you
>>> get to those struct devices from a DT representation, either they
>>> come from
>>> distinct DT nodes with standard "iommus" properties that the generic
>>> of_platform code can create and configure accordingly, or you're doing a
>>> non-trivial amount of work to implement your own bus layer like
>>> host1x_context_bus to manage your own type of sub-device. There is no
>>> valid
>>> middle ground of trying to stuff driver-specific knowledge of
>>> arbitrarily
>>> made-up function IDs into the generic platform bus code.
>>
>>
>> I'd totally prefer something like:
>>
>>     video-codec@foobar {
>>         compatible = "qcom,video";
>>
>>         iommus = <&apps_smmu 0x1234 0xca>;
>>         iommu-maps = <PIXEL &apps_smmu 0xabcdef 0xac>,
>>                  <SECURE_PIXEL &apps_smmu 0x898989 0xac>,
>>                  <SECURE_BITSTREAM &apps_smmu 0x898998 0xac>;
>>     };
> This is where I maintain a differing opinion - if it's *not* a "pool of
> identical contexts" case, but a single nominal hardware block with a
> small number of distinct DMA streams for fundamentally different
> purposes defined by the hardware design, then I would usually consider
> it more natural, honest and useful to make those differences explicit by
> name/compatible with child nodes, rather than hide them behind an opaque
> arbitrary integer. If by nature of being functionally different they
> also might require individual properties - such as memory-regions - then
> child nodes are the only option anyway.
> 
> However, if there is actually some meaningful hardware notion of
> "function ID", the design/usage model is such that it would generally be
> logical for a consumer driver to be structured as managing a set of
> fixed-function sub-devices on an internal bus, and you're absolutely
> definite that those sub-devices will never ever need any DT properties
> of their own in future revisions/integrations, then maybe an "iommu-
> map"-based binding is OK. All I can say for sure is that describing
> complex hardware well is very nuanced and there is no one universal
> right answer.
> 
> Thanks,
> Robin.


