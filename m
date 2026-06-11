Return-Path: <linux-arm-msm+bounces-112650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ZvKHR53KmqPpwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:51:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D2D670076
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:51:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cDsFLljI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ppg6uprf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112650-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112650-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D48C3011E91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625183BB131;
	Thu, 11 Jun 2026 08:51:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26B43B9DB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:51:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167888; cv=none; b=ikKaW2IL6OcUb29q7+e0suQXKeQXDAMlWf4l0+dPY3BcFTk0kFVFJOmkoyQfSYWQNuNV9YsAU5CpU9bDS5HRzKpfsdIRDuNfai4UO9fawdZGs38rqO0nXUalwEmBueK3+eJFaNvG/mo+1JEbdod31tEAzisLJ/+ElhhnFyVI2EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167888; c=relaxed/simple;
	bh=STmh2RbwN40cLFWOlhRd8ydC0OnzyocL3xRtV9nhBRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3J68ufz+v6v2kQB97tUF8ot5sJ9AzVTCbEOpqKW5+ltP69txjbSqk7KE6FjGis9FkYrbrv+kow5ES+JG77COqZ9KA3JPAcoUlCV9vs1GBpfpTaAuFiiOC/9VKG6zOFJCqrfvUHq1XCul2e3ATuYGyXhp8+mNulof6yYRxIxVbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDsFLljI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ppg6uprf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GN5q3863656
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyo6hKjHbzZ6v4TOpLvO7C4Dc/CDiOLyso/EOxfU+EU=; b=cDsFLljIWt8OVYZA
	/DLvFB9FJ7TXvz/F8ninX2kem9+mNjjOLV7lNb0Q1VIZlx+pkhWn+XnKLRUVm/Wa
	0eRUxjFtT9ZvQ/wlUghCVN3Oz+M+BJ5Cu8Y5/WZUTo7B42zj0VEEpZxGyzERKVyQ
	AauTLXysEZ/9KqXVYqI7pthkYHnlmNTHyMbLxDy7k5T2GkpnYeCeA3aCJ6sWpW5Z
	u3qWfV4b8j6CT7WW2REDisQ29B/nZHX+YaZLNn/k8PEiLi6znOlRK4oohUV59kSo
	tFjZ+CN1kzu/sKq6rDOXTBx0feuI1XNiW/qGU5Xe9Qs22C/8rRLYFO/AxYbokQ12
	MVBSxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjkm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:51:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517796be724so16059831cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781167885; x=1781772685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fyo6hKjHbzZ6v4TOpLvO7C4Dc/CDiOLyso/EOxfU+EU=;
        b=Ppg6uprfsVva60K9BSqgs40d1dnm1pYmwx70DPP6eNtmef6sDINIZtb4sPWqWgazgp
         Q8vGEeZbmfaV8EAbVUHTfp1VbkGJCrUClPJoEpcOgD4jACSWep7kKsgQyccpi+XNyqD3
         vCn1KpO0Mt8RncAJI/DKl/770t6L8bxvr1ebGmTjqBhglnKH/Q6fhMyhZ+avKKJ3Aqd3
         5uoS2aRP7krwjp8NrWlqPiGpkEijJWyPsu0ksZu8X6MhXRJ6X254s4kMFeTqSLLG4Voa
         s6WzDyrM0aVVnHJi4M8faiZrbw9sA/MWiwKtyePM3idUBG3LuprQkyp/P4MA+fEOcQ9E
         aYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167885; x=1781772685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyo6hKjHbzZ6v4TOpLvO7C4Dc/CDiOLyso/EOxfU+EU=;
        b=YKhU33M4px38MRBUTp4i5sLLxuX3OUsXKn9AIywoUJZ+Q8yHZCX2XkWVgGEXDmSJsv
         /umFUTCU8cAYBSa46jcdXItuiu+6/hIUVLffd9Y9EalGWqflBfWK7w1/AI6MKOtt02Zt
         zMMmyQE0R39xke8G5bg5el2102qEumbA9oBwSEeR34ReyXnYdt34Rwf33ICgBfzM2YTC
         jrg9FzF8zln0ZsWMXMaF8YTeY09dIUrfEq7bs6ink4cylFkXCRUVMj/v4VF1eZIr0/Z5
         gebAiRCOw2ifS9zOqt5Zqy/ulCe0CrLmnq+0OIO5TA0N9fB0qYNr9pK68i5A7F/0Br60
         vomQ==
X-Gm-Message-State: AOJu0YytYuyb2fMFQBa5PQ6JbkumfxpSCcS0lMOolfsKdOJCtmV6mLC4
	rjM9ESedlDSr/WQGvK8wyKYIcorTPrqzyAGGDI/OEF2U3wCAe+C3ov3f1ehSlYwiF99yHZ546Mh
	jbDMEewIVcaR/fVE6Jlla9sSWkaRkr2cGPpq/6Ekc1RB4y+qDOsj1u2kFVvDxsnz464iQ
