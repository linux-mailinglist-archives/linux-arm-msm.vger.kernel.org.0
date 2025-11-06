Return-Path: <linux-arm-msm+bounces-80624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D682C3BE59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 15:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B8D3189D9CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 14:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDBC344051;
	Thu,  6 Nov 2025 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiWKQcAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AinBshkz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A42315769
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440649; cv=none; b=B6+Co/lLRmyrEvPBcifpgC68dhqCM3XIgmT9UDBUeiJSKTiLdPO6MyNoPlDsx1uiuScwv5flwfB4Dun6FXmGIEScSVlMj8I0S8/2bSMz6NaJVUBGZw8p6tVThThxhM3K0LdijS3NPrD0TV/J5M63UN0t7zAQUH5+JNFtfI8eN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440649; c=relaxed/simple;
	bh=LWM0l4vzzbacqdnVzpCnRRUWEOcQxOAdXEAdjEcgw4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtBTILIbqLwxVylGpeuoT5vwxddspv+IuZ9bTXPuWyZeTWWvYWH9WBu7mLYBJEjQ60xfN+gOOCYV9YfkHD/4tI901/qE7LX6667RQdZrIq0boOJUCgFSX92hAZJd8HTlIqd5Bds1kklFPV8AKcm1Xu3BofXqy+dGUWN8liQeWKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiWKQcAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AinBshkz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6BimLh4018429
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 14:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+c/QOz5FWP7I3LmCV+SwCpj23lo4cqX+0KR+4hGKgwo=; b=aiWKQcAFWqcZzvGc
	YiTfnQU70O1Cm/+AL4xg3JhPMxgPcSzp0HFbt6WJ/luulrbH34FYMgJDW1pPCStD
	AtDY6gnb1jjAKwE6dE92jvyiCCqyxl5YnGBrhVCDf4nku7sogirG9efGnsBAAcJN
	4OOSEb1kpJerjBaOGBjhQdaUtdsh2Lt//LokUKGQqFQEPXlspYSueLJiIkyT2waK
	pfgwEN8HtDdtlFuRJxnGfls1QMgSg5jtt1rfkBglCT4kly38SgbKi1EFIfcRlaZV
	uXRU4aiXYpTd3goEZpZDho6lyP8b2GY8HH1AcoV36l2fsdt4lq83bSFh02MIjFI2
	tzvvhw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u2urghs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 14:50:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33baef12edaso1330867a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 06:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762440646; x=1763045446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+c/QOz5FWP7I3LmCV+SwCpj23lo4cqX+0KR+4hGKgwo=;
        b=AinBshkziaDfbl7t6QLG0GowA5fREtn+pIr6VSJJAfCcXr/bUFM10l3M0s0JYl1XsO
         7QS1Z0zSpKYOjvWdEuLH1XJFxVMPJ7V5agSoAsL2i9qufdeJOyswuPUWMVKaXdOYzvK7
         e8qRKbzLzgXE2+XVrST7TsG+hhvtdXB1YeruIubujm/eWg5a4+pwYcb1bS5QJl4mVUBU
         6Hl25fmfRNDQSzPIoktzqasNfkDxG5Kc7juSHQpuffK0Z0IRL0tIfeFPuIstqQi24oo5
         sOzpYWf7jSkzu8GNumwS0cQ969Msw0p2Mwxv9ChLytr2oFqeMMLHLE3CWZTN/v9UaXMW
         rDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440646; x=1763045446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+c/QOz5FWP7I3LmCV+SwCpj23lo4cqX+0KR+4hGKgwo=;
        b=WPGjWWAod4PxS8RPlmSffAmRwKVCWKbEccAKkgDJw2c9W4PX+lPvgZYGoVYgd5R2Ar
         R7hEQXHFw6mRXGoIRqsO0jIpTEcSYey443S5P3gTqI0WPUXsCndtAvcU9YUu7hMVY4Ro
         S41VU4To5X9kgHjxu8Zd0tyPz56Y76uUMkrvxiBSCFTHLL2YbJ1C+Elaf1ih5me3m45f
         nlNh/PYu9haPyFlxjAZB4yviD8iESHHCWUePdJz0cOltfaiKisoWfY4Y5/zVvvn2GsI1
         6tv7AbOVSSFO1HHoMllIc+OUgMCHNeyGltyGH1y0b7T1AFGrWr5XFvV3BL0Qe2Zka1W0
         KpiQ==
X-Gm-Message-State: AOJu0YwOUSKk9xYJ/kHRz/Rjs1CY5DfCr3gg7HJkOQl+ULMqYIeP8eX0
	YLFAsYiUW3TAOdM82rxjRJVwypezH9g/1fGOgyS2teC4aG2zrhQoIwH3HZVApbmOjEEFN7PwH/c
	15yeuqEcZ5G9ncPOk18mEGgZ96TgjSLsdco3+a41yJYDF48KIfhNcahJHwSA71j1+PDlz
X-Gm-Gg: ASbGnctHkwBZF5JeDQVXzztvhdIrG7S8KOB4Mli9rhIWzPtMxxadDw4h6tXJ54vlTSc
	Zcr0B0qY0OJOFAVjIwU3b9/NRkPXBIEFdzb4bLwR7bkVE8Gj1RBWQ5jF4UUAaoeILSFUlEbY0uG
	Y1zIXRu/pSLcxHK0OzvLzdMJay2v87TP1r9+Ofv5gdeRG6FlFDKi+voiVaV0lH2HVm8TjKiTarv
	CDI6dc4EyFfSccveoD4mgvvp6Az6bEytX+1XU9OulI7eAoxpujuum8tlQfjvVvDsWEgYEQSNW/7
	UmNojtp/eL/bBK2RncvGyZp9ooj5J4hamy3VdSuT2H1DVciCyHj/LcbBZLK7kSGt9sck8Bf54cQ
	DPgmno2Jl+5sOwcnhxhz5dh5vgEt9QNPwwg==
