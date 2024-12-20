Return-Path: <linux-arm-msm+bounces-42950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D89F8F3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0771F169EC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1561BD9FA;
	Fri, 20 Dec 2024 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yffz7OE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F4C1BD9CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687914; cv=none; b=cWzV2deOIyHx5lOQufiaFe4HftQcrnbceqGvjh3rJeAunpdas3Lx7yUIyfL6e9jrB5QqsLQ92zDY+xAj9kvinqXBKItdf4xLohBz0vfMqP2fJIzCZgW+eQxKQ/HLAaNbiaP5Ln8YuwpWJaM+iLqxEFA7KOICVirwIHuIhARuOOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687914; c=relaxed/simple;
	bh=rgbIsEXKrNUTh9N1VFln1ZCjKPm8rV2hssaSdAVAMN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jfmf+95/IJQjss+cAnRGVpLR6dOAS8q8AFa3gtz2Eb5/bES5mW2BFROLIRkooOQjC0YGcq1LkC082JgJcmxyvXpT3yZHViNsNV9toNz0kzDuYoZSdQ0VH7Zay/6wEm6/qyI68Mlh5YQquJ6ty4FhmP8OaFfuIUJW3VkLbfPQLJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yffz7OE5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK82ZKO018644
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9t8ArwAGrpS//NdxnvpTo28cKSL+hVeeidKueQ14eto=; b=Yffz7OE5C6rf+ELc
	w4FCEAy5QTkziXKW6QlLDxjRKfL+7d0QVKliwiyr7RIz3mAOB8bkiF+9P2Jw6xqP
	nyhUW1TyCd37ffTWNw7xRurr/z4p+6m5B/gyBxu8IqjIxaXHAHDXgLnh107Rdgf8
	n8S0Whi8V0Y4ytEuQkje9ePv8+W0DeFsSc86if9CT/W1pXjCfoNUDCzTCyVYI3jH
	iyYOkTIy7fYNX3/aWBlg0wq9q6+r12LiTdg4tIeb5ZeyojLvaQF8u7BonK2U0/TW
	jIzrCi17SvkxjJkfvsT0yaR0uRX2OCHB/4yHZuTUBHnCxLn2M6FkiZencYotVrUQ
	1pfFoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n4qmra22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:45:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467975f1b53so4337981cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687910; x=1735292710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9t8ArwAGrpS//NdxnvpTo28cKSL+hVeeidKueQ14eto=;
        b=HWOJUvpqj8lfZULFXD6G9JKcY6LBt08ObgxEkskH2RSYCWIkK67l9hmhXK5Mbv8rVj
         cqFAPuH11vKyQFP7gYlB1jBJoCu8klSjlEVhdVP3g+R2zCxLR2Z7TK0iBQp1OG4PMtoa
         cMjLPobEbYodkQLyRfSpwrQURQSlKGaUE7djF5KTd0wqAVsBxe+SkDi6HQGr0OCWLpG0
         kO62eNFNui3gUP4UGJ4Vovpr5tnU7hLE/hJ1CvKKjbPUT/Z+mW/198Uu4TVIBsmQgZIM
         dJ0iYjnpk5p9SlQ4Rbi8P0F1EwLhtbDROUsp5X/bVZDuThtnrZuYFvxH87iOInUQFUM+
         BaWA==
X-Forwarded-Encrypted: i=1; AJvYcCUFcTpzsTzfhkdwNOTeSFrp63CNHRCZW0p1wdJJ2ydUyLZQKlQgkr6bkBKddxSMKfeOE2HkLHqz5r3GtX1X@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1FzI0WvhB+d6p0eboTSWlsaaXDf35F1kHQtBOA3Rj+2WgcZFq
	0jlV1DSfgKFvoYE3ApOoCfR7qdgz2gX2LW03NnXnkOY9OsfuK9Y9bTqryBjXlknwb6/NKduWrv2
	f0FLJSxKFfifHjPH6FUqPhf4o7lCk25ozI30pw3Y8XAjHRT2SB48QZzUxj5N/Enjd
