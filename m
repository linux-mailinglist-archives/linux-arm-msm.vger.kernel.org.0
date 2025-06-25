Return-Path: <linux-arm-msm+bounces-62270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC942AE7687
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADD4A7ABE0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 05:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5171E5213;
	Wed, 25 Jun 2025 05:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jek3nG9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413E19E97A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 05:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750830961; cv=none; b=S3AhkOSgMet33ZJOgA79jD6Zi/iNIDxa4Rngs8MMYi0/jEh8blcDt7QQXN6oBugw628a7+EVQ4SVg+8LvrbMJdnBiKR1jckvPvGk4oJtHYvWx11Uu5dvCul3AH/lUjS2u7XTpL/ZkPXsQmtjsibDUSeQ/abxtrP5RCl679M7wNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750830961; c=relaxed/simple;
	bh=5mHx2qp52LHFAY1+WNQ1++R00CeBYRXlVI+r6bb6muY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/eg/sjnRMjGjjPkAeUFTinxeggVJrXcAQFHGAUT1zlFs3Zhnn6oyaTCJ4lP3rN56NcIcVoLrD2RMipxylIjvV0ImTiKSu0+Izc0N1tIsYMrKRlBVYRsWarXZZ+Y2w6ZnpQdVLXTGfz2sVVi2SaGnNqyJNzT+MNWvkCXPrW3xso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jek3nG9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P2QraN025930
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 05:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urXTHU4eOYr5vlGF47ojq1bQ+A2luNE9+0Af7fyCoyM=; b=jek3nG9BJu/p1dTR
	Dy5Pea2Iebt9lqtuBwPqU1DLnTgLsZCvnwhVPRwMEJuO6rnnZbJ6Ox3gmnIoLosJ
	igKPzQaoXiLHiI4DSx+o/GMpFPm17WlWvSqwV3o5ufegdCjxhh/R7rerr0RASSi/
	X6H1BaPORYUMoEb7Ae1gu4wW2ryoQhSh5YQdkzIgiS6ArAUPm6J/+ncKKbx1NdxG
	x0bYD/nBJomM/+XU40KD/laMxRFkhio9bUeP9xewFP1W1jcfYeDFXmN0l/o/tjk+
	jyA6ySKOzfpE1CbBaaELqPgPxwjrGJC6MGQqBqrWq27hpc1+E+oRyXdLoApZyPly
	J3XISQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec268uvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 05:55:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23824a9bc29so9167825ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750830957; x=1751435757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urXTHU4eOYr5vlGF47ojq1bQ+A2luNE9+0Af7fyCoyM=;
        b=wEhaDufmiKJ7jUCS7Y+8WIQoi7Vz/IWFD8wwo9KGYSO345GfkDyPcXu5YJZ71sB840
         r75DX/bPYCGe8Uv9CNppt9LPmCvrzeY6MCeRV0p0lAyUxDQlJtK4WYhurD6s7cBJu2c3
         gg/HTMiS27YtMd63Wum5+QY8/UBG/iRUJ0a9jee07X01iATu8faDBrDze/enRl3p3OMp
         bWxu2M5ZJJwEO6YrAWHsFwMKfNS7hAjh47ZwAXWk1t+Nxb36n4j2BLLvDEydYISyaDbH
         //oJpOVVZ8PhvZM4Fb47XRwXaFranCpf5zxhmCyWdJD68pxM+fa7TNcZpdfx/AyqOSB0
         HdSw==
X-Gm-Message-State: AOJu0YyvPWmgSGyeSksEFYp0e65L9rR3dzFmK4FyvqCYes4U9bu51hyA
	E5N9GTWanVVqleF4bjH8XEiU20vVEASOOMoDXvB+G9rnmU35K4wg84QU7621oE1zwR88PHtbdtr
	FTijs0ISyTBwW4Ldej1tbfAy0RCNcrLBe7HW5Whycp0Q9oEgbp7lNPZH4dkprQjkToV+Q
X-Gm-Gg: ASbGnctHvl5zpmIE4c4hPnA4ejR9rMRK3FBmHoUlxroq+71z/hu2tcyuIiGrpgDPJ7n
	jPbb6xinqjYqvxCCkvb3/TrDo0/YoKRSMyjyHdanSTxhvPMtFtNdZAzZXdgO0MNKZ8/YX+AqD7O
	LxbpinotQf91i9YDPfz9htxlZRiUdB3DMLjj1bNYF6OMS+oEWxcwj9RCuHv+PkxpnaFYhQ38fPO
	R00CR/XMfrYuuyed89eUCe/NKHExzVAWJh8oxre9/znlpsnTsbSP+kEDFq0Fw2fH/tXQHS1QpNZ
	HEEV3Pe+GlAwxJ2WWxwG9z8YRmgpV97cdgraA6wSxaVTTBusiriqerJQTUhpS5U=
