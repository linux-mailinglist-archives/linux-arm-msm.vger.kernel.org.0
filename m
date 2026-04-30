Return-Path: <linux-arm-msm+bounces-105383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H/jDNB482mt4AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:44:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B424A508A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9326830010E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DAD436370;
	Thu, 30 Apr 2026 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1q/nkbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8U+AfEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD343634B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563851; cv=none; b=aXMcaWsObEMtUKjbrwvZAEIGTuZxDWcg7/CTH8uZlC0jblL8Y1bMf/MSMNRifcEKcFlCEQVo2aYXoyiaNtxBALTLSgXZDUBNJXV7wLsyQP1c3+pVlqL+qdsr30HVrV7KEy60tUp9ouXhXIjRHpdEubyK1lj3fZZTFyjO9B8KmMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563851; c=relaxed/simple;
	bh=nhUUkVi9/hcYpl+bQ0fHNNneX3Eu22Xic+NtqQ3E/qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cdk6CFSeuahbQ1WnvTUZYMselFgE3WEAWCvhihOGx0DttvSe+zo90zdKUBa+x89Lve1cVrsyvNSER3/XovutfC/tjBIVeyXoRJMQPAbxvjm0bZ6nxO6+8M8z4x4rC19SzNXJ/2GYhDmUzOgWjj787eKZQUulPTKomPDJ3le4xiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1q/nkbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8U+AfEm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UCN6Mv088818
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17t3T+XOa+UMBrL9L1bRnwu0sMA5ZJW1jZ+/PIyf8Fw=; b=m1q/nkbnbEl3h9ZS
	QOhSS/CwDIZqfdQq4Z/bKLWv4ePXtO69SrX/Ohi1Z+Dt/YHTCpjHRimvenu5S434
	ZlDYJACOyv10EKlPFslVr46Oypyh8QnWw7VyVcueZdPSLSGEQoS7BEl57tf8IxGS
	9aRwpFA/LSPy6+glSyxK/xjx+PeGl2mnAVHL1bP5SjkX94rD9UIBkcrYYpmOwDVi
	ts67b5eQTnbc4PjbukcrB1SGTyRRh8X3b/uMzotv1qzAmOpeRui/2pbfKeg6LWpc
	W01+r/GaIApHdBAwWKXntiZCZ/88SUxirMMpfBfrqf3OPlRCxjAK9xcz8KNmfHek
	toKWlA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u42b2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:44:07 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so102474137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777563847; x=1778168647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17t3T+XOa+UMBrL9L1bRnwu0sMA5ZJW1jZ+/PIyf8Fw=;
        b=V8U+AfEmIe5bFWNygVNsnyA0x6+tCg7LPKmcZsPBsvszzpnDs4HzjBMD45Jb75OlzT
         M2G1pyRzyUvGGtftYY2q89CyP+QbC+RkPIuBqqsoiXetaQlw8krNworxEDFnHpIDFMvG
         unZhGsLV1tArJlVInZQH84pgrGVUNdafh6dFrwdjn1nbNnaHboTtwiLFtXREuA9WGvUT
         FgI+DqtP/fVTYPs5EX7IGGnbKB7A+3RF6NLLY6mZNChQieBbWaq51jO8/dRRH8dfEB1s
         RZvmz9dN0sb9gJ2Udl1mxdIdj1dcYm2VDBb28VVELCGxww+LKAPeW/+CuHX5JZ5owmi2
         KdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563847; x=1778168647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17t3T+XOa+UMBrL9L1bRnwu0sMA5ZJW1jZ+/PIyf8Fw=;
        b=Cirf8QG/5UKPDCCK8XgHhx62g7hoiTNFILEwOVqneNYlFSt+CDKKuEU4e9ipDf1Qf6
         JB4uVYNb1ng+219vZ5vMnhk5LXUDZJAsWKQa8TNyVQstSRxLNmb4sLwyLHG2d362059A
         KM3IVjE/VORcB7Ug8k85+WffLp0MmX6F69Qj3Vjd/hSpVhsp/Nq4B8vcihPNGnVAn41e
         G0efrNJ4aOGDBYz5YGFOFlWAlSA2TkthBsaQXByBg9pJtVfqbpn23QT8iT6YGYZZjXJL
         o+1/rY7FWemxB0NqKOmLgEs1n5dJ7x4a+A8xGgr61glM54fbARmybbK55ChbWOvz9ZAQ
         uQkA==
X-Forwarded-Encrypted: i=1; AFNElJ8PrBdywRkGX8+r5r+vulLwKrWufjcK7FePjW1rKgV+6fgokVsvRy3MThNmpCMyr5urCKITdu6Zb5zxV9j0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzppp6lT/HyN5BVORjriBXfLHB1Eg8sheoNBNWJ2RPcYHJoQsOW
	+BbM3kwFY6IeU72/uoWlf7lITa43cZqAR7NFopYPeSQvXAvBSPxG1A1yLP8wHJIw8DwCo7lejk2
	P0WgBugvGAalPrWwzYX5C09jRcp2N4+/KkDEZpp9MOmOF2uIPyCAfWvpLb3jN6DPQo5UC
