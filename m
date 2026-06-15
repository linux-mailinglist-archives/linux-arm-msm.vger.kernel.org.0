Return-Path: <linux-arm-msm+bounces-113092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tdCAD2eaL2phDAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:23:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA2683C06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:23:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="T/5dfKLW";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D1JqGgmS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113092-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113092-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D2BC30080B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142DC3B0AE6;
	Mon, 15 Jun 2026 06:22:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1042F7F1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:22:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504564; cv=none; b=XjUIgKCZeInyPeIhxMebcX2ilAXminBL5Kgp8J9l6p5nOXhaZiHAh7Ky4wp+Ns2Xhu0sX3SVKy0PpZJ3iPEZf5nQZOh54JQKxyIC8TbhTDLD4Pba6vN4CHkV4l22nEnt2mniIeSrInJqYN7zaprk5tUJ+xj6pIALiSw5aAM9+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504564; c=relaxed/simple;
	bh=/jsk2c0jgIq0uFJmJJ4W6J901ish66RM16aaQCUYz78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIpuXR4hYXsYa1WMCwKzedAukeHmiDH8iAGtaJy7OTqflSRyrxjXUVm9hyZTxri1UACdNihsn0Lzc8i/WFUX8Uw6GMVazM3jgyJJ5qvq6E39g7kKZaLIf293pcYwzHTXLvBgJEp18s2Hu2UrDjBif/jjp8mXGBXlKsAykJ5OYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/5dfKLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1JqGgmS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IoSk1835850
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jsk2c0jgIq0uFJmJJ4W6J901ish66RM16aaQCUYz78=; b=T/5dfKLWztHkVpmS
	1M/FLGog3WuijyPRLexVZhz32FRyB2+CVS9mmCPNHQyOev0/w3bEaxYPNUjH85gr
	mOap+6ccA4oPUH9yRrh3RkyexfOR40a5HHIlXf3y8P8bcxXggzJkGLZ9/xhkOgK6
	PX+xfvNh39kMTnv50nf38TFUpmo9b9n5+WyK586sKbFhxFkToxmM3ePx0H22eFM0
	a+bC4rmd7swzF2gyViqjoAwMdz6+iWFT5PV2Z5SASNV1m3VaHXuGNYIsqGnAOEBh
	DvRveMQ7lrlNHqMQBosUKkh86T3wdpDl+fLgxJzWJsuhfFNbvBfj0hdR0Ly+hNiB
	i0P0hg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffntgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:22:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2887501a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 23:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781504561; x=1782109361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/jsk2c0jgIq0uFJmJJ4W6J901ish66RM16aaQCUYz78=;
        b=D1JqGgmSNVGwXasUjVQ0HbAwuJusQKASiSgqEhmMWs0EJd20aMbfJpxyj68gPrFb13
         kBd5YEddQ6s/tCBAiadBusNABfwNH+D+BMDzsBb7DzQ0ulBUIV0tK5wRtI13j2r0Nv2l
         AV1vcSPOMBOHVhAYK8RyM6keCvIFLjmlquqJ4jZisxZO/XTNuoKb5FSXSKdI5XK01oBK
         PAO8svnqsiVlQrh4Mg1EV1pKfDsgNdCcYUoIiPeEi7/3p8zTeVPHV01nEzPU3achobwe
         641+jUhPHbH7dz6AsPsQ9oO50IPyH1GdpIE7/r/tqnA85r4LGan1HN3k/vVoUrcIdlMZ
         /3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504561; x=1782109361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jsk2c0jgIq0uFJmJJ4W6J901ish66RM16aaQCUYz78=;
        b=odnTz6tL6dJHHLio0YWBomrQF4cVC4GhJEd/83Ei3sp5ywV3oKLjcslTn3XQBuzwsC
         PzRHAKLo32+aM+o8R7C9m9oMKLmH361zozYbAz9xyQ7KdE/8Ukrf9qJyURnq/cByBUW3
         cN3DK7NZ/BJ5Pd3th/S/dOOjH4wuzee13hMKEx8V4Asxk7U/lsWmkg3dPK6ydlNh83UR
         /ypsRQsqFXdzZ+Pb+vqNhosMziksOwFvPkOpqjAL8hgzDbLa7dQZIkQIbsy6BH9vC89/
         oC0gL5G8/2HalD43JK25ipn7wc430TuLDtgYb3qjHYOYf54d0IPQpBnEIoJO6J7FW8+A
         uUsg==
