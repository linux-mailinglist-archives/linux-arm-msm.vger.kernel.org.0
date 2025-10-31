Return-Path: <linux-arm-msm+bounces-79837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B027C24296
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0371891456
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DE821CC64;
	Fri, 31 Oct 2025 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfBAv8w1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJt7DQqk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C9525B31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761903025; cv=none; b=dYdlK93ILiFt2v8qlzl9uvHJX9grHvaALZDyq5W8lPTdt30O85Vq4FKUT0MORZe9eZJLSr++k5hIlvDdJl7qbJ7byZJgvzhmo5+8nA3mS7iw9W9LieSe//Mgl+U9HGjnDJ8GAEwXkolbrsIlxeoHNVqeuKnnSVRO2hIFi9KOxDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761903025; c=relaxed/simple;
	bh=rYH6p1UwRQOjMh69pzRcI/An0pAMCpeV31BylTlA0rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZkONFAcwGMIiUqZHBhH7Cc6pyKbbU0D6m8hKs9LBb8mLqnD31RT4x/Fr2ApVSWZKRaaTJ9nSpFtS+igkPN3gq0q5nZzuof5yLvn0LLxUhUgxSJuzXwRPb6lNppGNYEEgTnjnrCW++QE0E+ExRmC+iPFEWtH0SPCbFuXggJPqaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfBAv8w1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJt7DQqk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V4Lhin1826917
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpeBS2pFql6V+IwGychAPEk4HDzH/LVw68M4+RrrS1c=; b=LfBAv8w14tdIN12z
	QBPnXl46Hz328zAajoIW/ctH06/9frPi9Nht3HLiBeBHFCxjP+yeDyDHtoAPKm+/
	8k0PrLAAtyjh4vBywHCdvAfhB6k56MS3AorBajjmmxBJ1yf5m2WiTsOh8tf5/MAm
	4p1x0XXPgALH8sIhMMN7JenHgZA2Ae7WZdh5Sv3ol8OjsxzkOl3nXmKsxCtcyRj3
	QNg47xLmOkhgAVMwAUy0EBJ6A0IWjvQ4qyI3xVUfcIN6TOrVaiuphRlXAEIQ9jlf
	ye3YkGCuckG1X11f4rHf80+ewMe2rjLu0iEP4istvHBiN8hdNhku57iphzY9IRrJ
	m/Ua6g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11rry8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:30:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7f5798303b3so5542856d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761903021; x=1762507821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpeBS2pFql6V+IwGychAPEk4HDzH/LVw68M4+RrrS1c=;
        b=UJt7DQqkdLsdGiJAQoFKqI/A//x5P//hRHAiC33Kg701fB2K0/96Rb0Rrzap8Dm9LO
         T9nKIARhAEr1uF2I8A+6mfUn8PBXrOE/uNawZgMhXjKKXpPFFbAuKtQiCuC/LctUweTd
         ooX9Ys3qKZR++CMni/8/gw9odOrn+yjg5s94SghrWu3aHYd2cAF6OW5ujNc+rDDrlf9z
         ccicxSIQXnT+v+0Oxam5+y3ILNdFywt3evB5lg+Rd1MB7ZfitGrZWiKQznh7B9Mt0AXb
         CqfmHriEA6MGSaUIKyEiX9NTgcwmnqNGAkhofmFpV59oWsk55R1Qgjk4MjG+rE5n/fhD
         hhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761903021; x=1762507821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qpeBS2pFql6V+IwGychAPEk4HDzH/LVw68M4+RrrS1c=;
        b=WwOmhl4Wjx0IETmKzl/ckYaAeATPW5IoWCTjzg3IlQSjh5Q0s8MQ9fr1jvxeX/3FWf
         svP2r9KXoAidr+qGETJcvhvU9ZDWVMAMdTirJoUq3abGSd66ztBC+3CjAbbaQVXKTVUJ
         3WpP0o+34W+35VM86CzmywPmjSTis0Ms+RGslKEO/e2hgWPUReFOXljSoGgaTUxFes00
         x9TpyWwJgtgsftz1J4i+WPfPJC4DqCIJfVjK3cAlHGLesESktBd5goylBkON3bZzAiKK
         mlaWKHO1SPBBzDkjDgs4vDHr4FqmgRJdSxJHW31p/fjcfPzJUDuVdyjH1QofUF8VKKUp
         Natg==
X-Forwarded-Encrypted: i=1; AJvYcCWQFmQ/iVL0E5waf10WcgfXThuiPAF/CULGnnr+lE35PxSJ+G/k7Di15N7GBlnRmQuI10afqYwn31l+4hCp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu1oH0wBGmWZUmQd4mhdPX9D4U3aigWvawKw/lcOrszlgySvEu
	3o7SGBmM8ldpXaB1mWZ89I/Hb05BfyKxaMeP1Vki8TaEsugcmxVX6OhW3So+N5nwrWffBGuELfx
	q5yMJJ8HoGvn/XTCOIw8GIsR4ZMU0vB0DqilQH8j8K8n7+STQi1cKsxNUYesroL8h/myk
