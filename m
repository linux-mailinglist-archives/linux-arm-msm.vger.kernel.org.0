Return-Path: <linux-arm-msm+bounces-103527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BKHMpsp4mmQ2QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:37:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B841B433
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96AD830378B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6530038AC8C;
	Fri, 17 Apr 2026 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ga3R05o2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmELN605"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDC5383C84
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429440; cv=none; b=BxrSirE1Gek4L5m67Er6jSDxFeG7uI4fHMYAYNjsmy3rg1/cF0D45VRFRkBp9aU7ccebuC0dWE2ko6MzyqLImX4vIhJ16rJzp9/d6n4Xd3+Ph4YewfzyLLOsBI6bF8A2Ycf+J60qCTdgZHlqySxq3b5buljZl+PeTRODnD7ffsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429440; c=relaxed/simple;
	bh=N35rTkhOKN3ePSz0lSG1W/FT/xQCyJLnN8AHKDEboJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BaRpZkVqV8GHVwwRnowx3VAaVnmiZ653uVtLqyO9Otjc8nKGStqT84SJA5+BnMFC0sqWcMbT1bfS5yjHh20m1yI8acSfTVVw14AjVCNCWe7006vVfhZBdCI0Rs/8pwGxEvKQsU+FzD8gzoKt/MXVFvzl0y0SJJDwGtfvRYfEX7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ga3R05o2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmELN605; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H88YZ2667778
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 12:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syN7s3fwKBB2b0e/L5u7fo14eh4La/wkEmwmtd3jb1U=; b=Ga3R05o2+xKIKWml
	x9yiWLHQ6M2INngNQPokLoM8uhOWhJEp88merHbViBOqB10gOI5HtU0xzdj5LLcy
	JDVOBX5EWUdHqA7wrTXsl9Zo21IAcnQ9unz4l27O+jtUgcVFLMrjnfPtXcsinddK
	XKko5bf23ekjFxSkS3517Q8kkFPQARMvE8it/K8ljWNAK9RFoaYCR5dOQAGKqQ/8
	tBytvuO/omYdy9ut+G8E6NdARuCJsfAbS4nIo1CVyMmijowfaBV6uLTOMFx+Otxp
	gELRio8uS+uCDMTFGw89YcrLgYKlstd+ve9FgrP8rYRpFIUoCdXWT4IIrgw2vrTh
	FYwSqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxct7u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 12:37:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so1598251cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776429435; x=1777034235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=syN7s3fwKBB2b0e/L5u7fo14eh4La/wkEmwmtd3jb1U=;
        b=jmELN605ZeZaqjDzEX0P+Y4Nf1XtLUsNNZz+dxImHBPwODTFBme0aciD21Xd9wEMgk
         7gtBy1VBVEK63Ihw2CGbpmtTyogizoJyEyZIu8Dr6gK11bU7X2nGJDedJkKD4vMbsIBH
         56xqd685CXihv5T3wvaye7c3suS6iUBh8U4i3r2r/zoPps6dxCfu7fB/XFxJwcqJBiTc
         R14KxbRVbETLtQT3rvsFH6pm3lu0HqRXMMCtmgG36db9rXi+usYGDUkPp8EjMI0J9vO3
         Zc2ULE8sVzrIPB1xwknNN32vFoGouBtIImCq++7ZiPiux6oWRClcM4k24CeEEHTNxic4
         L04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776429435; x=1777034235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syN7s3fwKBB2b0e/L5u7fo14eh4La/wkEmwmtd3jb1U=;
        b=Oh/QvtiK/ADPkFDZCVXSZ1marePmlJQs7uxQA6RDwpQISpzBvlQ8r8dNbIWAFNbL3A
         +YJBj5QCxRSJh6hZaegIf7PkJoN5vFCxMjX6JS/bPrh6npWr/19hC1e19bgl9cVDq5LW
         iCSf7KaknqAMheDjkNwBEQkSSuZ2LDb45vGGfXlRmPfKRqlObFl37PZLC0fBcyI3VjZE
         RHy13BeLu+7bBlfiyxmYEsYPnNmwCy8N0wGQUesJ5jdZ7jLenGUp+BAfl+QbmY/TUGDS
         A7Z1bLHyUGcM2adz9e0BmL/Rcg7PDwAXtNjsDXNc2m8woRaVj+vKT5n5Pk+yJKsdWCxP
         GUlA==
X-Forwarded-Encrypted: i=1; AFNElJ88iegECw7YsyS8UmLG25AQJauj/U4oasMWk7BmduHBmCUoTN88DwHT2MCNBQEq8Ey3qNYWyBcNaqYviVun@vger.kernel.org
X-Gm-Message-State: AOJu0YyRnvwJbfHNr61/edWcSELsr5gs5OWYG/s+pgBSIPGrAzwQLdk/
	esTE9CaNt6SYZZYq4+rr/k2fIVEO4JK86JrlIyY29vGUPDqaVVBjoSU7cYLQ98zyjmwyYiWi/Nu
	b2tq62tsLklS0DtfAb/9SsueN90Cp97GyrFKYTdG9DTFJhDPNKj46rC5p5kTSWgbgO7Oi
