Return-Path: <linux-arm-msm+bounces-68635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C194B21BD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB9319065A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554CE2DCF5C;
	Tue, 12 Aug 2025 03:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfEjVlTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390141DF27F
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754970597; cv=none; b=aanses+RA9EvUyvlgfz0eriq4GwFcBEniJfp+hmS0ycZcgceOTFmzDcV7mW7m++x22ABQ05MjmlQ0qKfHweoygSmbmw5lsAGFio+25u6CWrHKejxUa0hFbQWqS7IlxBJZVHFV5bDZIuh1Ii9xxdaSJY8+ePLPr4KuslfETc5FhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754970597; c=relaxed/simple;
	bh=87OsKUWhd93bhH0mOSNgVS47foXOTSCk7LBABDEo+cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXP4Ci81MxUEf3Y4S6nA0yv858A8vTxcF/98Hld06Rf7dVHl7onV2yCd1aIyGpSHv7hnT86ZysLQKpQ7m2IZVPOcN8AE4k+9VpiCZF65gi8wC0yIL2jbgKiETxEPwB/IRxrw81KKplYHTV62V9ENQcmJp/VFqy+Mx5Hc5XLPJsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfEjVlTj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C3QGSe004900
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5TV846db6f3LjcIYa6Gb2G9q0zV9dsFXUpYfVhL1rCU=; b=mfEjVlTjeyFm0qHS
	zFnOX5AD3U5UGq89NvX7+yyyR38LA2xb0dTSWn/ysP4ngFic0Vm8c+Lh5tHZzAo8
	VoEHkp22Ayv1c5+t7D7v6RoUGG+TTIvJgehpN1JToIC2FOErWsNkJ7S0WKViXnnU
	eXUl2UJqqEmSOKfNiJcyJOP3gdsV4wAbptMvxk2ei60AJ9b4A0MrIrIQ89kEVhax
	92F/LjJP9eSnH55wPr52b75DAzLpNclov+8Q3JSYhD4p65Qx7+2z95HrjSfNABRd
	kLLQ2DpJ9STUu65cbphDurT0z90ULGec0IDyWf2MqaHyjTB+KOL5F4NRcpRian87
	qlJuug==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxb9t14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:49:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3f33295703so7592337a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 20:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754970593; x=1755575393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TV846db6f3LjcIYa6Gb2G9q0zV9dsFXUpYfVhL1rCU=;
        b=nWWll6NaIUzbl+HYVv+cJ70vNd7HfkdqOuzv0LR18YopEDri6PMH1p/+JIdbG5zBlP
         Na11cxXWimlvNk6uxJgIUyD8kt69EI1SATmrKqFY4nf7CNV5LRx4XSxV5yq9WomNd6uF
         F0vCxYWjUiSt3QbPTGs0UKLIr22VcOB4fN7cBkgdMyqejLAQh5Ij1cTCKIbp74CqH1Tr
         NzWLNLnAuVMDL79qDkvwMyX7CayeL+xx2tJAPvsMyK9WhaGBYbqgrag6X7c2XUEFWgB+
         NI+nbXQiALDwDF48atbMiMHqf21naoJt//srwxU74+y+xEvogLo9Ql2x1kzXJbQIJdBC
         arZA==
X-Forwarded-Encrypted: i=1; AJvYcCUEXkuYjnS6qEOZIjknz2oKQmNusAFqbAHVPAYNX7QFzHcVbJwEj2tGEiTnr5gRakkYbseBkmD9vvBvSk0p@vger.kernel.org
X-Gm-Message-State: AOJu0YyMb3lEyBLtSOLDS17IbGvmuTFZNF6rTelAe+9zWYu/Wn8IcaHa
	iWKCyZzVhak5eCndFHf2MmxxpYq90U3XO5/Gp68/8Wv94a6CVG2QDqjVmV0DSK7gHy5890BgVG1
	3kmV2HxvLd9nVY4ZcGIKnKT9j1YEpGVnBDqqjvKvD1P7cZ16oRvAD51U0/3snyVE0u+SY
X-Gm-Gg: ASbGncsQAGIxSQ3fqTfvcOYXTU0+6yxftnr9iK4k6Zd3FM5UhYC9MVvNXf2V/zlFJKQ
	9GZz+1hu/Yy1EoKCrDUIL8+h6XgHDBUNI/fq2pguvkhdUbtzrE/OWKSEzxB7kamjAPqJCsjrLFC
	eFAIBHttED8IfqCToLfwu+XogmKIx8FS6hDBzemB63xdMD+CWkxWvHbY+yrsOMSn/yc83UgeMF1
	P4olBuB/1ZgUYHEqowSKw4uF/BXtvZuEHwiWw42YqFZuY5lWxpVXFVYJulTq/kUHtxVj2mIym9F
	HsPCx028Fup18ftX9/K6ZCQuxWDj7wN86l0DMGC1KVvUhKcczclqHizQOejRid4+GHUjJm2Fxw=
	=
