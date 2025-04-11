Return-Path: <linux-arm-msm+bounces-54064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B354BA86649
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 21:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C022C9A1617
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 19:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E61B280CF2;
	Fri, 11 Apr 2025 19:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oe6ECoMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C9280CCC
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399599; cv=none; b=n7LOwimyeQILiLlUd6LzpI2MH+TvxvVA+tJmUAUwW1zLHT+1ZbovtjHkcwtpFsindFaM4hBfkIl4xoL3MvGTaNdw7WeWxuMkyd379lEeko7lHCSQuE6cSbDpPgzZxYNRNmYY9nPClDqKpEQvvxHb5CNQCgdhcT/SjTJADCjNWII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399599; c=relaxed/simple;
	bh=t2XKWqYwo9p8es/lv2XfWiNUBQNRAf64yyzm8nF4H4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xan5DX5uehTlJkPWrFrH7gi3SUr7Sw4D6KOMYMdtzvCqL0Hz+Kl9f9sfPESNOpAih2YvN5gnpJUcvk+C3OEXJxxIjiZ/CKjZnjotkVq6ffinj0KRx1Dvys+22wsMQ6S8JIspLBXHvXgrt1Yl08B5bIqt/22lG6wkafph2w4Wsos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oe6ECoMq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BEl3mB013887
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiFCJdTRo2gqr1y6Z8ZKwiG+ZpN1Tivwr8j0QBndcYo=; b=Oe6ECoMqutTybooA
	jejpXGsnVavTZUz3MPevR3cOoSNLVc1Wh6lUanVFrQuL5BtMvlaGc0PkVU/qBbjD
	I7Bdj15Zrus/edmUm4yEe9a2xQ/9RzpOLGXlJXW44Ww+3nZCQ9VugbhQbojxr5o+
	H4YBl4191vYBjJS/cbne/Dt5DqVw6T4vSwhj5rfNlBm5rJb8hEV97FxZ/qYclR9s
	5daPUpBAL3vQhSLXLFpS5jn07U3V/8It22kePY1Nleb1vkG0ff/Iv2POC/SthLTr
	vMuu/Ub9CaQdgwcHg9s/YU28Ih6N5CSZFB+R6eAsLbP1fKHjHj5gMk0dJdQS3vIR
	kEGpfg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbekhe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:26:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f3766737so4137596d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744399595; x=1745004395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiFCJdTRo2gqr1y6Z8ZKwiG+ZpN1Tivwr8j0QBndcYo=;
        b=m4TySrKxlpeRoVvi01MQJyrJ5d3W50ed1xwQCxqy/cz94jTo00+SHeBpZZprVJr9i6
         UusOl2aGeXkTTJwrQSaJpEnTm6aXLL1U73Rw1UKsRtnI2yOsnc9WkSJ2AW6MiPD/jw3O
         0GfVGnm9z+2VtXehUFPo9uuFsD1a4J+EKxN6+4yKKImSh0IQDptph+Hd6imXPXWQFuTd
         Ruu6IAZ8zeJ17U00Q57/WtVDe/PgernF/lw3QPiznKnFq1QVAjMLfInOzg0NX+yoF4ca
         vngxEwa/36wyvFgA79qHWir381u+pwLF/wS6Y+eIJb6HUcyj5gu2mAZfPA6XAJuZf+qp
         xu3g==
X-Forwarded-Encrypted: i=1; AJvYcCWnS86Jba5DggT+CI0DlSVJrZhFC3hD3AtdpbpECDUl5OHNUqce2MfY6LgRJMz7lnuWliwnH1MVT7CkN9ZW@vger.kernel.org
X-Gm-Message-State: AOJu0YxfzGzW46x6OsSucDrDbQxDbOAOpcaPFlxo6vF4ECgJ8h1NsVC9
	H7uqBE/H30LET9kisuGhtm5YuV84p85WCjDhvorDOLSRJfqzQ3yNUHnoFPnje+qMO5gygCZ7VKj
	dG7LbvdOUjyxIT9hkQFWCp/pwIfefB1mhxtirE1NMHQVtvdlbrqgkQErbhUOaTtuz
