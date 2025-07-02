Return-Path: <linux-arm-msm+bounces-63373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6AFAF12A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF467170EF4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C8525DB0C;
	Wed,  2 Jul 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVW90TN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E4025D1E6
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453573; cv=none; b=cYCFvRpXStTo4wkXQP5RCwzHDovkzO2+Twarlk6qAgwHIO0pcaxr0Yjl98ZLeHtmOfyB3N2ddMsHUs8ztCM+JN32sqd0C4Hxnpg8xuFboGHgNCmBH1E0VgZqx+ABbGJBr0MEm3H5RIr6/bMCoGdg+9kAfLu3LkBjFhvtN7Ea1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453573; c=relaxed/simple;
	bh=QyOZe1Nr7H5KHAyKctX/S8gjJgiCuRPtnQpIEej6L9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlK4A28cBoC7LM68FdHY6CkZOY9+AJFIogR5w86BlSlKbhy1vK1ISAYOse+Ag5ppr1nalsH1xJVDwOoG9iQ6dR+hKhuaNBr2dJbQRP31voY1B+befgU7jytlfkHs26XPQoVSbUudGcBhIrLDpPtTrCD1ZbDCWFkw4z9Z1n86L+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVW90TN/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562A9Nvt013520
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdcvOTLK6sbPYv8JLuGt57WOwHXLBbK1kcu/LcxRrZI=; b=jVW90TN/s1t+S26R
	jQ/VOA9TKs9OB9ytZrYJLqrLpJ7C4LLWK4er4KSEFWPwI2NsDitTu2EamfwbiNgd
	AXyjClX+VZWj47ib26MXkb2Ix6IIURuG+IuUImSMJWT5axl6/K6gHYrihvv9Vb+n
	fzjimsghTFlLlv4+P6OKvEPd/7siofvB9ItWxrF2we7Ld/FXhn1BMaSY+uh5eGzY
	N9D19dv48XX17RzcYIb0ftfQOwRYTUfxbv22CRb1ybrXelmTaVUQ0/93OSCafoYi
	B67fjrg0z1jV+cZb/Cb37fAdElNdndXj7muEFye5P0sUiK4hLhxkvkydHHBSpvDv
	EfRfbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j80246ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:52:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so62206085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453569; x=1752058369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdcvOTLK6sbPYv8JLuGt57WOwHXLBbK1kcu/LcxRrZI=;
        b=KNAkNsFu/i96xilWmBMZQE7N8g5oWlSHmzpEUbToIrtSQmdxPgLS6hEwMZzVXn/PAr
         rTF6FF46roVtELa+6Qc0ffkK/gfc5gIkKz2eSNyNcSUrkHCv7xkpLEU3/4COl2kyRscu
         IsN3/tSbCE82sJGLkmFXQ7etC/NB9WOLPvrgsjZU2aB9zt4bgMZZpbuVQy134ZSwyfov
         DTFi04gSEJYreUwPZp/BAgMJMonVehtteVwYq2Irl6Tr7wv8LLew23GN/B3pCOkMSJ0s
         t2Gj4PpxmsrdPt5PpJeSnHCvhzqTAY+f/EYz3JU5qB9pIVMc4g6V9vXm5czOVJWH7pe4
         RquQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/q7BDPhGYu9C36iikHhyTh1MQvnOZBJaOON1eldigNIPlIZrjz7rq0URyjM0zMekUcptmUq1Neqz78cHi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz1cJp53ywoybrsDD02SMwgXgRXeZysH1rQc01krgLdL0DUkDP
	GdU4s9JAYj7z4/l6MXtsB8TMzJkjPetyx/O79JoU5MRlxIOmXot0kwwDvUKFN5PGFYDIytGRL1V
	9hPxyqwVBMhNeuDa89CFHXnAMx0j0fXao0fjlVjcPCOs+6/CDF3n/Y03upldCrq6BZa/1
