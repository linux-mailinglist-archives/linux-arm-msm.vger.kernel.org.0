Return-Path: <linux-arm-msm+bounces-91839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI/JLPqGg2niowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:50:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDC8EB320
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F34DF305FFF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 17:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744A03A9DB2;
	Wed,  4 Feb 2026 17:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfY5h04k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6Sbp2su"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7CF34C83D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 17:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227156; cv=none; b=OtDe9M0ZK3CeI0wW2ILJB2J6RKMVu2A3a39APqKsAh2JdSYH7JCjSyWKSEfMNeRatgRRE6q82zHv2XkM5Z/jR9aDlSAc2nePj2UTXA0Zpo9soxbCkrmKSeFJ+AKc23LBwqQ5g/ztEG5dhTD602Fgcsr4DJYoiYoyIfvawkcaJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227156; c=relaxed/simple;
	bh=1U+T/TGx1lu7uG20Yk5Dj/g7zoJzzEaRG2Pyl5Lwbqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EERgAUvxIQnoQ2tKv+iFYvrbB3eldYX6RDiRuyUuT/9bELW2ImbsJTkXI0/yDMvNE5kGSbSbFuHvHLqRftBcJNRLOBzphcmKWVxHZQvAk/KE/6gFpvwRE71n0bQmMZtT8TUU99znC7dbozckQWXFwVScsw/x8l8mkKNKTFG3va4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfY5h04k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6Sbp2su; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614E4Toh944995
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 17:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Op0scuHNJd3fkuYUXQu5Bv+7LfQ4C8HhgX5SWl4YC5s=; b=IfY5h04krrIowMJS
	hIgvkrf2HGdMu9w8Ggl+JmO1gqcpBOgM+OM/cZt9MAKP2NhIRAdJQ3NRry0SdyAq
	DjiCNK8llaNwn+bHIHGYp5lT0g5LknVbXpu8esdj8LxlySKuCnbPr77VY/okti+b
	jNQse7eHwWIz3pWqC8AVQsD6KRbsjEUNXpogKzxqvvmBz4e8zWx2dplEwxDoVx8l
	D73UZf1+GmQyd0Edtp9e5S+uCVonc+AYEPxkvEIB0dx5RuPwwJ+HyjWRRwMrYnLw
	eIuQM5XMXeUK9zvisL30eMoysMJTDncG4Z/S9d6GliqSwj+gateoAlEcx8dpngyv
	ObCeHg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja0sjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 17:45:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4952048a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227154; x=1770831954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Op0scuHNJd3fkuYUXQu5Bv+7LfQ4C8HhgX5SWl4YC5s=;
        b=d6Sbp2suCAT4VgQr7xnlrs+MGFzb625jHoZqGlb0VwK2ypl7L6sRX0uTFjSi4qLzoP
         HsInu+Q4ICjEzpbmQVSUhYIUtGn4ZCcjoHppX9YvrMZjab0Nf2VspWeGINuriF2a0HQE
         bx0DZovCju4QEBBDQsDqK7KaAV1ZQ/9Hc7WyAXzpbM0GMb9tWnCFdix4rxvnGlF3fF4B
         3t7xvahzmJ6cLKUS+O0h5FFcbFyWTLGOoDm9VMqNl8r7uTdvd4+8AQhGqoNqcUZfKw9r
         ++05jlNOdyVmaIQFJfR1jvIuk1q+5lck79vOCqZL3bwlahYgB/Ne9KU6Ay5N5qEQk38/
         HqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227154; x=1770831954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Op0scuHNJd3fkuYUXQu5Bv+7LfQ4C8HhgX5SWl4YC5s=;
        b=dc5IFgS4ZHiHWmrjewrXLN9x062G7x/cYtxpRDAGGbZ1owFiXZdZnREXHTwLSrSCv2
         yy9JotyLmNIYcgDcIa+E/mOujRE9x6nFySSTG6mehGynvW7ks2zyo5UTEm/Q1Etz/wYk
         lMHCVvNM6HBFuUTnfLxIsHUV0FfhI6DIlGKwSGmQqAThIR8kYR9PhNmJL4MoyJXg07J4
         OEpw+54mjDln7qtFs2/bZuEDb4VWaLBl1SVUEHgBiRmU+5vJXm4L0LZSUFhTvdtLzmaR
         hgub75pb+6MjOxM3kSQEHaANhqxFH4yTTlYBhwKNvxfrnY4YxylEhYzbNllowqJFROla
         4F5w==
X-Forwarded-Encrypted: i=1; AJvYcCVGCq712d0rI7PLKSk/edvF0r3ttbi/lG2sSOYdwIrhjz1wzbM8YWbkfAQk021j0I2Ut/UaV+s3uteSBW22@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNOO1H9sARLErACGhT9GgJ8pkp+7GTqecxZgDyhJuU1MgK9fo
	2ySvaSOkVD5OQXk5Wzv7l+DzuCZIHaDSUS8tM7lqiFVW4FvMqb9RRfUpMTi9cNAmKbqwVoRg47p
	9CM4Z019VPM9ZkWtN7A85NYnoxLSmkOKbUkd8mPFaxumtkFKlExQLX6ixVfu9bqsYt0hE
