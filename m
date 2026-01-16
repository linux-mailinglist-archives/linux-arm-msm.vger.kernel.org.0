Return-Path: <linux-arm-msm+bounces-89363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E537D2F15C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB52D301834C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBE23587CE;
	Fri, 16 Jan 2026 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5jf/a/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eENforfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD2B35CBD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557213; cv=none; b=aUNWG90vWbXFlCNmFe21tDh9xH7yTKyBNc1z+YFGy1ivAHNwIG0CC/YkxUf1O7R7vptrwjpFLlTTLrBXKUGXd2aC/vXKBjkGq9AUYmUsm1aYMSxNm5sWxP8Vv47T4r0SLwTjgJmvtK9x3wF8TMLIa65FjmFOKe1E+AsGLMPJyk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557213; c=relaxed/simple;
	bh=ge6ghaPRiNit0+4pAgxtBDe6NbdialyVuuknLaBpZBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPjd84gblvW6KJIxOYBWZT5CmP4NNcE2flkhQvNG3oNpmr9GyL29MHhzjPak3hWau2V5M1iDqPySlKIZwv1AiyAm75Vo01eT/tdRRXHKGL/TGBar8XX/mtxqZkizgxlSgPP994glSfW05c+P+AnHhErKXVr3McIWy6OTifXcELg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5jf/a/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eENforfE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8JriI3714120
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ge6ghaPRiNit0+4pAgxtBDe6NbdialyVuuknLaBpZBA=; b=A5jf/a/I2XLuaGCe
	bFCOwQBJZnToyShg+U/cuxvuk9dgwGjSeYf8fnqr0P1w2A/gB0bSRwCyOdB4GI+h
	wOAMzhB4V39F3/FYpidkFqlCzgtYmS+O+lru7OKBa1EzTdwOepYVh/MNQo1WTqgY
	2Io1NgPKC5kjJJRf70UYt5r828hTmOTaGjZI+mmtxrNTgN74n7DUwEt9mwq36+ha
	wswOuwd1WyM44DI0elJuAJNt29XP18KzJ+G320GFBlumR4U+L95HyfljYIV69sur
	6R8r/n5h9aMogbqX5D7vua0tD8zzofL1JC+qQ0IWJm02VV7dcBwYuJ4AbRnW1TjM
	6P5rZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96p9pmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:53:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5014549e7d6so6150241cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 01:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768557208; x=1769162008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ge6ghaPRiNit0+4pAgxtBDe6NbdialyVuuknLaBpZBA=;
        b=eENforfEAgCmTD2cBL44PxuFbo4v2DbVWM2a32Lwg3PHKcLqalpj+Bhr0Rpa6D2FUd
         k3SkejC9YJ7FLYvd5l5Hsb1S59kc2WMwALLAHY5uJzyh/q1P0IVP21K6g/qdISCSAVEE
         jH8lSWHOgLFXaE+ktK5zEmKGsWG0JBAO2OMPzs7y/8dZz19EUUJELydNOVoslbJXHAEJ
         NoGiSXwkJATus+7/FTbLTRWMtdF/jhNVczSNXurKfhFtdZ5NySzmjf26YIEXx7tkeZjL
         /2XaHh5dvhpqWLpB68sc3pMlPq/MojBFrorvMQuBJHlvDBRwE9nYFxFOUkWO0LHYrpeX
         fSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557208; x=1769162008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ge6ghaPRiNit0+4pAgxtBDe6NbdialyVuuknLaBpZBA=;
        b=FNzId+ZztcSzdmJI5LyMggPY7q04tVZ7znhzkyoCn3Cx2aTHRSuMedNV7/X/4yeYfN
         /vVCaYM/NSbtufQZBK4KZwvcG0SmMGgMKfGC0gMayAA927AVz4hrjq2Gt1RztHTwzvfT
         sp9tOlaQkqZt3hEE3RIbjUTcKcwunefUzD/EHs7bbalVSzt7QLy3IPMEhy8MMQzFTyeK
         6m4pP30HNik2ip6oAYV+/JQ6g8NBanvh9lf4bjBlvIdnG7MCnohJz/RK+gu1/85vPxKn
         DMcieCCibIZQrHR59sIsba0vY34UXhuItcfSj30pmg1q4vC4RQTbeEvxQekYYjnojhs9
         dCag==
X-Forwarded-Encrypted: i=1; AJvYcCXRpHCbwTZteLl6E1CbJr9fTIvAMBJ6W6GbXY+I92vn3T0hlKti/pBy8OvCL6Cra+fKzcKZd0Hrhfh/8GmX@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJ+QKAF2KRksixBUlvdDuKojtXTfp+hy7aKEgDTrClmJ/DxeW
	dvB/yewhm8qxD1uJhfpQ32nldZSNzJZE0MPr5SOEsdu8ZVDAbEjaLfq1avtgWTr1hbWqK9g5ap6
	tT7b5lwcrHnB0xCJFWUd8mq30tdnJzH8d2tJSkJDeTTZkZx3ngPl71yKtVjTuPRjI5BHV
