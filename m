Return-Path: <linux-arm-msm+bounces-76593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D81BC84F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529B13E6EB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855E62D0C6C;
	Thu,  9 Oct 2025 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TR8wKMrg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65FD25522B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002208; cv=none; b=lByz4qs4Mi6pbPEMe8stqBCNX4ABDEiXdugXNjYwcpTSn3aI+Fgu/s/sKA5h7JDgw0nCKNPTncyl5DeoN1/brdTnCKD3fAfgC+Jb2Q9Gq6Ud7SDjdHu77KbHTwkIbOH1fpXynw2ifoi1QrDJura0WTWooIghczpSzKuXq3g+vf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002208; c=relaxed/simple;
	bh=el0ASqmaTvmfPJXD4hKNf4F8hGWxKWMWrZAUEtGEOAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoCJOT/KjO+/f0j4K7PlhDdv+uDp2iRZEXAruNbYGmjD2KoUVM8bFR3F4XUumiQtjSYOiHMz8POyOwC4g4JLtu08BTmGADSuwpez5VJpjRR2hpDUBO3bpt5p2HUu4BtLPojkX6AyTGpKUhvruPkLxWwOyHhJFmXECkPyMPcxVww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TR8wKMrg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EYFm022451
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 09:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Q2RvLUP1TRoeCdEklVO8kA/8Vk/VvKeXscAp6CMzmk=; b=TR8wKMrg4tr+wdgQ
	6VYKTMn3aFA064VFzGRZIE+jkvygmm9+Cfbvw5MvYzvVS3al5MoMT2JIDSSMPPTc
	vHIWZhMZNLo2aPIl2HnPoYm7fRW+GVrAvs6qIm48a9ewfI8GSqI/Az7SDkqLmqoL
	f4EgWIsAcBugFvRw3M4ei7Ip0xoRBtblDpIYAZxAPGJh9omh81Xs6Qj6zlFmMpv5
	sSKXtNSe25a4jVdYvA4DUUY0nWPQ/oojXaCLKrcVAfieZt0c3h6r6ba3wsunmnIb
	WGkosrqj9D3XQD5JMwxLyyAOjOQi48B2J/wYXYG0TNc2VRyJmmfUCWlJ9h0fJ2PI
	HA9x9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sj7ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:30:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso2760941cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002205; x=1760607005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q2RvLUP1TRoeCdEklVO8kA/8Vk/VvKeXscAp6CMzmk=;
        b=Pw4gXskKRd6a/z7Bp540Wpf3X9H1GPuxnpdBw7d2cDVxFRN7i9RUXi+R79PYvA0E0w
         RWMFIPk7cLrhpxUj8qxqOM2w03CKOaqObe0DAMnep57Yg7zEX0/2dkEYv71UO5kPCXdB
         E8Oj2dRyENlJJ5JE1dLNzvGQj4nMZGsqNx2MJi0qpzyT0xYVYDWtTQ+rkVxBLjK3MGSL
         +zJqvYoImHiwiGicQbt7PqbuTEJsIDTuHofIBfFjpnpepuxnSjhB4juwUApobIxy5icm
         wdxvnFYlSYnk86ZeR6Z7i7n/3YVFYJ6LcxcWyeMUPfR4H6qzQ6HPrAOHya+mPwja6RTn
         CseQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbC/XVMIJyAPRG320isJ+txWRqJQJ+3G8wFsCVrSw+WMJe97zNgAwnigduzibjuSFkIUoLOCymv8zYtLzp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmt3z4FzBbZlmSAa607nNEkCcIXXZLMdnVsKGQtmcLw1NUH5wP
	H0cLH0SR+Gg2/g3gB8g4QnJCE+1QXpwZoP3lqO5dqDiHYwEbx4LWtGJ3l0PVF/mUKs5X1QusP8U
	3p/M0lBbrzCgy2aIRCi5Lt91WGrOD+f2Fm4Fp8x8/iIwnL1Jpdk3ZG1zn61spdqSVk4iJ
