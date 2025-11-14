Return-Path: <linux-arm-msm+bounces-81825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE3C5C76A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C7BE4F6D34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A3C3081D2;
	Fri, 14 Nov 2025 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHF0GLbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MV5QiRR0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2B305E02
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113237; cv=none; b=L4otlINeIBSLQRFilQeHhFbNtc5N+IY4tmJMCiS6cT5VRPZdDzTuj6zifTXu/lW6QzY7Q7fUsPfzTx/l7rhHhhL0D2dfttSQ8i0dktho7Ol3W4IUBGoxBFwWRpzBT/bqdU1Tyyy7t7EzPBAHMkR4dEf9F7LbxCUqHr9Wq8A/+Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113237; c=relaxed/simple;
	bh=Mi4T3XcEa6EdPKaThvYvHMEV/+vQktgW96gwsyb88WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuYAkIRAKQJ4mnqza7OQPNQ4zWt3iyA6VbNOBRuwo1Q5UJMkgME+yz0oD4ZQv7zVSY+5EGLQYAIN+TfmyRG8Oy8qJ7yfhUnj5GW1vITcEpNxWZpB7eZ4GV0KVEVcb5M1PGXnAqJScJ+XBwmVZl8fQqE6G0EpDo8TJlISJG2ynUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHF0GLbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MV5QiRR0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8Df9W1484923
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 09:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zUSPLxfkM9j/VAXTWZbk6xRZYQjSdc0/dXsIyAGTxQ8=; b=MHF0GLbdq3qDDIW2
	mVJTtHFLfM9UjVPxIYdtDyqfUvBQ67HMVilgvafcZL7/3AEmvgHD5azSNLlVTDD3
	wP31x0668cmKITC2v/K7lPgEAomKLyr0OSwqWWwtZK0SkVs8e3wrc6ezpv8avKqU
	Vm0P8GXU+XkaPEnYkaBYFGTiNoD71aZJFyt/kylj5pG6lzhy9iYrMMqxn+AcfNQU
	wZPOyh2nGHNjrdeVh4WfWZY/nxqSJo87KGCnzreAj4fI8xlIq1Me5A3R13ZfRJcR
	P1tjem3R/TyqFxIrRszRu+BZQWdM/vzmWL/RUfLE49a9VWh5nB6CBBPd21SwHQYl
	XWNIXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9chp2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 09:40:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b29f90f9fdso66891485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 01:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763113234; x=1763718034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUSPLxfkM9j/VAXTWZbk6xRZYQjSdc0/dXsIyAGTxQ8=;
        b=MV5QiRR07olkorLkU8HBrq7YqCtiBxxz951JTSKGFiMXZF9rNIJ8wASuZpmQqgTNTu
         qAz4PV6n/rzv3JX7/c6uijdTI1gNAT+vvZItLULUpJQUPE6/xRGaU/zET+vmH3RsTuJq
         iNeH7uW9yCIe0EvOMKse1AIWMTKCHYf9ZcVwWE8i9eWmWPTTrTCiC4eT9EPipmcYqJTZ
         pcB6TiSJcdTaaRhzRo+cqvCB+9LLCNsLE6WyxFWwxxFf2K+6wci9Zq8NNwrKNPgODHyv
         OEfhw+FPG1gFK9b2c8xqC/R7VGlPwT010agG6BCbBKT1WhAb6CBw1XUvnOC16Scj/APP
         MiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113234; x=1763718034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUSPLxfkM9j/VAXTWZbk6xRZYQjSdc0/dXsIyAGTxQ8=;
        b=v4xx0MyP4kIjqgpMXmzqkUM61cu4e2bYTNF/1XqQlOYuAkJWoAw1spyxT7Wzr88R1q
         MLss7Na1otK/Y0mLbRKFJ8AhTf61sOlUpX1Lo9WDabzBGWypSsm8FStM/5AjG+p93UG7
         A0mmvKmHPP1t67YZCSp/iBf9TKR2gsJDpppxFv/piWJ3W7BM/YLLYPKOtnR5dqFg8baV
         Riqp6z6L8oxwAr3G84DUgPAPRcGtgHbFBYRWz65K9C7R41q+EK+ojzgpoLnAkw74Xbwg
         INHToScupSiMtlOLIkqccIOOuWWwVDGDOv3XJQ+bg9vBXEisu6+Tgi7Cy5mu2BuJ0XPh
         dIsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFuZhQUXCLUH5DrctOv28KpOBTBQRZWbCKg5BkmZM2EQf7P5PFJk5gfEuoDJJMMCNlSGFP3n5nMDWwNBlC@vger.kernel.org
X-Gm-Message-State: AOJu0YxtzqxsmQ/xTzIBTje3KxaQtITtjZMlWDBXnzuimCy9yUyO8kGa
	IKew3kJg8j6B4t2/ioL+lX/FLQVJI1DZEOS6GvVtDiv0mn42B88bMCRuWp/nO6ZDZWleYCQIJ9o
	p2PbTKcU25IerNHsU7Tq8Wj82Tj+CPR8NWWjJHNDUsZ5bgIeXmgpJO428wURquofBgi5p
