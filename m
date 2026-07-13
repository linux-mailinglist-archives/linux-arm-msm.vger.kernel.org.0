Return-Path: <linux-arm-msm+bounces-118740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4IDOC/LEVGrkSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:58:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C15D274A120
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:58:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="l/SfQ9Zw";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IEkgfM7w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118740-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118740-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F30233054335
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274703E9C2D;
	Mon, 13 Jul 2026 10:57:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AB43E6DD2
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:56:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940220; cv=none; b=TQspeL9NmLIhcb8z5tdnBIrHch6vSeww96kNxxAsqJYJ1OlQGCWBwAXAwyFEym4LNIPROri4w6HWjxQFdq6ClYBFGI+OJNYvCEPQ8sFDa3OpdNq+rJFsORtOUWmhNRp4uoFMZMwjZ2PMweLq4yAnoCXA394ubt+lMVUV8XPVIEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940220; c=relaxed/simple;
	bh=2MnR6I2BNqAMzfZRvFYRC3qwQP/EwvJfFx5TSQWZhdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVgR6A5/9iWknyqyPhm9CwEcLtIZMuGsBvWmZOUv+e9du7yp+Xngv+6qHB1nAA0/sNZSrza0Q4ArJH2CrEJ35GJVTOZl2HX+5MxHZNNhRgY//DSHAJsjtt1umXsBn2XRdOmd+e4iUaHp9+GMlhtGtfKBZggKtmQO160+KyHINs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/SfQ9Zw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEkgfM7w; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dTNo952873
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XWIXGPO/zIvgoe73Zp0dqFW7Zs8Gu8Gr0uQZbbJn3bg=; b=l/SfQ9ZwZka8OfZz
	Y069JmsT+LReaToRF/qODJaKS4vlORk8uYQ8doBOB3YUKhHw/H02UzwQBvYW8SdF
	Q5tmj0Xuyt0FHRE4eZVBa4WfWrPIU1kXZhsD7pHf/vc/SRuBmH1rMmgQ+jApYocZ
	+b3ET493Y2uU/Ij60Sm+qE4JDi28SzEWlTtwZnCiwpQnM8QBB09FzrOUPAOtw/O1
	3jd++pZ6sgHUQITHefGBcWUjBe64OtrE699QuC3wn7jVyU7U+/3cwUcDfcx8fAZq
	Dk7XTCMvORNghlPUtzpfvhqBewh7ZiX1COe250xfpNCF4litHAmqiziqQVxgp5Qn
	MMndDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g8nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:56:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso28135771cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940217; x=1784545017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWIXGPO/zIvgoe73Zp0dqFW7Zs8Gu8Gr0uQZbbJn3bg=;
        b=IEkgfM7wdVXU5SlKjX3T+cQfUTbq9hEYUEPZJjyX88fJzPcAlripdXk/IdojYhGTHB
         kBareQ2/UzzogTGoUH1cIIeVeXCMHrKYa7Sg+R0ojMNKZs9qhtuI/UBLiTtjRHB4YTiy
         /PmbzJ68oD8r2osTNxP1DmOd5iWcJ4F+RCQOlV8YZlN9Ogk7RS65hhBXOtZpbDjIdJ8l
         C/1J1Z9J3bt8g1F5wzJ9wqhoD57jNIsoSlhFRI9+D/SucvJQ4BqOxFrMI2qAugIYBa1R
         l5CTOt0aStyVSWqZvPH7txN3EiMz9iIjrLvQsk5sRB146ty4QP+DbGUijR4DoccgXADj
         V2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940217; x=1784545017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWIXGPO/zIvgoe73Zp0dqFW7Zs8Gu8Gr0uQZbbJn3bg=;
        b=su44Fpf4qJgxQUkqReNCGrhj/hdiFG4emNkmyxKKMhGiNq8+HfFhgZcjSlC57CrbOJ
         D5DPb7vKrbQL9zs+z0GXeFC+DpUY4rWc0ealV3XWUSooLRnpTEsUdaw5RQfc2wZ9T0c8
         g+e9fJBc140Tv2x6lLIron93qVHbfgREi/CgyOF6ONFY6voLulJMo9tJwLTSArQtpRcU
         PQhvoz+oN/D6l+Wnzjp6KR2JNOVWDHRJdCtlWMzw9o783rSKrcTmqc4APSWAI49JBEnG
         s5M2gaThTvkAxkCoNk+qeXn/q+73k5WzpmoncfZiA1x7oPRrilAu/m8eO1JPbznbSSkL
         C+wQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFC1hjPd4ejs+KT8vEX+7wFILKm8hmdWYlt7x24EX+L2OaGhb5P5oEQhefBMt9VJneUu69mMpY4mjD14Ib@vger.kernel.org