X-Received: by 2002:a17:902:e802:b0:235:ea29:28e9 with SMTP id d9443c01a7336-23824079460mr38373995ad.38.1750830957483;
        Tue, 24 Jun 2025 22:55:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtjS5jkmUSESvPLbkb/0K3dNNixBLe3xQT54FHebYS6/RcOU67fQTGoknssxa7pA1gZwWyBw==
X-Received: by 2002:a17:902:e802:b0:235:ea29:28e9 with SMTP id d9443c01a7336-23824079460mr38373755ad.38.1750830957077;
        Tue, 24 Jun 2025 22:55:57 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a8d5sm120184275ad.104.2025.06.24.22.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 22:55:56 -0700 (PDT)
Message-ID: <3514a3af-ab7d-41e6-9e59-95defe9105b4@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 11:25:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
 <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0MyBTYWx0ZWRfX7UBamGQO91lM
 TXwQAJOpj7nDAVAooTJaKvMqpStRxLF9xrKM1LQH32Ya45owtKF1RQluki1RQND0FWBh69cwn8s
 0skwVHn6coU8wph37IvO2q8FXq/QExjk8zSPaHQpIAPvwPHqFqvooe3TAz7+lbyOy5Fuyc/RyzC
 7m2w9TW+547LoWjMWPSW7sTw2NLNe7Fve0cPfmcR7Aq4MO5KoxUXqwn4IvJEbmMkVXtKXxBU/Nf
 medBvpUxhFt4RdZq9FEf7nkFuqGRn2Z3ZIww2N5SjWtmJOksAdwPESQ5aUUea2gMUIzZ1foWToN
 0e8Cv1sEq3ZMzRORUg1/sYdvIMWsP+RaeIWCAa0svxqmKNcor3rt0am8cVl0F5Da9lgEmfnvk14
 s9qJsL9qXrtIHgDegXHEn0TwvL339lrMkQwkeGJAxuZWBhpdhHpPfHKUmZQJRPoj+6rTla2T
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685b8f6e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=WdiEhHOlSmYA5aSgIJUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: YAlvFgbfMUsIpIvdmSH7NUboqmV1jMnw
X-Proofpoint-ORIG-GUID: YAlvFgbfMUsIpIvdmSH7NUboqmV1jMnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250043


On 6/24/2025 8:08 PM, Konrad Dybcio wrote:
> On 6/24/25 11:00 AM, Kathiravan Thirumoorthy wrote:
>> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
>> first SE, which supports a 4-wire UART configuration suitable for
>> applications such as HS-UART.
>>
>> Note that the required initialization for this SE is not handled by the
>> bootloader. Therefore, add the SE node in the device tree but keep it
>> disabled. Enable it once Linux gains support for configuring the SE,
>> allowing to use in relevant RDPs.
> Do you mean fw loading support?

SE0 is minicore, so we don't need to load the FW. But apart from FW , 
protocol specific configurations to be done in the SE's Image 
Configuration registers, which is taken care in the patch[1]

[1] [PATCH v5 0/5] Add support to load QUP SE firmware from 
<https://lore.kernel.org/linux-arm-msm/20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com/T/#m37a6b739c66040cde5b6b0121a03da7ea6715842>

>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Correct the interrupt number
>> - Link to v1: https://lore.kernel.org/r/20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> index 66bd2261eb25d79051adddef604c55f5b01e6e8b..2b8499422a8a9a2f63e1af9ae8c189bafe690514 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -417,6 +417,15 @@ qupv3: geniqup@1ac0000 {
>>   			#address-cells = <2>;
>>   			#size-cells = <2>;
>>   
>> +			uart0: serial@1a80000 {
>> +				compatible = "qcom,geni-uart";
>> +				reg = <0 0x01a80000 0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_UART0_CLK>;
>> +				clock-names = "se";
>> +				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
>> +				status = "disabled";
>> +			};
> I'd normally expect to see a pin configuration here as well,
> especially since you mention the bootloader doesn't configure
> the interface

Ack.

>
> Konrad

