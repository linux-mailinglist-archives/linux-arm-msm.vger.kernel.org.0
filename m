Return-Path: <linux-arm-msm+bounces-63550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67666AF7C4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1564A28E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D753C1DA23;
	Thu,  3 Jul 2025 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VE0KPHD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184791AA1D5
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556527; cv=none; b=ZVdpd6hO+sXCym5zG0+aND3FQU8oeKgdv/fi7W/ypuaALLUOYLf9753Jxr8+uiKOXZd3IRovAVA508I7pxdUulUnTZtMFshccxw9tNbUHjcpQ8pDNOcHn2hW9uf4pbRxNWInDfd+zSoJzRXNsT2h08NTiFC3vRIXbq4/H0bkcT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556527; c=relaxed/simple;
	bh=8CzUJQpMWoh2iCytXS+C8OvozoPZGZ3UARwoY554gH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WY4TZAwhkirtjTkiuhuL5frGmRV8ZTogdBRkNLH0aqR7ml+bvqMzwbbvPMewtXc7XmDl9GqlqYfCgZY4DN44sPrEgs/+5SfCaddXaWarKEhd2A1LcTTgpGRkn+N9Psi06QkB+xfx3S2Tr2mka1G4afaSElJFGi28B9A/zvpubzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VE0KPHD4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563Dfcnf008005
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 15:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lB3GyQgbImWw0wJtLFROwCUwuZIRVk6wsudtXt6O2WY=; b=VE0KPHD4lxSt/UMe
	U57ikihOWP3zDwVydsLozE4e8z/gNcvLkWQcryjj2C8iKia7UFSF2o7XAwFTVugR
	RtNBfHLu4jEddjRHQGg7TMD9Y4NQIwKNmnl9Ff1I2RnCq0nWX/m0eqlciL5J8vTr
	iQQ+u8N70tqWVyQ0MeTrnuEANVrASRw/Iqf8Yr/JdDiUfYJy7o2TEexI8EwZH1bj
	EgTmgkze3pkLJ8fKUhcdA29wzRxmu49xtjno87Uy69X+blZYdT4+UDyZBb74qRUm
	6VjCqAFCLIjd7mQw40dPFeHIVAnXOP50FCv+GUceZyx/+nRPRsxYLEPSvtd7htmo
	0ifDfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47napw36q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 15:28:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so83809485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 08:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751556524; x=1752161324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lB3GyQgbImWw0wJtLFROwCUwuZIRVk6wsudtXt6O2WY=;
        b=CbIc99t3tdoI08PBA5ci4k5CmdWWF3r5+A+N0SUmeZiKge/7dcO/Bt0BJZyOkMWQXm
         /d2jAISHCYRQsuNnFIU7+P5C2MO4u+z+APoiAN+5sk4f2hIpKtjhfi5C4siaCh1CofL0
         h8WsJQ2gOayvvzqJjuOld5vqhNjyfWtVcef7FL1xHBh9FrstyVgb3DlW7sNSrqlR9xAz
         edulpi8NZksmhzgmPcsLpk2YtKm95awWNI6w+FlcVF/eJGEeot6W+m0fymtgua94Zwax
         K3v8I7qzxZ2C5KrEi/KGowENmRQ2lJAO40osbZSKw3Lt5cBczB5lHHiJMPaR8dxJbpnx
         fTsA==
X-Forwarded-Encrypted: i=1; AJvYcCXePDsILOiEloWmQpGCud0/TRUhy1HLDLTD3yaFtuFnkt3tK3YxmXvv8svAkswZSFnSa+/WzC9WWyGlwffN@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEd3UT6N2oUDrmu2VW50URgI+Yp6YtATbPSTpnXEMmBSYgnTw
	EqYuKczCM/UJbhqhPzMMen26aEjW575pxywIut93laMcCAdmxIyeY0WdYoqaM31muKE0G+rpz6a
	V85Fy8e0oNH3adeOSUldFXImMG0r3imUkUpRxE8KHnWR2SHrqO95Y/n7gPxMN5Ui+xdwv
X-Gm-Gg: ASbGncvip+Es/RWD/BXxuE2G2++u/4734wH1HWaI1ZYlCbK4K6gvtWbrPSiJbx2Vxix
	HT3chTXXSovPTKvPf+Kr4MZUOGy7Cv7qA3+zfOydfCpqbIAq/Yif4+qLZCQpnVdsovQCg9iUpaI
	HkUWLkTdjzrID/5lAaZFefOvKocIoPdZ7wjz5HU6ri4lpoz6cMjcBOP9FizjspTTZH8Xg93S1aE
	1aRtX+Jq77dJYNTsCaiS/impTkJp78EAbXs/1HnCBJ19OdG4hyQW9rBPLmb7tWpg4wtRinupfp2
	9VvQHX7j0LkW6Lrvzb0BVmOFqW92ycoHMKcrsf/LOWcGr7qT3y/lrS2sQ5synGE+4Ch6ED37rY+
	NxUbImg==
X-Received: by 2002:a05:620a:408a:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7d5c476ce96mr338195185a.11.1751556523388;
        Thu, 03 Jul 2025 08:28:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYROatQiIdSRndOVo9BLkkhoc+SWGXG6ITnZGJxgqN8bVXUZzt8u+b3n1+LTxv13qnf9jpMQ==
X-Received: by 2002:a05:620a:408a:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7d5c476ce96mr338192585a.11.1751556522666;
        Thu, 03 Jul 2025 08:28:42 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae37e7508fdsm939819166b.106.2025.07.03.08.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 08:28:41 -0700 (PDT)
