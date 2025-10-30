Return-Path: <linux-arm-msm+bounces-79625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE5C1F407
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 167034E96A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8502F12A0;
	Thu, 30 Oct 2025 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JocMXsx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFmY+pwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160AF2D0C9D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816072; cv=none; b=lRXtx6pfWtv7kO1rXIjlhJlssSOGoJy1J8XalLigERJP8Ggi42bZA4PCZFG4V1JgZV3M/EfodUT4pwUiJykLoRO5OHlLG56V+8LA+ZnjO+2yPRzP5/m8YR7tRz5GV7Tz3RvJ94/aqCzG4pEbVOpkVO1BK3RlTyFX0FaVuCd2XGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816072; c=relaxed/simple;
	bh=ZbUSH8YEtVpK+SB1ksdbnsza3iM7iPgVjadp9NMUzMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNk/BqM8X6rOPhCJ4mwyDr5ZQxDmeKa3e7VGug9v4aViA1PxQzb5AzT2Xzv6pFe+mnPdJCwePqUxvbNNofGepx82RQYrJL7HchBZUBlt0FvEIYVRZ3dxXDItS+ZWG6NsEH1L+MUdURG/jIWNnVHoMGbvmllKc5vBk+Y/CbrpWVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JocMXsx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFmY+pwg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7mdsF1578970
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfUwVbPs51AL4l2LdxpZRB9YbMrAh0PTO+r90p+nVoE=; b=JocMXsx1Mnl2mZuo
	IEnYdS5aSXbBRlPSRX6Ne+0uvSEfhF6k0OWSJKZA14XD9b/j02RQ4wT25ugmSUj0
	7aoxyGrQUFxxgv6iA0mfY1OX/c+20/wRjJFq3vtBs2fNqOhdj0LaJhry757tB+mL
	9Gdfk7nqHYDWQKvGGFGZ+2/pSUNpZLIq6l/UCUfkmh3+2iPEHc28ljWoc/RlakwL
	T2DklDuNCUNhOaSZ3kHWuA7eggdgk19qBmVFwi2v91VC4jxGcvMfO+ZR4t5tgskb
	VzfRT69lNaS08mDEOU5F8djDjZZBkr9/0yh+uv1bCKmm7mOl+SQrINwJSD9sQeMg
	/P/nOw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjehsv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:21:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf77618a5so22025011cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761816069; x=1762420869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfUwVbPs51AL4l2LdxpZRB9YbMrAh0PTO+r90p+nVoE=;
        b=BFmY+pwgaFaK50yuLXVC4VSFAx1ImAK4BTzWK+K0juMlN8VlB98nHAa3cEY6Aw/DMB
         zjT1g/0WmTMSVjNmotghXCBWcJOSbNZNY1SCgYTL/J5neh+19EN3Vl/hXL22sY4t4BwZ
         bLeSrzh7IW1jWuYcu749MN8VmAvDsnKABW2f2LEbDHvJO0JlPHUI4RvxT8/nEZarWrNT
         aJxHWyynQwaNZxVgaLHQU80ctyEFgbWW8mHfr4y7O6OoC08RVdVHAv632LhU5ZsCCEE6
         v7mPSGjcw+CyEaT1TIQvqW0KLC7vI/1GOkrL+2Gsm/zu0VjiDqowLdTZ88OWKqkC0SXJ
         4GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816069; x=1762420869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfUwVbPs51AL4l2LdxpZRB9YbMrAh0PTO+r90p+nVoE=;
        b=HaJLkc8iMdNpltKhnFewdJ+i6QpjNHL2g+1pI1kXX9gFB/20WJY8eTG9KyoXTKpSzM
         ER801x+66qY3aBR218l1FlDNHI6ZMmWzER/hqvrB+MD+co3KywCpPS7ELbbVpwHFGrLz
         +uio4rl9U9MVXiheoi+aiLYbUi7beosn2hXh9BiZBUW4qFeDJ+bovRzgsgyAe1HqHbEh
         gbTq6AdVJSIgd0uQzLZeZ6EPk9U7AmJ6dyvRfR/UsEQRAeicD3pk409gPx1mr1b2oSQg
         ZPblmDXhanPGKgnQsVULA27eQK5zyDMgige1Kb0w0vOBlz1iq/ekHJv+gdKi399Mmj3U
         zQiQ==
X-Gm-Message-State: AOJu0Yxm7n0hDuecARFFktvUCnkNagXHimARlBgdM5MLb4cremzGuLHT
	zrId03OdgDXcJTrMkfAiQiSJj7yWxeO42YeaNhWVb5SKdnZoRFKJn+rcFV1j+1pL97S+YH57Gax
	Au76Uzl2ndX/Zsw1IjBQPTz9NYhFgqkTV1TFkPO3UPtMQ5ZpcCjBApH2lbK9Hb3ICXfEo
