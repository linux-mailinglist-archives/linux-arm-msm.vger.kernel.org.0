Return-Path: <linux-arm-msm+bounces-106864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BiaBfKdAWoHggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:14:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1950AB23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 772EE300AC85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71473BAD90;
	Mon, 11 May 2026 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKaiRrYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOTYF9v8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4453BA236
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490862; cv=none; b=ICJBkwip239g941IvrZc24Iql8lkQ4nUj20Nd9HcFThLf467j1z62WEbfYAhre4dY0riDG2MirmnM5835afzarwibI5lKdymw+TZ1YbSUVYUBH0pUWvEODhrJeTRkbZd7UIOWkfDkJVGDVE4BxzDCYKSn5oHOWbSvqAJ+ZOCVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490862; c=relaxed/simple;
	bh=ucB7W3Ztg9rQ6q82LIGwjNZXafkB0JrLouAd5gNQIms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UX+3XDr46UGwN5enLz/DoS9qOGBZelv2MwJVbuIEvdlnBBEbq7jdibmZPXWc9NBD5x+uysceUTYF9FC9TXfbkvVuG4hd02Ieol7hyIBCiU0gBaS3bzQz1RZ85hXAY2p/KWlUrL3B2NdSnCpDNwTZhxvZSjKFEgU8Ylq273xjBh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKaiRrYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOTYF9v8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B60g2c3163614
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T+RbmJy7CU+A4W8ZISw/GL0n1oGkX3YC5BIPsAMPBJU=; b=EKaiRrYzHdYBBTBY
	BWkRfTyNT4jNPs2dEAcOJBQyroDjPgdnTOasPqHk6oAI0OBopB1HWes2HxHcvGwu
	9hEPcB8bUcZppkixToqFqRw6nCqQ9z7+W4zyjee7FW+J2GugRbYBtEC0Rh/bO+Nq
	eSXHS5ldZtFGJrJBQ5zGsSSpgIEqkX71JaK6CUD+ryjzMq1WDyZGsJUaYxRPMakB
	NrJ9a5hTogPQneDilGorgr1KoEGdVefaW2ovHPYQDAtJhOXOrT9NLVmFtCSnHWTj
	QqQ6QG74ZpjozULWDCLBFhHAX6hHdRMKD3Jv5nE/gEN6zW5z9Sb4S4ixDTA+iDYR
	Q0qOSg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dkskhj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:14:19 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95f5663e05cso18960241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778490859; x=1779095659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+RbmJy7CU+A4W8ZISw/GL0n1oGkX3YC5BIPsAMPBJU=;
        b=bOTYF9v8QAcXyu9ardcpqzBWSYkryq+l1naIHH/Bgl7FSH4b/TMaTEddnuDb/XfAqZ
         pbxBK5jxPACgmTK18F53I4q41bKR/j2ZFpm/9ElRo9SikHv9DXFaI/4Qot1uMu7Qu0AJ
         bRE/AirunbMQVJL8oTuvNYtVDCwUvzRjSDUHPYSCuljv0PnJDOAtHyLE13d8I743aCvY
         aZbMHn0zGcg287TC5wkOhpdm4P88uF0cF3uJHYD9dzx9WY15buMOg0H/SPnUH3cGDH5Q
         TNEtGn6qETiEWnsnGu21w60OwP+HBW8C8INvjZJ9ZcoETIy+NNwHbVc3YSbm0z7wTx7Y
         nnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490859; x=1779095659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+RbmJy7CU+A4W8ZISw/GL0n1oGkX3YC5BIPsAMPBJU=;
        b=iZAL605/kAZry5BbC0EBtoIgGrtLkAXEItBjNynx6/ifZ9VomOQYjQHt0ae2GwsAXy
         wPlR4/SZ9T07mqzFsrQG9zNu+F9l8JjuRv9SfSe+KFfdy7bSMhna9h3CmaPxebThjbt0
         4sS+qeQB7p+xAqqPjYkF5tG7K2Z8yUpJ4emjkgV7sxYj79e/iIJN7Uk13vPeC3iu3Zl7
         2uHey8KRw4t9wbpB9A2gjeq9wMl2cCzeXdzYf2RcpbxwSu1QKfCRPuCyjMIc6vAolZGi
         WL8ypav1wCxphB9Fci5Nv3lzo/2iYNjwb2qZdEF7o3XwYGu5sfWQVDpJ9gvpau5iqaRU
         eaWg==
X-Gm-Message-State: AOJu0YwLYAmt+I0UDy/cvv3ZdJ3FO8inECaWlr364Yd1V/KLQUdSz1ZC
	09VEPQ3xUBEdRMUswsb67CUA/idcnhsN45lVx4XzvH9GIa+14XU4AsIZFmtDT4r1awvnbDHJRw8
	JNz7YSUu99D01Qc+f8CvTgex9mNwBUV4TeVfKV819a0rxIelLSRzOhZDM7lZWZHK+Afaw