X-Gm-Gg: ASbGncv+FraYmtfRi5EvUqPD492fxFBoj+Zlwsk58ZNg7ntqyqvsR4gJaJEdXcelrNW
	AMex/9jL4Q3yh6D2/s2VcpkzjjHLN6pLO6VKtR43SFCKp0E3iyDTmQZb2SLJkKF+wx+7yzrduFq
	kFT3EcNihNtTzYkK6T4GiMtkkRw7txVRe+xw6Khhn7BrlgA4FMr1EKeEAEIw2dZdFYaUyvIoQV2
	YYVB686iiHNT8pW+ekRqIBl0WJuMzeHaVakKJGN7k0OzkgPyWTjtefKCEeE0T3afJXRTsd1p1ih
	VQk6XyBe7qGQ3rnKMf8zCgiG0B36rXfrOX2yKcGrla690pwMcKOBCyNSMTI0Yhp9+5Tra7XKbTP
	cvfA=
X-Received: by 2002:a05:620a:4050:b0:7d4:5a97:cdcb with SMTP id af79cd13be357-7d5c47177c9mr135371585a.5.1751453569430;
        Wed, 02 Jul 2025 03:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm/atw5g0Y+/Zxp9/O20n45//JBigs758mQxwlzNeuKPn09gyM0KkrblZjXmmUKGCBLy8SEQ==
X-Received: by 2002:a05:620a:4050:b0:7d4:5a97:cdcb with SMTP id af79cd13be357-7d5c47177c9mr135370285a.5.1751453569036;
        Wed, 02 Jul 2025 03:52:49 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bbe3sm1056245666b.118.2025.07.02.03.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:52:48 -0700 (PDT)
Message-ID: <5176d31c-cd78-46da-b251-107d39ad6c34@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 12:52:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google-sargo: enable charger
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250630224158.249726-2-mailingradian@gmail.com>
 <f931e284-6ae6-4177-83bf-c6eb1ce583f9@oss.qualcomm.com>
 <aGRiEdXs6pwRH5CH@radian>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aGRiEdXs6pwRH5CH@radian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Hmlg2OUYDezjQISKdLsbbNiKcqWTOaNf
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68650f82 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=hIQoVPvBo2FKB_bRSjcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Hmlg2OUYDezjQISKdLsbbNiKcqWTOaNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4OCBTYWx0ZWRfX4U64k5cAp5sm
 TN/AzO9rNY9nUUhJn5kOa0QppvNUYMGNEx5NT8mRc0b1SUFyNh4QJxCGHdfqAxk1uWGlbAY4Xby
 Y0a4PzupIwV7t8RCTbM1vdOMIUE8ulV3TfpIleSoMFkWyjqFCv2qezTgLGwx4J7EdARynJsYDK3
 rSiaYds0lAt9Ru+2qkES5B54bIqk2T27L3wEVgzYurWHN65786KVo6B91WcAIk+3ix2JBzOx755
 VBOc8We535zWrZRKf5xdB6S+2U0IHD1Hoyq16HdTFQWokU5geFUGlKHT2stb6hGyPURm/G33Jt6
 4ONKWz+lb4Pz7jcautq4mkT7RCZghlESG1Lc3z/wgHuc+0V/sBdVAGA3WEZ0QxAvoAsl2DsTmIi
 bewQk6/5ZOqozaIV/ULarZVUaPny+ImEyoc7J6yqbC1IrSDiCFNPweIdUZEyLiHoHpK7BzNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=882 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020088

On 7/2/25 12:32 AM, Richard Acayan wrote:
> On Tue, Jul 01, 2025 at 12:55:14PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 01-Jul-25 00:41, Richard Acayan wrote:
>>> The Pixel 3a has a rechargeable 3000 mAh battery. Describe it and enable
>>> its charging controller in PM660.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  .../arm64/boot/dts/qcom/sdm670-google-sargo.dts | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
>>> index 74b5d9c68eb6..d01422844fbf 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
>>> @@ -33,6 +33,14 @@ / {
>>>  
>>>  	aliases { };
>>>  
>>> +	battery: battery {
>>> +		compatible = "simple-battery";
>>> +
>>> +		voltage-min-design-microvolt = <3312000>;
>>> +		voltage-max-design-microvolt = <4400000>;
>>
>> Does this match what downstream sets into the hw?
> 
> Actually, downstream sets the "empty" voltage to 2.6 V. This minimum is
> closer to the "cutoff" voltage at 3.3 V.
> 
> The maximum voltage is consistent with downstream.

Alright, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