X-Received: by 2002:a17:903:240e:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-2962ad88638mr95158315ad.34.1762440646345;
        Thu, 06 Nov 2025 06:50:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDRjrSPgAtrWEFqUDfncKSqQ+S6NIN3iMJTRreo40l/2rWNYrrLBKk8fycn3wYrt9sMYdptw==
X-Received: by 2002:a17:903:240e:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-2962ad88638mr95157765ad.34.1762440645836;
        Thu, 06 Nov 2025 06:50:45 -0800 (PST)
Received: from [192.168.0.171] ([49.205.253.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm31242295ad.23.2025.11.06.06.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:50:45 -0800 (PST)
Message-ID: <fdf4c469-d276-4f64-b13d-5266cca7235c@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 20:20:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com>
 <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
 <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
 <9c920cdf-1985-4656-bee2-8bfacc15bfa9@oss.qualcomm.com>
 <24719933-d81f-41cb-aabc-e28f018b156c@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <24719933-d81f-41cb-aabc-e28f018b156c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wv4m8Nfv c=1 sm=1 tr=0 ts=690cb5c7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=qKS+5dAnvCMTy05vH4hvkg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9_Y8sxrH3V15ADIk1vQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDExNyBTYWx0ZWRfX0HusEyglKn9e
 BiPbKiwzuDVbAWRtMNixCrcaqpEkyTd56mqyk7+xmqu+0IbrY31qup0JJTLv0NiAlkeGyFrkMjL
 IdlIGYQVyXs73igUAtNjygvoVAsC+Kz8QBMcZcpanPyTCg4Tt/g4C9xxa3h9FZ1hC1VG8KtyopC
 amTld4Id5EzryE0iQAqCvdv87rG6yMsXumwQ5w5mplWNLfHK76kp5l20MwI5ORoF5h0Jz6A2Z9L
 mNYNmCjDmE6KcXkduHqs8IINj/UPibf+F5WyF3MMlZVGFk/FLIVvVT1PPU0N47vAe54SUudAk6Q
 nGFOu0bObERSBFl7j5svY88yMpB7hStdwJGY64a71Uc1pUkzIoklKU+3LF+683LZbdCpoUFzVY8
 9iWpyuHAiB1vsuaMmF6O0K0EXkiWww==
X-Proofpoint-GUID: feGGC27zTvvAAMkDkAdpvuLbreC5S4kH
X-Proofpoint-ORIG-GUID: feGGC27zTvvAAMkDkAdpvuLbreC5S4kH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060117


On 10/22/2025 9:58 PM, Krzysztof Kozlowski wrote:
> On 22/10/2025 17:36, Konrad Dybcio wrote:
>>>
>>> [    1.361157] pc : qcom_smmu_write_s2cr+0x64/0xa4
>>> [    1.361165] lr : arm_smmu_write_s2cr+0x2c/0xbc
>>> [    1.361168] sp : ffff80008005b8f0
>>> [    1.361169] x29: ffff80008005b8f0 x28: 0000000000000000 x27: ffffc7f252f45320
>>> ....
>>> [    1.361195] x2 : ffff800081200c48 x1 : 0000000000000048 x0 : ffff800081200000
>>> [    1.361198] Call trace:
>>> [    1.361199]  qcom_smmu_write_s2cr+0x64/0xa4 (P)
>>> [    1.361203]  arm_smmu_master_install_s2crs+0x7c/0xac
>>> [    1.361207]  arm_smmu_attach_dev+0xb0/0x1d4
>>>
>>> Could you please suggest on listing the iommu items ? I did not find the
>>> relevant references in other bindings where flexible iommus is being listed.
>>
>> Krzysztof would probably like to see what I believe someone else somewhere
>> sometime suggested in the iommus discussions (sorry it's not possible to
>> keep track of it all), where the DT can list every possible required iommu
>> sid, but the driver ensures only the ones that are necessary are utilized.
>>
>> This will require big changes to the iommu framework though, I'm afraid
>>
>>>> I already asked this.
>>>>
>>>>> +
>>>>> +  memory-region:
>>>>> +    minItems: 1
>>>>> +    maxItems: 2
>>>>
>>>> Same comment. I already asked this about iommus.
>>>
>>> Same here, there aren't any bindings which lists for flexible memory-region.
>>> Please suggest if there are any such references.
>>
>> Similarly, we can define the additional memory region that's necessary
>> for $reasons and leave it unused in the driver (actually I don't know
>> why there may be two, but let's assume it's a QTEE/noQTEE detail), because
>> for the hw to operate, it must be set up by some entity in the system
>> either way (i.e. the memory is reserved even if it's not done by Linux)
> 
> 
> Another point is pretty obvious: if one claims that
> iommus/memory-regions list is flexible - some elements are optional -
> then clearly there is a distinction which elements are mandatory and
> which are optional. So there is difference between elements of the
> array. If there is a difference, they all must be explicitly listed,
> like every other list (clocks, resets etc) property. Writing bindings
> doc also defines this rule.
> 

I would like to describe the video bindings covering all the interfaces, 
including the secure stream ids. For this to do, i would have to wait 
for [1] to conclude. Will put up a new revision on this series, to 
exclude the binding patch and the one which enables kaanapali. That way 
we can have the driver prepared for vpu4, while kaanapali binding and 
patch to enable it in driver can be raised separately later once [1] is 
concluded.

[1] 
https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

Regards,
Vikash

