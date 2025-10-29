Return-Path: <linux-arm-msm+bounces-79450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA96C1A783
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D2571896A9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274A435771D;
	Wed, 29 Oct 2025 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PV8z0OSS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eh/1i3Zu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE0C35770D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741014; cv=none; b=WVbqKkufgCW+bdzXZpvPEPIvPHOL+GtSCBzEQs0SjJWqXOpXTig+xsfp+eMQoO4lPRdJ1VmXEckFWOAhpqadHg4oOvRFfOWc05t6AvhJSjpaUB/ReMKVTb/N82MsMLVgmv8IjhtivxEeT7Rzjz2nWi1tpGB1go0PglnVwSfq71U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741014; c=relaxed/simple;
	bh=kG5m0dyjBmsIXWdS8H3YMGbeyjdHEsjIAHd68POJ7Eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdtSr+fdZnUwpq2BAh5goLS5nUJ8oyUNO2neOuWSea97FemWt6gEU5/Oxr7lKatHEW/jyh1eZH4GFLWAESI189VjrgGDsfDGE9OpdEUdqMjAJ5FOWatPwu3IT8bL85WztSyGmCTnetWDZuFYerqDbAzvy2s2LAxSZV4RxrwltOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PV8z0OSS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eh/1i3Zu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TBmbHk3755383
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMUc3tJ7ZtFekmGe/5Q8FFBOdVi1pg7gP6RmhoyB/Ls=; b=PV8z0OSS7fuvvlNo
	d7s8xqEfukZ5V7h4g5zYmaZoXaL80TPf0ipHRn/xM27wKepv6LOcP+Aq7AfU7wn0
	djbLwHYiWjEfZO/fxGy+SJVAPnJcJSb7+A2VBTlcMBSOUgly3kk4FIrwK9/JgEJW
	0vMhMZdX7jZKEuYk/d/3UKj1NIvY5U7t3O69BbH/UDSHJ8AOUZ9KHpo1kcWfuHys
	e8vynn4G3I6316tBXlXcLdRkUclTt3x3eYpHeq2wg1LY/iwc4scOZ2z0rZSawSTJ
	BYIXImBp+B5rAm4a1p+zzvtujM8T+7HmUL1pcI+mt6CvM17UgsZhvZR2ha7joFpa
	WQKvnQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0jgj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:30:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78117fbda6eso5459702b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761741010; x=1762345810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TMUc3tJ7ZtFekmGe/5Q8FFBOdVi1pg7gP6RmhoyB/Ls=;
        b=Eh/1i3Zu93qDmz6Dq2wttOnY9ABA0CsrOHmUeDF2B0ziXAR4+mfX8Cc/PSTWGd9D7H
         tlxCmQU9xCHjLoJ+8JQPRUN1QHD2NIDHEQP5vb+WKvy388oWYT2+rRkUnAuxFxTrZdXJ
         h0LSzBSPz9Ba8b9lMZAtC1pvme+oTDJJvNF+6+ntfWOt7R5Ajae7DRLbY4b/4WyUt92X
         RPFVWOfHxQcI6Gn7ByxNxEwHwAEW1FGM31Iq2P7pTpJW8wKQTsYhYclSGL6BuUYvCYVc
         wChVzRgSBEa1bh57R/R53FULjCStme2QsuXbgX1OMfpEyLJb0rDquAAszFFVb5XWqS8k
         9HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741010; x=1762345810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMUc3tJ7ZtFekmGe/5Q8FFBOdVi1pg7gP6RmhoyB/Ls=;
        b=Q+X9Q1n/YO/bgL4kjkz8hC7KoNSqwVniutR+vHMXeY8teAzqkDhdxcB1uqRiNorXqO
         bQCTZBAsetHYMCTdSOYZRp31/9hFsyNFV4RLEneQsu4R+rxnmR0TLRAU9fnb+HHi5sKM
         c0hRpYUtZrUY1ObT0g2h+0CRVMKvS/R/GFV/PBCWz0AD4cnn1V4fE1yzV8Cg8PmT3b9+
         708sinmk1t9bNPF2zyf0mikUGjcjNJj7k1p3EZppE9KYSiwlTy1G6QEiXly1NyZwP40u
         fj0NEOuaXD0SNZscRUl74qkLPU11cAcPYkI6Ymdrdok9bvu+VdKZ9Fp3Kmhu3d2RkoQY
         /R5g==
X-Gm-Message-State: AOJu0YziZNBNFLqjKCFfw+Cyhp/NrLJ34NSiMMV/9zIJXmow4yredsdZ
	AwD8e+02DrptxR7fmVelIPAWdCAxIByAtkwJu4KGTZO+LuOMqFMpzNWQtaZ7SPi/GoBECWNNmrj
	doe5eJZRtZURTfAAU5ExF6lkliWa9aQGbqcHthRbN1k3m22wUgrf/0t6Cj/EFViHX9AKX
