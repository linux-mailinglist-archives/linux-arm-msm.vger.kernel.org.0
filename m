Return-Path: <linux-arm-msm+bounces-66668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890EB11AFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 633F37B3428
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 09:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7F92D373F;
	Fri, 25 Jul 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gqf/xXQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6E02D3758
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753436403; cv=none; b=aohqPvfaFUcEGHvtCwu6CJ6zR+DVZWmNEJ80q7BM0BcUhsLz/x3qsrzESFXhQpMDux7lTgQkXA+x7fvKSq61QVK3SUZAENdlmBTCYFsYgPLucaVvqFD8cG7E4x2yX8K/Dwfz34yphe4xJmI5OKQKBJd7lfFDUIBGGO3P3kZOjiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753436403; c=relaxed/simple;
	bh=u0Be70tRO8EucRz4c+aHCHMlZERAFH526qljtMYSsec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGWp/lIRvdeo4uSegg5b57GdHaxI3pDZHQtQwgrQfPZOdSMHbeYtNXK0W/OWKfuwORqogyrUHxtIBlp+GOcFUmPb4uv5SNs2biG45m4Dirc93am2R7403prSlBh/pAfzo+eWCHRmoHotLPFFObyQkcZ6xZZlsXYiz19N+DVxN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gqf/xXQE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8r754015756
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGcapkNoG5xSntx/Dgx3xqxnAeNgJFQJV/nU/XJef4A=; b=Gqf/xXQEOFebvRx8
	XyK3eCnTrzKmwM1uDjdaH2eFRpMMQmx+3PpkTagn6hs9bICbHjUn0imzTozg8Izd
	3FKrowK3Fm5yvmHSEFeD3WbKuXNLw7fPbWqOqq0PFOWJdxru026LvhoS9zPbvLyL
	mnaUDhf34SrzEZeSywpPiuTYk8FDJLfqIo2cK7BfeWzT2xhJcdQ625c6isBNThMT
	aPbbHCYl9rH8wNq9r1qogQy6oR8Se91OUUnCeoWZiiOJANyNGWsnOLq1jjVBkMCK
	HtRcxdqRshQ7l7/+IzApShTDRJpJCnjfTZvgpAIv6SfXpOz/DMMBEr2oZMJA/Mzq
	GYk0sQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w501k8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:40:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ae762426d8so1299911cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 02:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436400; x=1754041200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGcapkNoG5xSntx/Dgx3xqxnAeNgJFQJV/nU/XJef4A=;
        b=qg822BjrHa3qpcX+Z5rD9/WwcKqPGlOYc+AoNo+Bw1cPMZa+u7P3SZ99rDHw7ibi2N
         ock5/grlvKP/Uv5X2g79NhKv8XljkgXTmYaV6zcYBzL2w/gtLyQno0q/xlhh+dn/kNlQ
         3niOhqBbp8lwYd6+LHK95HL6Iizkygxo/XeEeYxI6RP0p+ALaGBjsxpj56SVxhXs0sML
         8b76mrJMQrWk3caiDNAbpS6dB+VkEq1hZULMeqCdmQGQTouVc6vQvnc1kwesqhxoC92v
         OAfhyB8jR357cFK7fI16vrAppfpKsM7169j7V0x/b9Hw/kGsVScJ6M0d+80wKLSeYv76
         Cppw==
X-Gm-Message-State: AOJu0Yw/2F6i7iMiewdMHZcH/otQMUWwiFND0XfrAJ80/3KICduRmObA
	y7dLDVUYVFnUejfnYjiFqCy4zkZEfSteLWjI+5U0a5TywlDTb/Er5yJrQTf45uvTrgw1dKXBIKy
	SfmP/ir82nj9+BIFrOmqCPt0nU2/bTSHBNlmJQOBN4lTvb00J+CWzZ82AF/mMXjiRrlAg
X-Gm-Gg: ASbGncuQ/z5yJeJWaIX4cKdqcW5NaHxNMExg89E5+TSTbRFwZ/vsb/n5lOGJXYD9NyT
	X3tlqyj6FMYOOmTf3m7/GHA4V24CFSMC16Hu41Ah0Xh2tgAk1dCWBC5czWpsd0GWQ8He1eYxvvB
	riHgTm8M1IG2xYCWgxIqNQiU3eet/8x2zUkwPaN3oa2Lo8ATpPn2ZMBD5oDW3Dce9kloXP/T93K
	AUh+41w6ld9lOqDxP2JspxqAu+8xzPL3GnjZu3WI1oLKWb+JQJveJrfyTh39dTPq++Xan4SAfSI
	8oOI49/FfFxo2Aoua+yAFqvZK+wasv+3r9zeHwzD6NNOuO5nnWSh8ZjdCr1gqpDLUgNqs7LKY5v
	s+sJa0+WuqwAK2tv0fQ==