X-Forwarded-Encrypted: i=1; AFNElJ9fAX9coYrvcP/MlprHCSsrySSIGj6rFbZt1diguXUDp+93CJpEzIfK1J07m/erxTZH3EC5mdfn25x8M/5N@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbR3SyPQswIdNP8YhGJAEgbXn5vybJ1e3NuydPAsR6/tjjNd7
	rPwKvVv7DEporXWosPkgNwHm5+YY/hvlc78erXgsp91P51CgFQ/i0rTQq5C3tmv66aovVNoCxMP
	9ToDBbJBZrrrYCK0/WHrpzdSRPVGbmrNCzLcu6TezDM03juRnJB8RpuAA7Ms2Dqtkre5mIzj7CQ
	Mk
X-Gm-Gg: Acq92OGb218tEr92i4OrFOhw7wKl3+5criF/1b2U+SLnkH54xGWrrwjOVTB+vRdbAMh
	p78hO0TNIQfFP1me8eqPnYuN/DzA93K77NWnXzQCqZWyYwCHdLSHY5Ut3BOsuPdW1rQfWnp7OaB
	TxRn1z96POwwAqCyCpIVnSj9jcUeqXKRw+tW8gMS39fApfrH2g6Pw8mfNrOhWIwZLaTlk0NlUof
	UGFtPcUERlteT3fr+Cx9lB3okZoiIjxC7ZPcinMzYnwyyb32llbe94/qmX+/LWjRTzZ2SQmlFFq
	FCqWqm2KIDeiFVsPxD/6FNp0SWZmE+5el5+/J0ID5GBiX826S+odfS5MKprCgCg9y7y1GXy+9f0
	G/U3FI6IkAH2uIqDflf1ajpkX8AiNAbfRruYM3a5GAGWxBunzEFE2EP2uPPUAP1iBQQ==
X-Received: by 2002:a17:90b:1cc5:b0:37c:18e0:90ea with SMTP id 98e67ed59e1d1-37c2bd29455mr9723080a91.18.1781504560535;
        Sun, 14 Jun 2026 23:22:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc5:b0:37c:18e0:90ea with SMTP id 98e67ed59e1d1-37c2bd29455mr9723030a91.18.1781504560116;
        Sun, 14 Jun 2026 23:22:40 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm98846965ad.14.2026.06.14.23.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:22:39 -0700 (PDT)
Message-ID: <c3b7616b-8f88-4de2-8c28-0346219b7223@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:52:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>
 <20260612-blazing-brainy-firefly-d77a6b@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260612-blazing-brainy-firefly-d77a6b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2f9a31 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tHV2ojtu5FqpfGfkYVEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: nFuFgvarReQAUCOWl0shQMwJoj4lYPI7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfX8o7EEDVG7wxo
 WY+ISfa/oC0uRk5ZorRxGjdprSN//bQFSdVIETq19WBH0sFLLCmzIPOJMEwFBKtd5gP1SmTGw4R
 xhQxSsbFTeY6x+PREPWpqrKo3wRh3Ug=
X-Proofpoint-GUID: nFuFgvarReQAUCOWl0shQMwJoj4lYPI7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfX3e1HZR6po2nF
 uqABlmevcmKmkk1ZLH7k3knLaE73f4rJlMzFwVU4mEVEPecu10eblS4BLn11SOStHo+Uya4kjRR
 h6aTvVA0SgeO8CPRDSV61zCcfDdQdqvPQY9bFlhOxVZNwpe0vyrSPY7EhggtviIgsni2RWFTfVm
 56VpQ5mehc5cEiX9Hsclc4dnPzgCnsdjUOTNsdP2poriyU6ouCwQdG+KzQd8SOwj8Nq2nU5YK5O
 83PefTHcwGzXeuJDVC9ewhu3p4BVA/mKtUop5Z+Oo5WWBnFY1N47iU25VSI2rRp+YRRUKHlPhXC
 k718v3Yyd2tZ7PlRKQPO4CwXas2Kdy5DtmsrxOb7o2x3n6/tzKMymw3Fs8iqBVsauruzKJMeSs8
 tdFtzmx+TGn0Ex8VP/jQEOLpEmXba0rSXRQ20PLVjV2HV6mknc0GEavzmwXIJ0u0s4sI8ImRK8B
 hGfY/QKHbEiHWg7Tqqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113092-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51EA2683C06


On 6/12/2026 2:32 PM, Krzysztof Kozlowski wrote:
> On Thu, Jun 11, 2026 at 02:33:17PM +0530, Kathiravan Thirumoorthy wrote:
>> IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
>> USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
>> REFGEN clocks to be enabled explicitly.
>>
>> Document the IPQ9650 compatible and the required clocks for it.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> You just ignored feedback... From me and Sashiko.

Sorry, I missed that. Let me address that in the next spin.

>
> So you got the same comments.
>
> Best regards,
> Krzysztof
>

