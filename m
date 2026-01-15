Return-Path: <linux-arm-msm+bounces-89242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68501D25D1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 17:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C5BE300F5A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77CC217F27;
	Thu, 15 Jan 2026 16:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4yR0WWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOIBWxss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508EC1FF1B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495626; cv=none; b=iuAoRFJxAN36Q0GE72nlSbOAscL+Z8oq4/r7fRCeCJUNAWm+Wo1FK1+w42WOQmvxKtvfLem/Kou3YTnW8YoSq70m9UPiul3IChw1L6n0+AcCnGO2TUE7lm+DMQe3tik1Fe9vzy+k50IwtByu69ZnSO0ntv8Y5HEFPWeuFpFKDOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495626; c=relaxed/simple;
	bh=BHS6hQ/OMc4n87ag9GZgPSWSQWwjT8gF9pOBg7i06oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCFk6IgzJ7itmwK9W4gqx6PtuhQhVlG1YUJ9rzkG+3pzU4EJaohVE9C02c6HWrPedARRda5nFWnBOE2+iqFwwhHvWxb8mERW27I3EeJLb0fr7Yfs+ynytrz58duDEepp7yLKoy0s74PisaPdl/kVg2uc0RjRwhz5XlNzM+2xC68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4yR0WWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOIBWxss; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY5t41909925
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 16:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3abO0z3n/B1pjXg/KULk99J8ty6XdnqIb7P5fq+KY6Q=; b=e4yR0WWCUZlIM0fK
	9FX5abQcG/0H6c6CASPd8f/Ni6sIupr6sH+vru1Rj42KBR2Y5hgF+mtY3WMmGp52
	YPJCfJmp1Y6xsCa5jDlfWZ0fc0Yjav9Qi+zZOf0BevSxtBOtfGIAgUSAil2tnjPV
	exTtIcNm3A7QPxHcaoIr8VuSKsnEyX/wi2yZtciD+uDenoffzdmX1Zh7LKYAHAHj
	39QyUYYaPtvU1VaRtxnITkxqcU6Kg32/gagXyNOjjq+jjkkV2oRKbq0+DM0QXDmg
	QJRnK8DW6MGzCLl5pN2Px+SZkCGTgU8oFaI7WlmksXR/dw9v7Vh8W8PzPbK2UFXN
	mundKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxgn10yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 16:47:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso1954596a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768495623; x=1769100423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3abO0z3n/B1pjXg/KULk99J8ty6XdnqIb7P5fq+KY6Q=;
        b=iOIBWxssWGlVTDo9J/CS7XSpUtnLNdWDQGHm5+XFZ1sVRwzS/fP2NubGa7erDTshMy
         YJDkzKIhM/FsKiA4y9FNU6unoEb1UZG3bhDFj3n9d+CfXeN62dHcUufUlm1/h8xKaMTX
         IL3QZrwUXZRsAiSDptFpUIu40hXB8xoiEmMFT9jTA3UGVXlnYnhwy2Nc/XdyPUw0AiIL
         UtCLckOptBC8+px1OsAq7ERLflt9o8m8XtJrPvQ8Zm9GAVCMQzKBtyLQLoyFymrjSPmv
         OFZnnvN8Oqr9bT4IY4iIxNoJtgaCaieVdVb8IZl64sz8LcdDBnwGi/tvQEvW9uN1Cod5
         3/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768495623; x=1769100423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3abO0z3n/B1pjXg/KULk99J8ty6XdnqIb7P5fq+KY6Q=;
        b=XDOuE8HRjqNNEzyRcZVjfa0oKrICSFakrPYzsLuqu94Mei6hoaDpmL4EzONROBnxyq
         o6FiZ01eJTWjljEPI5k2XWvZxj2sQ6LNbW48WWvRBnUt4VEMqi/Y88pjOl1mdZDvm4cD
         PxAU0UyL5M11+3cNtJUwxOeg71NeRV9wQymqkGHUClrgtwvyjtmUFi0E7vktty3E0y0g
         tDSW532zqs+2VElXDIuB8BXFmWsb4ZR0D3npg+bQ+0uW8RhsaY1zXCPyWaqMrAKnMm33
         5ksYL8MGEXcyciKa/3EkyN5GH9P77Zub4k3Bd/DOxWAZBi9h4BAPbnTqtwdG5SKF6iNK
         T7pA==
