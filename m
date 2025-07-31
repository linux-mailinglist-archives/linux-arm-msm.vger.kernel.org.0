Return-Path: <linux-arm-msm+bounces-67248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0921CB17069
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 13:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44B9A811C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 11:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227E42C159E;
	Thu, 31 Jul 2025 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVl0ingj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47A2BF000
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753961605; cv=none; b=mc3h02c+PSJ80BX20TdwHbOhxIsGrknmgXT1Knk5THI+aK+q52YAWaI+21hQssMkty0I7s9uGEO05xYxNNH0rt9GEtEJbuA57Ri5D5jUgT2WwpTUp0tXAxsNi1ba65+83T1IhyBSKnsZMdYIpsBR4pW4nT7zcjI1bVNsK36gsUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753961605; c=relaxed/simple;
	bh=MVHoymTtrUj1FNtzHDj+G/R7m5ic/21SYiflzC29O+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNxbF/9ctlsM3F9hWNXmJFn55ryjCdduPa0xFch7b1/PtVAX9eSetC02/kqBrsEWkY8D6ZrZduk52dDl3T8UmHxf8SY86DySJj7fk0wQ6bpwiQuQc9eG1riqtF21lyhDvofXDDA8Iptpe1rzqcT8/875DhuoKxyd1KTvYh/WkpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVl0ingj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9fFuR004903
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 11:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hiQCVI4PmZedCkpDHfOr5gWtV6DX2AHcDyhpGCv1hLE=; b=KVl0ingjacySND2Z
	KL76fBWAL7VJFK/s9lqPRtADqB+ZRAn0MCAXW7yT8GNr4dBhD2TPxsgNYxlEPB34
	YwSceVonh6V61GfPWxVUqcSv2tc283lXq3F3n9d6r+eZtKK+fokcCF0eHI9nn1AX
	DFo7UQvLJKRd73+R2mKczq0/6aEJSMt+25Kay0BJMML67BPVwxbdNQsvatSrLxo0
	noo3zY3LSflY3jjF65Krrt4bglKWM/8A0Xe/ymdAjvhRpAnfn0J1etskDsWhPXS+
	bzos5i9sHiNZW8QtZcwCzHaaAIcRxXvN0lvZPamMZjpWtBQNS1FIYXI9PhIN/s9m
	38TbUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwev05j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 11:33:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dfd0470485so20026085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 04:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753961601; x=1754566401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiQCVI4PmZedCkpDHfOr5gWtV6DX2AHcDyhpGCv1hLE=;
        b=ZJit+QPH0RgrlyeImtSPCdCZ5hQMdtMfzADfjpbxH6Ur3Gsk/s8V5BSSkQiFR5CVkG
         yCeXmZvXoqaSJURZa2VAzQUBrEpsHNy61datdsHLEBEl+nAr9gODGMhKQkhn9x/TIFz5
         Cyc6Grbffmj/1o0isAY16gVFNKbwIxa6DIuiwtqqwWBR58FadPwoqAtxewIbsnT18ERK
         sHVmFCVpPajcLUJRPKaReJHX49xOrNHYWMgUJ1QhQ1LCmSyXHJgS2l3j7Mf83Sit882u
         jamK2IV5IH7BhIEW/mSyrkaO9VSGQgWvLpgikzMF9jAQK2p+emGxnUvYDFqzwGdT5I8b
         ThXA==
X-Gm-Message-State: AOJu0Yykk6t40qtbhZvV/IYHBZ/lHEPKRbjQr+z+++JVtnbsvDDvZB4b
	Mjq8n6imRf9IwltDVl1JYOdAUaKu/ZcccnllNSIKNJOTZc6vV8lhXooRakkNN+Bin9aLuCsOtm7
	KxGTzPswRLGkWAsHeDxyZqBCnZLlY+bBBLvCBZoo4oHyu9+aVQ97N/sQsq1hOLU/vYzZ6
X-Gm-Gg: ASbGncsWtRucnEB2Uciit7SofqHMjg3jo8u5X/avvq6k7VKBBBeJleJ/ppWbrAj5ZY2
	YUUwTJyeU2/F231p1dUWJawqPUArdon6Muim4zd+nQtUhtRNgxB316JWcwjFBHA0vbV71kf+KNe
	nVNu/4WkgGFmCg1D12YSRQFWxHR9UusBFEqSxCw233xjXjtIcJaJXumjBNMjG1aK70Y3bpdA75B
	Pe9iN7iiPMGE4hmOOTem69BkxD3tDmL7RaIR1H53kV+WqJFpmKi+4Ay4RWQr/d7Yz3qj3yrhCWc
	u5r8aV8DVrkb0bcwixG1TC248PgHs0egkrtvBQNPCgBqUyh7DBkw6tyuMjdeU1JYLk2eLCg4QTn
	Dp6uIInzFrEu1NEHUPg==
