Return-Path: <linux-arm-msm+bounces-79632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 918DAC1F5BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CB60188E3D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6816337BB8;
	Thu, 30 Oct 2025 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+q61kk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fiOaS1Id"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFC0342170
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817318; cv=none; b=hLeUACJQoAq/RV5RI8FI9mi/E92Y4Y5AzICMWHMMvY/yz5XH47NNoMs57t1yS68Nsno11D2U7OAkU7IreQzKx0aRU/6nJbgujcDANNWwtMRvaJ757/eps0rarLw6fTcqtJ5Eb2GKp7nN34Pi5uc5DP+97iL+xrcMWuXnd7j3m7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817318; c=relaxed/simple;
	bh=xxO2m+K4+X6ZywsuL0npJO5qkxo6MOVOHSO7y5HDfbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Myf1VYO72/RMF510SbuvlIHWYvJ6IWfxrGe8gwrnsRh2Y1j1kZfFyJnNi7QCh/sWMYqM6xmaMvMHqN4LiRzlhWq0+p7vrSS3cW9c7eOJHclWF8GbTXSh4BnOmb7x1WMpjroHBXBCjz3UShsr/oWxl5rwdKGZmGLN9W8YUcG3fts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+q61kk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fiOaS1Id; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9Ogq6810809
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bh/NrdqFUpU9wVwB3r8i3vqn0tl54Ze3lOlTg9aA8Wk=; b=c+q61kk0F0tX/xhN
	1d9JzSJos6pXN7B3bV+DMQOcjZAo0iU/Y677CvVXMm3CSbBgTXKaG9ls4ZMv0+uf
	249Sr0OHPR0ni0JKEl5YHKto7uqsc0cz2cb4rsLmEwIXVwBeDsjC5w07Iv5wXhWC
	V1C/BIyfKkeFr5kJg4kLFZ6Ygi/7zehL+ra4Tor+B3Xp9kF7bv8dZANY0IdrXTY7
	CWN0D+ZsIgJEWEsjagGwfaqvCjWWVWxycRX9/XfbJ8/KXNZFS2diNlX2x1uKvInD
	E7n1QUlPb2JAFRENAz8VQI1cmA2xYqQ9dIx9J3SxYZ0S93Ye4Df7M4epCEv8wew1
	NXZtvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvgb28f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:41:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eb9cfa1b72so2775941cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761817315; x=1762422115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bh/NrdqFUpU9wVwB3r8i3vqn0tl54Ze3lOlTg9aA8Wk=;
        b=fiOaS1IdZRCiEmI0lDBzrClscpZuQZNe53xEjWSk1cQlIebrZ4UrsZoW7rQuvk0HuC
         FWDiT3prx5DZ8Emo0A1bhNlfy2rnjjE5ZYZBCGv/CJ2myzTBu72csLFqEmKtVUbElQUs
         W13uueWkNEtIxnAFbbgfDi5Uye1uuMu6qu21Ool+lscLrvvsKvxwCJ1DkIDMLYVhrpxw
         rzWIHzguxVF/1jzCqwg3YlaWUdjTTV8wTQXO9XqxIYnSrokKgL5ULbRBk5g5RfUIId7N
         cOjOGG1R1AHqIcJoPgw4G/sR/a6GwdnhPu1sxRwyQmLFmugI9Qbk4T2ZJ80rp9iwmHhc
         esbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761817315; x=1762422115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh/NrdqFUpU9wVwB3r8i3vqn0tl54Ze3lOlTg9aA8Wk=;
        b=iBRqV6J8Q6QdDCw7Miw3dzKcb7ARUt5imYHVO13pUEkuCz6tQzj8/EF/raw8hOfmd4
         pemw1Di5F1bYv/u/DGuoYIeXEpqiJM6MiaB1U/S5cMuyZyvIXTAARD7C5tbEw213VsY1
         fVQD1/NjQRDwxBGqVlEUAFg/R4pol4nHUuE+HdnT7R9xbr2VeEYqFZayxBvcpVKZbCfG
         OvuUX+zVC8chUYeO4H7lmsZRGosHgAnz5+OoIjO2mVo+nedB2LZKDcQ0A5QvTGEyD4lO
         SCARUQdBdbKEtD49e41n4BnnE+92OH2BOI6nPbVslWtL8jzULpgyYkR/2uL1ux6zmUvc
         yuuw==
X-Gm-Message-State: AOJu0Yy0v+S1w+oDjyCbwP47wq1LPZ9XLt2QuCLzgXCv8YBprI+5+7Au
	3UIBJ2mZdAsIFGA7s9zsqXHoj06WiJytX9HegkGwwNf3Oyd9EeFfkyrJVci1s3Z+Q3zdnsefKr6
	CzYzuUSSoyjbdtJj3aKCjLpYCnQy3Ttl+Nt3jCuGetsz/SKVSYgGPzht+KaWf+g5Ti/y4
