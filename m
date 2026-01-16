Return-Path: <linux-arm-msm+bounces-89384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852AD307AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 12:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 790983081139
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA5C374196;
	Fri, 16 Jan 2026 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKDM+ota";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vod1QmzX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B92328605
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563022; cv=none; b=ELwsDmmp3i324JAdctbyFH5pfltL254fVgCKAAeZCTFEsINfLkdThoBv10c6+hq8VYMMAciKTNm1XwcnBhXMbCY/WWdtmhNNy3A4WdOCfQgpjLwBDCz/Y53z3EXjdrYa/HMSA54QU8Uv7wXqzCUWqQtBsJyILF1P4AjeEJwqcDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563022; c=relaxed/simple;
	bh=TQTvbgiBG+SKBmDtt/7Qz10lccsxtBeY3EJYQbt/5ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4k+rS4iGnBcXc+Zme1RZsdfjFPLSFf1nOfKWp7nSK05+nGCBy9ViueSqgsSzjoNTEhB8LsQHdoHnYBo/AkTlVHkhM8BRZ+HCFEiOPPTVGAl9XztMOLizbGhD24bFNnV9a7rpq6hAFIHZ2MmNfdK0rD6qsiD8wCAiPNDlqzn16Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKDM+ota; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vod1QmzX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8Gre62615142
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09h4tPa/kI/gXdQi3NlmGSOnFal6CqO9SCpG9ObzGqg=; b=EKDM+otaqzpTsTFA
	a89rMF/q7ULUU7gUWmU7o9AqUkG+2q1cUlfYNuW+/2aovpB9/kNM8O7Ieoxaouex
	ihjYuB56RU2C4U19LMsDVCi+o3M1yIjJICA8GZPQy1dLNgvuETB8lar0nd+IGaA9
	4DaGbfARlhv8jY0tnLXy5Mnh5npnjDq6N/Dt7K92529MoQoqBLlRg8DeSWmgU/86
	flVAksWe7iSF+RdClH/xIE4bYJLySa1daCGBuwByR7FhodX/WVWytTsnBJhGThYW
	KfUvGNfx456A+k9ni7uXk42pngMUSxvmvsLFafUV/4YrNE/Ru8X6jGgDrNOXVR8T
	P+chMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977t10e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:30:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50144419b6cso5478531cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768563018; x=1769167818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09h4tPa/kI/gXdQi3NlmGSOnFal6CqO9SCpG9ObzGqg=;
        b=Vod1QmzXu7uxSyKNXo9K7dOO5TAIM5cWG4lrmVxI/6Ym9jlkrt8MtrbjXj5CYoCcy0
         Qe/BVwrGgwtbofCfQkf8bYFIEl6f7yK5kGEyA08saczYVUPQJTffDreMLz9satv5SzQ3
         y7ZqtW70MJzBmui5VQ2ol+QML1jSaRU9o78ULpB/hKSUAhxHWSI4l38quluffybI7Mcv
         2rJCe3mDnR35nACRJf+FCOPIXQId2XcKcAmyi/9YMuS0edK6eP1zjmCD4rgr8U8rg3Z2
         L/pwIe4ua+RMiaCUZtXkREqk7H+p4NZZejqnQDTplqEwrZd/n8ouCRE6O2dMO1zBt9cR
         d0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768563018; x=1769167818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09h4tPa/kI/gXdQi3NlmGSOnFal6CqO9SCpG9ObzGqg=;
        b=bgVk2xKRF6sUAKma2hdZTU579YLgnFd8Z3UZpX/A2VcYo+AvhqHJQRywqyJLom5j1c
         9ppUkug31J1bWptsAedukyUOYwa5/MkLz6v3F5fOfKRShNBIELxa07J1QYBkfkp6W7zK
         8kF4vHS60YlJM8hkNUeQXWSUQIVYTh5K0+1WpMm8XdfXS/Q5gQ9MQztWZf6zM/X1mT59
         NW+cmAzoTEI/gMtraFCyHtvyrm/pNzSFbT0vdGU24fmg0xkl/8Eq3ViAuMsCFSvpUeQK
         mEk+JK6kjIUhRRkZr+9qtB5GQrepmNRSk85jbctetAieoqFIQWeBeJGqCo9ymFKmo4RU
         zrZw==
X-Gm-Message-State: AOJu0Yzh2brJLJ44B1rTW880MWlr+JaO6qZQccv2RnKDHbOVFEScIMvo
	VNLqkzffIraV0Jg2OdZGrq9uZlnZTpobX+XOclje0qLFlXhW6+fT0/JsfQa6vlpBbUa8rPGFv3f
	OwGvh6tdSEUtdzILjO7v/zgTePZH7OcVjwGOhvqqxjTfHoVfwaRVgmtM7tRIprnfW95HP
X-Gm-Gg: AY/fxX7jJ1p0vvJJSMkH9Xi7oHo9mdCB0ow18BXynFLi/7OGrHchW5++b7TB8erQPfu
	9bgMjAHwTmUBZeqUKaK6jXMKT3HoyTOQwEsz1GdFcQGWtObecC5FAnBesCKfDVka9xznAk0qvH9
	jmNdCj57eFMUmfyBg5lWxv7iZFHUGBXm4ZBMO97TeedUOZqNpmMA5D9ppmjnSZV8hPJqdoGfSjY
	46lk0VAzkL2NGA9G9uc+aiKtvrjVbA56iU4ZMo3hWTvyP7h/GsQ1Hdn6Jmv+3LM0q0ytH1HWEes
	Hboph5/aGYzwdYZhTXc5NTbBQCA/auJioTvTJSeshMhtaatQJiC60L7RfT+UEuagaE+7Te3/WM0
	/aH5xSv9F+lFxsexGcDPRh3TVSTKiZWZYUwTZ8cUQ7RmLPPTo+l3vuXCTxYW9CYn/rKs=