X-Gm-Gg: AeBDiesthpMOeS9CXbboHOysFj1fQw+uNS7J3utOaq4+m6ih2eYMzhcfAoOjfWlcDty
	gMYDloroJof9X9gtg3/vDwbMyFv6RjCdcjqrCsOCN5Y9sN3JrKzpiDBF8BRWys8hNKX4/ERQgq5
	TOm+Up6HK+XSRD7/sQ98ZcSUrxKFTcR3poFPJgagyiP0FOZxOaVTFyYr9pXLfcQq33DVrjDhBg9
	qIMqfLp+IEncmEp1kzSJ0t5TG6jflTZ9Ku70JpSYKuTD1gDOKI9gRYoIPSV4NjIjhP4bJOCD01d
	sBs21w4f8/VP7Asfb0GPCgmrgcGAsp6BZ5qKFoSJeaPSOtKYD/tf9gCHBxFQrK0eYxogkZ8e0IK
	E8zZalmAEdpXRUAhn10cD/GfT+0Re1BJIXVxsm6cyEJ8IpxhUr5vqZKb7C8pVBh9ypzHLvvBGNw
	l5P5QRlw392VaoHw==
X-Received: by 2002:a05:622a:5c13:b0:501:5260:51e9 with SMTP id d75a77b69052e-50e36c65be4mr24028001cf.7.1776429434888;
        Fri, 17 Apr 2026 05:37:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5c13:b0:501:5260:51e9 with SMTP id d75a77b69052e-50e36c65be4mr24027521cf.7.1776429434320;
        Fri, 17 Apr 2026 05:37:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4512115d6sm52459666b.7.2026.04.17.05.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 05:37:13 -0700 (PDT)
Message-ID: <54ab414e-a33e-4cdb-a125-5a980ea7e851@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 14:37:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260228125431.23098-1-mitltlatltl@gmail.com>
 <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
 <CAH2e8h7W8Tng4v9Da9c7xg-oczHgNcMvz0OF6A27L9m+Pw7iZA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h7W8Tng4v9Da9c7xg-oczHgNcMvz0OF6A27L9m+Pw7iZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e2297b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IGz76sYE0BYaplGTJ5AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEyMyBTYWx0ZWRfXy+6yAqa6nGao
 paB7s89oHZ1RtIlRZWlURCHqwvmAWClo7nqJkLajZVuhPyETG2hc2H9hjQMHFezJRLmXcapWcSi
 JLqqDK1wRALE/8w7GlrGlAov0RukGkDYC2KSdqNmU1seeVQh5weXgL2/XE6AHTAMapK7fQ5eR+j
 xZpytaG9lGeKW8SRxQ5KlTScCHE/mKk70glgHIQqXUWZqD1RfB7J28BcCcVH12ciSffX+2Gw/Qq
 nV39I7zkIVAz9+2yF1jzDeGKWL1dVibPI5xpT1jvC8uKFV/W8TEku1KsQZA7aiotNQk4TqxZe4c
 LG7U5R8JkX5J5a2FuI0RmJPkDrkTD2ICSC1xc7usXWSfvaju38uqOiEIhhYFkT2DOR6Cm2KHQF1
 4pan8czEUr+3Cy6r/n5Cll7jqGYiQiCNroj8U+XKg8Fjpu02P0hbXYQhBMz7t/z28luH8lQ7GXI
 x55x+ca18S36sRwuH3Q==
X-Proofpoint-GUID: rbSeugUAkHRUiESyBmi1L6nOCEO7qp6K
X-Proofpoint-ORIG-GUID: rbSeugUAkHRUiESyBmi1L6nOCEO7qp6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170123
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-103527-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 627B841B433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 2:23 PM, Pengyu Luo wrote:
> On Sat, Feb 28, 2026 at 9:13 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sat, Feb 28, 2026 at 08:54:30PM +0800, Pengyu Luo wrote:
>>> Use it for the DSI controllers, since DSI nodes have been added.
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>> This patch depends on the below series:
>>> https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com/
>>
>> Why was it not squashed into that series? I'd assume that DSI nodes are
>> incomplete and are working "by luck" without the refgen supplies.
>>
> 
> Today, I did a casual read. I found the register(0x8900000 + 0x80) to
> enable refgen is always 0 on windows. The refgen driver may be not
> compatible with sc8280xp or the DT configuration is wrong.

The Linux driver casts a software vote. Most newer SoCs should have
a separate hw line between the PHYs and the REFGEN regulator to take
care of it automatically.

Even if a little unnecessary, this won't hurt

I *think* base+0xc & BIT(3) should tell you whether the power is
actually flowing at a given moment

Konrad

