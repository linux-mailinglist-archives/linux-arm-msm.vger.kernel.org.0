Return-Path: <linux-arm-msm+bounces-117825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id myodDUsTT2qUaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:19:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4F72C3E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:19:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fUmLOdcI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gKkKNjBO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117825-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117825-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB13F302F0C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 03:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6992938B7B4;
	Thu,  9 Jul 2026 03:19:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6A3403FA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 03:19:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783567153; cv=none; b=sDVA86ynt6HvZij5O4F5QReaOE2n/UJIEpEwkEYtV4ThPsa7YiWYppq1NzgGjhvu1QPxKxPrwzyw6YVK5H+7ab5x01FUyuRqSEBOTTDt5ajy8r/OktCKGY2w5DyZHCjRtWSy//twuIICQCOvqxzbs1fjgqiDsLMxTXaGqFoaAN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783567153; c=relaxed/simple;
	bh=/b3ftKccdWGjLomvIuP8o+/t+cUoFe0gmgQ5X6EKPMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S17POqs4mdpJujUUiFYy7aglOZ3rQe+sWiOl9Z3oYp1FLizEHNmQJNApi6l1TT4t/YW656aOGbdI8SegaTkOx3afgU+gN/HlS8nvn9Dq5vlMie7Bq+ohblIVb9nGloy6quCGTahVwbhpNlBGDOCM4FbYBN/Xbs59P/KL9vODB68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUmLOdcI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKkKNjBO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8ikS4088576
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 03:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/Q06J8Rc4ahTkKljNWzcF6BEHKnh4z2W5qhHZ7eU9Q=; b=fUmLOdcIENlr01y8
	HwmujH9OD6FplkZ7Ri/FgXbhFCwUWCIU9n/v7FeY46JPpeGpeGtuudc6pZAREC2o
	n//bCgp3c5xWPDoZO4X4OmQAdo95/WLQIh6I0WEv3pk7C6KUtw7vYexSXJvc8+mW
	1pKzY92lXc26xLIvRLj+vdQGC0zBCSQTd55bsPetWZ24ob7Q2TABn1V3RNP0WwyX
	Sw2Nz6Glq+K/VFLOg5rWx3VKmtZtPNYha3CSJ7m90AvKTgm0zWIshXWC36NA5BQ/
	3xtRB7rkXVhgcg3+zZumKbewCZiyO2F7z/ikVnjQA5Ij9qA3aNJ2DCKjH41C3JNX
	KSNwBA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u1jfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 03:19:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88d7a75507so760050a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 20:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783567149; x=1784171949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/Q06J8Rc4ahTkKljNWzcF6BEHKnh4z2W5qhHZ7eU9Q=;
        b=gKkKNjBO5w04aFdD1nB8aRYAAvCLlRm6meQZU/5pmNdgO7EdRgG2zg6r9jGN0MmnlW
         NXwLlNRyKYjcSMiPTzJ7Vn5WHCcwU9pUZHQ65FmKvluklWm8ZwsVWJdd8S+Xh6oOftqe
         uOdgRbbMCR7JmtWSoGaok6CdWTjL3/r8FI0MjpwWKBTFDtshfH9fXyD0wzsQUNMRbASx
         5Y7ZwmZDotDVmVX8ugPbM+d9tuBzLZYFF2xmXZo8xOxtnQojHJHHFr1CvLm7mIIKCfys
         bO0AL+B/tWObo/JEsiiFczOPtEBAxNjUPe+t4/tCQAIkyD3H1WCZ3eBC5qbF9EdLmJrl
         RGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783567149; x=1784171949;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/Q06J8Rc4ahTkKljNWzcF6BEHKnh4z2W5qhHZ7eU9Q=;
        b=rMXhJ9Ww/dkWuMqOBljun9s9900Hkg3aZ6gW6qy94gjzfeZSIATYiRigMj4wZfi8nM
         tNM7L41LvgN6LUbxr8jEPMxpSw36gyYMMlIZh66Y2P9pdn6IPmcfPQXEzcfsB+7kDFZZ
         6Brlb87OTm+mbYMLRD6KPgd/Z1sywvKIpaG3Qpeojl9NHnpdipbmyAFJQKB5U0Deskg2
         IWr+Pdn2oG8FJfklYKUXKuY/Lo/9/t51gSFA+w20IyawZHmWkRqeHPKLUDpRodGUwkN3
         fVE4Qly+UtVwfefLGiMXXuPZHM2SKTvj7T4VoQSlRhVKZV5SVziyd06erFeke8NN53oO
         pmRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpP2omZpIhTVw/BqvBw4/vvprS8rBY8myUNh63WRYGcI4Bzpdwnarzr58fdegtucsIuADiehTKk1eQ058MQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0VCU/hSLT+gye6osauwwVb03zBpDuH4aOHY2bXs0WQ+yPXsSd
	a81q+s8K5dU4JpgjtmO7dPco2tMQHxLbnJz4Dt+CrTX5dwOnm2S9daKl7C6LU72e9tCpnkd2g4/
	qV+z+oTO4T8zdidmzKEd9wzLrxNq80Y4533dxM1OfQvoY0IxZnFni+tZboVJzFe0LaqME