X-Gm-Gg: AZuq6aImefJMZNsEmWmNX2d+uS38BkUDCGcnSwENij9qNv9BO800l1+GBIOGCbdbOfD
	5lZCvBbiCZkgxo+nLQiI2pVGo2JjmYgnvQe+7oU4s7WCu+IN1gWxcwZSM6t9aNLvYT3AD2kZlcB
	z0wDok3pMiik/WSaYGanhLB9BGBCK4gNSSfUHGWqsB5p95+M/NoNdtqzlNjHG+KZe50iZdXBLbu
	+BpoeE12yc1G9scOsvTawAVB6J2snjuSwikWwmNX+4zBOPD4yy2Tj2kb5tCQNGLNsi8XoSuGB/t
	ZNTBbqf2yk90yBiauOWRH75TsZ0xc6czcoTnNqrEFdjHuP0Iosu/WT7DdId2d0bDZKfn7WAap26
	32yI2enK7P4/b/ymbbQ3CPyDOXg4dY/Vcs6hAMKVvvt3q
X-Received: by 2002:a05:6a21:150d:b0:393:39a0:f1df with SMTP id adf61e73a8af0-393725d732emr3402856637.78.1770227153990;
        Wed, 04 Feb 2026 09:45:53 -0800 (PST)
X-Received: by 2002:a05:6a21:150d:b0:393:39a0:f1df with SMTP id adf61e73a8af0-393725d732emr3402838637.78.1770227153461;
        Wed, 04 Feb 2026 09:45:53 -0800 (PST)
Received: from [192.168.0.103] ([124.123.178.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6d9713cb83sm219304a12.5.2026.02.04.09.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:45:53 -0800 (PST)
Message-ID: <b6dc62b9-9bce-4f35-a108-196052f4ff59@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 23:14:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
 <fxzm4767ged6hikpblsnh3xzec4qm7dzyfnds7m2ljedhj6n46@zkm7zxz3oo73>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <fxzm4767ged6hikpblsnh3xzec4qm7dzyfnds7m2ljedhj6n46@zkm7zxz3oo73>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FYaW5qhUUaKOuH8Yf1pnF5q7-oE1LkGF
X-Proofpoint-GUID: FYaW5qhUUaKOuH8Yf1pnF5q7-oE1LkGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX+EMNYag8fhM9
 R1Fw7I2tW58oupTSHGTgpsJHYAFyx4jSzIwKQgCQ2tzmTZad3yCaRAEr9als+MQUdehIigtlsva
 bmOysfrTlYXU8zeQjraAxCO9DK8ORnYGIXaBQ4BTYG/c1yCXdvVvj45so2V9JxLo46ch6F35XTk
 aZaFplicd1k9MHgP15jH3cRvSYnYxOxWr7WYeTwwW2gTWsZ+MT2OU51xwI8AIvlcHyrp59wzk1R
 xjb5BGerXeCiEBmf0QTIRi6o/AEf8GgpeApfa55jxol/jbgs7J2rXGYTegB3ZBLGm9FAXq0tuLd
 2NuUkKAZHzERK5g7lA9Ad8aoHjAekvr43618dyi/lTm3scJnHINF7DVafC4g6hCoz5o6FQ7ZlFq
 r1+dIGk1jaHmrEGjAfbht+BLIxhm57+BQQosIKKUfZex32zzbKB7eT+xbEDmHfZQ5DmJnoRoSDq
 tJ6c8Csu0nIKomxt0DQ==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=698385d3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=2H5/5ZkxJs/wMzWGxXwROQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6d1n1Ba-E67CpG4V2ygA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91839-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FDC8EB320
X-Rspamd-Action: no action



On 1/28/2026 2:04 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 12:56:32AM +0530, Jagadeesh Kona wrote:
>> X1P42100 video clock controller has most clocks same as SM8650,
>> but it also has few additional clocks and resets. Add device
>> tree bindings for the video clock controller on Qualcomm
>> X1P42100 platform by defining these additional clocks and resets
>> on top of SM8650.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml         |  2 ++
>>  include/dt-bindings/clock/qcom,x1p42100-videocc.h   | 21 +++++++++++++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -30,6 +30,7 @@ properties:
>>        - qcom,sm8650-videocc
>>        - qcom,sm8750-videocc
>>        - qcom,x1e80100-videocc
>> +      - qcom,x1p42100-videocc
>>  
>>    clocks:
>>      items:
>> @@ -67,6 +68,7 @@ allOf:
>>                - qcom,sm8450-videocc
>>                - qcom,sm8550-videocc
>>                - qcom,sm8750-videocc
>> +              - qcom,x1p42100-videocc
>>      then:
>>        required:
>>          - required-opps
>> diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..eb6c9b7264f8cbced7cfa0001903238ffa168431
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
>> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
>> +
>> +#include "qcom,sm8650-videocc.h"
>> +
>> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */
> 
> And then someone introduces new clocks or resets into SM8650 bindings
> and this gets busted. Please extend the existing header.
> 

Yes, I will drop this and extend the SM8650 bindings to include the new clocks and BCR.

Thanks,
Jagadeesh

>> +
>> +/* VIDEO_CC clocks */
>> +#define VIDEO_CC_MVS0_BSE_CLK					17
>> +#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
>> +#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
>> +
>> +/* VIDEO_CC resets */
>> +#define VIDEO_CC_MVS0_BSE_BCR					8
>> +
>> +#endif
>>
>> -- 
>> 2.34.1
>>
> 


