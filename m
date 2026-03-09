Return-Path: <linux-arm-msm+bounces-96241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Cl+CKCwrmkSHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:36:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E4237FEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7B983014100
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DA93A4F36;
	Mon,  9 Mar 2026 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jl8hfwlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="geXjl7xS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D26621FF23
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056122; cv=none; b=iDCTpHdTIvOK3tbJOPoX2xKsht5oX3rWhu+h1Fhadp0fGH2Q/Nr6OzzSpQBVf4XeN9UQCbiLFBLk7UPiBB58eNMLu5L95iXGthMax180jdjfc/QJPZJy9uH7XpEgZ72UOvyd7QykrsbHjrVBbb1Ik8ZeRrY8yaF/QJDKsKpbN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056122; c=relaxed/simple;
	bh=IjKB0RY1F7a9g2zBFRyurkKPqU1OSnC1fFvV7yeNsx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdJTyK7SF/anazef0MOwl9p8vo6Yl1T8fk57BKXKTfhehgIWoN9BDxtY94irRZlBj7Y8c77WUSj3YfqO2Z2vKXSgLT2Km5DmXMxGepcP7hiIEHIDAg51urDv/wkuS/WdibPsH+jCryQgWC5rltv/N5G5bFBvd7vJP2IVQaOK+iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jl8hfwlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=geXjl7xS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6296Q7fd3234878
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3+rstJ/ZdS7C8kBoFMmuPACxGCxopy6Lc4ZaIJW+ZY=; b=jl8hfwlCwYb8dApe
	yTiKjIcLS/poBp86vwfjLXe04EVGEb5ymRgl1pD0B5r7fOHGGtpnfApXh4cWBqGk
	nq2phhZkWCv9utPft0N6Nl9eo+kHwgMTaN1ANPuxlig4QUUmDq0S/xJtqzYO5C+9
	3Y10UkZmxstGGiJZx622xkoJ4LxTKDHNc3ssk0Tf3AdVOr8fhitSKVgtJWjdCdnK
	KMmi3w6rXLi8itMip9irWe/yeqIhLKyfxRnzA2AZhsci27Mlyu7F/o9+6zWj0OQo
	IoeRWjr2QfF7e0jkpAogumXvD/9k1wtuuwGitBlLMyQspsVz7UPWjP20RMi3uGLw
	a8nTFg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6fd3ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:35:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae3e462daeso42755365ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773056120; x=1773660920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G3+rstJ/ZdS7C8kBoFMmuPACxGCxopy6Lc4ZaIJW+ZY=;
        b=geXjl7xSvfxo4L4uw9hfxsxTqBU2W4OjtwmjMA/ZXvWTvA0pqtbRm1U49MqTI1Fxsx
         KZEoGv4YO5QEkrdpUHRcO+KYJWghl2pJvocjwuxVkHtDclQBRW/UafUjFtXt06k6p/io
         8CnsOq0aGCZRgSdv6ApJBfq07EMvOhfP7lWFnmGvVnB93x506mKa3JSzQ7sxDXZqu5c5
         z9QmaWumOCgnBLr9CmrZ+gcZ5i3k55MBTJg2Y7LfBdFJJi1lKMAByumyCuWmuY18jvrp
         j2GWp8zYaDHJRpDgShEIH0sUQx/tkoJYTFuugpf8DuKX4IT1s3YrXzxnMPGAL9UM4ZxQ
         7QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056120; x=1773660920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3+rstJ/ZdS7C8kBoFMmuPACxGCxopy6Lc4ZaIJW+ZY=;
        b=jMLLlErmpN3umeEBCv3gKIbG0JvRQ9/CcxdeoP7tUrXEXlE7FFdPTAR6gt1CfPccUJ
         ezfIs+boYYm6qZ6Ej3ykQuMGJun6H8eoOkQBPCL2t+4zfcipCPCF9M5fNk11ygbmrdaj
         t/lKQXCLJCrdNDEEE5AgqKFL9FC8lki0Lfm131T1/eWYnVjuz11/RR7y2Re5FCFU9luQ
         B2u+Zm6oQPfSEMV64W2l/532vBSbufPKOeOreS/JmwKE8kzY+lCXmRAhmbyMqShPWvNO
         QNVgnOzR+ttRBT2J3B6HnEwBh8+wIG07IVV8mOdw8VIDITCSo4lELZ8pOLcdDs4NApUj
         obyw==
X-Forwarded-Encrypted: i=1; AJvYcCX3JEJ0IhAj2aykuJd0NZlkrIG0M0t5c1v/guwqB/2IlhkRQvEHEgUAQpsNSQAXqFJkKdHH3VWo1zXSVkZf@vger.kernel.org
X-Gm-Message-State: AOJu0YxenqLbdT3tt4+u8s+gF3GL7ZVmYDsm+zkFULECb37HaZRWzP7M
	L8hYu+Gk4Rs23T1AIj1GfVTheuUPEAJNtdvlTkHV1TiXooTfpGWwu9Uj1RPjXaO7VNKu4wA+afY
	SHAmZzB3NL89sXRhZNIpdJCSGcpgWTcYAx9HuUmE+CVIfExKADBVkUP4DCU+0r0030q8A
