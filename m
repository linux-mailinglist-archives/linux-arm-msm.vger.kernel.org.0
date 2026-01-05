Return-Path: <linux-arm-msm+bounces-87378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA625CF22F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 08:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75651301A1A3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 07:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00882D6E66;
	Mon,  5 Jan 2026 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JX9djdWB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKQGA7+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7442848A0
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767597680; cv=none; b=ceaBMuTryEsCM/YaghUV+LrjUgbCStY/57IGICpNN0J1CbsWclcBBcFGSz7ca6U7r1YeT+/7uEXBg3EmDjPqT2mTr8hAAmg+y+bPJs0e0ZGZ4DBy8M3f27M5J9buQIaIa6CL0jQ5fFyb3T32HWFoae6aKcx9P4HRwJCJjC2eVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767597680; c=relaxed/simple;
	bh=Q9fUcBP8YjPUKrNYmKrrs1nQiSNlglzUEHd/A6jOgpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckmUcZHNOhcH92CD39dODX+PNpIFpjnGLnIvyqAmfOh/iNqWAsRY5P9u/jX/CuecM5ek68oQ8NvNDZnWEGujIBP2S3BF1B8NiXdgmey1jBMGVAQ0uH/TQmzb6Uf0JFWArE9dp9h5iY0fEBuOst+wpraSQe9LdcJmH6ySwdw5sDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JX9djdWB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKQGA7+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604Maoim3838852
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 07:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WtQReFN9My29FPdkv/q1sjeQWhd2NDf7z17BNmHNNPs=; b=JX9djdWBtaIH/cN4
	yXhT5rEltFkPnYKCrqSDbEJP9fozBKpa/eCMOqZVgP6Qsj1Y3wrvB8xch3uSWObw
	ClE4NfR3qstOYHBl2Js98ohreHKoYTwK5AeqHvJ5gg1i3OhWslHOmAGzyWYfM4yX
	bHo0rT+D9qEJaOxsU9bAKxweMJWgkRaBV1p+0+pHVObc5O8bu5Vi3QkQrbWP3zlh
	MT6uxo2Z/Z/VzI8so/2jRfKG1WIv7jh/efA2Bo8NVq1XXHX7DrJhjTgMAJQaF8s5
	Ik+q7pd5s9/yOUysfA251Bv65G4ofP8RRRphKZVRdvhMWHh1kHYRUlBj9KhKi50+
	zALnyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0h26c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 07:21:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-815f9dc8f43so1878840b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 23:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767597676; x=1768202476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtQReFN9My29FPdkv/q1sjeQWhd2NDf7z17BNmHNNPs=;
        b=WKQGA7+MZTG4Fy4toVW/1EwSiSVyJUYl3gA0Mw1hEj3LvTxvgdscvhAkF62aFdYvqD
         LuV1c//lXI4D4a72Vni75aG/v/JsCAg38vOHxERT2weVMcijQhKAK7ceDH21cziJcAz6
         zlLMzCMZeRmgmqhtDaOe4q0c+9Nj010d/ku4oCf03JWgfOZGChSWeD2H09s/u1q/UHf1
         W1/PVtn0LdND6ETacPYToVsyx3YYLKd8HtG67tbv7td/Q5BhhETwdRrOIYOwUOlQEP+L
         hltfaY3AafnnWzEZP/6eCaIjkXZmhhWJnAwhxAOM9tPh+ZPO5FRN90hCiJLH1hmMR5j6
         ZeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767597676; x=1768202476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtQReFN9My29FPdkv/q1sjeQWhd2NDf7z17BNmHNNPs=;
        b=ftbqKleAw7EfKzZ2Msq9Xa/sf1yfavDfvqaQ8B8eFGsj0Yt1g3yF1WjlmiQULmUkcN
         5rPVSQpwc44JC57nK95CIHHLc81zipyc2LNtQkfyjd1eTNJHeIJqUoU9FjUxijUnd7zq
         JkNCi324/8P32J8DssIDEKUSsnWQbN2xs122TYznnaFhwcmWCUnWVoHNkL8ud1c+vSs8
         lKnUVMbdhUff6fETBBJMZwg5thHVrOkc54JyEKP2i3wrQvvnhJv87JW38S6GZP+N/SrU
         xd2j7zzAgOk5mm9mr5ZTj1jCv2bC4s09j/nc9jBZLQEz07uhYu5gq4a5/miI6P0VSnhy
         aFyA==