X-Gm-Gg: AeBDiev1tu5S7OaAmIQBvVD0LGeUV93N4u0vtEkum+t63x11cvAghLkG1jWPpPn56cs
	SRMOJrfaQ+Xh1DTvlMZnYPFmf3li8yl0Lmu8mPlBpfmvq4mkGDgJxspuPA8MC5QgBP2QLnexKB2
	Wra7A4dXtP6nny/5TZpBv1f/TlxMSt+fPgo4tpk/UNUp2qeGnyq2MSsNEzQJBL2qDy8RcAhFvTS
	wLiLYrFPyLi8Ax7YN1euPEE0CSdwNPXjTag5yVHXBaJ9kqO6MlMr7Ga+/PCoRMtCjEwq4+tjwjr
	LAasru2hLY7Mfju5YtONBT/Ysy1+gDzTjtZ8Sz0yPzz+glH94BJwe/obPAK05VJNNW5dR0G97Eo
	045pH/d9L75h1T40aNB9imkcQuoFH0D8TZ7AQU0ejL3YXW8YIyXWQH3tco1k9XpqpGrMxIlG21o
	RZEiMJABUel9X37g==
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr640447e0c.3.1777563846777;
        Thu, 30 Apr 2026 08:44:06 -0700 (PDT)
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr640426e0c.3.1777563846217;
        Thu, 30 Apr 2026 08:44:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d4cbsm12589166b.16.2026.04.30.08.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:44:05 -0700 (PDT)
Message-ID: <a74a19cd-2a33-404a-b074-58a8d7d53279@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:44:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
 <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
 <269bdec3-6340-4b27-9b38-3fc1dfc958c8@oss.qualcomm.com>
 <de7a2958-e431-4162-b0a0-d58bbebb600d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <de7a2958-e431-4162-b0a0-d58bbebb600d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f378c7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=C5MmyifQ20IcwxlzDtwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: xju089ZhavMgHpigKiiwEUsj3tKaxJ5u
X-Proofpoint-GUID: xju089ZhavMgHpigKiiwEUsj3tKaxJ5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE2MiBTYWx0ZWRfX33GlElddrj34
 TR6aqPGn1F/Zlr16chYZTTZ8ePsl6LO9mCNlaWQ60PyTZIg50bRe6swvSneMFWvLHsYOk1e9kOC
 jwiTV2kBJT5DRl0WF0oExGvRhgutGfbqF58j6W/jBGJc8GUmSg7DfmJmZDe1eocZIFJAoG4Ngkg
 j7s2mqqUmDzUCC58igdE4/0tNxUGSBpGHwaWVHNuk+H1MlzmJyQxmJ22gt92P8jyFSG+Oesr06u
 YVd5dcXIkVdKpdZMxpNNTQVHzE49AEu97EqiOnUA8y7k7IWNC6UhJ9r5NQrF75av3m8RLqHUXBN
 t557F4F/1UotSPNBtz9En3yNxHJCmj1DMZRXPqWSl33R0xuL8XIDOC8Uf5d1AtdhymCnSfVWLex
 Wu82e0AUAcijDejucbc9WN4Ay06DRqXcUcFI8z2rp1sGkd4qXB883X5UB7QrTyhsEIl4VE3Wrv2
 1bkfeFX2kMNrYEsY+1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300162
X-Rspamd-Queue-Id: C5B424A508A
X-Rspamd-Action: no action
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105383-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 7:22 PM, Jagadeesh Kona wrote:
> 
> 
> On 4/23/2026 4:43 PM, Konrad Dybcio wrote:
>> On 4/22/26 8:28 PM, Dmitry Baryshkov wrote:
>>> On Mon, Apr 20, 2026 at 09:59:00PM +0530, Jagadeesh Kona wrote:
>>>> Some PLLs are already configured as part of CRM(CESTA Resource
>>>> manager) initialization. Add support to skip PLL reconfiguration
>>>> for such PLLs that are already configured.
>>>>
>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>>>> index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
>>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>>> @@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>>>>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>>>  				 const struct alpha_pll_config *config)
>>>>  {
>>>> -	u32 lval = config->l;
>>>> +	u32 lval = config->l, regval;
>>>>  
>>>>  	/*
>>>>  	 * If the bootloader left the PLL enabled it's likely that there are
>>>> @@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>>>>  		return;
>>>>  	}
>>>>  
>>>> +	/* Return early if PLL is already configured */
>>>> +	regmap_read(regmap, PLL_L_VAL(pll), &regval);
>>>> +	regval &= LUCID_EVO_PLL_L_VAL_MASK;
>>>> +	if (regval)
>>>> +		return;
>>>> +
>>>
>>> Why is it being applied only to Lucid EVO PLLs?
>>
> 
> Thanks Dmitry and Konrad for your reviews.
> 
> This is the function used to configure all Taycan PLLs, currently all the PLLs
> configured during CESTA initialization belong to Taycan type only. I will recheck
> if similar logic is required for any additional PLL types also.
> 
> 
>> These clocks already have a an .is_enabled() callback, could that be
>> treated as equivalent?
>>
> 
> We already have is_enabled check to avoid configuring PLL's that are already enabled.
> There can be case where PLL is configured from bootloader but not enabled during bootup.
> This check avoids re-configuring such PLLs that are already configured by bootloader but
> not enabled.

Okay, that was the missing piece.

Is this a micro-optimization, or something highly necessary (for e.g.
glitch-free display)?

Konrad

