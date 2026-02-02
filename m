Return-Path: <linux-arm-msm+bounces-91466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAYxAE58gGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:28:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FAACAEAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFE9A3004429
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923302F90C4;
	Mon,  2 Feb 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHwzmmPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTH0yK4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39174356A1C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027484; cv=none; b=T0pOSA7l1SIyFOdHWxCwxF6kJgW3yhsiEOpAsDD02TwqswOfqPjMp3PIXu+SSe5GjSTyl1KmYmwrrYgbgaBcWsLoOFjz4Da/zAQhzbJSERpJT4yfmB1LfBXNzI0j7npOO2MCHO3EbuZ3P3x7EEkuC0ntmU9rCzzIjOKPEjtaNY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027484; c=relaxed/simple;
	bh=Hm29zKjlzS/nFNKeeCjAFxNpmgs2NUQSFZfItnl3HsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAcmYDR8XZaVdSAqqbCihT2U9pe5K/oGHiqbdC15ez/KqXJZr81gyzXfzd8oJsAf+VckopCFnvO9QZbvMwbdFWEcH8AqbVal5vsLfh1ndrdb3QhXjNjBh0JiwtfEga7VfS0CFuNqwJE/99kE0QW/VkkEXxnBWkXAC57CanMAWHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHwzmmPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTH0yK4k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612869Ko1865799
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KxbnQdQJm1N1N9qykf0wPd4VrSMSS2ChcNDcq6NCmU=; b=ZHwzmmPlVRt4di4Z
	spAPTQz7VcZAyHat8qhucazcXqDsski/UCuwRjogxdjE+MD80UNdW6MywaIEYldP
	tKxjCRsSgXmZI8D3QAYu50NNOvhFasidD5RMgc/1vw/FO3UFUPdt5AR1f30On38S
	rtnL2KWbk8pcCPB2M+CgU5n+xOc7fgdDy7LM+XrY92uF3YmdROyBIxI+UIOxUbQ9
	inqwUTsLpydKvFMZmy1Lk9+jMB4IcKu9Q+sxMnqLPHj8rSZZiXt1/5OhpgPq7iKD
	fTB0e0vFl5jHN2pt1hohO+WiSPyF0Z7XxtBZpgLWHZgbAMxHsLQvVqxyE0g3g2/a
	9fBzwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnn1n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:18:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso91869485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027482; x=1770632282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KxbnQdQJm1N1N9qykf0wPd4VrSMSS2ChcNDcq6NCmU=;
        b=gTH0yK4kfCaYo98Q1HgtEUXVfZ444kIyd/mmLBQRH2OdJKnNlTRomq0uZHDfNgWefj
         gr44yUybJRZA4tgJaoteR+iDaKZW0e2mg7JMD0tbrnkTN246M3dBFQmXZJfSJk+8P0rB
         N2d7CL1ny8bBWrh9DpR56HlSHk4CVURYJVLALratc8VdzYZcaxvTwuJtbI4Ajz+F4a24
         qjxbRm5oP6/wQy8HKXZy9czhT91EnG+jTZiFshJb1VxeinTJnnL6E9gY0HdHqTUWj5JB
         xrmPNbfEWBD/6knCimnPKkPk7fWIHoe6zBRsyoSaAZvHwriJKnTSIrf6oIrX10FJTQQa
         l1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027482; x=1770632282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KxbnQdQJm1N1N9qykf0wPd4VrSMSS2ChcNDcq6NCmU=;
        b=pKRpsqz5GGOa1UnXM2xu5BTU66ppHxWQaw+tTRZEJr1PvpC+Xxsr4q/0BaPwzzQLPj
         lHkp/oV3JDLC8pIZsnYN/JVhIkCzakYx3ST0TkSBArsfGapai+H0HkQUd80zdge50Tx6
         apHO79PT4y0cEEbUW4zn3sqSqQCgZQ/JaSC3Jf3c0gl5I0sbVQTUGPeOUxyrDd2OQLhU
         P+6hZkAKlHY9uk7VICcKsBqxCaeG0OUDe7AmSRdHc0Yv1SOIffCZMGB+vNi8fdgUypl8
         9zGShCafoBgyVzqKAAfgqYbrlvCHAv3f7xNsiEkJm27SrUA8c1VRIfUV10x9AHFuBGeQ
         FV4A==