Message-ID: <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 17:28:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIKmmPZb c=1 sm=1 tr=0 ts=6866a1ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gHlHN3BjToyBUNvogygA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyOSBTYWx0ZWRfX2x5E4ifKH/0r
 PD6CVodseJtd0XpSjdrJRHuYk7NGLrx4XXjKOcaTTGQ7Wi+JEQemY08OYzZt8aLREaZ6FjvCQFd
 SMi71RW9OnFIUHMoEHqVZ1P0pu8BajnVVPFTM0CfEf2BklIlnhJqqpYxb9P+z3pCdlwcfwjehnQ
 8ZNrF2GOvW9U0zNdUCCFincwXCvfBTc2wqqEmA8cDYn3pfLR2qnxC9Pv2k2nsV52dV6L/PCKrQz
 JdAMuEttivKvaylOszjC3xHDpIr6uJFEdPhlWwdyTGyCGZYJoZNZ6mvgK4NyBKtLKa5GKYTzLdM
 9BX9Ec3+Dt4PDJSeSkvcz37XTfr8i0J6oQzQU+A4OfPlfTW1JDdzyEX/GQgRef0sKg9Z+FloAXT
 QORbVWl12EgP2ATOUh7HjP7hr+O6rKQaTaarRE3+p07AIelwzLUwX8DrAynqTsM4drtZ4VI5
X-Proofpoint-GUID: 8fURitAmIe7VtDHEI2giShpnJ3zHnH-1
X-Proofpoint-ORIG-GUID: 8fURitAmIe7VtDHEI2giShpnJ3zHnH-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030129



On 03-Jul-25 14:54, Krzysztof Kozlowski wrote:
> On 03/07/2025 14:38, Konrad Dybcio wrote:
>>
>>
>> On 03-Jul-25 09:27, Krzysztof Kozlowski wrote:
>>> On 03/07/2025 00:26, Dmitry Baryshkov wrote:
>>>> On Wed, Jul 02, 2025 at 01:06:17PM +0100, Bryan O'Donoghue wrote:
>>>>> On 02/07/2025 13:01, Vikash Garodia wrote:
>>>>>>> Anyway, in other messages I explained what is missing. You are changing
>>>>>>> existing hardware and you clearly must explain how existing hardware is
>>>>>>> affected, how can we reproduce it, how users are affected.
>>>>>> Exactly all of these i have explained in the commit message. The limitation with
>>>>>> existing hardware binding usage and how my new approach mitigates that limition.
>>>>>>
>>>>>> Coming to usecase, i made a generic comment saying usecases which needs higher
>>>>>> IOVA, i can add the explicit detail about usecase like 8k or higher
>>>>>> concurrencies like 32 or higher concurrent sessions.
>>>>>
>>>>> Why not make this change for a new SoC, instead of an existing ?
>>>>
>>>> Because we definitely want to improve support for older SoCs too.
>>>
>>> Older SoCs came with completely new drivers and bindings, instead of
>>> evolving existing Venus, so they for sure came with correct code and
>>> correct binding.
>>
>> No, this is a terrible assumption to make, and we've been
>> through this time and time again - a huge portion of the code
>> submitted in the early days of linux-arm-msm did the bare minimum
> 
> We do not talk about early days of linux-arm-msm, but latest where they
> rejected existing venus drivers and instead insisted on completely new
> driver iris. This is a new code, so how early days are applicable?
> 
>> to present a feature, without giving much thought to the sanity of
>> hw description, be it on a block or platform level.
> 
> You are saying that iris driver was again shoved without any sanity? It
> should have never been merged then. Better to grow existing insanity
> than allow to have two insanities - old venus and new iris.

Iris was created with the hard requirement of being compatible with the
bindings previously consumed by Venus. I think the logical consequences
of that are rather clear.


Perhaps you're saying that the binding for "newer" ("not previously
supported by venus") platforms should have included that from the start,
and I agree, that would have been better, but hindsight's always 20/20.

On a flip side, any additional requirements we talk about here, also
apply (in reality/hw, not talking about current bindings/driver state) to
every single "older" platform as well, and skipping them is pushing your
luck every time you access the hardware.


I also don't think it's fair to leave them in a permanently-suboptimal
state just because the initial submission wasn't forward-looking to
these previously-unimplemented requirements. I'd even say that if we
want to fix it, we should do it sooner than later, before the bindings
age and get more users that would care about breakage.

Comparing against downstream, I only really see IOMMU specifics (binding
SIDs to a PA range, which this series touches upon plus ensuring secure
buffers are associated with a specific SID, which is done basically the
same way) and (on some targets) an nvmem-cell for speedbinning.
Everything else (PDs, clks, icc, irq, etc.), we've already covered.

>> That's why we're still adding clocks to mdss, regulators to camera
>> etc. etc. to this day. And it's only going to get worse when there
>> will be a need or will to add S2disk support with register
> 
> We speak about iris here only.

Sure, I'm using the other ones as an example to show you the actual
root cause of the problem. It's the same "the initial bindings
submission was not perfect and to make better use of the hardware, we
need to describe more resources / describe them more precisely"
problem that pops up every now and then and is actually difficult
to prevent.

Maybe we can have some sort of a broader conversation about whether
bindings from before SOME_DATE or e.g. not older than N kernel releases
back should be deemed volatile, but that is a story for another day.

Back to the point, I actually think what this patchset does is
resonable, especially given the address range and SMMU SID requirements
that the OS *must* be aware of (or the device will crash after a
translation fault / security violation).

Konrad