X-Gm-Gg: ASbGnct74KMvSOO4LZVr8oJzSItfZMgH5Bi7ageHoWxTnDeq1sEfuiZo81SFZ+JettM
	CmbbKDj6bf7pKJ6BpEO0hlNCDp+FfP1dJlgKymZ5ZibvDuRs/wmWeHRiomAH4oc6N99t8uXfQgs
	nSA8mZkcOxMp7CvHHXJYnz/p8624e8jtVvE6D57m25T3G7ZtDfdZCqRc8zHbFAbPL4XL0vPloRx
	z0Hp+lRJBhLp8URRcUAtY/LXntp081UeUUNcvphLBprz1xIqttrSSgD6+L0UDosijYWK853vpTf
	DlFiwb5ZIgizy0YG1MXDYkGt1fx7ls+73dfFKvrUMdV+JtvilgHovHKom6Ms1CooAwuQ9+jt2SD
	aKwco4m9YUttF5cQOjyg7Tbi+3OAO5DSSyzqj4sZOr33ibAAszg1v5kGV11luRdluLDAkUQ==
X-Received: by 2002:a17:902:db07:b0:264:befb:829c with SMTP id d9443c01a7336-294dedf483bmr67053165ad.9.1761815313020;
        Thu, 30 Oct 2025 02:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu3xXjROAG0AbuxZKF8uMAd203m14ukKjCiRnjsSl7vJd3tLAM/xmr4opVRmTBwC3GqV5ybQ==
X-Received: by 2002:a17:902:db07:b0:264:befb:829c with SMTP id d9443c01a7336-294dedf483bmr67052785ad.9.1761815312406;
        Thu, 30 Oct 2025 02:08:32 -0700 (PDT)
Received: from [10.133.33.50] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0967fsm177213595ad.26.2025.10.30.02.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:08:32 -0700 (PDT)
Message-ID: <0cf2521b-8d05-42f0-aab8-35cd370e599e@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 17:08:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add backlight support for eDP panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com>
 <b5d9d47b-7fb2-4ce4-9bc8-0d28395b78db@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <b5d9d47b-7fb2-4ce4-9bc8-0d28395b78db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SYDXf96SQAXouZEqrjzswEXIsJWsRs1j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3NSBTYWx0ZWRfX/KskuVKvpA9o
 JSSfUpmb6aOTANndAiwLN3JgJh0/iQoVhN/cDc7q6XLiSwqUKDY0XGZzoo2ZY5Q3U4fxSYvl39g
 U0k65IGEl8FwSEOhP/yGxCkiMKaO31VEHgzQZ0Tbi2hifwsE8trqDpWzwr6kV6LAVGyHyfQRan/
 8NGFidO1NwWgjacnZnUJdi1yTb9n4lb6CQ6aG+DzIZlgPYcMYKeEdvAwotYP8jZ+2J4YIHzIZft
 cv24wp561KzEkO3SnLn5TIfeo4Tad0zriEebcBgqJ6+zTphfXnq4y4PT8Vc+Gs6abQxKlBljGGg
 YnbX5JqoPpVfSMpfirVDbeUmw+1d6VIaHotup+OCiq3a73OWJ4PUyiIm+rifsQeqTah35H0YOwl
 cpUZFauPk25w3OQ3ycvmTGH7D7H37g==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=69032e06 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=81pMHEbCwSLrc7DcvnsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SYDXf96SQAXouZEqrjzswEXIsJWsRs1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300075



On 10/28/2025 5:08 PM, Konrad Dybcio wrote:
> On 10/28/25 8:04 AM, Yongxing Mou wrote:
>> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
>> control node in kernel DTS due to some meta may not enable the backlight.
>>
>> Aligned with other x1e80100-based platforms: the PWM signal is controlled
>> by PMK8550, and the backlight enable signal is handled by PMC8380.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
> 
> The subject must say "hamoa-iot-evk:"
Thanks and got it , will fix it in next version.>> 
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 
++++++++++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..fda1b3a3c7673be74832c27849231cba4bc1f25f 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -17,6 +17,16 @@ aliases {
>>   		serial1 = &uart14;
>>   	};
>>   
>> +	backlight: backlight {
>> +		compatible = "pwm-backlight";
>> +		pwms = <&pmk8550_pwm 0 5000000>;
> 
> Try adjusting the backlight value.. you'll find some funny behavior
> near the max level.. which reminds me I should send some fixes for
> some laptop DTs
> 
  I tried sliding the backlight between the maximum and minimum values. 
It seems that at a certain sliding speed, when approaching the maximum 
value, there is some brightness flickering. Is this the phenomenon 
you’re referring to?> [...]
> 
>> +	vreg_edp_bl: regulator-edp-bl {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VBL9";
>> +		regulator-min-microvolt = <3600000>;
>> +		regulator-max-microvolt = <3600000>;
>> +
>> +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&edp_bl_reg_en>;
> 
> property-n
> property-names
> 
> in this order, please
> 
> KonradThanks and got it ,will fix it in next version.