X-Gm-Gg: ASbGncsMd7Na47lkzc/7aM+fOe/ebJkjiNO8pCaYL7sFXWii4fvoPYlwvAyNZwOy9pm
	/j83gwftDbj9UUP8iMFhQoagXKYp2UHc4mDbiVEZbxrlSfotc2KcFBDk/PSe/gNwTMzPLnTv2Uf
	4WseDf/8sGS7qSzZwCluMcIj86Lt/dr8HRynY5/Zbvil6ZBZ1zg4AumBfyXl5/KCY5MXh/iKOmQ
	AigmsC42bFS9GF51vRP7AjjmeYBUwcarhTcdnWUHg30ghK2NmF+7SlQbSLRnqCUkwJ8kG5/fqgs
	2dEOO+SNMRebS+8cOwwnN+ZiN90OR/4IXVXfAIPoJEFBUPoUoaQz0uNHjW3ViQpe9g==
X-Received: by 2002:a05:620a:4093:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c7af1037bfmr252382085a.5.1744399595503;
        Fri, 11 Apr 2025 12:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7JOCrWJ071DFON/w/kNrougGfwHwDgibkTtx5HAr1FExa5I2PvombMMolvq+UJpXLvd9smw==
X-Received: by 2002:a05:620a:4093:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c7af1037bfmr252379885a.5.1744399595116;
        Fri, 11 Apr 2025 12:26:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb3d8fsm491976666b.106.2025.04.11.12.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:26:34 -0700 (PDT)
Message-ID: <cfa4003c-e8b0-40f6-821d-07f8d44752af@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:26:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
 <1c09fee5-9626-4540-83fb-6d90db2ce595@oss.qualcomm.com>
 <9eb6dfd7-2716-4150-9392-98e26892d82d@quicinc.com>
 <e3dda8bf-e19e-4dde-83a4-7876ca81e5e6@oss.qualcomm.com>
 <69fba227-ed47-4004-9451-777ca19b687f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <69fba227-ed47-4004-9451-777ca19b687f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UzrGY_XQKXBNCWofA1UiuB1F5EWZxeaY
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f96cec cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=6H0WHjuAAAAA:8 a=_xYJqbmhMe1K5No2dSMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: UzrGY_XQKXBNCWofA1UiuB1F5EWZxeaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110123

On 4/11/25 1:37 PM, Jagadeesh Kona wrote:
> 
> 
> On 4/11/2025 2:42 PM, Konrad Dybcio wrote:
>> On 4/11/25 9:15 AM, Jagadeesh Kona wrote:
>>>
>>>
>>> On 4/1/2025 10:03 PM, Konrad Dybcio wrote:
>>>> On 3/24/25 9:41 AM, Luca Weiss wrote:
>>>>> Add a node for the videocc found on the SM6350 SoC.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>>>>  1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>> index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a050a8654d54dae2d06c220c 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>>>>  			};
>>>>>  		};
>>>>>  
>>>>> +		videocc: clock-controller@aaf0000 {
>>>>> +			compatible = "qcom,sm6350-videocc";
>>>>> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
>>>>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>>>> +				 <&sleep_clk>;
>>>>> +			clock-names = "iface",
>>>>> +				      "bi_tcxo",
>>>>> +				      "sleep_clk";
>>>>> +			#clock-cells = <1>;
>>>>> +			#reset-cells = <1>;
>>>>> +			#power-domain-cells = <1>;
>>>>> +		};
>>>>
>>>> You'll probably want to hook up some additional power domains here, see
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com/
>>>>
>>>
>>> On SM6350, videocc doesn't need multiple power domains at HW level, it is only on CX rail which would be ON
>>> when system is active, hence power-domains are not mandatory here.
>>
>> 6350 doesn't have either MMCX nor a split MX - shouldn't both normal
>> CX and MX be in there?
>>
> 
> All clocks & GDSC's of SM6350 videocc are only on CX rail, so it requires only CX power domain. But when HLOS
> is active, CX rail will be ON and operate at a level above retention, which is sufficient for videocc to operate.
> Hence clock driver don't need to explicitly vote on CX rail.
> 
> The same is not true for other rails like MMCX and Split MX(MXC), hence clock drivers had to explicitly vote on
> those rails.

I'm worried about MX being undervolted for higher OPPs

Konrad