X-Gm-Gg: Acq92OF0epJgdMIeksz42ktcjWTKIY81u9Wfzer/ptPoZiadF7fip1wvT9OuM2IKLUl
	xC1si5gIs0v7zc9+1KiEmPjFSWwwqIAkTa+5519Jr7Iyv3LU8JQf5EZqxiyiW0Qowpt/Z1Itmi4
	meQm+UWUt9wFrMOYmUPJwgQ0/nctPWvVBbNGaKSzr4ekzrGDxIfEb+O5HgZNeq3SqCl7uprj7R6
	X0S8FX64qs0O0D6hueYvUmddWjqFSE4zMIOCQtpA31zBEszs8yebbrU/OUsP75Dq+/rtDJ2FQW2
	qAwCWQI2OFlZyqXusnLhoM7AKvu/+yHpHoRjDzPZreI76qtdk/kFzlcnDb7AtAqvmZh6Ex5MsZQ
	faTvhXn5MamBsxt8hI1LNrA4DIB5oifgjyZFCMzclQPGE8L9B9ZD5gJ9m
X-Received: by 2002:ac8:5a82:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-517ee1d6c5amr17027431cf.4.1781167885132;
        Thu, 11 Jun 2026 01:51:25 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-517ee1d6c5amr17027171cf.4.1781167884709;
        Thu, 11 Jun 2026 01:51:24 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb688410csm31719566b.61.2026.06.11.01.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:51:23 -0700 (PDT)
Message-ID: <10c2e008-74fe-4dac-99bf-194a1767bc16@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:51:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
 <amL4e4IHe75_j1HTIsmqE_GyurvudlyHQCPW14zs7ivHz0UnalN-yoknJwzaVRgHTT6ftSRCqDyCodh6ABCLxw==@protonmail.internalid>
 <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
 <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SXuaBUm6I85XRRKEo4sO1lXrlVyAF-rN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4NiBTYWx0ZWRfX/togvToFxx4h
 Lhs2GEi0Xk3mq+NUjs9q5Q19aIVRuib5bTomMJ5rQ8AjTFwpWroVg9DvAL9V8xMDvFAB/1dvWg9
 UPTX2B7WUvzepI30WI3XxJEDBU/1tko=
X-Proofpoint-ORIG-GUID: SXuaBUm6I85XRRKEo4sO1lXrlVyAF-rN
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a770d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JoSlTferZKbt7Xiq8IoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4NiBTYWx0ZWRfX5sE6ZPCCsnHo
 hKM0FcG+CRgJe56OL5yO4Ql4aSxjMDhyeLfn5sMGSrwenATQmEGjwzpVV4h/m/06k9vlwf5fbAL
 GpNK8b5ggyCWE8HscCot4LJNH8z9ep/KZ32vVok79Y/B5NJSe+5dTZhOY2ddqiUYI4WrIJrA0DV
 LxqjMdBtYD+CjL1e7cS2PHdS+JhVDo9OBqCvKvdd7kvcv90hyzeywzDD5rNH79EpLtgTF52vZxL
 6MKt82QPuL7ByazAMpTPW/XgGYVGt0f6gXVGzjDUABpZEN3cSkO07EG7VYiPl8LKH1SgbiRo4xy
 vNWr0c8Zv8o9Vo6g4s5qP1xzn0NTuwnk/O020ykmeaWCAvKcs+svsD89fVpq/FM6kWteuPRDc+b
 ANrd2nUhJA4QhczqKSQTuBlTHC2voZke75ZhQ1017xsJsIlPfsaufywToEEZLDGZ+U2chZazlx9
 p6D6d5w7k1unM6skkIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112650-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16D2D670076

On 5/25/26 9:49 AM, Bryan O'Donoghue wrote:
> On 25/05/2026 08:06, Jagadeesh Kona wrote:
>>> That's not in your overview letter so generally I'd advise to include things like "did X because Y" - "didn't do Q because Z" anyway, how does it make a difference if the values are static ?
>>>
>>> They are no less magic numbers that way.
>>>
>>> What exactly is the resistance to defining the bits ?
>>>
>>> I'll state again - when a vendor is submitting something upstream where that vendor 100% controls their own documentation - there's no reason at all to be presenting magic hex numbers - even more the case with generated code.
>>>
>>> Just update the script to enumerate the bit fields, I honestly don't get the aversion.
>>>
>> Hi Bryan,
>>
>> There’s no standard interface for these bits, and bit definitions/fields vary across PLL types.
>> So, common macros aren’t feasible and would need redefinitions per controller. Since these bits
>> are not reused elsewhere
> 
> - Asking for named bits not common macros
> - Reuse isn't why you name a bit
> 
> , IMO directly using values from the hardware documentation keeps the
>> implementation simpler, avoids unnecessary abstraction, and makes debugging—through direct
>> comparison with the hardware spec easier.
> 
> How are hex values in upstream code easier to debug ?
> 
> Without the spec you can't change or understand hex values in upstream code, which is the whole point I'm making here.

I get the 'understanding' part, but regarding change, as I said
previously, these must remain as-is - any difference for a PLL
impacts every single clock downstream of it. Some of them also
correspond to specific electrical properties, just like with PHY
init sequences. The existing values are a result of tuning and
silicon validation across presumably many, many chip units.

There may be updates (very rarely post the chip going into
production), but I'd assume these would go through the same
testing procedures

Konrad