X-Received: by 2002:a05:622a:155:b0:4ab:806f:e30f with SMTP id d75a77b69052e-4ae8f07c679mr6020991cf.14.1753436400452;
        Fri, 25 Jul 2025 02:40:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYMeHjcnVI44EcDI70Yucz+FRHkluZa7QI89wpXOAoApZO7jDs/RWusaJ8gN/WVwuN+Ojkqw==
X-Received: by 2002:a05:622a:155:b0:4ab:806f:e30f with SMTP id d75a77b69052e-4ae8f07c679mr6020891cf.14.1753436400072;
        Fri, 25 Jul 2025 02:40:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f44d758sm240579766b.76.2025.07.25.02.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:39:59 -0700 (PDT)
Message-ID: <c28b7ee4-e438-41c8-8033-6ca94a096dc5@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 11:39:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
 <20250724-hamoa_initial-v2-4-91b00c882d11@oss.qualcomm.com>
 <d55f79ed-0bec-4045-8bc6-9005d19f865d@kernel.org>
 <cf84a8ef-9f4e-4f13-b41e-9525e21a913b@oss.qualcomm.com>
 <3f03b1c0-94a2-4081-adb0-aac4f42ee430@kernel.org>
 <20829683-b2ce-4aaa-beb4-4ca5774350a2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20829683-b2ce-4aaa-beb4-4ca5774350a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fh_v2WLqYaL8UkjoiMxUFwebJ7eu3i81
X-Proofpoint-ORIG-GUID: fh_v2WLqYaL8UkjoiMxUFwebJ7eu3i81
X-Authority-Analysis: v=2.4 cv=bKAWIO+Z c=1 sm=1 tr=0 ts=688350f1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=3OGU9N5RSJw_tsRa1MMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4MSBTYWx0ZWRfX1brawAH0syBB
 gI+Q9k/bLWCrree6YQJN8ASnfrb2OeNCcXVGvgTr/NneVPOdPN6StogbbWj7UXt8nYwiLNVc++O
 IneLgB7DLpuuxklfuGzbS4dSUIU2YGz0JxsCZp1e34M4AjnjQ6oGDpKerBONdTH3TDnICL1+59x
 385wly9HWh9e20FaamYeyp6p46FaFsVH2Jvaz5hp6/kE7VdUQkchibrINNH6xHPTzE3j2A0MCxu
 rkzFLY+eqof4RDVGqPbrp6ILuvr5IIqVehVsf2bm9l9vd/z0N7cqcWw8iZOSkdy4ncB7ijceCdH
 prqONc0kr7QbMmZAcsxLK5I9nVrlNecTzuh05nmvg8dAl15naji5cq10W4iBHfYwSC6IgszOB4i
 dB5ERL/Y/UqkU3JEefEkGkqKoyHB5hyBb+dmBF0KD2B456M3BfkZ8kaU1i6JBgXTZSIbPgB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250081

On 7/25/25 11:36 AM, Yijie Yang wrote:
> 
> 
> On 2025-07-25 17:18, Krzysztof Kozlowski wrote:
>> On 25/07/2025 11:01, Yijie Yang wrote:
>>>
>>> wcn7850_pmu: wcn7850-pmu@xxxx {
>>>       compatible = "qcom,wcn7850-pmu";
>>>       reg = <0x...>;
>>>       vdd-supply = <&dummy_reg>;
>>>       vddaon-supply = <&dummy_reg>;
>>>       vdddig-supply = <&dummy_reg>;
>>>       vddrfa1p2-supply = <&dummy_reg>;
>>>       vddrfa1p8-supply = <&dummy_reg>;
>>> };
>>> This approach ensures the DTB passes schema checks while keeping the
>>> implementation clean and consistent with the actual platform setup. Do
>>> you think this is appropriate?
>>
>> No. There is no dummy regulator in the hardware, so you cannot add it to
>> the DTS.
> 
> What should I do in this case? Is it acceptable to deviate from the dt-binding rules due to differences in firmware behavior? Otherwise, I’ll need to revert to the first version, leave a TODO in the DTS, and wait for someone to properly model the M.2 card.

The reason we describe the regulators is so that the Wi-Fi can be
powered off and back on. Please don't invent any hacks.

Konrad

