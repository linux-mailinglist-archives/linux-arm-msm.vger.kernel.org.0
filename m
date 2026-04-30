Return-Path: <linux-arm-msm+bounces-105384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO0wMZR582mt4AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:47:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4337D4A5153
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4475F300D9EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1649444BC92;
	Thu, 30 Apr 2026 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ax+FNWHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4QVsKT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FEF347BAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564049; cv=none; b=f4VKTJYsfxys7eKai6NCGhz02rgQvCOXHOGeTTRv6uhHHP1S5w/+k0XER6NkTxI8JuxMMMo3OtJSLxpWOpvPlPaWU0A9X6xXoxKGzxHDa9wfk1JgdjLBgdZs6ObdL9twGuW4r7pT6Sl24mC8cT7fbusSdq5NRVC7laAJ2BKrj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564049; c=relaxed/simple;
	bh=taYUBNhelatZqHbz7w7iL8qAmVUpgnOLmkxTrhjIj1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFvGORnKgTdxzd33zSPAz9WHzydOnk8MEWTiPTpvzFMOfCmupE4qJN8AwHHMAbn6s+KGkUGONw1JDU4/yDcAqHrvDRHnYaFOwAh4FNp6q0eQg8CHtXDX9EsFZ9KdaPt+vpS7SbI2u8xgxQ+42TlTIYpocQcgWRRF47Y4QY/SOBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ax+FNWHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4QVsKT4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBkN8W3884903
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+lLMVQj5bS5ETHwl6+CEGdqgaWOFgrQQ6MT/bMnizo=; b=ax+FNWHZmrK627GE
	hhzPrw/vk5iROTcewMdWcd4+OJWsYeNlvt2KXg7FC3Vlbme7Of9B271IojfpkbLn
	dVw5ohU9X1zqHwohBYfUTNUHP5IalVbIcjGkJmMuzoZ0LqJGGnfhLlIqQ0Fpza40
	/Fo6XXiIpf55q81YicgsKwJe/yKzOjsO7Sgq+hkMX9AJ0Pu0MPkSMyQ2zbvwzLkK
	eHeVRhFiZE5QhaPZTlr/uj5Ng3Qmc7+BDNeFMT3+c6L0dbVq0jTjzrKgp0/kAx3s
	FLUhOOSPyWGYAFePZyOpwjoMyDqkh16zljC2ZpQk72CGol0q5QTwu+zrQ9b+aZB3
	vW5uBA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmam295-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:47:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so104482137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777564046; x=1778168846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+lLMVQj5bS5ETHwl6+CEGdqgaWOFgrQQ6MT/bMnizo=;
        b=E4QVsKT4edM/AxYdx8kZVZMCQm/5Ax+6+D8bTMkhXUO1AxYw/3PJgl+o1bezAQp+w0
         5DBjx+iaKntOhWRxvaZ4SCtHCgDy5gtF++WiwAf7jakV6ZWjdptE5QJ9IwNad5c5gAPM
         3k/ENMXHOYFCEwrp/HrfmG0Z2ZtwZPX8ZL3teZaAfEl66q4IW9iMVVfvHYsP/ntHS9QJ
         YMXJnm47RQp+ZKD2/BLpoJFZI01Qya/wn6XpAF5bPCeWkT9YOOmmoVna8GjRmqzKBoas
         k1kMgh74D/CZ2mSbaa0a4zDHctNbgziJ1BJj628mn+Qe7iscTQu0a+cXfb7LOdh3T+Yn
         RV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564046; x=1778168846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+lLMVQj5bS5ETHwl6+CEGdqgaWOFgrQQ6MT/bMnizo=;
        b=lh719JgNHBwh1REkkuuaJeElrSAdw6TuHuBpI4Y1vDW5bJVXfU/XhWj9sKuQNJWbF1
         MUNS02O+rPZL/SFh9XnYicNE1RqMMM3r+THXDUmuQCVc4zeKqsiKWd8BWbsTAAqkII45
         /o9ERDeY1ui8OXXtTESRUlplS0hx47iovL3tHhECgg2vmz6SM33A3svOHqzU3C0XymcT
         /RKXDi1K2rjiN8WknheV0AL189X5jXcWwkk+3IfbEeIC5wa87N6lA06l1Apuj8CZ5EGZ
         rIRQRk6R+WTOyZ+vSnHQg2odsIaaS920DPnknfo18uM5LjLdHOLCsIutkz2piVp3PC7y
         5KOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DYefJjBfDWs95V1y3HMuaGGOcCjcN4NrQrI3CQIGuDpl3WLDH4/OOePMc3hJl8do1N6wN7M2FtuvoABlU@vger.kernel.org