X-Forwarded-Encrypted: i=1; AJvYcCUi70Mh1J0GEthb6rWVz63dnw3ajACzF2Ol4WZSZLS6MUTE+oYALqqK2+arbAcqZ1n6bJBrAxNlN/5syz1I@vger.kernel.org
X-Gm-Message-State: AOJu0Yya69Il+VdPUBVnB6n+pI/owD3nZV/A/1CTTk5qtphbCJSTl4r3
	gW+EIRR6ceqKut5DwBqrwO0w3hJ1riWbYGRaCJ/AyMuPtAarvkRS7pG/Uf3OO2PJRi/eYR0Uebb
	ixCbjhGcaYiuwbGGUKIWjfINjITn2s6asuvWwDZA4xWOAeMCuRqZKVHYCbEWa4E2lGMFp
X-Gm-Gg: AY/fxX7ERUps94NmO0Qa/fy3OY+yYFDCpHdhnsf0NLRbAWYtcuJmIOctUl13h8YLoax
	NmMnSRXC23bpxyzoSqD2tYifOH8bg3KnEDvyMLlx7aagrxuZJzyQwgasLx2NRj7UIcKalMwrXUi
	8zc9Oq4de9lWAA7ZEeCWanVUjZophWZZUj8c8BltG71OxVWJ4yHeqCoY9K5EaZNDukJPe0X8Wea
	h9eaIq84cFov09QDhNlYmugs9VoRnlK0CSmHCKs4CKqEXWlQKh3mM4IvWmfSAGKUsv4ZUUwJVn3
	kQKQiZMoXneqON49m5uPnjdirtDCRXz8d0UX/xiY6OQlvyt5G3rC/c1mVYjlRrBTE/oWhz0dWMN
	Mt4pGzbIQ4rl/+MiSkQfQCddHM+pV16Wlo9T7KUsgEDbv
X-Received: by 2002:a05:6a00:44cb:b0:7e8:450c:61b4 with SMTP id d2e1a72fcca58-7ff6607cfb4mr37312024b3a.36.1767597676000;
        Sun, 04 Jan 2026 23:21:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw4Tmcr2OP7fseCNIxK8T3ePllQcqGwhtVRopMyrwyavAtC32anSV8EZ4ZVYurNUGM/JJETA==
X-Received: by 2002:a05:6a00:44cb:b0:7e8:450c:61b4 with SMTP id d2e1a72fcca58-7ff6607cfb4mr37312010b3a.36.1767597675512;
        Sun, 04 Jan 2026 23:21:15 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af2ddf2sm47130415b3a.19.2026.01.04.23.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 23:21:14 -0800 (PST)
Message-ID: <bf62a6aa-fba7-4c95-b1e4-9da2528d0556@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 12:51:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, linux-kernel@vger.kernel.org,
        Prakash Gupta <guptap@qti.qualcomm.com>
References: <20251229070712.456138-1-sumit.garg@oss.qualcomm.com>
 <CAGptzHOftKG_3h3KegrYuNiaDFCUHC8oS+eN2JyBDh=aRMod4g@mail.gmail.com>
 <5fdf6122-3c2b-44fb-b8ea-9e554208a56d@oss.qualcomm.com>
 <aVexkPYW0X6nWW9y@sumit-xelite>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <aVexkPYW0X6nWW9y@sumit-xelite>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695b666d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IiibPKZ/S6LkjEaqkWskKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=PTQFZ5kuHX2ljL7qyYAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA2NSBTYWx0ZWRfX8rHQqjQwht3s
 NbaSSeU8MozPTP7lfIvy/+UfZS2zL2aplBxUK0hOKCb5MTNTFaYevR+1X2KAha5m9mXt3FpM34j
 PnDBmvXZCbdzxQNL9SMgmw3JQUPxZ1wq2G5aRMALbuH6TC+KUH8tkgItJp9MB65s027nTyJuaNl
 6XFO1l+VTnC7v49qDf0qalkTrkhzPUKG0LDm+benNK+bF0VLzbou2VVdbsOQ/NwU55IViiKd1Jp
 RWQgCXI4R18fA862orU9m6fMR+nsj8jQcNDsjT86Wq9/QquZ3ICujeb8IkumuXxqjlt4lNWJpJr
 rXNPRRpOTDAbzftyB1QqyTdxanRQJBnon76yDr+5TyGlYG4LcHQZoaJcQpFiA+iSlO8xBYlYuAg
 hOCyGz66qj38uV6pmE9gumLyQcBUMMb6cgFMkxg/m9ni+iHe/OCVe6skQQeOoXyycXPs9R2aXwx
 9jGBE0zNAnBhUJjMzYQ==
