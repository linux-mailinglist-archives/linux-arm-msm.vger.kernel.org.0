Return-Path: <linux-arm-msm+bounces-57634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35372AB450D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 21:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C2B519E29D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 19:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70544298CA3;
	Mon, 12 May 2025 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNM8TRHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB2D298C37
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747078687; cv=none; b=PdTDuo/wms2fj6a9QkfoXfCyaGEl6pzRi41Sf2gomd5AqwNanyMj94mGNPj/LZqEwZHGMvfUGmEXxE4AC5HcEm43GJ4uOs33N0h6UFcUNnYT2ev25XU0uFaIO9+EgTTqXxaCNh8Wn+xt5dCOZ1TrUPjMMAFW+3Cljn4Wj2Xq6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747078687; c=relaxed/simple;
	bh=9ez4BtdoGB++lLiCnnrZdX44y8JQbRPcU5gzICvces8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HU3mCbo0VaGlv1WsAF7Y/G+6op/K5t3/YXe4Vn1soVrtkjf12E4Vz80LZGa90DPdpua+EOEAhZkcPGoCFB3QkPQsFacH5FOWozsx4G0TslWOJ1UXwfBeoCP95MTAdgTYFXPfIMwHkKRbTanGZEnsBNmTzQwaT95hif4rHtcHeaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNM8TRHm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CHAEY1007486
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 19:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VqHk3VKldQzfdHmNTAkLY5Rh4BplTNZBaYw6PI77HRE=; b=fNM8TRHm0mhYwSpV
	WwhKC9QFYrmMfiavpA2Uvndtu0F+LICkHOKkZq1q0s3st3D49czLZ1Q1wEToGpqd
	ja05Pk9ltra6j3oj6OfZRUedqpUoHGEHFCkvjPqerK3zkMFO2xinErWPWOVuSNj1
	eyJJCRXp06Z5NT81SuVEJr1CL1xiaYCrpvaY8fWVNFJciYigxmc9DdnzpIZEyyHZ
	wCn36thTohUjaNVGy7QcZ/0I7oqHHos+aAae3fi/UmJnpdXtpm+8bJrya432PJq9
	+jjzX/RGajM0LvZ4/L9SVFcl9Tpy3plsFOF+1cZQxFzzemR5tibiw/ICTZEHYJuc
	MZLWcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hxvxdd5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 19:38:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54734292aso141780985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 12:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747078683; x=1747683483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VqHk3VKldQzfdHmNTAkLY5Rh4BplTNZBaYw6PI77HRE=;
        b=MEVi7oOSjGM0Y6eTGAiVRBDlrVZqYk0qFmT/f7JOcIfZIGtpGvVceP4ePHbdKAuQNL
         yBhstKu/jBY7So5JYH9H8cfOm9GGZ4eJ5Biv7D1QJGjIwpzAL5tNfPXFo7H9nFAIfYlu
         EOESMBw4UlFSBwci38+jQxdmDoQRDJYxNGL4QlXHwx8/tyS3tBk4gmO3qWJVZ6pKEPwk
         cyhH+Pq0nGH5eq3oDReY7MOA5mshXov5doe6jRW4kSW24gD5SOflnWzw9XnQstx13zlj
         P2IOGy34KGaMAXSSKbg8vdzslIsKisOXwTkvzv7mD082otM2iJqHoPeCFKRkWqqdywxa
         s5kg==
X-Gm-Message-State: AOJu0YwpFvr/ixQfRZpW/pkvg1ANxFkCmb3WCq8uFh5+sO9pgrO9zCp2
	xd8KZttKyR9R1xukJaVKRb1o5ZW5MNKxeCnKgTjzjQt700d7gEadnEPkvv0APvzFyygUUK9WPje
	9EN9Wlys5sn+U9r8+riImn8UwERgS2jTj73JPyraO4MXudKzYMaQIodT3elxIaHcl
X-Gm-Gg: ASbGnctpA751uf2ahgM1oFOOHraEwN+jUf5IBUXdeLA+/bAQdZ82mas17zJEbVG8abS
	Ax8FzKiKf9Igc+SKU4VwURNZBTOX67UWEThEjbJoayZcu5imkmXLnZVJCjBfl/tG6EXIMQDfL2C
	R3rYxKJSIuYMLQZG92hIXaeIvdxtAS1IJT3F3S0uCf6NKPvu0mn5OP3/8kfUkCTKsFnmWoFDQyr
	zgY35u6ytBfoDmBD/ylY2C3mYRP5z1VINJv//TJc3ONAm18sWC55Qkdn68JOM6vI6l8ifzJeavZ
	0Nmfwvrsotvav2WRHstZUDk2Iq+d4DOMqnnVAsrbJwsJwgALoAUYwaog0r5AMQvBwLs=