X-Gm-Gg: ASbGncsR9I5ACYMJUSvcTKuajg1B9Ize3jBryoUUH/cM37F1z20WgCxTnd/XCDtYWO1
	6qbm9+ibPEUcBRwBi0hoTGOM+Rr1SJ86ji3OsLYyixMzL4Fd93b40mDQS293gv2TIoJ/HFUy0Ly
	eU3QHeIM5RCDxXvOXkTM0iAt+r7RwZ4bmRAKvI8O93OfMSBHk+2Bj4Tzt7O6rKwOd9txPEicAU8
	/+ntHVyI7qJ5Fx5sZSXZ7PDGOk5FrCHnJ4UlTZiKqVi08xXXftDn8FEliwJxTdHVnOfaJ8daTFF
	6i8Bvjz0DaFjTIUXc88lYfiWYtne2Hskmxg=
X-Received: by 2002:a05:622a:5cc:b0:460:7929:3575 with SMTP id d75a77b69052e-46a4a9daba6mr14655331cf.16.1734687910163;
        Fri, 20 Dec 2024 01:45:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGf+tTYMFgzn7IzxK2YYOAOa+4TPDlGAcKmLrdpJ7UTEWxIiYZqZsZRaQjTIPUanMegHW11Qg==
X-Received: by 2002:a05:622a:5cc:b0:460:7929:3575 with SMTP id d75a77b69052e-46a4a9daba6mr14655141cf.16.1734687909794;
        Fri, 20 Dec 2024 01:45:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe41a6sm159635166b.102.2024.12.20.01.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:45:09 -0800 (PST)
Message-ID: <17ff74d9-2336-446e-95bf-be8d70d20a07@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:45:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: ipq5424: add spi0 node
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
 <20241217091308.3253897-4-quic_mmanikan@quicinc.com>
 <ca0ecc07-fd45-4116-9927-8eb3e737505f@oss.qualcomm.com>
 <f51b7196-1774-45b0-a63b-1070091441dc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f51b7196-1774-45b0-a63b-1070091441dc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZhwkwxnRvYoKWVbCT_CpAilLwd6i8h3a
X-Proofpoint-GUID: ZhwkwxnRvYoKWVbCT_CpAilLwd6i8h3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200080

On 20.12.2024 8:25 AM, Manikanta Mylavarapu wrote:
> 
> 
> On 12/20/2024 2:06 AM, Konrad Dybcio wrote:
>> On 17.12.2024 10:13 AM, Manikanta Mylavarapu wrote:
>>> Add SPI0 node for IPQ5424 SoC.
>>>
>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>> ---
>>> Changes in V2:
>>> 	- No change
>>>
>>>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>> index 5e219f900412..b4d736cd8610 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>> @@ -201,6 +201,17 @@ uart1: serial@1a84000 {
>>>  				clock-names = "se";
>>>  				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
>>>  			};
>>> +
>>> +			spi0: spi@1a90000 {
>>> +				compatible = "qcom,geni-spi";
>>> +				reg = <0 0x01a90000 0 0x4000>;
>>> +				clocks = <&gcc GCC_QUPV3_SPI0_CLK>;
>>
>> This register base suggests SPI4 for both the name and clock
>>
> 
> Hi Konrad,
> 
> Thank you for reviewing the patch.
> 
> The IPQ5424 doesn't have SPI4, and according to the Qualcomm IPQ5424 register catalog,
> the register base maps to SPI0.

I'm looking at that register catalog and what you added here is
called SE4

> 
>> The existing UART1 similarly should be UART0
> 
> I didn't understand your comment. UART0 not yet posted.
> In IPQ5424, UART1 is the main UART used for console
> and UART0 is HS-UART used for some debugging purpose.

Here it's my mistake, 0x01a84000 is SE1 indeed

Konrad