X-Gm-Message-State: AOJu0YwGCnbNn/XFI7vIvSzYxvIBk6TT0UM9xUqRXxowYH+KDPKNxi99
	5ktufaS5yH3UUYxf8wO3+EWWSkAP7aL9HVApTKM3+m5WoC4LAvvTF4ko/VCpgSP59aX4UXwuEBY
	1wmqFaCSnKIsRbJGk5Yscbc0hypeyCcUuuy5R6U9uAJ7LbbZKh2hR9l1v9OHaXh5Shc4B
X-Gm-Gg: AfdE7clVBzw1eGql/zjOk4ksp3yjOAGipOIMfv/et3x3thdYGF6CucZhtIQ2noUnkIz
	yELtTUB/3nMLwmmJXTkTzk87+H6g4FAeVZJgnKWFvnFg/00mVwtpAI4E5QPN3xqnecpzWDPQJoM
	2LE7Pbq7iAVNjpItYXcpSCaw13x8cE2/ko0F7Y9EC39rMgR0BmzCkH1CYKcumiFhKSMuxwkqSoA
	QlsIrQsD4JV9CoXzQtZ/07SZT+L9IB8Vn7pkCHgA5OW2OuOBeuDd0l9XwR7fG17IXXVVbghjwaf
	/KQe74cskZxlhAjygnD8RHtRKsa4icw6mh0tKh9FTtO41xilts5ZovSQklUTmjgG18Ro8l3Lsw1
	UygxXMx6UDhMG6ejiBQkAJpqh3ki1ElnDA4XggMD9XwE=
X-Received: by 2002:a05:622a:4d8e:b0:517:c582:9161 with SMTP id d75a77b69052e-51caa02e846mr120942251cf.7.1783940216486;
        Mon, 13 Jul 2026 03:56:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8e:b0:517:c582:9161 with SMTP id d75a77b69052e-51caa02e846mr120942041cf.7.1783940216036;
        Mon, 13 Jul 2026 03:56:56 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4a60sm14666982a12.8.2026.07.13.03.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:56:55 -0700 (PDT)
Message-ID: <b385b69a-4c4d-49cb-add5-285bb9a182a9@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:56:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <gri2pdgawm2ymbmebzzxfel5kx5nmyqzrdg6oikfhv5bgt7xem@uld56b6csqhi>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <gri2pdgawm2ymbmebzzxfel5kx5nmyqzrdg6oikfhv5bgt7xem@uld56b6csqhi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gqvEdS4TBiF1bouOGnazjwKwoP0CHfR_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfX0WKfJEody1uc
 YIeRvgi06CHJ67D/7a7bI4PDbmtR4fjs5LAxUN594WCzoCvm1fOjWy51xfb8O+A9nixvKP7vODs
 8fniPY8LV1fGwqv87zHJDkY1mZ0lqaw=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54c479 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=SSmOFEACAAAA:8 a=csZBsyBRHWlIDgxsDZoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfX95u1A2258blh
 kUSg/Me4fjshSVYA+UBBuvWyahshkxZUswnOMEjUxMVUdVBLkOw/EPBZFLeHdx64lGcoMa505rl
 zy9unxYK9nMyhnz7jSTcC+EMMJIsiCcKR8tIIPcyuAEzlzcDqN08EL2/7/9nP4TqIE0AWgKFtr1
 Vfi4zsJM7o5HH1pyTC9UGCbhcy2I0QH+dw9dJOcpoUIB2ky3FMjL5kode3t8HQ/KWscGKoSFH6O
 O/cZub8HYGxbrgRiOEQxXDY25UzprRIKK7bwCwuTOKcS6bld2OPJrGSDxxLvuLpKJzYwlIx2D8x
 JW/Bmi/DmHCrciYQEgmjk/B5VAU0RZnC713/JJRskgH+KB26IZZZYy/POQSawS3uAVVEEfBtvD6
 e65tDUCPYZM1yWLURvKQVjM0CwMDFHFeFCxigAtf6rjyrdgHI/j57JqFqDQI09J2M/FOUB0khPY
 5rMH1AEb5eAbou6AfpQ==
