Return-Path: <linux-arm-msm+bounces-75115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D9EB9F71A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D4B6189123D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4FA2135AD;
	Thu, 25 Sep 2025 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FC/e12P1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899ED21770A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758805905; cv=none; b=TbViChaO9KMV1awqnoa/OB7zd8jUB7yn198bhvLqKd/6UcDEwSbwzRMqA760nRa/dlaeBU6ajRzifJhOp3yYiruunN1oYWOZME9Tx8StzvjA/lSCgIRhf65qwpOI7WF0Mt5CwcbMZcB70FKs8/NO/QEnmCPjLdpRVK7TO838+gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758805905; c=relaxed/simple;
	bh=lINE7NkSUvaMRUN5kdpq2iupYa9Jn//uSqQB9Wso/oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pafNRlrGyXCiRZCunYxr9uWV/jY0yOwxjettTJzn33AuAbFpvZVz8o5sifI+SfdMVaZprYQsPhtayiVgc/zsHHmXzr+oHd/WYhTW1t+Y1yNE/MBxvw8m9bBucc+MX/2UJVfUM4GI9yumZNO9HP/2JL3k7uf7y65NCsrjjt1Z1ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FC/e12P1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4auxL028515
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l822Z63KISA17qDDKSQgq4rvN0cBPgBN2THLZWvJPpw=; b=FC/e12P13NLUWpHV
	yn9nF77c84gm6r25egvyDqWqGVf7XzyO5R6ZzZnyqQdj6jifb6f7T2OZKCF+EQB/
	gRHQzPV9c0tNarU4/ldKcb8UNb1xz08z+d1gfOcr8NEqUZNLays2hE7QsZ8DKx8X
	3g4rsWZawnCYP74amBZmYjW+gKxUjXAqiEdL9+GkGLLlmY1JcaH/hM8rElZvRk56
	pRjlDDNEBHVMFCU6fX9V6n72ADgp45+EFIwEuAHezOGWCU0TlNtvnQN1yIYX5Iqc
	bs7nExANPp8Oj6hojAJCAn87yPIWO645FZt6dBG9CRHXCafVgOTEh8z+WSjoLrVO
	h0AmfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup1cvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:11:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4c39b8cb20fso3340021cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758805902; x=1759410702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l822Z63KISA17qDDKSQgq4rvN0cBPgBN2THLZWvJPpw=;
        b=w/Jp+uMConr7GWSiSyLJgDIkgtLrSRLTN6EplkIQjD5kA3EyaEFMD5+2FUxU2Gg75q
         B/IfktsoWFQPeRSd4c7lD8vKbzZjcROmgsaomO3WCFbpV81XNy9pgUjTeRVOmtz5q1At
         9JHqCVcAdSjDlFp2Kp1dk25M4C/2S7lh5/Z8r9F41t5+G0kYwMifpVuTfUwEgIlzeQf8
         noP+agfXgtko/upAnHLSL/jvoXK74M62J3u+GhYL0ajTX8EGL5eRtjia8QLrY4wOWrUN
         L/Bd56kEMP8b4wf++1EHDaPjc2ah8NION3QBFqOw6yQWE6ZOPRwpMBfZVN81fE4LJlOr
         9BKg==
X-Forwarded-Encrypted: i=1; AJvYcCVhZDvTKqfn8/5q8kxzTWNJX5Uy77en5fdF6V/p4Jf5JHZwYSoiRVxe4+5uTZuZ+4h05wmoQ1JW0LS7MAjc@vger.kernel.org
X-Gm-Message-State: AOJu0YyduCgeVayHN5N2cJ4IjsJJFZIWNSLZLaMdOB8byeOBtnKkg6Jj
	6kUdu7gl3LnVNGEB40RbE2zeHT+4trZtdGrPDFasuPxDvGFPJAnulBZji/VntuOaKo2e0YyPJQu
	MfPlDuKvHkrCbKFd7y0KmhD7pnjiZHl79JjJoLn5Ddtdk7foYOfHV1qNTMqk1R5PQLCbO
X-Gm-Gg: ASbGncsHJDupLdYzOW0jfzUnbskjcAb728+Z+ek22pjWQoMfV1LkaT+VDuBwRRZxZkL
	OlRmTYdfkvIAv7BF/qVL7ll2WLLr/dnPjOTEkhYveYVKtzjsUvYsoQy4bdJjRRdkIWkLnqkruXD
	jsQYWOtChrNIUS4QJ7yT3vbtZPYiFyUwYvZ/F2E28VnDeM+bxXLeVqLK6GFrM15kaIEnUa8iUyR
	KKAQDzcp3KDSdCeONR2DvYOA/iq3P/YqUsyPFC7Jwg6yWnG+YDsCIZsncjIt/A6JMPeuEpj0TRs
	mjmOvQ7FJoEG/vJZzYo/I2qhVziMOmUDnaoRECTqK8hmLb4WmuPwSo8KZmzalNK9KG/Ou+jr7/s
	fyP43kGAf9Lpc5n2NNogxLw==