X-Forwarded-Encrypted: i=1; AJvYcCXgxqh5so+bOs6t7Ml2nlhqPbN8IE2xyYftONAxuwPkPy6X1nN/ulGOxPNbc0TTayGQsXq9daHMl3qIb7dQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzA2+pf7LLDibwAJAHpo1D3VeqLq4xWYqAKlXEUxsYW41c5VIyh
	Bk5361Q8Z6p9M7dL0hIgltalOlkoDtzaK2KuOFcptrLfIq3jQvxX3vJcMx9xhHWngjuowturfID
	kUBcfPi+x6gnjp4/trUjzhNXg9cR/Nt3RWRWgrrrzspNE4Aaay7HQMCMneQZ85QbfxDs9
X-Gm-Gg: AY/fxX7OVouGyvB2YLWpbnRoB5XucWGf9ClWNjKELwlFCRCSvjyCvMA+eJc4pAMYYAH
	ThM0E+1ohBQnNuBHAbZgIg34cEYGXgc6aM3R3TiUbkBbwu+IcS/DcPJpZLEr3WCcWy6gvINqT67
	n6zqjBb2GmcyKec75+IV22TgUoIkSsc5eKenZ2PRE9ZrQujuwajbhiEVACt/hs8oYIOH0umRvGl
	VppFaRNY7tiOt2UXbpfrOpq7zKMtxJc8NUsQmWlnZElMEAMspcAfpqGckiYuDRnCE3q5NZ1XGFK
	MD92hZ9WD5eFUbv85V3XHMoKbyXB9p+DPme4TV/HMZ9FkXdSy0Cj4U301Pr3VggqkAFpRdTJCx7
	y7F2LmMbA2X50wPgo7ogaofp7lCi+H1u3z6/5
X-Received: by 2002:a17:90b:1e47:b0:349:8184:af8b with SMTP id 98e67ed59e1d1-35272ec4d3amr45123a91.7.1768495623119;
        Thu, 15 Jan 2026 08:47:03 -0800 (PST)
X-Received: by 2002:a17:90b:1e47:b0:349:8184:af8b with SMTP id 98e67ed59e1d1-35272ec4d3amr45084a91.7.1768495622637;
        Thu, 15 Jan 2026 08:47:02 -0800 (PST)
