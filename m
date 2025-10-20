Return-Path: <linux-arm-msm+bounces-77993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B7BF0F1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A468940634A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621C22F6929;
	Mon, 20 Oct 2025 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4cIrlXc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B32FB63A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961300; cv=none; b=cm9Jpi5T5C5l4S7lftxJ2ofkNtg9pPs2XnHibuQz4jTLVpraFbOm+TYo+Vat44i870DeCmFyR1LaMnhLTyXapQsifl9lT+i1JbyVPOtOTqE8Y7vBEHNUkr0opKfkUv7LryfNcpEVnfhKADsv4SaXEm8TmZrdbKRYzAfDTIp22oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961300; c=relaxed/simple;
	bh=YjNRlwU+DyUZdyR5D/1sCMX2dGtbyGiDneDhHjsjLVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifuxNvAPB9LQTAxDx8xe5xickmEgoE3gZyxXhDvDbSJUwfZIKQ6ICOQFljY+6BwotYekSlpI5QyWp5U7LrYDIOpIYIcAM8katTjxjbQmarMla+7EfEHvBADgiMiKSME3cAbfcJ5vQ4t2WyAuvdWK9q93axHiYaZLF64WVxhVjt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4cIrlXc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JLs5kV014855
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPefw/XTUcQTv8Ghf3sxd1o79dUhSmHJkuGsZMt3Mqg=; b=E4cIrlXcXMLvxfvp
	869yCmn0RVP0p3Q6HlW8CuH70U9j9n/aCuWi+j0gJTijLrC81scElnJo2OmYxBZ1
	qryu/aRYfPVtdp/EaEn0Dd9GiZDHm5iRhIpPbn6x66368FKCPeNPv5fhFPvO0aL3
	QWuahBUQwrw4QWcWPV44YXrlGPWNqnjZu55GY64zyT61BRcT3LYEnODBMLFhNfgQ
	MBGVBVRJbVpjK21wTUBv3eDbkpdlk2ujSXib1EEd98+ElQESrQJAn7LIYE10J87N
	QJteLF9+5cD1ytmRsDVGoSzcqNWzQ+LRckoMwbP0Qr//7IwaVOHInf9VZEpdHGdX
	UworKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pcvhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:54:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-890cb81b3dfso148259185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 04:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961297; x=1761566097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPefw/XTUcQTv8Ghf3sxd1o79dUhSmHJkuGsZMt3Mqg=;
        b=tn1DdOyUIs2LyuBJWfRjX4O0YZ01mddz3cGW2jD22e01EYcZZR8QuGbMuTGpGGcHhJ
         wyhdFya06Jdsn0syp+V8Pgh/sw7bZZR5qpLac/zdo5Q+0+rAq5Vdwtx/yxMTsjEIiPqL
         E2ZiQi5RMQGOSF4TVkQD8dObQs01iI3AymVQ3vQsb21DzEXZXD0y3s63MDJS3bQkWEt5
         1sKGxKZEOoxk3OkwTKC0m6kWtU6SFucOTZWRGUSC0cryypZQ2rs5S2FDAZJrgqACr+Ue
         RusKjQx9eOnd/39Cz2HM2yk8ljv9WT/7eQmCacpXKNqleVj0kCbfF+ePnO7J2/3rniC4
         O9WQ==
X-Gm-Message-State: AOJu0YzBMnxVkTz/JiJyJRZNfwTBcvQEpbziRthudmqFdD+W28GhEQ01
	LK3vq2XNwu8vuaVdV27IG3+L7IxJxGFgO+PaDuuKbj3T1EZ0blWIjhAv+jliSsFSHBO0tPMHU5b
	/PTvdL3nZJWbaMtBj+vVq4pm5rboCSz1VGvxn9ZsyHTDpjRkEhGr9ZXaqlb63yoZwWrQY