X-Gm-Gg: AY/fxX4hEy13ssCGouNMJcoM7Bvn8pGYkhFHkMGcWQqOZ69A/sVoFXZyVxITeg8TPfs
	abVkqp9Shiq/4zhJVOsfJ2bVJ/PEMZBlKRNWgtSloqf7eaQnKxz0wssQNtIIwEO5lCud7Cg7Kp6
	slEsArbnVNB5/7uDcQsHykFzeHDDovANXLimvIGJOZpqKCyBgM7b5lvW/sDGonnBMiErx7xUlb0
	IjSXDlDxxMJDH/dLIiuZlpGxoxVuxHvLP131NFdwFPEA/w7WsQhlIloYcEsm07jOEZpMvhYIqAw
	4dNPstxJjp6Jd70WzG7kX2gDiIHDUu7VZK/FNyjgyDsbhmRjck0zKRKyPcqZGfosfM/IVw8AnOW
	X0Kp6CJqA5qOeWF9MhktQk8Ezv0Oiw6HsbWyKsUiH2xapG82OmgHFjAEITR/Qs3pxKus=
X-Received: by 2002:a05:622a:610:b0:4fc:989e:f776 with SMTP id d75a77b69052e-502a161627cmr25289321cf.4.1768557208445;
        Fri, 16 Jan 2026 01:53:28 -0800 (PST)
X-Received: by 2002:a05:622a:610:b0:4fc:989e:f776 with SMTP id d75a77b69052e-502a161627cmr25289201cf.4.1768557208059;
        Fri, 16 Jan 2026 01:53:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm1933290a12.31.2026.01.16.01.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:53:27 -0800 (PST)
Message-ID: <253d0cbf-f65a-4f60-b874-4191e552c191@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 10:53:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <ff8fbdb9-dd03-4811-b9cc-4ec0dabf9353@oss.qualcomm.com>
 <4cb609391559a88a4a6f1e2f550f8450@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4cb609391559a88a4a6f1e2f550f8450@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MyBTYWx0ZWRfX3PhKTAeDkSyG
 8Y+RmjokxSgoJPoV8cxE2iqr3HQi6G2DavqrNjptdBliiSVcU05KjprmFc1vHaidyHTd6n39A3d
 JQVb14k9Rfc3aliF/aUgqa0JMnmIoKgUn8e0JX10mUSr/X8c02gj7M8UKAsIQNi8wLkGsKKvoo9
 0IcbXZlmUc4jhr/Ehem1soOPuRZhCIg+KDxmW1Ay+Z6p7ltzxKpqV4Ri0RsawvtzHJwwfAYfXr7
 wpNOYKUJxA5Osvc6LGzBJaKSKNKr6DAGf/WBZWlWUzq4vxsx87iprqGlKURqJE3i7WWZVkicDHS
 pS5rCFvDCyRbVBaPLo9YVq11VF1z6GH6g9+wUX+aDAC1gKt7aWDAHmYmktVkjfOoAe6PtJ6oWNw
 Mb+XqHk0el+3plKhPcl9CcOtFK9N54gNSKLBcraUqtug80RG75roMCdfKFMwqHUbigOo7z/EtZP
 7RqMgunk9SGxIokWZrw==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=696a0a99 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=LpNgXrTXAAAA:8
 a=OOYZNU6-2sxu1PXP_N0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: txwm1fOZrrEACvEuA417gwbX6Q6fnGBt
X-Proofpoint-ORIG-GUID: txwm1fOZrrEACvEuA417gwbX6Q6fnGBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160073

On 1/16/26 7:53 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-13 10:04, Konrad Dybcio wrote:
>> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>>> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>>> the only difference is willow have NFC.
>>> Make a common base from ginkgo devicetree for both device.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> [...]
>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> index 163ecdc7fd6c..70be19357d11 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> @@ -1,304 +1,12 @@
>>>  // SPDX-License-Identifier: BSD-3-Clause
>>>  /*
>>> - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
>>> + * Copyright (c) 2026, Barnabas Czeman
>>
>> Is there a reason for you to remove Gabriel's copyright from the 5 LoC
>> that remain in this file?
> The original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi.
> I have not removed it, it is a new file with the old file name but
> i can add Gabriel's copyright here also, would that be fine?

Well you certainly don't seem to have contributed anything additionally
in this specific patch, other than splitting a source file into two
source files, so the rule of the land is to generally keep the copyrights
as-is

Konrad

