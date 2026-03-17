Return-Path: <linux-arm-msm+bounces-98079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHzCL3T9uGl/mwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:06:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F1A2A493F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D85B5300F2BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF01138642B;
	Tue, 17 Mar 2026 07:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4TiClbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXNhJt51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06DE3859F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731183; cv=none; b=MPPaFpJpcXZAjp2TvkyBN2CuQSB1yNPhE+7B6QJkOL+p2ObQp2icaTmme7N8U/+04lp4G/ThthvL60mU9hhqKhzCycfceOFcPoVavL1qa5kJ7ZUG/oaYLxuqbdShBU521pSiluMpC94jupFw6QbRKfBd5gMqMoftwj7VOA5zYoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731183; c=relaxed/simple;
	bh=+7Y4AM0AU73pNhph8INX9d312ia5Ft6eIBrR9KgDEjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXgo9opw6jSJTzGQp8L3kQpZbqNDV96XY5sammU6XunurKa9TAa8AxKIE1pFHZaal94/FEBY1urMeurgRl+Nrm7fcr53JnFCYv0D94086Cb2W20TYsM9KgkI4t6rCk+mhjjRS1Q1p9IZST+wnsdBc6RvhYu4DSzuRzJXKEiPrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4TiClbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXNhJt51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H0ejqV795574
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BzWYXwMubvF2D4wEFZJl0atkOVu62kLiijZp17n0pHI=; b=H4TiClbu+IkFuIvY
	0jo+RtQI07jDMh1Ifas9IhyEAbvdsAwx0Kl4B6XFlX6R7T1V8WlDRMVKlPUfhrya
	Oj/BNBO4q2vcPJT3oVRfoGX5G5hUcuuJsZhetKe6t6c7V0Bd5ad0v8Ojym4wmyOy
	0GU8hAf2HEHYCUb0mmEBx0CQw6ZHctQWoubpFvsCMpP7Mr5qNKHvCrU+b6yWgQJG
	DA6xZGsmiQlg5DoCtkc/4jsLTz+LgoMpFwolS/rzWP3JYNIxb+u0asFLHf0MfVOZ
	AqHnhBXCu7mFwnY4wHQOvpYW1UHEQfW/2aTM7+lKenM16KLm+m4F9byZKjbW25lo
	6GP1xQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm6d2ucs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:06:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0337930eso4410773a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773731180; x=1774335980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BzWYXwMubvF2D4wEFZJl0atkOVu62kLiijZp17n0pHI=;
        b=KXNhJt51sxMOoyE/EY+m20Wdm/7+pHio4P68I2i6fSji+gz/XQRvDCnrW5Ka4HwZqq
         gk466i8ypEnLBf/6Pum6VEKCla1fh8L1Xfu8zdzFO0hE3SUKsG6HF8Ve4nwqmpRAEJjH
         RNO7JpZ9/MmVgjZVFEwKnMgwCU5RskrMyVEe+X8hNEDOuOeq5i+jZitmk21FhM8vP3ed
         j9d2KEG3QWWObo1Z9s/Rw6lH/Cu4zIzzwPT8Ejl1QPBR40+8wQuf6rB2cyVgdolBttHW
         z1diPmkUQG1pcQ2azl+4Z1O5zAPf6dlu3eiu0ejqU6BKCH5+T+hLeLASFAlSNOBK3g3L
         EzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773731180; x=1774335980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzWYXwMubvF2D4wEFZJl0atkOVu62kLiijZp17n0pHI=;
        b=G+7Yzf5yCB81AVximRw8Y3HJCRV1UkASe6TQkpwQbBcEZoHPsVFD7zygAdtPLc1cIn
         w2AyHOSZU9ciXFn/5vy1cMX2Mh5q0i1Py83aHMLyshh8VH2dKv+QV0md+UdRexgQTY/T
         NbDUVCpOcSkwTm5L6eCVaua883ht5vGTxkv4npddE9phKKAEIr81iD0fs2MwQt6F4axm
         rTdsmP0xKFb0+DTmiUj2kpprm8iJocbcaB8MfDvOJkVu5tdnvZjOGY6QuUueoaG6ry//
         +68msl7BJPxPvmrWtQ9A7F1yRzIeJaQtGqWOYdy5qzULqNadb/9ArvYPM59Wt+K15/WD
         bxmg==