X-Gm-Gg: ATEYQzxuMKinP7EYnFri1MeHw8MD7Iz+8dXxcQYKqWykrfvLWhdyE2AHJKoeJnA2o3c
	H551cQglH1nYWwEgEOCmOdPHJGsJFeAXwnrma8FMvZIif3IbFmX/WNBopbBgiK0vqAuCVB53SYL
	bjoNTb0sy7dn430ByN/CVTyOBYI2IeeOn9mLR+miZYkoWhV6Gyi2M0FepVbLyFQuVWQJ+UQW6jX
	ARuUxCjInlBg+ieBQXeaY7ZXeK/4zIhsDpMqA3K7UqxDojn4p/lU643qx603a6A9ErIH85MdfVo
	y2NwA63mhrg2D0GyV9u8rF3LbicmWHn3Hud/zfEErGXDppGkzktwm0szKLqWiO9nbGZ7AWIi0+V
	Rr/Tsk2ztUs9K1E2TXJm5hnvHLLPOhh2pkunUbVRZnuPTJpdqppPxxmq+75i8nCH7ZR3ZbIdqzq
	R1nSQqYhAXtDvMDy8hTKhyOmdzIyKylh0IDHFbmWg=
X-Received: by 2002:a17:903:182:b0:2ae:4fb6:bb21 with SMTP id d9443c01a7336-2ae8242e961mr120563645ad.15.1773056119685;
        Mon, 09 Mar 2026 04:35:19 -0700 (PDT)
X-Received: by 2002:a17:903:182:b0:2ae:4fb6:bb21 with SMTP id d9443c01a7336-2ae8242e961mr120563325ad.15.1773056119026;
        Mon, 09 Mar 2026 04:35:19 -0700 (PDT)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840aefbdsm149900975ad.82.2026.03.09.04.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:35:18 -0700 (PDT)
Message-ID: <c6820604-d1a9-42dc-bcd7-821aeb1b09c7@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 17:05:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
 <20260309-amorphous-archetypal-impala-8a0e1d@quoll>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260309-amorphous-archetypal-impala-8a0e1d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CEhvWHTbPZVmUwSw_ZRBNo9nc5FpXpSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNiBTYWx0ZWRfXz3XoaPn/6stq
 Rfw50uHL583a+6PchKPCREL4ZpCVxidBX7H6KnSkkL9+Lmm0vwVlJYmx2cwIY6WCv55mdtKKXYd
 1clF2sEwMN/89LLInj/l8FGFFIlvlur64GIRoNJ9srKZJvSVSYP78GvtaBR3w5B+ibIVhGmvhj9
 jczzIGMOaMpEPBnFzquUurfR9DRta6PLOxJAKnKdKIzhNekl1tX0apCWc9UTsdcpiweHOQaQ3TD
 6y1YQ0Yli81phO7VfpbdkM2gKCnZXAhkot7FDRQV4T5CfAy2gtcqZcl2ky1bl/TlBsOKC1SqrTg
 V/Rxbui/uorZt7WBrr/sSzth8L8nIjtkfnqdmGlSXI/2xs/rUetgOKONYBLCd8v2FeP9f3kpBl9
 yQBLUn2xleatoT0q09uygT3kqlscIgj+mVApzPZmIqNbKHRUCYzqIcn6Lz6QU96ylrSS2Dbbzl1
 owo3Xz5Ys4v8lYOoLpA==
X-Proofpoint-GUID: CEhvWHTbPZVmUwSw_ZRBNo9nc5FpXpSl
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69aeb078 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1qf01Qjrl_d0v0_Yp50A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090106
X-Rspamd-Queue-Id: 777E4237FEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96241-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/9/2026 12:53 PM, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 05:06:42AM +0530, Sibi Sankar wrote:
>> From: Maya Matuszczyk <maccraft123mc@gmail.com>
>>
>> Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
>> reference devices, which run on IT8987 and Nuvoton MCUs respectively.
>>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   .../embedded-controller/qcom,hamoa-ec.yaml    | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> new file mode 100644
>> index 000000000000..ea093b71d269
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-ec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Hamoa Embedded Controller.
> Please implement the feedback from v2.

Ack, sorry missed it.

>
>> +
>> +maintainers:
>> +  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
>> +  EC running on IT8987 and Nuvoton MCU chips respectively. The EC handles things
>> +  like fan control, temperature sensors, access to EC internal state changes.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,glymur-nuvoton-ec
> nuvoton is name of the company, so it's too generic to describe a
> component. It's like calling it "qcom,glymur-qcom-ec". How many EC do
> you have there?

Ack, will get this updated.

>> +          - qcom,hamoa-it8987-ec
> I don't understand this compatible. You already have hamoa.
>
>> +      - const: qcom,hamoa-ec
> So which EC is this?

Will update the compatibles when consensus is achieved
on patch 4 thread.

>
> Best regards,
> Krzysztof
>