X-Forwarded-Encrypted: i=1; AJvYcCWTW9YmyceHj9p+3pR6f8JJ01u/aCKdK+QoqQVTWZPqtShQlXJL4jXK0t6GLjHJvOfy4aw9HZlLLtFbHSl0@vger.kernel.org
X-Gm-Message-State: AOJu0YzACt3ucXKOO7Gl1oZO8EzqIOeM7cDmRKJn2gcZACA85fJb0L+d
	8VvTJrJYHGC63gT+GtOZ8Ew7UU9+/ryhxhVC6rI31kjcVJKhcTlJcDZ4OUfPsM0/fSxWz2Q67bs
	CaAJW78ZU0oefWApYY7O4mcq8LynAS81yEKnht8VvWlrg3bYMEBIg+aKZ+vv2+ujBfhr6
X-Gm-Gg: AZuq6aLjCQ6eoq5GYHfVkvKwenn0gT7BoceUqTas5TQXZyQORZ/7/MO6Gm7n2BFovca
	gsZDVwFsKp7zUy5pj1SqkR2+nckrWISL7gCFmR8mkaLPjyoaCgv4Dt/EBx2CxFpp890eMVpCaAv
	Y71Jpydq1JsdiUQsu+pksdKJaYzVMN6F9JS0t5yJMQ+4ttCuIx88v//pAhSf9j0HSnprnR93XK2
	XNaDKirBUxYwbVA6vjtmvs+8P2C1CVQaUNEMK25dcyjsWyrG0W6g4+kPD4mFnDF2NLS1eeda1cU
	u5JIJl+58Ng7CIEH9B3Fr9mQqmda7xMfNcmivt4bf8kG+fZqvqGstRWV4eTe9smQ16KU4nn1iRn
	dnVOD9epYtMD12I9WoP2it0+WGZV/p67Xm/xyJA9FnGShyKoZJZystsKFU3JcXblHsmo=
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c9eb312fd8mr1125627385a.9.1770027481581;
        Mon, 02 Feb 2026 02:18:01 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c9eb312fd8mr1125624785a.9.1770027481022;
        Mon, 02 Feb 2026 02:18:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2e0619sm840508766b.59.2026.02.02.02.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:17:59 -0800 (PST)
Message-ID: <330d3cf6-391f-40de-b889-7e14f2a83477@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:17:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
To: Andrew Lunn <andrew@lunn.ch>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260129172850.1175728-1-umang.chheda@oss.qualcomm.com>
 <20260129172850.1175728-2-umang.chheda@oss.qualcomm.com>
 <8ec07e5b-b83c-4e76-a49a-933420ab55d5@oss.qualcomm.com>
 <2f06ef50-619c-4265-823a-97e47d2f279a@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2f06ef50-619c-4265-823a-97e47d2f279a@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ub6ZhTbXaYp2ogJg_JJ3sJOxQ44DpQJa
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=698079da cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Y66B0tY4aEQZ0WDv4vYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Ub6ZhTbXaYp2ogJg_JJ3sJOxQ44DpQJa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX15LUFmBAgeFJ
 wyoz/Bu83kbdzNXHCDq5zrHODDjKgOHLWH94+Agyv6jLJWdtn1ms8lBmXtwTvzDz9WSJM1KZm6l
 t2/Qg/0euB/Du7HDvp+wS+b/WVzdey2pG870ujceQ339iAGntgLV6fwwbbWPygUwdUylZu/fFFn
 A/Z//+sA3QMNukqoul8VwJVoGiJzAW868X2Xepo9oRZqT528ShLZWjJ2uyKL+2C/IqZs6tTWLCP
 S2AJUX1o0zoz8q+JGzIKHyRiXdqSgPYBxxQWR+zuaTJsMGdilrH2M69DNBUVwygwJuIMFb5TGjr
 z9HC0J4OuS/epXc9n8SRRApfuG109NFDxpWnEOHgx3xTaAWdIcCaIufxympMvIs3jiZpqv9ckvO
 aCW8SWGx9q9OwxWjkyG7tRAz51RTP55CI6fgHGjD+KkyOScfGdvl+A8VaRYFglQWAicZOaWTQAC
 H8f/oTdL64G0Kp7WnMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91466-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27FAACAEAC
X-Rspamd-Action: no action

On 1/30/26 9:11 PM, Andrew Lunn wrote:
> On Fri, Jan 30, 2026 at 11:53:09AM +0100, Konrad Dybcio wrote:
>> On 1/29/26 6:28 PM, Umang Chheda wrote:
>>> The Mezzanine is an hardware expansion add-on board designed
>>> to be stacked on top of Lemans EVK.
>>
>> [...]
>>
>>> +&ethernet1 {
>>> +	phy-handle = <&hsgmii_phy1>;
>>> +	phy-mode = "2500base-x";
>>
>> +Andrew could you please take a look at the eth setup?
> 
> Looks reasonable.

Thanks!

Konrad

