Return-Path: <linux-arm-msm+bounces-109739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLngNXFOFWpMUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:40:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA355D1CD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2682A300938C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947653CBE86;
	Tue, 26 May 2026 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS8/PSjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBECVF4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A313CBE74
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781177; cv=none; b=c2SSUx8eo7jACp18p9rp/IzZuyadk80J9K5AoBGK66DETFvzcDEnQT17rH+dtdPjlH/KXDd4TkUtjho5jIN+jfjmDeGJjHHr1EHL6CuI9W4VRw7eBnWlrnA/4cDmOc2nQagiKxzRHjksE/BRj7zrS5tXxPG3+7oqkWf7imSFIus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781177; c=relaxed/simple;
	bh=QROzjesojsza6o6DWliDyVXRJb1pE7GEdq3E60S7bsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs+rbX5XijvZgfp7ecN1NnXHCfQeKUfIh0/Gm852MZ9HT8UxD0QOIspSdLIlrbd8nG0Syr9PDkPe12oFyUy0F1VNqvGi6yAajf7gqRqzxhE/zejSGYw2xiZwAbdz6oYYpAD6FzJPz6v5QuSbq22WDTYpaGvLAWWn2ZXvK8hkTDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS8/PSjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBECVF4P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q20KwN3604070
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jIGEP+z60S2yqQzDYqC9TS8A9yx2NRGZ+os1M5/9i8=; b=jS8/PSjE4Rp+Up6r
	vD1iIuYTubxtazNDwSGTnbqn3xAOoGu5A0Zmo1XrldHvCOJfdiKqIEYGWjgasV7P
	7q7wuvyUB2co8lZceHNHhQBXJ0b5hxsjOvOG0YlcIvE2v8kIGf3KkP/eqrpc3M14
	8ykWAyPcQeoyfS8L95KQiC/jxeoxYLDqNxBsOUYRqv/DE8RQhd25J6YnyiuKL1Jl
	xUtOEtTY1CQPbkq/jmRZKuEudA1iUBH2wrF3FkC9MZ095sACyZoddpf6ZJ1H0XS/
	Ypu6w9JI1OaV7f4u87q0gaPMVaMDMeWzLUX9HlJJ0YTSHLMeJZLhM+zoafOWYHIB
	y5YlXg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqjva4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8525f0807aso4560930a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781175; x=1780385975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jIGEP+z60S2yqQzDYqC9TS8A9yx2NRGZ+os1M5/9i8=;
        b=jBECVF4PoXk1X1kqSS3OPfgsBaKLes27/21aCXBAiuq88NzoO2J6ZZC1WLtOU46wcr
         34bxcJzb45IdUK96mvgBxMaAwvzAyyjc1LqnvqICnN2QgzjBvLXbT4sZKETopflCKKxs
         /qIfQkmMcI+17/81VWpO72nM/v//btGsOnAP+b8zgl7do98VNrDGmSZ7QZ0hxjd9WmX7
         8EbbuIwECqyg8/8kE0cYd3zehq9hUJtRffVDpIHD3VObrZ8KXjflDBt0cScFrHOj2iUX
         KdE2c1TuR1/BUakZq2yjKOm7w1AoaS8ffGcdsn6D8imzD42YDrrp+fp23wqIB8Hc73cg
         uyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781175; x=1780385975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jIGEP+z60S2yqQzDYqC9TS8A9yx2NRGZ+os1M5/9i8=;
        b=jowV2Nup27Wh2/IxahP/rvHQqWQmHOA35YRABvcRwa4r1NMk+HzQA44ycddlowQIS6
         wf1EHOZ0O/qqFvT7pQErJLvkZlSKzJFuu2Gtitg50Gfu/51qQ/OQ1gWTQMfT069co498
         vL5WuzakMJv/8/mZtaY6DgezHgzvXHslKIpK8JSo/2lhkKllOwkOQw37ZXUbmLQvjfW5
         8rWNLJpb3Jc/nKva6FyoMFqE/y83IeFvovniYNsRrKm68mRIAzBqFXpVJqJsWiaY8i68
         xseyEU36Dxr9UXG+RHgLraE+UeIkq7M8XNVPp1NkxuX+lMNakUTgGamSsPMgp2mKa6rH
         Um4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8d1jaF0D0bpDd7WoJkyswI+wcroIXZu3TxCS7ITqPGlnUx1y7soB5Gzjcie7KdvIOE0PQFsWi/EcUNl3NE@vger.kernel.org
X-Gm-Message-State: AOJu0YwiBx7OH6vq7q0GmO+lAP6OYztsumSV5Ra9X+wfoWab8JnGR0dQ
	R//abYEh+X+uHtNBwnxE/Rmx3ygf3Gx0FS9qgvT0emJEQp5Ea9aqQlsr2rYAoNMDmA/wvzTt04v
	hEjGtYHQHa0gXFsz50j6p5iPe/shtFMSmN3xQuJW5YkV9ExEPQpoyg3z+KyvIbjuNU9IJ