X-Gm-Gg: Acq92OHa/VXmFuwZ5cDKO7FVTFE98esXM2TWQMDIr33G3vrHYWjNQRkyEYvZZw5A+UV
	ojn/psluiKz1hXoh5bG8IsSpXMLDchyFETadTsfr7DRSLxOl5T2tF8MYTHAppwJcp6gKWcmX7N1
	L/FqVVKzyQZ/Y5uqIE8Ur2PbeQCnS3ygauA6aKBuzmH8qLBP/Chl4YTlA7Hnsf9+ax0uwKz5n4o
	pPIopNlUT/kToFPR5uVv77dn684QZ/vnMk9onw8lJ064EnriX7ACEiTEKYzm7BjN9jMZ28+wRP9
	+/kLP/xrpQLKkZUHLjlYms0xtkfpscrK15UOA+j5e4BeF0MvJqNx+WEtqrW6gzOwTSHF9DUmgUl
	oRHSRROASCTb7ynPm6kiXi+I72jDtDHIENejPArUv5fPZrm7DmVCF/t9Cj6udqYFXROGHFuZT6K
	zBdvA=
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1444456137.8.1778490858786;
        Mon, 11 May 2026 02:14:18 -0700 (PDT)
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1444454137.8.1778490858380;
        Mon, 11 May 2026 02:14:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd09513b8cesm81361966b.38.2026.05.11.02.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:14:17 -0700 (PDT)
Message-ID: <45d8a780-2d02-48aa-ba44-077a4c30bf8a@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:14:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>, azkali.limited@gmail.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260510-pocketds-v1-0-cf05acec06af@gmail.com>
 <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
 <9f7368f9-f6ea-4b97-b8f6-2e2f2e62c261@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9f7368f9-f6ea-4b97-b8f6-2e2f2e62c261@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMSBTYWx0ZWRfX89Q6gCCPeOOD
 thBG/z9fjOxsZ+TJ1OQw8JsZCGWwpT3N79h3GVQirHn0IampORpl+xM+eyVentL0wxD2bACiRkA
 bNrUatthuyzi0sLTI8BQGCwzVxwLBNrCHX9QXzjO0dOUO8mGN2GPuQcUIK4y4mEhk0ywkXLv0CD
 ZFGat7Orh4ZIs3pr0VB+xrqh+0+BuwjYW4a2g5bQtNqkepBmru7BPCcDSk0iY+RCoQhUiU0UeAU
 /FO0UYRGEwioW5/goNrCXJFnm1rYSrnghjPrb1sOvwQAO86uoaShJGHovi9iHS0e4xWUJR7eDGx
 gA4qal9PqnNOhNjKj0G3qdCs19Zpl0FmvUT3bnz9+2y5GFX3dlTCs9cqimHMEmyMOHG/7XWareg
 vtK0GRNycSjcKqNURZ0irSQwR1UMVrsJlhBALwlkX82yEGoJsuupTWL0vvUub8k7NwFq+i6UooN
 I+L1MxxUgJ5ODrMbvhw==
X-Proofpoint-ORIG-GUID: P13ozbi7LnV9pguwnJJj9rPb3gbTDynp
X-Proofpoint-GUID: P13ozbi7LnV9pguwnJJj9rPb3gbTDynp
X-Authority-Analysis: v=2.4 cv=cKjQdFeN c=1 sm=1 tr=0 ts=6a019deb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=0O2ySSlGmDdbU-S61yQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110101
X-Rspamd-Queue-Id: A6D1950AB23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-106864-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.38:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/11/26 10:19 AM, Neil Armstrong wrote:
> Hi,
> 
> On 5/10/26 18:05, Alexandre Hamamdjian via B4 Relay wrote:
>> From: Teguh Sobirin <teguh@sobir.in>
>>
>> Add initial device tree support for the Ayaneo Pocket DS gaming
>> console based on the Qualcomm QCS8550 platform.
>>
>> The board file is split into qcs8550-ayaneo-pocket-common.dtsi and
>> qcs8550-ayaneo-pocketds.dts in anticipation of additional boards in
>> the same family that share the QCS8550 base. Only the Pocket DS has
>> been verified on hardware so far; the shared dtsi is intended to pick
>> up sibling boards as they are submitted.
> 
> Please don't, this is dead code, please send a single file and then
> split it when you introduce variants boards.
> 
>>
>> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
>> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>> ---

[...]

>> +&i2c4 {
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +    touchscreen: touchscreen@38 {
>> +        compatible = "focaltech,ft5426";
>> +        reg = <0x38>;
>> +
>> +        interrupt-parent = <&tlmm>;
>> +        interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +        reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
>> +
>> +        vcc-supply = <&vreg_l14b_3p2>;
>> +        iovcc-supply = <&vreg_l12b_1p8>;
>> +
>> +        pinctrl-0 = <&ts_int_default &ts_rst_default>;
>> +        pinctrl-1 = <&ts_int_sleep &ts_rst_sleep>;
>> +        pinctrl-names = "default", "sleep";
>> +
>> +        touchscreen-size-x = <1080>;
>> +        touchscreen-size-y = <1920>;
>> +    };
>> +};
>>
> 
> Why 2 touch controllers ?

DS = "Dual Screen", presumably

Konrad