X-Forwarded-Encrypted: i=1; AJvYcCX2LgInbDj7cIafVaKEKHLWNZtBu/gIxeMVez9BBAyKWlrgVsv5or44dOIELebOOm0sBni0ctOIK9mQIfNJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwhMkZoKMeheiKhZj1edXQtsCxDC2JCdozQuZFVey+ALKETyJGW
	7xLOQgCiu3SMhcynr3bsZIl8RBMpCIEo7bspMS6DnHwx7ruZTnzP7xW21fBMRVPm1HcXrx3dULy
	Pd+xkggW2PvRc/RqT9/Wm8V90udgAIUPWlBkm+7bKGpsbJrOEs55jTc+rw1E8dJdRnPoo
X-Gm-Gg: ATEYQzxuq5cUMjUHt2fhiWgg86y3A8GZEDYmg8ifdW4TYEVJ1lLfKa284ImlVoqgtSV
	lCRjMGJnAxZhcbcbDOFcum792u7JqZxOvXPU9G8S1Ve4LxbblL2jSBz7Pti6cUFJyK7NXrWsu9b
	nSWq6O9oWJOFO/BDzOcBoPDqd1PMP8NV1cGjuNfcOJP0W6c/RfLQ0NXRIKMQBIYMwBCSX3NIlvZ
	NizOuK4QTKD93u82eyh82WU/GvTnVbOl+GSZvTT531y2Ju+aqZXXb5WeBpWeir9f2ej2eOvKt4O
	32bhZiR1yiDPd+aFoNv7/jGVMwNaE7DEGOfVKzn2c9rtXA/l35yGQMdl1zUwPL4L1UCQIkHOXId
	RADKYWS4PbOtWayFx/ZYlodP8rA/8UJsEjViVVg2/TysKN+PCrMOB6hObkqHAzgDpjIRluSGOiL
	Ia/jT1iKEg1/bqZB11wQ==
X-Received: by 2002:a05:6a21:691:b0:398:7808:10f6 with SMTP id adf61e73a8af0-398ecdd8d89mr14257894637.63.1773731180302;
        Tue, 17 Mar 2026 00:06:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:691:b0:398:7808:10f6 with SMTP id adf61e73a8af0-398ecdd8d89mr14257856637.63.1773731179749;
        Tue, 17 Mar 2026 00:06:19 -0700 (PDT)
Received: from [10.133.33.223] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74029fa6eesm5535805a12.20.2026.03.17.00.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 00:06:19 -0700 (PDT)
Message-ID: <d307bbcf-0fb0-4d13-8372-0bed7fe78d5f@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:06:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Rob Herring <robh@kernel.org>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
 <20260226020454.3210149-2-songwei.chai@oss.qualcomm.com>
 <32309e19-e193-4f56-80c4-39b028f05876@oss.qualcomm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <32309e19-e193-4f56-80c4-39b028f05876@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c7+mgB9l c=1 sm=1 tr=0 ts=69b8fd6d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mofWGhzUb814t78398AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: RdP7LvMp8USDfETchwkzDRNGXubvN7k-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2MSBTYWx0ZWRfX/z6Z1jFmu7Bo
 PwAC3rXPVi8/bleFsrzvEfQFVMGBtDZFI982IhpkJDPvJzwaDj7PLGCJmOaXNilKBT22I4eBhhw
 0K6xBkDd6q87t1CTB+uIjMbyP8Usp3Z/Rg7XBn0hSI3DfgwbZrnYEZLos7O9tEKCSjYI/CygxPQ
 lSTpxwOKdGi2AOqv3kLpyvP49MhFuQQh7dpMKiogw6lgWrxxw6kcbbCkVPJC6Q6V1mWk0z31PY5
 6Q90SxqbzpIqsLecKxJNzZol8AE/epyu+LZ0Cb/MHCgxkB/67IficLmY13VQREKzqn82EjWBshe
 192FovvTemTRnpBF8/X3CHh2F0w0w2TJIGuUfxFQSEF/LzyqMaIMaRB+z+e1LxvAV19/qwE9P+q
 Jg62k74KYI+bYnRn35sLBl1dzT1UuDORH+GGhtSI2x4OhRLh8CBdQ0c5BJnIyPWaAC5s9nQVArY
 x+5nKGcgmxRvQRM0tJA==