X-Gm-Gg: Acq92OGTjfH+dmTxNgVNYVs+5eatGT8aS80wNJ00+odI5q7/00EM/+STxQHoJACz2hM
	hqrj7SBzqaHLl68oT+62kq44/S8WRGhw4I+6ZTuZktOt4TNMGeg2/Wg5MEv3P/AxdTZurw8XEgc
	+2G2rsMa7ewccsRdkffb86XCKbErvEUgL3888uFutjhZSkO2ib1w83X/iKFcZvRBUHMoXrQRaXH
	i5s5BlTNRiwZMg8CuMf41uf1uEAqrwU3yfs+VQ0L/eAUpzZo/LeOZmcCJ8D7V37oYHniOclZ3vo
	I1tS01G2Mm4t68JnyAUAyWogfPG2wbKaJ+X8exWSyOWen/34VLhQp6jbQF2x8LQ1qUlT7qQcD55
	zUHjjWTH/a4nb1riaVFdqrC4z1/j90bZqyu2oXpufkcmO56kSJBmZ9O8GJ5s=
X-Received: by 2002:a05:6a20:c90b:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3b328c4d6d0mr17344484637.4.1779781174715;
        Tue, 26 May 2026 00:39:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90b:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3b328c4d6d0mr17344438637.4.1779781174206;
        Tue, 26 May 2026 00:39:34 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056d767sm9446299a12.25.2026.05.26.00.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:39:33 -0700 (PDT)
Message-ID: <e339703d-1a10-4594-a8af-64e6acbc6cd3@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:09:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mps,mp8899: Add binding for
 MP8899 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>
 <20260520-passionate-handsome-dogfish-9fc65b@quoll>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260520-passionate-handsome-dogfish-9fc65b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a154e37 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Ov9h6TAEAQTuY_HzltgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Q-8B5AZUClwsMP6vFN_iExLo9RJxnOTo
X-Proofpoint-ORIG-GUID: Q-8B5AZUClwsMP6vFN_iExLo9RJxnOTo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfXzKBB2ajP+4mv
 J/sZ6Tcqhbn6nZY1npURUGMbOxtjwF92p7vFUdXKgXMnSPqP0UD1wOKvL2kd5N+dJCiLSHsPZTi
 Dtr2fls6arxnHPAcD1sB4XxoM3JSo1VQOZu4MiAP016aCV7iUcyVBI5IiGwB9kSqeI/mZVL3rqw
 q7SAdIt6LksiLOFZRFg2tv2KHXTV6GzyOtVB5BONBaP9QpqV0D4OwWVDMWe/dJ4wOedSTZDFgmq
 7lcDQ7h+eXZ7jVWQZ5MuQY8QW5FivcUZp4gRWLhMD2+Y0pk7oR2s23O/K0LLuHanS829KCzEXlr
 vn3KVAMpaZnyyqwNuc/fYlM6P+dXdUvveCbf/L7w7DfNjbSSqg+7UAyRU6AeOKoeV84yh1LPvj6
 m0vLzILtNz0XLtsu57RMz3mcB9w1x3fTKSKLRcoJoUnTl4Bm3vLfjp0HFXbH7N+Y17PzEznhCVt
 1g9MUQBJE4xvvp6zDLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109739-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFA355D1CD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 3:57 PM, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 11:51:05PM +0530, Vignesh Viswanathan wrote:
>> Add devicetree binding documentation for the Monolithic Power Systems
>> MP8899 PMIC, which provides four synchronous buck converters controlled
>> over I2C.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
>>
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/regulator/mps,mp8899.yaml  | 66 ++++++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
>> new file mode 100644
>> index 000000000000..3225c92db2c8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/mps,mp8899.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Monolithic Power System MP8899 PMIC
>> +
>> +maintainers:
>> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^pmic@[0-9a-f]{1,2}$"
> 
> Drop nodename.

Ack.
> 
>> +  compatible:
>> +    enum:
>> +      - mps,mp8899
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  regulators:
>> +    type: object
>> +
>> +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

Ack.
> 
>> +      list of regulators provided by this controller, must be named
>> +      after their hardware counterparts BUCK[1-4]
> 
> Drop description.

Ack.
> 
>> +
>> +    patternProperties:
>> +      "^buck[1-4]$":
>> +        type: object
>> +        $ref: regulator.yaml#
>> +
> 
> Droip blank line

Ack.
> 
>> +        unevaluatedProperties: false
>> +
>> +    additionalProperties: false
> 
> Put this additionalProps after type.

Ack.

Thanks,
Vignesh
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - regulators
> 
> Best regards,
> Krzysztof
> 