X-Gm-Gg: ASbGncvQsiM2bXRl8BX1NlqI7gS2Guu5EIIPkRcOYjBYORUOyu1h4Fz3FN2AJenxmnF
	TzzD1Rm2RwuLe6tuuu8UYlVJGoA8yZ2kh9FwZI4DtgVS/9oH5f/nLKle05RX0qXuC6mDc4cJx6o
	cNbFpvB8v+DMpfrkeiN/sdIIT8+v1qO/IgvNYMFsJlrdHu2GeTFvFfVqVruvHf+sFj3vj9wk26Z
	QCkTcea+5hZlkinjhqDp1cxPCZcJTmS0hMr89WvcaqGLSlKJG5xaWjFcYxFNNeLqYfTrOyYG8l6
	CRVhNHUcGrSMUTSV/6IWEgJW2tGgJ9lvoYW0+O6Qqs1vmbjFoxwDQQsW9TA+zHf11bobf/uZaCC
	SHyP937fXA4YHt2DOIramOk2eIaOjIqLpxhpZgHGDBi8Q+JN6zmt/EfZ7
X-Received: by 2002:a05:622a:130d:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4e89d411c5emr110883171cf.10.1760961296766;
        Mon, 20 Oct 2025 04:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4g3QqfuylmN7uh29TpBlKZHcCS438BuAzHT3iaXVyocAn5WuW9zvPw1VDaSWqYNUHzL22/A==
X-Received: by 2002:a05:622a:130d:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4e89d411c5emr110882931cf.10.1760961296323;
        Mon, 20 Oct 2025 04:54:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8395b6csm785558866b.26.2025.10.20.04.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 04:54:55 -0700 (PDT)
Message-ID: <100b1a6f-0b4c-47bf-98f5-f81d05b40df2@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 13:54:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
 <8828946b-3979-4e7b-a11c-740d8a6253ce@oss.qualcomm.com>
 <235cf6b7-e758-4d16-b5a1-182cc869b2e4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <235cf6b7-e758-4d16-b5a1-182cc869b2e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX1/eFkabrm3Ag
 AbrfF1ehKojV5D+OQJNJuiFRw0+44XL6Mx9s9H5e4nlGEAnw0g5H5hNhpHwIGHe6Ee9290izfIc
 h7anJMMVMevqxP/Ycy9S1FF2ewIgtss9QHV6iPHNJIlPvbbEaQBhdTY5/07C1EqQEmbM4YMW7/W
 jmXAN+f2O+9P259d4HrB5fXWVPGOc5lLx72bPVWNjhawqCEb6k0CCPdbqMZP5y6ICJbON4shv5I
 fvT39HFLo3+qVIWldUAUGrPv1RIjZ5uDV3+Aza3Pg5OLlaRIk78SkpXF4ZyGhsPE6pTBeLIVdWa
 ixHMClS9mZ4DWDN0+HDA0m6VZvKGbAmm3V71eeALMcvmP+8FNccRO4kBzR5Q2TSpCNQtYpM2Wkg
 E3qngfExpPNnanuDRDwLSejONdb95g==
X-Proofpoint-GUID: _ncWvDoFUqzcBm2R3jFKxtWBRpNgFTlI
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f62311 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZwCl7Sk8p17T5DaKarAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _ncWvDoFUqzcBm2R3jFKxtWBRpNgFTlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/15/25 12:28 PM, Jyothi Kumar Seerapu wrote:
> 
> 
> On 9/25/2025 3:48 PM, Konrad Dybcio wrote:
>> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>>> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>
>>> Add device tree support for QUPv3 serial engine protocols on Glymur.
>>> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
>>> support of GPI DMA engines.
>>>
>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +        gpi_dma2: dma-controller@800000 {
>>> +            compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
>>> +            reg = <0 0x00800000 0 0x60000>;
>>> +            interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
>>> +            dma-channels = <16>;
>>> +            dma-channel-mask = <0x3f>;
>>> +            #dma-cells = <3>;
>>> +            iommus = <&apps_smmu 0xd76 0x0>;
>>> +            status = "ok";
>>
>> this is implied by default, drop
> 
> Hi Konard,
> 
> Do you mean we should remove the status property for all QUPs and GPI_DMAs from the common device tree (SOC) and enable them only in the board-specific device tree files?

Nodes that are not disabled are enabled (i.e. status = "okay" as part
of the initial definition is superfluous)

Konrad