X-Gm-Gg: ASbGncsvOPBircijD3/fJL2BBU367Kt4BA9GIhs7pHePZjBrryujE94gjrG40bDwf0/
	96K6q74iZ9p4WZci+ZQZirFNadwGePo1s0K5R6WfPPWV/wK8rP+6N70mK+NmhaWJyH6SN7Dbsix
	F/r7KDOTdFBARZMP3n0GGNDaoznb7Nvx/bQyUrw3KHSWpXT4lxtJ92+puxHPtpAnhjd3PYpPcMm
	97Wo+mopELeJweuJpPrRXqoOlWBWnvOkFzxkNwBz3BR/6lbHOem6wKIUIwO56h1nV87Sbnh9Z0f
	v5dFRD6AC+fNaG7/pOt8O8y/pPhM9HsdONc6Dxq/oe4DJsrY8yokjzjs8CImP1+2Lq9qCLsq7tu
	iQBUcVQSNXiyvxIECfpw=
X-Received: by 2002:a05:620a:4495:b0:88f:74c3:6649 with SMTP id af79cd13be357-8b2c3130e10mr214555385a.1.1763113233818;
        Fri, 14 Nov 2025 01:40:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+KWUEsr9qbYFM764MbE5Y013bVRnhaH9X7xyioJ0T6Mpn7AHc01ToI9In2YF15IlxdKoeUA==
X-Received: by 2002:a05:620a:4495:b0:88f:74c3:6649 with SMTP id af79cd13be357-8b2c3130e10mr214553285a.1.1763113233326;
        Fri, 14 Nov 2025 01:40:33 -0800 (PST)
Received: from [10.233.17.95] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2af044e3asm297385685a.41.2025.11.14.01.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:40:33 -0800 (PST)
Message-ID: <d86c455a-e9dd-4424-9c79-aa8eb429118d@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 17:40:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        quic_shuaz@quicinc.com
References: <20251113130942.2661069-1-wei.deng@oss.qualcomm.com>
 <nh6rlcyamnm2spm54oitckujnxp7wna26vomxvlrik3mlhh3no@22skfvcsrfhj>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <nh6rlcyamnm2spm54oitckujnxp7wna26vomxvlrik3mlhh3no@22skfvcsrfhj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 770p_FQ4pUki31TqwnXfUln5NflsLVMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA3NSBTYWx0ZWRfX++KnazgQBq5w
 ZP4aWkN+YCcwTdVsZCuWl6ERVqPDuFBHvT0oXMKP0jAGJNO/qacs/C5j+8kKPGbXFR4JE/pUyeB
 UG0vDMbQMHLjjz7PZa6QbcHo8zCBrBWPReE5PSTe8cYl6OIuyvni4O/ldJXjGkLz0wT964q4dzP
 vJjm5HwOamXPwZG2sLtxxOf7LSOtD85F7uii62Mpmf8xkKTGa8co2CQQ2QQhBRDQfgXXpNc5+s7
 daEoBRJuk0x7Qs/2ifriWNhwrY2EWP1AW8L2zrlD7A3sHhAKs/woU7rGQDowU3aJ5l2YNE0RrVp
 QbE7v6Ato7iyGNatgjLhV7EvM3JK0nl0vqcWFNqA4cIKvY+KkGx7zrTClmEn/nIBSoAMW5fvkpx
 evQ9T9TzuMyFqpiJZeDxLD+zBrx4dw==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=6916f912 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YCW-zRLxNBBzO5pBKAoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 770p_FQ4pUki31TqwnXfUln5NflsLVMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140075

Hi Dmitry,
Thanks for your comments.

On 11/14/2025 4:14 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 06:39:42PM +0530, Wei Deng wrote:
>> Enable BT on qcs8300-ride by adding a device tree node for BT.
>>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> ---
>> This patch depends on:
>> - WLAN
>> https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 28 +++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> @@ -571,6 +580,25 @@ wlan_en_state: wlan-en-state {
>>  	};
>>  };
>>  
>> +&uart2 {
>> +	status = "okay";
>> +
>> +	bluetooth: bluetooth {
>> +		compatible = "qcom,wcn6855-bt";
>> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> 
> The reason for these firmware-names should be added to the commit
> message.
> 

Since the platform uses the QCA6698 Bluetooth chip. While the QCA6698 
shares the same IP core as the WCN6855, it has different RF components
and RAM sizes, requiring new firmware files. Use the firmware-name property
to specify the NVM and rampatch firmware to load.
Will add this to commit message.

>> +		max-speed = <3200000>;
>> +
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
>> +	};
>> +};
>> +
>>  &uart7 {
>>  	status = "okay";
>>  };
>> -- 
>> 2.25.1
>>
> 

-- 
Best Regards,
Wei Deng