X-Received: by 2002:a05:6a20:3945:b0:238:351a:6437 with SMTP id adf61e73a8af0-2409a9b57f1mr3209091637.43.1754970593607;
        Mon, 11 Aug 2025 20:49:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP375zTdK8Lz8GD2GdflxZl60YmZFoMKeDDEAaMpk+lohW3i3wGJFGZRlHt70eEG4IIaUe0w==
X-Received: by 2002:a05:6a20:3945:b0:238:351a:6437 with SMTP id adf61e73a8af0-2409a9b57f1mr3209046637.43.1754970593156;
        Mon, 11 Aug 2025 20:49:53 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbce56sm28275963b3a.82.2025.08.11.20.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 20:49:52 -0700 (PDT)
Message-ID: <f21f6fd0-9d58-4eee-9676-e6e9543cf7f6@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 09:19:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sc7280: Add wake GPIO
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, sherry.sun@nxp.com, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20250801-wake_irq_support-v4-0-6b6639013a1a@oss.qualcomm.com>
 <20250801-wake_irq_support-v4-1-6b6639013a1a@oss.qualcomm.com>
 <u4zedngig2jsraq27h2gc5ksp5swgypl2k3sy44znrhndtljpp@r4jb3wibkf3q>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <u4zedngig2jsraq27h2gc5ksp5swgypl2k3sy44znrhndtljpp@r4jb3wibkf3q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689ab9e2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Ztk8bZVGPGJlfjIOV0sA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX3iCmgY3pDlXB
 fkxyTSb1FaCqV6JNi0QDvjrfTd9pCYwfK8ebs7mAqyp53y/YIRQd5REmwI2jcsUWo0xPKk1J3+0
 oyA6pM7ZGmnmqSh2zzFW/0q5CqwhBkV6CR6gOUecbCPBUhiMrV3VolmYwXL/VIxJJ2a4wNXzJg2
 9Tv9DDklpIf7Fo6yTjz1w8y+NDye79S/PbVgrXNgns/jLV8rF/GSKFiBOLaRiImMtrk0McI4yB9
 zDii597yQ6S480Paak5plbGhPdTmB8/GXLbhTe0AF5gMOETkWNKpJCe3AUcN8T888cj9dS1eBc4
 Mn0w4FVcbwqnzmEjnjq8QU5Bc8SRaF/q+aDHGFsqJccA0zV3UbmJsPGTyREt6K2xrOTq+TZTqlw
 cwtv2Mxs
X-Proofpoint-ORIG-GUID: NacD99s2FkOk6mXUKnN8i8i9b-m_pCvU
X-Proofpoint-GUID: NacD99s2FkOk6mXUKnN8i8i9b-m_pCvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097



On 8/11/2025 10:06 PM, Bjorn Andersson wrote:
> On Fri, Aug 01, 2025 at 04:29:42PM +0530, Krishna Chaitanya Chundru wrote:
>> Add WAKE# gpio which is needed to bring PCIe device state
>> from D3cold to D0.
>>
> 
> What tree did you base this on? None of these boards has pcieport1
> defined in the upstream kernel.
> 
Sorry I forgot to add dependencies to dependencies to one more series.
I will add the dependencies in the next series.

- Krishna Chaitanya.
> Regards,
> Bjorn
> 
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   | 1 +
>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 1 +
>>   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 1 +
>>   3 files changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 10c152ac03c874df5f1dc386d9079d3db1c55362..a4d85772f86955ad061433b138581fa9d81110a4 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -810,6 +810,7 @@ &mdss_edp_phy {
>>   
>>   &pcieport1 {
>>   	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
>>   };
>>   
>>   &pcie1 {
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> index 60b3cf50ea1d61dd5e8b573b5f1c6faa1c291eee..5e73060771329cade097bf1a71056a456a7937d7 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> @@ -477,6 +477,7 @@ &pcie1 {
>>   
>>   &pcieport1 {
>>   	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
>>   };
>>   
>>   &pm8350c_pwm {
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 0b0212b670797a364d7f0e7a458fc73245fff8db..240513774612fb2bfcdb951e5a5a77c49f49eb82 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -418,6 +418,7 @@ &lpass_va_macro {
>>   
>>   &pcieport1 {
>>   	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
>>   };
>>   
>>   &pcie1 {
>>
>> -- 
>> 2.34.1
>>

