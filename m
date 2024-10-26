Return-Path: <linux-arm-msm+bounces-35999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A69B1757
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 13:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 836191F229B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 11:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB70E1D3656;
	Sat, 26 Oct 2024 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiSWcLJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776ED1D3654
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729941250; cv=none; b=IwJXewvaQ0eUqElNcmdlcIEOpWU9k2lLJD/19zew1xnq/OapMdRmpGPUHnJXSr5flhnJ8YnAJ69YxIx1SXxubvW2OcterKK9Dv5k5T+kkz17O9k4bJ26nDQKfQ8l3Hk/LFAtVGVeoeC1n9UD0vZj+MjdhVF7sv2wvLMoNynuS7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729941250; c=relaxed/simple;
	bh=6FvXG1+2BkeLGD3AY+/9YpHV5JAfMTLz69z6Znln92g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jsz22z3rRLXwRWYcQQTDOXVm2kr5F7c4hMKZAFacBiAm78ohnqd76XHKB9OqY5HKFYq18v+VNMiI6NdRwd93w6RtqUHca+hXhCpuMLbafceiyuAAPA+ay/E8gm1whR5GXnbuo60UXSNbE2ubSj7Fdm8RAG6ptaG7CZdOHzV+pm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiSWcLJW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q4NlXb015443
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2VIJyVShOKe202SikbYNzeQ/DoTsTn4fTzLjpZCO0Wo=; b=PiSWcLJW0ywSuUUk
	6iJfPs7noBJcyDSH2ik9YFwKE8ZkKBqVhU1l0HU4UpVkqtYUTCZQ1nfgUD/JQKgv
	7DAXuIu1ijaT6Ypt/PZfF8wybNlk1RcxXUqn+r1GziR1kvxtL3l9vtaj+gbrO3YR
	pDQTheD0KKWnl0FfjRHnkSRkesJdDzw6oq7lC6Cj+Ro3k2T6CpGPN88XLbpJ785L
	xt1/sVl8CC31BmDdOH2yAgsANhFfgS93o1j8hzQElWCT+fmOaI2DnWuw+bDSGQ51
	T2A5WrP0IAXE4+rLtDuR+0L5o0LabB1IHp5pHEenugyyhfTkN4IwezQcWPw0sxeg
	YT61Vg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqgvc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:14:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b1437d6f6cso69571585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 04:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729941246; x=1730546046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2VIJyVShOKe202SikbYNzeQ/DoTsTn4fTzLjpZCO0Wo=;
        b=hWDlkX7iAihH53UcAN3pdJnkxMuo77gFT7kCMW99/9qIJyEN9H3EVqI+yi+GO1ZnpE
         KRI2EGIREYfjtsQU1Ae4+1gXTCu+bakmn1BpXGvLjdy+b5xPdb/mWpuWjRZk1AVeXSTf
         BDvZfgu6onPzsp5SgzCRq/aiDyN2jcEff2P1l50BdMMt8BGyVYGyWXD0GDcPEgBpEbOi
         g8DpmxlB8/3GhMexg5+ZMsN0keg9Nn5gY6jUe09G+k9yAO6G8D3/aHBGc3dzRjLfzz72
         7tvSUerHQfmZua7IvOl2B1ZVeuqorRQKFRlF7dptBaSQ67aL1HbdHMaOmgF4+vLtu3JR
         DOkg==
X-Forwarded-Encrypted: i=1; AJvYcCVDB8vUbMGDVdX40GR4XE/DTYtq52nU2zl91qlhuLAI/BLaGVhC9VNbJImHMGGpae+v/oSH0GaKfcgI7Gqc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kYu9LQ3g8sbSIbBvCLEHorsK/GFlIhExu/U0TrzQtCGUSKHf
	AbbO7Ubea3IUhgbr8MHWOCS2K8rp3eRikIqENvcYVRvKq6x9DYj9C7GbWzm631YWLmx/8w4X/5/
	p6eqWB0tGI7cSukWxNK/N9ZW9/jjM3qFKrST7GTIl7jlM/hnFWPuP1qHkI20oW4PC
X-Received: by 2002:a05:6214:2628:b0:6cb:6e29:bad4 with SMTP id 6a1803df08f44-6d185862784mr17394596d6.11.1729941246096;
        Sat, 26 Oct 2024 04:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIkNHz09S+ye/cfwnCyIzU7xG6/ASc4nNFWo8hNZkb/kELlL+FU6P19DEXNKKxitu/4IweCQ==
X-Received: by 2002:a05:6214:2628:b0:6cb:6e29:bad4 with SMTP id 6a1803df08f44-6d185862784mr17394366d6.11.1729941245630;
        Sat, 26 Oct 2024 04:14:05 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm164496866b.134.2024.10.26.04.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 04:14:05 -0700 (PDT)
Message-ID: <56d061ea-1458-43b5-a823-eb625204913a@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 13:14:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add base QCS615 RIDE dts
To: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
 <22qkvfravm6sxiq3xfavahg2u6b2pwlyzqbqvd55zym5zef3gi@m4bsqkdvggty>
 <17d0017e-b55d-4b32-9fd3-1a1a84e5ebf9@quicinc.com>
 <0ec92d59-0648-40ed-a522-307152b5c37d@kernel.org>
 <148451f2-6b1b-4616-b703-fd52e7afa2be@quicinc.com>
 <90c98fee-770c-4b83-9e05-6f04866094c2@kernel.org>
 <729deff2-d5df-4409-b941-af22de408521@quicinc.com>
 <9ded31cf-5b14-426a-a10c-694f20d4fb9e@kernel.org>
 <22657edf-5df9-44dc-b2a8-134ae613d819@kernel.org>
 <ded66421-9425-4b9d-9922-dacc66777b83@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ded66421-9425-4b9d-9922-dacc66777b83@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OYmPhTs0UMnnVYAchqu099BXWT_UJFdm