X-Gm-Gg: AfdE7cmJ+5dQmX9aILwNMoz2ZGQDSxyt3w3Pk1mMP9rYSLiARxsmiinNvplNa4Kkb/7
	JQXsUBdcGgi/7U6gbGaP+mA86NIId2Q2wuInRtdVPMzu+CjVB88a7BI2F9/10olGoyxbgj1EfXN
	g5FVPqfQwXOVubWEeCzLEQLqwhShrd2IhpctfBgKgcxax/iwoqpdJLODRiv4aILcTbM7qDK/eAG
	qi2hJM7sl37VvF7wuNayMUvRTt0rx+Ex5MXqgTS+ewryMEc+/Ia1NrgdSN0T5uzXzY4IbRAipZp
	nRAHBQ5ZfA7IE1DvHGwJQWl1LiwWUjdNxsRk7CcidEBw935Wp7oUgjVRFoN+pHy0X6cWgTaJu9o
	v95w0rPM1ePvw9zMEnClDwj0zJkNnZSHtVPCHeZEbZA==
X-Received: by 2002:a05:6a20:6a06:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c0bcbe9525mr6421040637.11.1783567149306;
        Wed, 08 Jul 2026 20:19:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a06:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c0bcbe9525mr6421016637.11.1783567148864;
        Wed, 08 Jul 2026 20:19:08 -0700 (PDT)
Received: from [192.168.50.84] ([76.176.60.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm26144876c88.5.2026.07.08.20.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 20:19:08 -0700 (PDT)
Message-ID: <e4a4088a-89a8-4234-8469-a5f4ee0b9d6e@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:19:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
 <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
 <bdb6ea4a-9536-4b4e-9849-2ebf2d26fd60@quicinc.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <bdb6ea4a-9536-4b4e-9849-2ebf2d26fd60@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAyOSBTYWx0ZWRfX5aagsFovYX2S
 zVnNvLmNFdgP+8jpLukHiu+dwpD1nEDTrtm0byHrsOVL3mbxZNYIa1z0YPb9H/ym5jmKzHaVYs0
 nKw90qE2jdWxD9TN2ld2o0KDRLW7HNs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAyOSBTYWx0ZWRfX9s2QWbbDuRtp
 eIdN39MarFqXT0ZuHbTK0e9tizOJOlYQ6h99MATZ6RuLu18nJoqPHKJpW5JL6e4GmHeJ6cCm0vU
 1yrT4IIImTBCDuy/wiF0DBk0fFhOwWIs6N3gwy44tcCU/nlOw9Xp8c17ZkEBvaSjFgZyjavhhFM
 DJrD70xHYCbdo2bkNT8uYhMpVOWKT3cdfGnWAipItbfbVjQDVCUpyBykVHVAvzLB+Tp1vfXv9C9
 ACMKTQa1QU19mhNQIXpuUlyxDPWh18GqCxgeaAOQBTJMGK4bagQSDAZg8IHcS4IzeKErfWb9CGD
 /NDZbhbpbkhWvOJ2GzwgL3BeiuYmwmA9U4/BJNUj5tOODq2qdqCn7kOjFuTG1XnCHoXd1ehSBuC
 KLrI+4heeX3o+KopnIuBL/jYrmv5IABeypmhqs51omx3cXXIGbeAsSDosqH/FMFIMePxu0iuFj+
 FUOfEVlrKEGO/9JNXeQ==
X-Proofpoint-GUID: Xm6S-sdg2vuFemcDKQLeMD5Ax9D4gpXB
X-Proofpoint-ORIG-GUID: Xm6S-sdg2vuFemcDKQLeMD5Ax9D4gpXB
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f132d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=0ISbvMpsx/t7i6H15JfNAA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ZcQJt_r4axFxopQkEsUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090029
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117825-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pavan.kondeti@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7ED4F72C3E1



On 7/6/2026 8:38 PM, Pavan Kondeti wrote:
> On Mon, Jul 06, 2026 at 07:15:15PM -0700, Deepti Jaggi wrote:
>>
>>
>> On 7/6/2026 6:57 AM, Pavan Kondeti wrote:
>>> On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
>>>> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
>>>> new file mode 100644
>>>> index 000000000000..0c7ffe9e415c
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
>>>> @@ -0,0 +1,1918 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +
>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +
>>>> +&firmware {
>>>> +	scmi0: scmi-0 {
>>>> +		compatible = "qcom,scmi-smc";
>>>> +		arm,smc-id = <0xc6008012>;
>>>> +		shmem = <&shmem0>;
>>>> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
>>>> +		interrupt-names = "a2p";
>>>
>>> I believe this interrupt source is GearVM firmware via Gunyah's
>>> doorbell, correct? How do we know that scmi0 instance's interrupt 
>>> is GIC_SPI#963? Are these assumed to be constant/fixed through out
>>> the life time of this SoC?
>>
>> Yes, this interrupt is a Gunyah Rx doorbell VIRQ for SCMI a2p completion
>> from GearVM to Linux. It is allocated by Gunyah RM from the platform's virtual
>> IRQ range and patched into the DTB by Linux bootloader at boot stage.
>>  
>>>
> 
> Thanks Deepti. IIUC, GIC_SPI#963 may be overridden by bootloader and
> potentially this IRQ can change across runs or when firmware is changed
> etc. The interrupt property is a place holder. can you confirm please?
>

IRQ will not change across runs , it may change with firmware updates.
 > Thanks,
> Pavan