X-Received: by 2002:a05:622a:1488:b0:4c8:39e0:95a9 with SMTP id d75a77b69052e-4da489a1c99mr25435511cf.6.1758805902330;
        Thu, 25 Sep 2025 06:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVLJC5KlSybFStb+ck2Af033JMceOo9M492BbMXbBa0IliIzYWZPhJGlQ0ZMIsN2rkol5KUg==
X-Received: by 2002:a05:622a:1488:b0:4c8:39e0:95a9 with SMTP id d75a77b69052e-4da489a1c99mr25435301cf.6.1758805901862;
        Thu, 25 Sep 2025 06:11:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5cf32asm167836166b.1.2025.09.25.06.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:11:40 -0700 (PDT)
Message-ID: <60d2cfed-5018-4afb-9db2-6bf423defc7d@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:11:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: max77705: add interrupt-controller
 node
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
 <20250912-starqltechn-correct_max77705_nodes-v3-1-4ce9f694ecd9@gmail.com>
 <a3ce0aa6-41d3-4ce8-adff-14c767d7f871@oss.qualcomm.com>
 <CABTCjFAO=iLauq37M7LOXOmrgAnPxh210bcoujUsL4zEC3634A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABTCjFAO=iLauq37M7LOXOmrgAnPxh210bcoujUsL4zEC3634A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d53f8f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8
 a=qdIrdHMtB0OfU3cIBJoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX4LAxdYFXXQHA
 ILs64l9KkPR57qZjLBMgduXT1x6AeKjPLdRLbOKs1ZuQZpcr+lTfqT303zlFWUR/Q4y5tsRPqeH
 rBY5x4kLSRs4jKMpZPlfyYpaAAcLwHa5ar38afplf/WujMWzysj9H+AlQC81xscWxYnaE79qKyg
 u4plRY6kE5EOgmr7WkuI+vc8687a9bp2V1yUDjdJkDll8HgmS5Z4pQ+/b4vpzK3tDI0qaCw19ip
 e/ZJIlCwuNq27WqV/WjJw/wXh3SnFH+XfWE7BqiDgMMVaiprzJKrG6Dvy7i/RsLPK9wDBhamtYU
 TWkcrQAcTAr9CSNSpbbaK+8dsanvc2j8+lT2Su9FvDFHRgYgKj6QJHU9KxnqYWxl57xTmbqq3zt
 rVHodt1T
X-Proofpoint-GUID: q5Zb-iXgWVKG2dnBJVREEIj4Ie96wESi
X-Proofpoint-ORIG-GUID: q5Zb-iXgWVKG2dnBJVREEIj4Ie96wESi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

On 9/15/25 5:46 PM, Dzmitry Sankouski wrote:
> пн, 15 сент. 2025 г. в 10:49, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>>
>>> +      The driver implements an interrupt controller for the sub devices.
>>> +      The interrupt number mapping is as follows
>>> +      0 - charger
>>> +      1 - topsys
>>> +      2 - fuelgauge
>>> +      3 - usb type-c management block.
>>
>> The MFD driver registers one more interrupt, and these don't seem
>> to be what you say here:
>>
>> static const struct regmap_irq max77705_topsys_irqs[] = {
>>         { .mask = MAX77705_SYSTEM_IRQ_BSTEN_INT, },
>>         { .mask = MAX77705_SYSTEM_IRQ_SYSUVLO_INT, },
>>         { .mask = MAX77705_SYSTEM_IRQ_SYSOVLO_INT, },
>>         { .mask = MAX77705_SYSTEM_IRQ_TSHDN_INT, },
>>         { .mask = MAX77705_SYSTEM_IRQ_TM_INT, },
>> };
> 
> MAX77705_SYSTEM_IRQ_TM_INT(and others you mentioned) is a part of 'topsys' irqs,
> which is kinda MFD own irqs. They are unused at the moment.
> 
> See also [max77705 rework interrupt patches](https://lkml.org/lkml/2025/8/31/27)

This would be useful to mention as a dependency..

Perhaps >this< patch should be part of that series you referenced, too
(or they could come together with this DT change even)

Konrad