X-Gm-Gg: ASbGnct1z0M8Nom8pXW+2wBSDSq1KMWBVYAHGrBXjWQm9qUnyMWT5Ae/UrBjz9WlcVF
	wMzzrQ8apzGJlYuPU4PRD8Dj3HR0XmtPrAmtPm1QT9m6anNb/PEkBjslZkLTSPXWfyLd4DKh/7X
	84keK1KGgtAusgNbm/E9I+iAKruSKtM5HO1ui6Hl597mgDyi2N/xKO8mm4Lz1ZF/vJyyxFfDgNe
	C0d14Qj+GmBFw++aH9sB6G33UYdmBkSak/rItVS2dRwab0cJm/eUwueJR7HGIHuJ5o784cO5tsq
	wp0sfvY/2QrcOjSUeFsZwxatAKINLngPYhIk2YDuIRDvvq93k1oI27zDowyQ7iVNew4dFTfv6Cd
	dIVeigyqq0CH7JJZdA/jL2JaICQYXeUw9
X-Received: by 2002:a05:6a00:cd2:b0:7a2:7a36:46dd with SMTP id d2e1a72fcca58-7a4e2df8684mr3535366b3a.5.1761741009603;
        Wed, 29 Oct 2025 05:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVwrrfaLG8ulMxEQ6t0UsGwp3wouMxuPndkKaFYkveJm2eyV1MsmhSCWLET27rZ8SM57ZGSg==
X-Received: by 2002:a05:6a00:cd2:b0:7a2:7a36:46dd with SMTP id d2e1a72fcca58-7a4e2df8684mr3535313b3a.5.1761741008921;
        Wed, 29 Oct 2025 05:30:08 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414015724sm15081222b3a.14.2025.10.29.05.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:30:08 -0700 (PDT)
Message-ID: <a8046f0d-ee74-457a-aafa-6473c67c6ab8@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 18:00:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
 <20251024151521.2365845-4-krishna.kurapati@oss.qualcomm.com>
 <a117b105-a734-4f67-9bb2-c06728e79083@kernel.org>
 <6297468b-77d0-4202-8ec1-3e731acc43de@oss.qualcomm.com>
 <6234e22a-c119-419c-83b7-2a53467951da@kernel.org>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <6234e22a-c119-419c-83b7-2a53467951da@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=690208d2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yTxWjB1dP65ezAuFSf8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: c6lMobYfrf4RvCus9kCbEhJCj38rjr83
X-Proofpoint-ORIG-GUID: c6lMobYfrf4RvCus9kCbEhJCj38rjr83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA5NSBTYWx0ZWRfX0D08qrEMEHnI
 6qpax/WxUNPpXL35/vvPm0sIYc+Ne27+z5otBgU8sCtN1rG0L76+RZHkxs5l6TOv22FzCJB0TpI
 OZl038xcpyBuDBDHCIuU5bJsywbZtsHvLpXorzJGTepofF1imlPuQu8bLwa+I9MH53QGDiC87Kz
 VmUSEOyb+D3txTyODCCW8wQM2cGdSXwIDFbORQhzVRtybtJKz0DkAO5IykbKcMDjGnATTqT0pRX
 VmoRMzBqBCMs6fb3hp9icyAGv3QlVYAtfLOQYOkPvF0WKIpiaQEQFi3FIUnCgit7Z1hmW8lV2iF
 BHcz12z/sK3kfrEhbwFTukVKvCpoiLizfM+7aDsP1A/HPngKAmHjSuXW43uOYq17Q7ZP3awu5zz
 OuSHH7WS+2XswO7P6G34Pxd1VXAktQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290095



On 10/29/2025 5:35 PM, Krzysztof Kozlowski wrote:
> On 29/10/2025 12:42, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 10/29/2025 1:37 PM, Krzysztof Kozlowski wrote:
>>> On 24/10/2025 17:15, Krishna Kurapati wrote:
>>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>
>>>> Enable USB support on SM8750 QRD variant.  The current definition
>>>> will start the USB controller in peripheral mode by default until
>>>> dependencies are added, such as USB role detection.
>>>>
>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>> [Krishna: Flattened usb node QRD DTS]
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>
>>> NAK.
>>>
>>> You ignored every previous tag - multiple reviews and tests, and then...
>>>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>>>> index 13c7b9664c89..fc5d12bb41a5 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>>>> @@ -1054,3 +1054,25 @@ &ufs_mem_hc {
>>>>    
>>>>    	status = "okay";
>>>>    };
>>>> +
>>>> +&usb_1 {
>>>> +	dr_mode = "peripheral";
>>>
>>> You sent something different with issues.
>>>
>>> Really, this was a correct patch. Was reviewed. Why you decided to drop
>>> all this, drop everything which was correct?
>>>
>>> Your explanation:
>>> "- Removed obtained RB tags since the code has changed significantly."
>>> is just wrong. Almost NOTHING changed, except completely unimportant two
>>> node merging.
>>>
>>> NAK
>>>
>>
>>
>> Apologies Krzysztof,
>>
>> On first patch that adds changes to base DTSI, there were changes moving
>> to newer bindings and merging child node and parent node. I should've
>> removed RB tags received on that patch only. But I was over cautious and
>> misinterpreted the rules and removed them on the other patches as well.
>> Will be careful the next time.
>>
>> Also is there any issue with marking dr_mode as peripheral here in usb_1
>> node ?
> 
> No, I think I looked at your other patch. Tthis was reviewed at v4 and
> v5, which then it was changed breaking sorting order. This one looks
> correct.
> 

Ok.

I will send v10 tomorrow. Can I add yours and Dmitry's RB tag on the MTP 
and QRD patches and then send it ? I will implement feedback from Dmitry 
on SOC dtsi patch in v10.

Regards,
Krishna,