X-Proofpoint-GUID: OYmPhTs0UMnnVYAchqu099BXWT_UJFdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260094

On 5.09.2024 7:29 AM, Aiqun Yu (Maria) wrote:
> 
> 
> On 9/4/2024 6:23 PM, Konrad Dybcio wrote:
>> On 4.09.2024 11:32 AM, Krzysztof Kozlowski wrote:
>>> On 04/09/2024 10:35, Lijuan Gao wrote:
>>>>
>>>>
>>>> 在 8/28/2024 5:34 PM, Krzysztof Kozlowski 写道:
>>>>> On 28/08/2024 11:31, Lijuan Gao wrote:
>>>>>>>>>> +/ {
>>>>>>>>>> +	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>>>>>>>> +	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>>>>>>>> +
>>>>>>>>>> +	chosen {
>>>>>>>>>> +		bootargs = "console=hvc0";
>>>>>>>>>
>>>>>>>>> Noooo, last time I agreed on this, you told me later it is different.
>>>>>>>>>
>>>>>>>> In the early stages, enabling HVC is to more easily verify clock and
>>>>>>>> PMIC related functions, as it’s difficult to debug without the console
>>>>>>>> log. After the clock and PMIC are ready, we will enable the UART console.
>>>>>>>
>>>>>>> Working serial is supposed to be part of the early submission.
>>>>>>>
>>>>>> Okay, I will remove it in the next patch.
>>>>>
>>>>> Can you post next version with proper serial device?
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>> Hi Krzysztof,
>>>>
>>>> Can we use the dts without console enabled as the first version? When 
>>>> the clock is ready, we will submit new changes to enable the UART console.
>>>
>>> It is very surprising not to have console available in the first, early
>>> submission, but it is not a blocker for me.
>>
>> Lijuan,
>>
>> I see that the initial submission is very slim. GCC+UART+TLMM is
>> usually the smallest we tend to accept.
> 
> We are exploring various ways to improve the efficiency of the upstream
> change merge process. In the current QCS615 project, we are
> experimenting with a slim "HVC console" verified base device tree to
> minimize dependencies and enhance parallel work efficiency.
> 
> Currently, different developers are working on the same QCS615 project.
> One developer is focusing on clock support for QCS615, another is
> working on interconnect support, and a third is handling TLMM pinctrl
> support. Additionally, the QUP UART validation depends on above soc
> specific GCC clock/TLMM support.
> 
> Here is the proposed process chart for reference, Clock/TLMM, even other
> functionality like LLCC can be validated apart from current Base support
> with HVC console enabled:
>                                +---------------+
> 
>                                | Clock         |
> 
>                                |               |
> 
>                                +---------------+
> 
> +---------------------+
> 
> |    Base support:    |        +---------------+       +-----+
> 
> | HVC console enabled |------> | TLMM          | ----->| UART|
> 
> +---------------------+        +---------------+       +-----+
> 
> 
> 
>                                +---------------+
> 
>                                | Interconnect  |
> 
>                                +---------------+
> 
> 
> It is suggested to have process like this:
> 1. Have hvc console enabled base device tree support.
> 2. TLMM/GCC/Interconnect/LLCC/etc drivers can be pushed along with the
> needful dt changes.
> 3. QUP uart support change after TLMM/GCC dependency uploaded.
> 
> Here is an original example of qcs8300 project that the base device tree
> wait until have all qup uart enabled support for reference:
> 1. The first soc support[1] pushed at 08/14.
> 2. TLMM support[2] pushed at 08/19.
> 3. GCC clock support[3] pushed at 08/20.
> 4. Interconnect support[4] pushed at 08/27.
> 5. LLCC support[5] pushed at 09/03.
> 6. Initial device tree support[6] pushed at 09/04. And it have 5
> co-developer in the initial device tree support.

Right, plumbing up all of the UART dependencies properly on these
platforms is very much not straightforward.

> 
> 
> [1]https://lore.kernel.org/all/20240814072806.4107079-1-quic_jingyw@quicinc.com/
> [2]https://lore.kernel.org/all/20240819064933.1778204-1-quic_jingyw@quicinc.com/
> [3]https://lore.kernel.org/all/20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com/
> [4]https://lore.kernel.org/all/20240827151622.305-1-quic_rlaggysh@quicinc.com/
> [5]https://lore.kernel.org/all/20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com/
>>
>> While hooking up these drivers may take some time, please consider
>> at least describing a subset of the clocks and the QUP UART, as
>> everything non-SoC-specific is already in place.
> 
> To be more specific, are you suggesting like adding the base device tree
> describing with current nodes subset which only have non-soc-specific
> info, like:
> 1. "apps_rsc" nodes without info of
> "qcom,qcs615-rpmh-clk","qcom,qcs615-gcc"?
> 2."qcom,geni-debug-uart" nodes description without the clock properties?

When writing that email, I thought about sending a small version of the
GCC driver with just enough to turn on the UART clocks, but thinking
about it again, that sounds like a really bad idea..

I think it's best if we stick to what you did in this patch, and validate
things with `earlycon=qcom_geni,0xaddress` in cmdline. This way, we can
take advantage of the bootloader setting it up for us.

You could then include the base address of the serial engine in the
commit message to let others reproduce it easily.

Krzysztof, would you agree ^?

Konrad