Received: from [192.168.0.195] ([49.204.29.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677c90easm2484312a91.4.2026.01.15.08.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 08:47:02 -0800 (PST)
Message-ID: <4bfc5d1a-d200-439b-8e0b-9afb8122eba8@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 22:16:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: kaanapali: Add support for MM
 clock controllers for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-9-a6cc9e45de93@oss.qualcomm.com>
 <idz7dsvyrrf5t46hvogmertavqvszwzw4pwzdy6bg23gst4yo3@cqvklmtp2djy>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <idz7dsvyrrf5t46hvogmertavqvszwzw4pwzdy6bg23gst4yo3@cqvklmtp2djy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fydeCX6ZoWHXJl1CE3d5A4KlBktFOa4r
X-Proofpoint-ORIG-GUID: fydeCX6ZoWHXJl1CE3d5A4KlBktFOa4r
X-Authority-Analysis: v=2.4 cv=ANDFHcx+ c=1 sm=1 tr=0 ts=69691a08 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=sDpHl6b8cZmcZdfeLADyyQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1aPxvton2V9lDOEFgK0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyOCBTYWx0ZWRfXxfq01J/Fi3mV
 GC9lZS12YPIMKaMJA2QmvPxfr/qrmXwhsIiLZK+J91S9+egQo+zivUaohvES1RWl5l6egfn1rtw
 J7lI7lO0g/kleyDs0Qdq4a9fS0BYe/XeB61yBCK0wVIBgKcWQJnFWl7Z/bbQ7PRVZ/0LNa8nsaQ
 uU+wZ2k2W/aDfr35kc0PW93MI/BgciJWSzjyLtlQk+W9G2YwdmDWpaKo3ENyuWfScCZRokh8iaf
 F+ilwMLyPKTI/OiGG6ETkGozA8Lb4WZWOfCDMp26rLPrF+yAIHFQZ6MQD7RxUTJMpY+5flTBRTi
 DiNanzsBaw0tZ7J/prfVTVJ8UKMcBGqljvPBu5zT22PhAQwsvLBoFOpABAYUG6gBUGIA+2fYzkc
 oUPIrpywr3A2XZ2W9INVOA4p3KPpzaOL6wef8cqfJO0N5GBCQCe1n0kAiFsjfzT/zEo1ypHUIdQ
 hopEWrNn6gTcqXXMiYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150128



On 1/15/2026 12:49 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:49:11PM -0800, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Add the device nodes for the multimedia clock controllers(cambistmclkcc,
> 
> Somebody took away a whitespace from the previous line.

Will fix in the next patch.

> 
>> camcc, dispcc, videocc, gpucc and gxclkctl).
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 102 ++++++++++++++++++++++++++++++++
>>  1 file changed, 102 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 30705483ca20..8689715ae24f 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -3,7 +3,13 @@
>>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>   */
>>  
>> +#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
>> +#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
>> +#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
>>  #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
>> +#include <dt-bindings/clock/qcom,kaanapali-gpucc.h>
>> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>> +#include <dt-bindings/clock/qcom,kaanapali-videocc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>  #include <dt-bindings/dma/qcom-gpi.h>
>> @@ -1594,6 +1600,24 @@ aggre_noc: interconnect@16e0000 {
>>  				 <&rpmhcc RPMH_IPA_CLK>;
>>  		};
>>  
>> +		cambistmclkcc: clock-controller@1760000 {
>> +			compatible = "qcom,kaanapali-cambistmclkcc";
>> +			reg = <0x0 0x1760000 0x0 0x6000>;
> 
> 0x01760000 (and similar issue with other reg properties).

Sure will fix this in the next patch.

> 
>> +
>> +			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
>> +				 <&bi_tcxo_div2>,
>> +				 <&bi_tcxo_ao_div2>,
>> +				 <&sleep_clk>;
>> +
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +					<&rpmhpd RPMHPD_MX>;
>> +			required-opps = <&rpmhpd_opp_low_svs>,
>> +					<&rpmhpd_opp_low_svs>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
> 
> Is it a reset controller?
> 

Yes, it can support.

>> +		};
>> +
>>  		mmss_noc: interconnect@1780000 {
>>  			compatible = "qcom,kaanapali-mmss-noc";
>>  			reg = <0x0 0x01780000 0x0 0x5b800>;
> 
>> +
>> +		dispcc: clock-controller@9ba2000 {
>> +			compatible = "qcom,kaanapali-dispcc";
>> +			reg = <0x0 0x9ba2000 0x0 0x20000>;
>> +			clocks = <&bi_tcxo_div2>,
>> +				 <&bi_tcxo_ao_div2>,
>> +				 <&gcc GCC_DISP_AHB_CLK>,
>> +				 <&sleep_clk>,
>> +				 <0>, <0>, <0>, <0>,
>> +				 <0>, <0>, <0>, <0>,
>> +				 <0>, <0>, <0>, <0>;
> 
> One zero per line. Or two, if you want to pair DP and DSI clock entries.
> 

Sure, will update.

>> +
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +
>> +			#clock-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>>  		pdc: interrupt-controller@b220000 {
>>  			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
>>  			reg = <0x0 0x0b220000 0x0 0x10000>,
>>
>> -- 
>> 2.25.1
>>
> 

-- 
Thanks,
Taniya Das