X-Proofpoint-GUID: RdP7LvMp8USDfETchwkzDRNGXubvN7k-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170061
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98079-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8F1A2A493F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2/26/2026 2:07 PM, Jie Gan wrote:
>
>
> On 2/26/2026 10:04 AM, Songwei Chai wrote:
>> The Trigger Generation Unit (TGU) is designed to detect patterns or
>> sequences within a specific region of the System on Chip (SoC). Once
>> configured and activated, it monitors sense inputs and can detect a
>> pre-programmed state or sequence across clock cycles, subsequently
>> producing a trigger.
>>
>>     TGU configuration space
>>          offset table
>>   x-------------------------x
>>   |                         |
>>   |                         |
>>   |                         |                           Step 
>> configuration
>>   |                         |                             space layout
>>   |   coresight management  | x-------------x
>>   |        registers        |                     |---> |             |
>>   |                         |                     |     | reserve    |
>>   |                         |                     | |             |
>>   |-------------------------|                     | |-------------|
>>   |                         |                     |     | priority[3] |
>>   |         step[7]         |<--                  | |-------------|
>>   |-------------------------|   |                 |     | priority[2] |
>>   |                         |   |                 | |-------------|
>>   |           ...           |   |Steps region     |     | priority[1] |
>>   |                         |   |                 | |-------------|
>>   |-------------------------|   |                 |     | priority[0] |
>>   |                         |<--                  | |-------------|
>>   |         step[0]         |--------------------> |             |
>>   |-------------------------|                           | condition  |
>>   |                         | |             |
>>   |     control and status  | x-------------x
>>   |           space         | |             |
>>   x-------------------------x |Timer/Counter|
>> |             |
>>                                x-------------x
>> TGU Configuration in Hardware
>>
>> The TGU provides a step region for user configuration, similar
>> to a flow chart. Each step region consists of three register clusters:
>>
>> 1.Priority Region: Sets the required signals with priority.
>> 2.Condition Region: Defines specific requirements (e.g., signal A
>> reaches three times) and the subsequent action once the requirement is
>> met.
>> 3.Timer/Counter (Optional): Provides timing or counting functionality.
>>
>> Add a new tgu.yaml file to describe the bindings required to
>> define the TGU in the device trees.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
>>   1 file changed, 92 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml 
>> b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> new file mode 100644
>> index 000000000000..5b6a58ebe691
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> @@ -0,0 +1,92 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Trigger Generation Unit - TGU
>> +
>> +description: |
>> +  The Trigger Generation Unit (TGU) is a Data Engine which can be 
>> utilized
>> +  to sense a plurality of signals and create a trigger into the CTI or
>> +  generate interrupts to processors. The TGU is like the trigger 
>> circuit
>> +  of a Logic Analyzer. The corresponding trigger logic can be 
>> realized by
>> +  configuring the conditions for each step after sensing the signal.
>> +  Once setup and enabled, it will observe sense inputs and based upon
>> +  the activity of those inputs, even over clock cycles, may detect a
>> +  preprogrammed state/sequence and then produce a trigger or interrupt.
>> +
>> +  The primary use case of the TGU is to detect patterns or sequences 
>> on a
>> +  given set of signals within some region to identify the issue in time
>> +  once there is abnormal behavior in the subsystem.
>> +
>> +maintainers:
>> +  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
>> +  - Songwei Chai <songwei.chai@oss.qualcomm.com>
>> +
>> +# Need a custom select here or 'arm,primecell' will match on lots of 
>> nodes
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - qcom,tgu
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,tgu
>> +      - const: arm,primecell
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb_pclk
>> +
>> +  in-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    additionalProperties: false
>> +
>
> The TGU device is no longer a CoreSight device, so I think the 
> in-ports property is no longer needed.
>
> Thanks,
> Jie
>
Thanks Jie,

Your comment has been addressed and updated in V12.

>> +    properties:
>> +      port:
>> +        description:
>> +          The port mechanism here ensures the relationship between 
>> TGU and
>> +          TPDM, as TPDM is one of the inputs for TGU. It will allow 
>> TGU to
>> +          function as TPDM's helper and enable TGU when the connected
>> +          TPDM is enabled.
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tgu@10b0e000 {
>> +        compatible = "qcom,tgu", "arm,primecell";
>> +        reg = <0x10b0e000 0x1000>;
>> +
>> +        clocks = <&aoss_qmp>;
>> +        clock-names = "apb_pclk";
>> +
>> +        in-ports {
>> +            port {
>> +                tgu_in_tpdm_swao: endpoint{
>> +                    remote-endpoint = <&tpdm_swao_out_tgu>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>