X-Gm-Gg: ASbGncvEgDOprbi6cAwWvnyDbo2OQbZKle76PXtSovx0ueBGsJpPPIMNiuiYXna6nQb
	Y6Cfofnm+hPdmuzzTVmLPfWTi3NyFdBqHCSTvpShHtctpDgeIq1u9Gn0lWJ1oNXtWnlTFrkNtPI
	DI+TRGM3SbAFxF6/2Y6ccgTZzaVrBX3hvu8y99vvCsDDyLgrIwspQVcL3VtA2rMOSRXNInqxrrU
	EKqKWbbFgnbKNE2/7B+Ygs6lXMHcFJ5SXGoX3DD1STI+vC5xyX8Rm9o/DPwbtoIIQv+TrS3MRK8
	Ttp7MYZGeBAFKozvFsN+N5aEf6aeyxNIeo7Bz2B8GjGqIlaQmy6asMgWOya2A4BeZ66kaxRwiAL
	xcLMARBisYVjK72PRgjhWBXtQYP8=
X-Received: by 2002:ac8:5847:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e6ead5a000mr58399651cf.10.1760002204788;
        Thu, 09 Oct 2025 02:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFr0wEaBL2XbLULBN8fCQQoMulUdbLu/EIkIvWun7NFXx/+YOoZKhrRMhgISJJafb8hTw0mg==
X-Received: by 2002:ac8:5847:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e6ead5a000mr58399341cf.10.1760002204261;
        Thu, 09 Oct 2025 02:30:04 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ffbsm1838680266b.10.2025.10.09.02.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:30:03 -0700 (PDT)
Message-ID: <84d7ab07-4026-4313-8919-b5f9205132c6@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
To: Alexandre Messier <alex@me.ssier.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
 <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
 <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yDPlI4f_Wkwjl0StKRf0mum-L-A0xl51
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxMXrHOpnsAVb
 xPU7wOEwDLPNQnCFrNz0Jg8p0OP7SOoDBC8JXX8BcPA8KNedW57nBRun4EZoEKwMqbAbH1t+mkO
 YdinSr5OXQbkL1ep1cwBrzSKS7k6XEw8fTSglfrYuc67CcyDQS4Tnm8Q308Vr/0OGrdCBvwFZlz
 B7s7cJNvOzh5ByBQQ7W8TIXv4D8t5RaE5NSfEcC+n623oy3hMOa35fVIwI1UnB2Sg/iuZ4QBBIJ
 0j2eLBColI0N5ZXKLss8WPbpc6tOHjWk/UhxBKsyWNMgGitXfhPa+L4rZGjhETvl6x4FlEQ+S14
 4YTrHta44ApX3X2AvtLOjfdgkWObceUZOaJDp+MX4VA1JP3X+HiDa/rkqgAOpJlXAuF4emI+IwY
 8MJp/ex2IgPYdRYlXy30cUKRRFPgSw==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7809d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=nTsu3JDRWy1omu5sJsEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-ORIG-GUID: yDPlI4f_Wkwjl0StKRf0mum-L-A0xl51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 7:50 AM, Alexandre Messier wrote:
> On 2025-10-07 06:04, Konrad Dybcio wrote:
>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>> From: Alexandre Messier <alex@me.ssier.org>
>>>
>>> Add the touchscreen device node for the HTC One (M8).
>>>
>>> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
>>> ---
>>>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>>>  1 file changed, 36 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>> index 36eb42f0f3d9..040a256f9465 100644
>>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>>>  	};
>>>  };
>>>  
>>> +&blsp1_i2c2 {
>>> +	clock-frequency = <384000>;
>>
>> This is not a valid I2C frequency
>>
>> You're looking for 100/400/1000 kHz
> 
> Hello Konrad,
> 
> This frequency value is used in the vendor kernel [1], hence why I used it.
> 
> I did a test at 400 kHz, and the I2C devices (touchscreen here, and NFC in the
> other patch) are still detected, with basic functions still working.
> 
> Let me know if I should still update to use 400 kHz. I would prefer to keep
> the value from the vendor kernel (and in that case, I will update the commit
> message to add that information).

Hm, I grepped around in old vendor trees, and it seems like there was
a period of horrid wild west wrt this..

I see 355 kHz, 384 kHz, next to "normal" values of 100/400..

Let's just keep it as-is, but please note in the commit message that this
is intended and that's what the downstream sets too

Konrad