X-Gm-Gg: ASbGncstq8VGJUc7wctCZHiU/ynRuAESrYQhfZvnmfcHucq5w1T3uLCAYtxbL6G6tiq
	mgc1j9ldtwlydIznBRXwB+ImXZCwYPT8GXPPvpQtW72hia9tiVRVu/fTIjMkPHmLP9GFqqk5/YG
	8FLTZKVlHTongBRpBHS6mDWHE+auGrvOVddZ0d0F6OirftazmaoF1Mq+3bIRYhJsFZ0wMQwoIjs
	kcMHPa33SUFAhnVn8ntGypxV/ztkzKDTzYi+Fbdt7HVrFEkpblvtwaGCHHafrjZ9Yo3Num2V6WC
	OwCN1IaMcQan7MGae2Yh+OrKwyA9HjkE5sE9d1lP5pu2oq1hTPYoKqiLZ6kcUj4VsPcrD7yn9ZW
	osFFTPsGsAlNMoWjorpltAk6iQzIYOAA59K47xysBHQnQtTPnl1sn+y63
X-Received: by 2002:ac8:5d44:0:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ed15c4618bmr51538101cf.11.1761817314910;
        Thu, 30 Oct 2025 02:41:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPSY2Bg5pdYdfgMg5cODIfPC2xkNzl0pPizTea4lv1QOx7SeLeYOM+cfOYw/kdroIHDn+x6g==
X-Received: by 2002:ac8:5d44:0:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ed15c4618bmr51537991cf.11.1761817314386;
        Thu, 30 Oct 2025 02:41:54 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308cb0sm1743866166b.9.2025.10.30.02.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:41:53 -0700 (PDT)
Message-ID: <8caa1cec-d881-4e77-8d77-be043f8d13d6@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:41:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add backlight support for eDP panel
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com>
 <b5d9d47b-7fb2-4ce4-9bc8-0d28395b78db@oss.qualcomm.com>
 <0cf2521b-8d05-42f0-aab8-35cd370e599e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0cf2521b-8d05-42f0-aab8-35cd370e599e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3OSBTYWx0ZWRfX1x8ZGGrF3/uY
 HxzyG9AUTTo7Cc8AEv5FuQBFw09p/YYaF9AleM/7/P/HkK2Glg+CCKZZPom6l4vZqRsD8t7fdKz
 2kXyEhcaiu7oxgg3hU2GYCvVawXcBgYXGXEq6jrRQexbLfSncF5k7ScpbyUxn/QSy2j9ADOP75o
 jsTT3U7ZhYqLozTkMTGroqUjrAV43xCgDqhJTZX7SoBlZoOUsbSifQXZpFIwGUun4cRwHq13SH0
 4bMrsJCYwU9P6FdscY4R4FzJvR8/4f5unWGAXarzIEPLGv/1B4h+s8r5uslMWoGtKVsoCznKQkq
 BnQe+AGiiEpHGdux68WCMCkoaCDeG/lKvOvXG+qo9FNRe3GrWN+UHpnkN8PxWUD2+wIAc5v7EZg
 yT2gPf9qDAsQSZ19TRFqrKdHydjM5g==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=690332e4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gZJ2WMP_fuF1vj9OyeAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: UjokEOmD9___OmmdJfhuFy8VmXkpinbq
X-Proofpoint-ORIG-GUID: UjokEOmD9___OmmdJfhuFy8VmXkpinbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300079

On 10/30/25 10:08 AM, Yongxing Mou wrote:
> 
> 
> On 10/28/2025 5:08 PM, Konrad Dybcio wrote:
>> On 10/28/25 8:04 AM, Yongxing Mou wrote:
>>> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
>>> control node in kernel DTS due to some meta may not enable the backlight.
>>>
>>> Aligned with other x1e80100-based platforms: the PWM signal is controlled
>>> by PMK8550, and the backlight enable signal is handled by PMC8380.
>>>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> ---
>>
>> The subject must say "hamoa-iot-evk:"
> Thanks and got it , will fix it in next version.>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 ++++++++++++++++++++++++++++++
>>>   1 file changed, 55 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>> index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..fda1b3a3c7673be74832c27849231cba4bc1f25f 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>> @@ -17,6 +17,16 @@ aliases {
>>>           serial1 = &uart14;
>>>       };
>>>   +    backlight: backlight {
>>> +        compatible = "pwm-backlight";
>>> +        pwms = <&pmk8550_pwm 0 5000000>;
>>
>> Try adjusting the backlight value.. you'll find some funny behavior
>> near the max level.. which reminds me I should send some fixes for
>> some laptop DTs
>>
>  I tried sliding the backlight between the maximum and minimum values. It seems that at a certain sliding speed, when approaching the maximum value, there is some brightness flickering. Is this the phenomenon you’re referring to?> [...]

"maybe" - for me it was the brightness actually going down beyond ~80%

The issue is that the PWM hardware can't really do a period that's
== 5000000 ns

But it seems like this is no longer an issue since the driver now
rounds up to the closest supported value, see last couple commits
to drivers/leds/rgb/leds-qcom-lpg.c

Konrad