X-Received: by 2002:a05:620a:2886:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cd010f42ffmr744499385a.3.1747078683640;
        Mon, 12 May 2025 12:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOGrVy3IPiPX4Pi0jYbAdexgsd1bwqVgHygrmyQDSL5+w8isAbM9p8okCaBvo1qLD++QHUtQ==
X-Received: by 2002:a05:620a:2886:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cd010f42ffmr744496985a.3.1747078683304;
        Mon, 12 May 2025 12:38:03 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fd1777c29dsm3665804a12.70.2025.05.12.12.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 12:38:02 -0700 (PDT)
Message-ID: <1a0be977-39b8-4089-a37e-dd378c03e476@oss.qualcomm.com>
Date: Mon, 12 May 2025 21:38:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
 <e83b58ea-0124-4619-82a5-35134dc0a935@oss.qualcomm.com>
 <afda790f-0b5e-4569-a92b-904df936df85@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <afda790f-0b5e-4569-a92b-904df936df85@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIwMiBTYWx0ZWRfX3GEU5RmezZBc
 yQhw0vz7HR36QjxtFkTH1r+GpNsiE/ylXvXvyUDPyYglpRRGHEVEegVlxNk1lQgVh5TJb/vYIKO
 OzCyK0+YcUnujsOSbPTgdAtlh+FFJqctqMQyRcJG65JeKXtrt3Mamk6uTOYM2vCbV6hCMGX14VH
 RNQQcibZ0PQmI6PEXZTsQkaYL5eN6p00p08U/2sgcR5P5GdnpVcgwmwBtwVS0/5MFOF6Yq2oaER
 OG6LcAiqSNUDD5iQyd+5e06T8rHW3VcYzuddzcYtoCXbHNWA2EhidHeIGv8LHAK/PzL9HtJ8JNe
 1m5rJEWIc4IRvrgmz3X/KgWusKu0icnJ/a60qcBXyo01fp2cx2vckmRvxm29m2yXW+TiRsjHzGE
 N7BKBW4z5mf4X797jqTgg67DKCm1prq4HPeFLfvccSTLek0iCwyeIG9adYqbKLmR9Hu0tmpz
X-Proofpoint-GUID: GT6nzyv2eY0xzakbl0PtRnMSTTfVC6pa
X-Authority-Analysis: v=2.4 cv=WMV/XmsR c=1 sm=1 tr=0 ts=68224e1c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=DJAtKO4d43LyDPfbdswA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GT6nzyv2eY0xzakbl0PtRnMSTTfVC6pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=849 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120202

On 5/8/25 12:37 PM, Krzysztof Kozlowski wrote:
> On 25/04/2025 11:24, Konrad Dybcio wrote:
>> On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
>>> Add Soundwire controllers on SM8750, fully compatible with earlier
>>> SM8650 generation.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 122 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> index 149d2ed17641a085d510f3a8eab5a96304787f0c..1e7aa25c675e76ce6aa571e04d7117b8c2ab25f8 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> @@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
>>>  			#sound-dai-cells = <1>;
>>>  		};
>>>  
>>> +		swr3: soundwire@6ab0000 {
>>> +			compatible = "qcom,soundwire-v2.0.0";
>>
>> They're v2.1.0, same on 8650, there's a number of new registers
> 
> Sorry, but no. This the "generic" compatible and it is correct. Devices
> expose versions, which is perfectly usable, thus changing compatible to
> different one is not useful. We could go with soc specific compatibles
> and new generic one, but what would that solve? This one is generic
> enough - the device is compatible with v2.0.

Well, I'd expect a "2.1.0", "2.0.0" fallback there..

[...]

>>> +		swr2: soundwire@7630000 {
>>> +			compatible = "qcom,soundwire-v2.0.0";
>>> +			reg = <0 0x07630000 0 0x10000>;
>>> +			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-names = "core", "wakeup";
>>> +			clocks = <&lpass_txmacro>;
>>> +			clock-names = "iface";
>>> +			label = "TX";
>>> +
>>> +			pinctrl-0 = <&tx_swr_active>;
>>> +			pinctrl-names = "default";
>>> +
>>> +			qcom,din-ports = <4>;
>>> +			qcom,dout-ports = <0>;
>>
>> There's 1 OUT port on this instance
>>
>> otherwise (modulo the settings I don't have a reference for)
> 
> Omitted on purpose, no port configuration available.

alright

Konrad