X-Proofpoint-GUID: 5L0ETf-rdgTnGq5eHPsTHJnZ7J2_Tr3J
X-Proofpoint-ORIG-GUID: 5L0ETf-rdgTnGq5eHPsTHJnZ7J2_Tr3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050065

Hi Sumit,

On 1/2/2026 5:22 PM, Sumit Garg wrote:
> On Fri, Jan 02, 2026 at 03:32:57PM +0530, Vikash Garodia wrote:
>>
>> On 12/29/2025 12:50 PM, Sumit Garg wrote:
>>> Hey Everyone,
>>>
>>> On Mon, Dec 29, 2025 at 12:37 PM Sumit Garg <sumit.garg@oss.qualcomm.com> wrote:
>>>>
>>>> Fix IOMMU DT propeties for GPU, display and video peripherals via
>>>> dropping SMMU stream IDs which relates to secure context bank.
>>>>
>>>> This problem only surfaced when the Gunyah based firmware stack is
>>>> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
>>>> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
>>>> as a fault by Gunyah hypervisor which were previously ignored by QHEE
>>>> hypervisor.
>>>>
>>>> The DT changes should be backwards compatible with legacy QHEE based
>>>> firmware stack too.
>>>>
>>>> Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
>>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
>>>>    1 file changed, 3 insertions(+), 8 deletions(-)
>>>>
>>>
>>> Looks like I messed up this patch-set with email delivery leading to
>>> non-delivery. I resent it properly again here [1]. Apologies for the
>>> noise.
>>>
>>> [1] https://lore.kernel.org/lkml/20251229070712.456138-1-sumit.garg@oss.qualcomm.com/
>>>
>>> -Sumit
>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
>>>> index 8bf5c5583fc2..e705eb24160a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
>>>> @@ -1613,8 +1613,7 @@ gpu: gpu@5900000 {
>>>>                                            &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
>>>>                           interconnect-names = "gfx-mem";
>>>>
>>>> -                       iommus = <&adreno_smmu 0 1>,
>>>> -                                <&adreno_smmu 2 0>;
>>>> +                       iommus = <&adreno_smmu 0 1>;
>>>>                           operating-points-v2 = <&gpu_opp_table>;
>>>>                           power-domains = <&rpmpd QCM2290_VDDCX>;
>>>>                           qcom,gmu = <&gmu_wrapper>;
>>>> @@ -1895,8 +1894,7 @@ mdss: display-subsystem@5e00000 {
>>>>
>>>>                           power-domains = <&dispcc MDSS_GDSC>;
>>>>
>>>> -                       iommus = <&apps_smmu 0x420 0x2>,
>>>> -                                <&apps_smmu 0x421 0x0>;
>>>> +                       iommus = <&apps_smmu 0x420 0x2>;
>>>>                           interconnects = <&mmrt_virt MASTER_MDP0 RPM_ALWAYS_TAG
>>>>                                            &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>>>                                           <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
>>>> @@ -2339,10 +2337,7 @@ venus: video-codec@5a00000 {
>>>>
>>>>                           memory-region = <&pil_video_mem>;
>>>>                           iommus = <&apps_smmu 0x860 0x0>,
>>>> -                                <&apps_smmu 0x880 0x0>,
>>>> -                                <&apps_smmu 0x861 0x04>,
>>>> -                                <&apps_smmu 0x863 0x0>,
>>>> -                                <&apps_smmu 0x804 0xe0>;
>>>> +                                <&apps_smmu 0x880 0x0>;
>>
>> Are you planning to update the binding [1] with this change ?
> 
> Yeah I am planning to update bindings as per changes posted here [1].

I tried a similar approach for the very same usecase [1], and what i 
learnt is that we cannot describe a range of iommus given the fact that 
there is no hardware which exist with *min* count of iommus interface. 
It is suppose to be a fixed number of iommus interface, OR i interpreted 
it differently then ?

[1] 
https://lore.kernel.org/all/20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com/

> 
>> If so, how to
>> handle the case of iommus for gunyah based vs non-gunyah based ?
> 
> Currently Agatti doesn't have any support for Linux running in EL2. This
> patch-set is just trying to enable Gunyah based stack.
> 
> [1] https://lore.kernel.org/all/aVOFL3jmNrFNiYV0@sumit-xelite/
> 
> -Sumit