X-Received: by 2002:a05:622a:1794:b0:501:4767:a6f with SMTP id d75a77b69052e-502a16043c2mr26336761cf.3.1768563017760;
        Fri, 16 Jan 2026 03:30:17 -0800 (PST)
X-Received: by 2002:a05:622a:1794:b0:501:4767:a6f with SMTP id d75a77b69052e-502a16043c2mr26336231cf.3.1768563017270;
        Fri, 16 Jan 2026 03:30:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513ed07sm226392566b.3.2026.01.16.03.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 03:30:16 -0800 (PST)
Message-ID: <42a0e768-c217-44b2-81ba-1237d9f983f9@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 12:30:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
To: David Heidelberg <david@ixit.cz>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
 <723357fc-a785-45d6-8d49-4c00dd4f340c@ixit.cz>
 <ff4d697c-2007-4b2a-b66b-dc86053a20a6@oss.qualcomm.com>
 <0da3c96e-4f20-4bd0-836e-73d20581954f@ixit.cz>
 <e0f33ac2-331f-4ab4-a960-6bd8bcac7306@oss.qualcomm.com>
 <d90872ae-968f-4340-8348-aa83de92a3de@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d90872ae-968f-4340-8348-aa83de92a3de@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZVdVNmHkRjoDpfGwNN2TOJ0UscjHZZV3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MiBTYWx0ZWRfX30sWTsA5goIx
 6c6yA6PeyA914kUpmq7Y5DvALM8vrCFXj0rQ5k8ChjJyhsDvKvHXKytlGo7p/PEBxr6t1FzC1MX
 IHTS+t/kT3j7ay+ohlLSal/6R9uKq2makAIrCIZPZj5q1FuZHcxsS1OE4OCqR0lO2MlFAnctdYr
 V92cAFqyE2lXJycuBhR9+PcsXPu/hmJt0Wv60RBgyXNDpawQm1itOTA50PzinNK9ECxj7Q+GzJx
 g/L1BUmWdVPWaTIqxeoSWPAP7/Z0oLvhzX27j5QgLQY9STrLY3QY0DjpGOAqwG574fx3vYFR6UV
 sIKqIiateHuTVBiDqzCRj4ebmWsMSQyaLMu1XqxO0AfIPK0mue4J318+WCNZDjtRZ5HYf86/yIq
 WwOInUOUAngKF70GNCs+MRMNOChFKqLvo6c15YqkCbRQIo69gvsSbZ9sM7+vqeF7JNBS88Y1r+a
 XBqKKHYeScjlVVZGdbQ==
X-Proofpoint-GUID: ZVdVNmHkRjoDpfGwNN2TOJ0UscjHZZV3
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=696a214a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=WKeohOAsuF05E7y8TmsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160082

On 1/16/26 12:21 PM, David Heidelberg wrote:
> On 16/01/2026 10:52, Konrad Dybcio wrote:
>> On 1/14/26 10:55 PM, David Heidelberg wrote:
>>> On 14/01/2026 11:28, Konrad Dybcio wrote:
>>>> On 1/14/26 11:15 AM, David Heidelberg wrote:
>>>>> On 12/01/2026 21:13, BarnabÃ¡s CzÃ©mÃ¡n wrote:
>>>>>> The device was crashing on high memory load because the reserved memory
>>>>>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>>>>>> Change the ramoops memory range to match with the values from the recovery
>>>>>> to be able to get the results from the device.
>>>>>>
>>>>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> Hello!
>>>>>
>>>>> I suggest one more nice to have improvement:
>>>>>
>>>>> you could label framebuffer cont_splash_mem since you already touching the node and testing the series.
>>>>>
>>>>> Then in additional commit, you can replace manually defined `reg` in chosen > framebuffer node with
>>>>>
>>>>> memory-region = <&cont_splash_mem>;
>>>>>
>>>>> For example you can look at sdm845-oneplus-common.dtsi
>>>>>
>>>>> Tell me what u think
>>>>
>>>> If you wanna do that, please call it framebuffer_mem, "cont_splash" is a
>>>> Qualcomm-specific name for (roughly) flicker-free bootup
>>>
>>> I have feeling someone recommended me to stick with cont_splash_mem.
>>>
>>> I think, since we'll be doing the mdss reset anyway in sdm845 (which I used as an example), I can do the rename in our sdm845 too then without any harm? (no it's not flicker-free takeover :D )
>>
>> It's not flicker-free because the OS must cooperate in that process,
>> whereas we currently reset and re-initialize the entire display subsystem
> 
> Sure.
> 
> Previously I was thinking, that after doing proper panel driver with proper initialization sequences etc. etc., we could have device-tree property such as "linux,takeover-from-bootloader", where we could skip mdss reset, panel reset and just continue from the point what bootloader set (for devices where bootloader does the right job).

I don't think there's a need for a separate property. Once MDSS is
powered on, various registers could be read back and the state could be
largely inferred from there.

It just comes with an infinite amount of edge cases and it's not top
priority for now, I don't think

Konrad