X-Proofpoint-GUID: gqvEdS4TBiF1bouOGnazjwKwoP0CHfR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118740-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C15D274A120

On 7/6/2026 4:11 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:11:13AM +0300, Atanas Filipov wrote:
>> Add a Qualcomm JPEG encoder driver implemented on top of the
>> V4L2 mem2mem framework.
>>
>> The driver wires vb2 queue handling, format negotiation, JPEG header
>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
>> integration for the standalone JPEG encode hardware block.
>>
>> This series targets SM8250 (Kona) platforms.
>>
>> The jpeg-encoder node is described as a child node of the CAMSS block
>> and is probed automatically via of_platform_populate() in camss_probe().
>>
>> Usage examples:
>>
>> - Check of related video node: v4l2-ctl --list-devices
>>    The expected result:
>>     qcom-jpeg-enc (platform:qcom-jpeg-enc):
>>          /dev/videoX
>>
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> index e4c16388ef07..53e83ebe4699 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> @@ -72,80 +72,75 @@ examples:
>>       #include <dt-bindings/interconnect/qcom,sm8250.h>
>>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   
>> -    jpeg-encoder@ac53000 {
>> -        compatible = "qcom,sm8250-jenc";
>> -        reg = <0xac53000 0x1000>;
> 
> What is going on here? And why?

The binding example was updated in the driver patch by mistake. v5
will have binding and driver in separate patches.

> 
>> -
>> -        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>> -
>> -        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> -                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> -                 <&camcc CAM_CC_CORE_AHB_CLK>,
>> -                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> -                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> -                 <&camcc CAM_CC_JPEG_CLK>;
>> -        clock-names = "hf_axi",
>> -                      "sf_axi",
>> -                      "core_ahb",
>> -                      "cpas_ahb",
>> -                      "cnoc_axi",
>> -                      "jpeg";
>> -
>> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>> new file mode 100644
>> index 000000000000..2ab29bfb9b88
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef QCOM_JENC_DEFS_H
>> +#define QCOM_JENC_DEFS_H
>> +
>> +#include <linux/types.h>
>> +#include <uapi/linux/v4l2-controls.h>
> 
> There includes are not necessary for this header.
> 
>> +
>> +/* Offline JPEG encoder constraints */
>> +#define QCOM_JPEG_HW_MAX_WIDTH	8192
>> +#define QCOM_JPEG_HW_MAX_HEIGHT	8192
>> +#define QCOM_JPEG_HW_MIN_WIDTH	256
>> +#define QCOM_JPEG_HW_MIN_HEIGHT	256
>> +
>> +#define QCOM_JPEG_HW_DEF_HSTEP	16
>> +#define QCOM_JPEG_HW_DEF_VSTEP	16
>> +
>> +#define QCOM_JPEG_HW_DEF_WIDTH	1920
>> +#define QCOM_JPEG_HW_DEF_HEIGHT	1088
>> +
>> +#define QCOM_JPEG_MAX_PLANES	3
>> +
>> +#define QCOM_JPEG_QUALITY_MIN	1
>> +#define QCOM_JPEG_QUALITY_DEF	98
>> +#define QCOM_JPEG_QUALITY_MAX	100
>> +#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
>> +#define QCOM_JPEG_QUALITY_UNT	1
>> +
>> +#define QCOM_JPEG_FPS_MIN	1
>> +#define QCOM_JPEG_FPS_MAX	240
>> +#define QCOM_JPEG_FPS_DEF	30
>> +#define QCOM_JPEG_FPS_UNT	1
> 
> This is a collection of random defines, which are mostly used once.
> Please move them to the corresponding source file.
>

Acknowledged. v5 will remove the unnecessary includes and move the
defines to their respective source files.

>> +
>> +#endif /* QCOM_JENC_DEFS_H */
>> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>> new file mode 100644
>> index 000000000000..ddfa84838b6b
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>> @@ -0,0 +1,314 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_opp.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/slab.h>
>> +
>> +#include <media/v4l2-mem2mem.h>
>> +
>> +#include "qcom_jenc_dev.h"
>> +#include "qcom_jenc_ops.h"
>> +#include "qcom_jenc_res.h"
>> +#include "qcom_jenc_v4l2.h"
>> +
>> +enum jpeg_opp_clks_id {
>> +	JPEG_OPP_CNOC_IDX = 0,
>> +	JPEG_OPP_CORE_IDX
>> +};
>> +
>> +static const char * const opp_clk_names[] = {
>> +	[JPEG_OPP_CNOC_IDX] = "cnoc_axi",
> 
> This way your driver will force its own frequency on the CNOC_AXI clock.
> There are other clients of the clock, so there should be some kind of
> voting on it. Either use icc-clk or add CAMSS API to sum the votes on
> the CNOC_AXI.
> 

Addressed in the reply to your DTS comment.

>> +	[JPEG_OPP_CORE_IDX] = "jpeg",
>> +	NULL,
>> +};
>> +
>> +static struct dev_pm_opp_config opp_config = {
>> +	.clk_names = opp_clk_names,
>> +	.config_clks = dev_pm_opp_config_clks_simple,
>> +};
>> +
>> +static int qcom_jpeg_opp_init(struct qcom_jenc_dev *jenc)
>> +{
>> +	struct dev_pm_opp *opp;
>> +	int rc;
>> +
>> +	rc = devm_pm_opp_set_config(jenc->dev, &opp_config);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = devm_pm_opp_of_add_table(jenc->dev);
>> +	if (rc && rc != -ENODEV)
>> +		return rc;
>> +
>> +	/* initialize the maximum available frequency for the JPEG core */
>> +	jenc->max_freq = ULONG_MAX;
>> +	opp = dev_pm_opp_find_freq_floor_indexed(jenc->dev, &jenc->max_freq, JPEG_OPP_CORE_IDX);
>> +	if (IS_ERR(opp))
>> +		return PTR_ERR(opp);
>> +
>> +	dev_pm_opp_put(opp);
>> +
>> +	/* initialize the default optimized frequency for the JPEG core */
>> +	jenc->opt_freq = jenc->max_freq;
>> +
>> +	dev_dbg(jenc->dev, "JPEG max clocks is: %lu\n", jenc->max_freq);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
>> +{
>> +	jenc->num_clks = devm_clk_bulk_get_all(jenc->dev, &jenc->clks);
>> +	if (jenc->num_clks < 0)
>> +		return jenc->num_clks;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
>> +{
>> +	struct dev_pm_opp *opp;
>> +	int rc;
>> +
>> +	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* setup the OPP according to the calculated optimal frequency */
>> +	opp = dev_pm_opp_find_freq_ceil_indexed(jenc->dev, &jenc->opt_freq, JPEG_OPP_CORE_IDX);
>> +	if (IS_ERR(opp)) {
>> +		rc = PTR_ERR(opp);
>> +		goto err_clk_disable;
>> +	}
>> +
>> +	rc = dev_pm_opp_set_opp(jenc->dev, opp);
>> +	if (rc)
>> +		goto err_dev_pm_opp;
>> +
>> +	dev_dbg(jenc->dev, "selected OPP clocks cnoc=%lu, core=%lu\n",
>> +		dev_pm_opp_get_freq_indexed(opp, JPEG_OPP_CNOC_IDX),
>> +		dev_pm_opp_get_freq_indexed(opp, JPEG_OPP_CORE_IDX));
> 
> Drop extra debugging, you can enable debugging for OPP via
> CONFIG_DEBUG_DRIVER.
> 

Acknowledged. v5 will drop the dev_dbg.

>> +
>> +	dev_pm_opp_put(opp);
>> +
>> +	return 0;
>> +
>> +err_dev_pm_opp:
>> +	dev_pm_opp_put(opp);
> 
> Once you drop excessive debugging code, the dev_pm_opp_put() will find
> its natural place right after dev_pm_opp_set_opp(), before checking the
> rc.
> 

Acknowledged. Will be fixed in v5.

>> +err_clk_disable:
>> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
>> +
>> +	return rc;
>> +}
>> +
>> +static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
>> +{
>> +	dev_pm_opp_set_opp(jenc->dev, NULL);
>> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
>> +	jenc->opt_freq = jenc->max_freq;
>> +}
>> +
>> +/* qcom_jpeg_camss_get - resume the parent CAMSS device */
>> +static int qcom_jpeg_camss_get(struct qcom_jenc_dev *jenc)
>> +{
>> +	return pm_runtime_resume_and_get(jenc->camss_dev);
> 
> Use devlinks instead.
> 

Acknowledged. v5 will model JPEG as a standalone peer node —
the camss_dev parent reference will be dropped entirely.

>> +}
>> +
>> +/* qcom_jpeg_camss_put - release the parent CAMSS device */
>> +static void qcom_jpeg_camss_put(struct qcom_jenc_dev *jenc)
>> +{
>> +	pm_runtime_put_sync(jenc->camss_dev);
>> +}
>> +
>> +static int qcom_jpeg_pm_suspend(struct device *dev)
>> +{
>> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
>> +
>> +	qcom_jpeg_clk_off(jenc);
>> +	qcom_jpeg_camss_put(jenc);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_jpeg_pm_resume(struct device *dev)
>> +{
>> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
>> +	int rc;
>> +
>> +	rc = qcom_jpeg_camss_get(jenc);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = qcom_jpeg_clk_on(jenc);
>> +	if (rc) {
>> +		qcom_jpeg_camss_put(jenc);
>> +		return rc;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_jpeg_pm_system_suspend(struct device *dev)
>> +{
>> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
>> +	int rc;
>> +
>> +	v4l2_m2m_suspend(jenc->m2m_dev);
>> +
>> +	rc = pm_runtime_force_suspend(dev);
>> +	if (rc)
>> +		v4l2_m2m_resume(jenc->m2m_dev);
>> +
>> +	return rc;
>> +}
>> +
>> +static int qcom_jpeg_pm_system_resume(struct device *dev)
>> +{
>> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
>> +	int rc;
>> +
>> +	rc = pm_runtime_force_resume(dev);
>> +	if (rc)
>> +		return rc;
>> +
>> +	v4l2_m2m_resume(jenc->m2m_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static _DEFINE_DEV_PM_OPS(qcom_jpeg_pm_ops,
>> +			  qcom_jpeg_pm_system_suspend, qcom_jpeg_pm_system_resume,
>> +			  qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL);
>> +
>> +static int qcom_jpeg_probe(struct platform_device *pdev)
>> +{
>> +	const struct qcom_dev_resources *res;
>> +	struct qcom_jenc_dev *jenc;
>> +	int rc;
>> +
>> +	jenc = devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
>> +	if (!jenc)
>> +		return -ENOMEM;
>> +
>> +	jenc->dev = &pdev->dev;
>> +	jenc->camss_dev = pdev->dev.parent;
>> +	platform_set_drvdata(pdev, jenc);
>> +	rc = devm_mutex_init(&pdev->dev, &jenc->dev_mutex);
>> +	if (rc)
>> +		goto err_free_jenc;
>> +	spin_lock_init(&jenc->hw_lock);
>> +	init_completion(&jenc->reset_complete);
>> +	init_completion(&jenc->stop_complete);
>> +
>> +	res = device_get_match_data(jenc->dev);
>> +	if (!res) {
>> +		rc = dev_err_probe(jenc->dev, -ENODEV, "unsupported SoC\n");
>> +		goto err_free_jenc;
> 
> drop the gotos, it's an empty label now.
> 

Acknowledged. Will be fixed in v5.

Best regards,
Atanas

>> +	}
>> +	jenc->res = res;
>> +
>> +	if (!jenc->res->hw_ops) {
>> +		rc = dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(jenc->jpeg_base)) {
>> +		rc = dev_err_probe(jenc->dev, PTR_ERR(jenc->jpeg_base),
>> +				   "failed to map JPEG resource\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = qcom_jpeg_opp_init(jenc);
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to init OPP\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = qcom_jpeg_clk_init(jenc);
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to init clocks\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	jenc->irq = platform_get_irq(pdev, 0);
>> +	if (jenc->irq < 0) {
>> +		rc = dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
>> +				       jenc->res->hw_ops->hw_irq_top,
>> +				       jenc->res->hw_ops->hw_irq_bot,
>> +				       IRQF_ONESHOT | IRQF_NO_AUTOEN, dev_name(jenc->dev), jenc);
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to register V4L2 device\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = devm_add_action_or_reset(jenc->dev,
>> +				      (void (*)(void *))v4l2_device_unregister,
>> +				      &jenc->v4l2_dev);
>> +	if (rc)
>> +		goto err_free_jenc;
>> +
>> +	rc = devm_pm_runtime_enable(jenc->dev);
>> +	if (rc)
>> +		goto err_free_jenc;
>> +
>> +	rc = qcom_jpeg_v4l2_register(jenc);
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to register video device\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	dev_dbg(jenc->dev, "Qualcomm JPEG encoder registered\n");
>> +
>> +	return 0;
>> +
>> +err_free_jenc:
>> +	return rc;
>> +}
>> +
> 
> [...]
> 
>> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>> new file mode 100644
>> index 000000000000..c9959518c64d
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>> @@ -0,0 +1,331 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/string.h>
>> +
>> +#include <media/jpeg.h>
>> +#include <media/v4l2-jpeg.h>
>> +
>> +#include "qcom_jenc_dev.h"
>> +#include "qcom_jenc_hdr.h"
>> +
>> +/*
>> + * The elements defined in this header are specified
>> + * in the ITU-T T.81 / JPEG specification.
>> + *
>> + * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
>> + */
>> +
>> +#define JFIF_HEADER_WIDTH_OFFS		0x07
>> +#define JFIF_HEADER_HEIGHT_OFFS		0x05
> 
> This is offset_of(), no need to define those.
> 
> I think, you already got a review from me. Move all standard-related
> defines and code to the generic v4l2 code, unless you get an explicit
> blessing from one of V4L2 maintainers not to do so.
> 
>> +#define JFIF_APP0_LENGTH_HI		0x00
>> +#define JFIF_APP0_LENGTH_LO		0x10
>> +#define JFIF_IDENT_TERM		0x00
>> +#define JFIF_VERSION_MAJOR		0x01
>> +#define JFIF_VERSION_MINOR		0x01
>> +#define JFIF_DENSITY_HI			0x00
>> +#define JFIF_DENSITY_LO			0x01
>> +#define JFIF_THUMBNAIL_SIZE		0x00
>> +
>> +#define JPEG_SEG_LEN_HI			0x00
>> +#define JPEG_LEN_DQT_LUMA_LO		0x43
>> +#define JPEG_LEN_DQT_CHROMA_LO		0x43
>> +#define JPEG_LEN_SOF0_MONO_LO		0x0b
>> +#define JPEG_LEN_SOF0_COLOR_LO		0x11
>> +#define JPEG_LEN_DHT_MONO_LO		0xd2
>> +#define JPEG_LEN_DHT_COLOR_HI		0x01
>> +#define JPEG_LEN_DHT_COLOR_LO		0xa2
>> +#define JPEG_LEN_SOS_MONO_LO		0x08
>> +#define JPEG_LEN_SOS_COLOR_LO		0x0c
>> +
>> +struct jpeg_header_buf {
>> +	u8  *ptr;
>> +	u32 size;
>> +	u32 pos;
>> +};
>> +
> 