X-Gm-Gg: ASbGncvMFxtrTHu5sXJ6oB8fmXL2LvS8nU6j7M7GXmj3rQw+MpMboMiK5QnjN1AHnwY
	wKIForh12w5zhOlOFbwXAg82+XFMj+XEZYdvWUTLZ2c1NEDGjcMfc1UmcYh5cduToRpWV31b6oR
	dehWKdpDsAquYRUbhVXHhvvmkPE+i/R66MdbmGG1BeyZ+k1T0pjytZOFZv8P+Ak9HSYZH7VKe6G
	O/KeZgZLVgNgkpXgXjl2QYdP9r3Nh2gDzhK2MxSPwu+adBdSYG/AbnWwzozqpWZsyGfhUSiuqlZ
	PSseM4mKDnrz+o6BrO+rrrJlpX+6438tzQ63dKbKyxY+8614aTSRYSgIcja7/UoqFO5907mSSyd
	mYtz13dszPTOTc4L984+L0/loww6i8aYKdhOwM2Gth0X/bBLUthkmMc08
X-Received: by 2002:a05:6214:258d:b0:798:f061:66bb with SMTP id 6a1803df08f44-8802f2a067amr24530226d6.1.1761903021313;
        Fri, 31 Oct 2025 02:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7xuL3S6oQLiRiRzIgeNjF3+Y1M1YfvJIBFLTYfnnQZPRwn0ILwmAHIvzUH0vueOA+61ZHZg==
X-Received: by 2002:a05:6214:258d:b0:798:f061:66bb with SMTP id 6a1803df08f44-8802f2a067amr24529656d6.1.1761903020562;
        Fri, 31 Oct 2025 02:30:20 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b427fb9sm1137215a12.23.2025.10.31.02.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 02:30:20 -0700 (PDT)
Message-ID: <adae8998-8b64-4814-8713-2dc63380452c@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:30:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: create common zap-shader
 node
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-3-7eccb823b986@oss.qualcomm.com>
 <c90b917e-b3bc-42fb-a127-ab47d5154d0d@oss.qualcomm.com>
 <c62a7f9d-6984-41c0-88c5-1d6c40d411dd@oss.qualcomm.com>
 <weyze7a2pqmt2klt763lbwyvpezqndm5rjnitexalru7hy3xhh@tdqx6xeqp3qu>
 <p5apfg5cbwcdmilfr3omoncvuj7z7zbj6dkex2eicjdubkyxwj@h42bzzhx4amt>
 <fuach44wl236rfm57itxmcvj376vr3m7idi4byge6mbbxcrr3h@4uzjnuefh2y5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fuach44wl236rfm57itxmcvj376vr3m7idi4byge6mbbxcrr3h@4uzjnuefh2y5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tox8eDs_9-QYHNA2Y2MCrO1AceTlccbv
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=690481ad cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KfUywC4eykHvL1nPqbUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Tox8eDs_9-QYHNA2Y2MCrO1AceTlccbv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4NiBTYWx0ZWRfX7A5lsdCys87b
 vVjuVFiHU7exfA/HlAwavNbRhtDCPLprBeyf405ES7KiO8oar68UH/GCjBvulgiLvYezlK5EfUL
 cwDBvRdmdAKDOMlWwPZ4dUvAaBqJLPeIOM4LZKUety7MIZlLYqn5YH6W0eNkvyvF5yI50SUeF3q
 p3WYbEUkc5+C2GffmvvHmxFjSuvzxVXZD1dI1dyC+5a22iO4Afmk3q4PI71Z9MU68IzHhthmshW
 mZX62dWWhwQmmq4iRAd3KyyFqyzVsjMnv+70qM4c6M5oeB4NfW3KP9spJ2nuUL/Mzm1JSFs8dYZ
 432x2selkHI8J7CwjbCMcIvGrQyuScAmLyrUK1d5+K235MDvGv01cvnSO+wKHLJaDBgrB5dvoA/
 lnfsoy2YrWdYOIRfLFHS4MccFreftw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310086

On 10/30/25 7:45 PM, Bjorn Andersson wrote:
> On Thu, Oct 30, 2025 at 07:58:46PM +0200, Dmitry Baryshkov wrote:
>> On Thu, Oct 30, 2025 at 12:28:31PM -0500, Bjorn Andersson wrote:
>>> On Thu, Oct 30, 2025 at 11:59:00AM +0100, Konrad Dybcio wrote:
>>>> On 10/30/25 11:58 AM, Konrad Dybcio wrote:
>>>>> On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
>>>>>> In order to reduce duplication, move common GPU memory configuration
>>>>>> from individual board files to sc8180x.dtsi.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
>>>>>> index 93de9fe918ebdadf239832db647b84ac9d5a33f6..069953dcad378448800d45e14931efe1fe1a69fc 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
>>>>>> @@ -14,6 +14,8 @@
>>>>>>  #include "sc8180x.dtsi"
>>>>>>  #include "sc8180x-pmics.dtsi"
>>>>>>  
>>>>>> +/delete-node/ &gpu_mem;
>>>
>>> I agree with your hmm, seems this line should be dropped(?)
>>>
>>> Dmitry, please confirm and I can fix it up as I'm applying the series.
>>
>> Oh, and this line is necessary, because sc8180x-primus has its own
>> location for the gpu_mem.
>>
> 
> Hmm, you're right, not sure why the memory map differs... But this looks
> good then.

The latest memory map for 8180 says:

GPU micro-code @ 0x98715000, 0x2000-long
(matching the Flex 5G)

Across all the revisions, Primus's range is either part of a
"reserved" region, or the CDSP's memory.

So it's either wrong or OEM-modified, with the latter being rather
an odd thing given it's a CRD..

Konrad