X-Gm-Message-State: AOJu0YwVQT5wmQgV3dywUrCP2DgoR94jZeOVZc0su8GuGUk9IjJhlVyM
	/KoEuMYwR482CCU7TXVDkBUwI8SbbtXMFzkP5tY/wttXwf4GR+WG2Pn2xjCUOeVM61OnRUDCiKu
	p14oJ8C+3tLPqRXk+0iZmVHSAtX6q9TSYVsng75vXNQqtUkTnz0/vEFQM3ZZR7oPp2tMj
X-Gm-Gg: AeBDiet/fNoCORC0g2bLAaW6h2GEXqcskFFd0MJoLJqjINpIjTzshad8YYcWXLhTrR2
	ug8PyohMvWaMw13qtbrL27Y6o+SUsA32B7kdgDoZH4d8LQR6+bzQJBz0aQp4d9iWAiv2yLOVOFM
	U6SvAsql4s6y00dLULKvAVeC/YDkq/JtRw2XhIhSwxxsA71AzodCdCHiYVP+e/WzLtmLPjc3itC
	HNYUmcLos3vde1TMOhL/wNq191jTJyD13tCvqRJgBVGbDjTYsFheDMI547+m1jB1z3nP1hnMIRf
	F5LLqDMkFQ2Jo5CBSXIPXJOdLHoIPY7QtmPEeajjxb6qSn5ycekMtqmBXTCsrMA7lEwacEow0IU
	vWn5r1gGvQUTjkKlUO9e4wRdIiTgoT90y/oJ/37JbWxsA1F119jr+ktozkbRItt0hGu6BPb2xgX
	LSjC9LExJVlPwybA==
X-Received: by 2002:a05:6102:2432:b0:602:b87a:3524 with SMTP id ada2fe7eead31-62ad661baf9mr648849137.8.1777564046037;
        Thu, 30 Apr 2026 08:47:26 -0700 (PDT)
X-Received: by 2002:a05:6102:2432:b0:602:b87a:3524 with SMTP id ada2fe7eead31-62ad661baf9mr648835137.8.1777564045461;
        Thu, 30 Apr 2026 08:47:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6da73509sm10510766b.53.2026.04.30.08.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:47:24 -0700 (PDT)
Message-ID: <009ecdbb-2297-44eb-862d-233e3290691c@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-2-0c3fd1977869@oss.qualcomm.com>
 <7aa439cc-02a6-4b80-84be-1358ba8a6d60@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7aa439cc-02a6-4b80-84be-1358ba8a6d60@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 27-iy9rX0zienk8FvuFYbGHrsydeTpaq
X-Proofpoint-GUID: 27-iy9rX0zienk8FvuFYbGHrsydeTpaq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE2MyBTYWx0ZWRfX4RVt0BqBCgNh
 pWizWoDr8kAbmnQXNDBfp4Fecti4DZ4AwQZarNZM6zjQ9+J9stvNSLr8I6IP8x+cwIG+3xxLyTM
 3EyjUxvAJplf/LWKpZnO+yoOSXEUVCzBtTqGqIs0nQlkWFO3So1Thz4WGcE0xfF/KB6hTnKZscE
 s0bNQeCRputYSkLZ+KOUdnKt8mu0O0ae1TJV4XAuC/+V511KHyGQNNQKNK9jrJqiC3D3v6iK3l3
 KcqjAdAD1EZQKBcb1rSRfrWRn4RwWEiqSmOM1SIBL4o5h5LDEAYhr6f6Af2CKjVqH/fTt7PtULm
 Rb1oTnL+flB9OaKdAdQ4Wx+0N/3sxJU4b3UKYUOVTYWe+fQm0+SSQ4OHz1W4tVIca/VqzhIlof8
 5oJfjW+IC/QcYBgO3LQjZTCVnQZiuQ==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f3798f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=-yHGr4N8GCYiLiAxFAoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300163
X-Rspamd-Queue-Id: 4337D4A5153
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105384-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 9:19 AM, Bryan O'Donoghue wrote:
> On 29/04/2026 15:14, Jagadeesh Kona wrote:
>> +/* 1200.0 MHz Configuration */
>> +static const struct alpha_pll_config cam_cc_pll0_config = {
>> +    .l = 0x3e,
>> +    .alpha = 0x8000,
>> +    .config_ctl_val = 0x25c400e7,
>> +    .config_ctl_hi_val = 0x0a8060e0,
>> +    .config_ctl_hi1_val = 0xf51dea20,
>> +    .user_ctl_val = 0x00008408,
>> +    .user_ctl_hi_val = 0x00000002,
>> +};
> 
> Could we start defining these bits intead of stuffing magic numbers ?
> 
> I can't imagine a PLL setting is commercially sensitive and even if it is..
> 
> There's a difference between someone in the community doing a port of a downstream configuration where the bits aren't documented and a vendor doing upstreaming where it the vendor has control.
> 
> What does 0x0a8060e0 actually mean and - yes its more work but, why can't we define those bits and bit-fields ?

I think this is largely "this is the value that the silicon was tested
with and what the entire frequency plan depends on" - some of these bits
are defined and acted upon in clk-alpha-pll.c

Konrad