X-Received: by 2002:a05:620a:c55:b0:7e3:30e6:1fd9 with SMTP id af79cd13be357-7e66f3579famr401346685a.11.1753961601226;
        Thu, 31 Jul 2025 04:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9SW+3agSd3nX7M2jAwPZf0SuoF4AQlimzli/JD2ZQjueM2pww1iKLHn5i3E3E7+3YegsRmw==
X-Received: by 2002:a05:620a:c55:b0:7e3:30e6:1fd9 with SMTP id af79cd13be357-7e66f3579famr401344585a.11.1753961600785;
        Thu, 31 Jul 2025 04:33:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a9115562sm982681a12.59.2025.07.31.04.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 04:33:20 -0700 (PDT)
Message-ID: <afcf449e-7370-491c-8682-552761a5a8c6@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 13:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Yingying Tang <quic_yintang@quicinc.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shuai Zhang <shuaz@qti.qualcomm.com>,
        quic_miaoqing@quicinc.com, quic_zhichen@quicinc.com
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
 <20250729-hamoa_initial-v3-4-806e092789dc@oss.qualcomm.com>
 <a6456802-3d19-4da5-a995-c8f00553c7fa@oss.qualcomm.com>
 <d14b2a0c-8304-497f-a662-5b93dbaaa1ed@oss.qualcomm.com>
 <c0b804e3-16ee-4e81-9aa8-4b6051b5af03@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c0b804e3-16ee-4e81-9aa8-4b6051b5af03@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aF1s4JYSN22tteLXs0WKkhfKImTQsmCM
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688b5482 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=WymS4dw2S599D73gK6YA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: aF1s4JYSN22tteLXs0WKkhfKImTQsmCM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA3OSBTYWx0ZWRfX13L4vyel0SaA
 ncsLms8n92kuareSOW3h0iTpQXGP1V0kajTLl9Hwv5TChvx5LEDGzdAuTd+gGgRak6saoi/WG58
 /RHMqXs41CWSOPdQSvjtvO62ZMEVQ22YOA+OQsWo8vTc+Mxg8xFAxfsXqYnHdAHez29ujNMxTvP
 Z5FEfze12S8bsUudN1BuTWUoNhP8wD+iaPyz0GZSmi+324w+dHIL4kl/XtlktMeg9GSP7FbQX8B
 DaI3ZmA9F68ULPP2ngmNkU1smSXMnBJyBVHrRNTR5jt4b4AXxazqbdkz1hZVBQJusclyO6BBNV7
 jG49iWjvxVbD5zPiLnqLMCSIk61W1qgRJNkiw0FkDKjSSrsEKmv5XdOteSkkXOS/UKz5U7CpUzf
 OlmArL4CH4vF2v7DbL2cBXQIMhQRmYEmRRwIP7XZE8zNC/AeqsuplSY832L5EqaZ+x+K0/sH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_02,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310079

On 7/29/25 11:39 AM, Yingying Tang wrote:
> 
> 
> On 7/29/2025 4:37 PM, Konrad Dybcio wrote:
>> On 7/29/25 7:51 AM, Yijie Yang wrote:
>>>
>>>
>>> On 2025-07-29 09:32, Yijie Yang wrote:
>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>>> embedded system capable of booting to UART.
>>>>
>>>> This change enables and overlays the following peripherals on the carrier
>>>> board:
>>>> - UART
>>>> - On-board regulators
>>>> - USB Type-C mux
>>>> - Pinctrl
>>>> - Embedded USB (EUSB) repeaters
>>>> - NVMe
>>>> - pmic-glink
>>>> - USB DisplayPorts
>>>>
>>>> Written with contributions from Shuai Zhang (added Bluetooth) and Yongxing
>>>> Mou (added USB DisplayPorts).
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>
>> [...]>> +    vreg_wcn_3p3: regulator-wcn-3p3 {
>>>> +        compatible = "regulator-fixed";
>>>> +
>>>> +        regulator-name = "VREG_WCN_3P3";
>>>> +        regulator-min-microvolt = <3300000>;
>>>> +        regulator-max-microvolt = <3300000>;
>>>> +
>>>> +        gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>>>> +        enable-active-high;
>>>> +
>>>> +        pinctrl-0 = <&wcn_sw_en>;
>>>> +        pinctrl-names = "default";
>>>> +
>>>> +        regulator-boot-on;
>>>
>>> It should be set to 'regulator-always-on'.
>>
>> Are you sure? Turning off Wi-Fi sounds like a valid usecase..
> 
> Hi Konard, It is m.2 interface on Hamoa. The PCIe power of m.2 should be always on.
> 
> Even on QCOM's B2B interface, we are unable to dynamically control the power of PCIe devices on upstream kernel.
> The PCIe specification does not support dynamic power control between the PCIe device and the RC.
> PCIe power should be always on here.

I see, I was confused by the name 

Konrad

