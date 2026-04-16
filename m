Return-Path: <linux-arm-msm+bounces-103416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKEgB7vm4GnhnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:40:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F5A40EF39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40D603059310
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB7A3B47F1;
	Thu, 16 Apr 2026 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKzEQMnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUdwCwsJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E13BF680
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346426; cv=none; b=Hna8a7HcL9Fo4sz8Zp4joFrGu2G4z9OhSgZDNRTXOo6Z5AyTZ1wGqGrN30r1XORMb2MOvU6IqGAlJrAQn2WTfKG0n92ltbPYogFFzAr+3vRnjpsIsfCZD26kWFmChJrtTmQ/9O4lgUTUjH1i8Db5SCN3sptsnn23ynCahF/XY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346426; c=relaxed/simple;
	bh=0ZaLZijLXXD3u+xQiSHAIo++4vJ6pw7HiIlwbtIi6Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhsHj35bxY8dNl2oI2nX1AS410d1lgqIZf7hZ3UPgwcJPT3csTawb7Qd4G2bVcDCy8+uXn+FVphHP85K99ioQiONuMXDHIhn5I0iF5dJ2pd1DPdx+ULGTXMInw5QIuK/ZLnwTpxENSO4qub3B0tuhVqS3TAZj4iHOojLKewWm2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKzEQMnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUdwCwsJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GCOutS2654732
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXaFwYu5q9PT2J3pfkVA8q6GTphn69FAyibCCzM/8SY=; b=GKzEQMncv2jUhCkz
	x+Jg4GUf/bac1n+cAcQmsTl2XyS3PKp0Puq4XK8lcYTZnUDDU/3UbxK16JHy3Te2
	l9V2vkhJZ8S9pk7RMdBFvicR4NFbQygDQfavuwRHQcjEYRPr/6CZk6SYDZKST8J8
	6Fqv01npF9jB4oSSSuqC9E7hmJ64AdQbZXB/OMikK/2wmD4qC8ZFnDdIn6+Y3Qbo
	u0UulKkCQfCyGTLrBcy6L2DNerouofQ3vOl8tgZ/quKkae9eP1RSSZLkTMRpL4/p
	FmUYrZwI5jmjfUc8o18+2hoR5yPhsTnQjXDjQyaotSQZPmyNkUNENNDs2og3LAUy
	i/Ak6Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuhfhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:33:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-610672f7120so355930137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346423; x=1776951223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXaFwYu5q9PT2J3pfkVA8q6GTphn69FAyibCCzM/8SY=;
        b=EUdwCwsJ/kYCxj8mqIXR87kbhohptaD/5umvEyC6tM2nbhAs3pzqX2V9FobiSVea07
         JP5B0ImsxYTIGIWrjKjbxe/iQRp1van6Oqrd4yK958vQMbgGmeGrNd5BoqVLoVKrC76T
         p2ZSSKQTj9Ev74dBzCm3GrCnEL+0a62WRYwnjB08gmIzEVSUHiuG1t9SH2SRO0QvPSL1
         Y0s+DKh7OHJyhn25MjOmGKyuIqdunwF23raUf81B8ZH9BsA2kwnVkirwD9cCfxERseKa
         UR99uAioKngAbNXnKvbXiiilnc8i4P7d5kl/n2YuY0Xh0Wk0DHWeHe0MP8UhQCoDuS/E
         onHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346423; x=1776951223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXaFwYu5q9PT2J3pfkVA8q6GTphn69FAyibCCzM/8SY=;
        b=U6fbFhLCNxynJokF6YSiQ1RdIiqnM38K2CMXvChtq6cwoII1h69z7ebKPzA38bpbtd
         E0lM8VNA+nSitDzbiGZBISBeiu9wwGA8KZ5mWevPK19xhczFfE0hezGAP7nwMb5NU9qe
         ZNUSmPx5rOLO4Q1esYK5wy4ovgUBsOwCVwGxC6d3P0v32AaMvRF+aOF8aK59Q4Srz+9N
         sl5qz9hLyjiuGySGaS3KPo4iLejqHGxZg2Gqohg1QpVIjB0i8+uY+1wLRqrPmX9ClHbd
         qU+WZuhHeTnU+NLCP6VVejR4HmM2cnbHMkPQMS3ZHMGCj9c9MXsFnVpgJbnZVBieSRty
         eVxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QU1vxQpj6niC3FI24pSpajEfduPwVwUvwGSOQvxCY30x4UsKts9uAyboCnk4Q0mrfKrNI9heFl0X1oPhf@vger.kernel.org
X-Gm-Message-State: AOJu0YzG2DZFL6B19CdRLohGjAvO+JNClynV1l1Bz8GlbVqIIcOBjYs9
	4zVOQOK796Kzn1bfPR30dxsrjSir4c7MdnskPOOMrruaLKyNtvjXLqFztf0EeK4/bJOvaFW/s9m
	6gcF/9NN1vVxf0G4anabO9vHY93rtaAtPc6xs8KeFX2ThnKYSZmBgbeMPvr0hQiM0UiHo
X-Gm-Gg: AeBDiescfqXdOil4X1/4VIEsAUVr/oC+8cAnyB2xrPbmIt2SIcZBtEhvO/eRcKvh3j2
	W6QwNVlOkUAdEgXiVJCX+oaBC9dAuMwpsNcPNX0m9sa+zeRDFs24UEtkWZ9OZB3m6n4/NNoTlRq
	HLTZzSaAx5mL1OIRqkckB7X3rn5+yjuo/7qzpFmtqUzpLTKNFnnIWPUkpXji5/bvv7Aqfn2uYVd
	S+wVenHo8Q+CVCO0NzfqEgWWf2kmYGEkWJaCCNJUYuVb4WZp2wE4J2T/7ZEzfGzVtJgw21ZRI+t
	COz0vPG6dxG3LeL9r5JNAdy6k+K7tgcYhdaqeG0YQupdgyR3aO7F5jHYEiyzeIybOgGCMC5o+wG
	mpwCM0aHAzh1vV5k7JK/YIxggTzaV/2i2/xGOgzAOWjj+EOpDCF5C/FeP4c6LEqaLe9rljJkFqp
	9sa0Y3lk5dzu3DuA==
X-Received: by 2002:a05:6102:30bb:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-61417a43179mr322634137.0.1776346423535;
        Thu, 16 Apr 2026 06:33:43 -0700 (PDT)
X-Received: by 2002:a05:6102:30bb:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-61417a43179mr322603137.0.1776346423119;
        Thu, 16 Apr 2026 06:33:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c3c96sm164875966b.36.2026.04.16.06.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:33:42 -0700 (PDT)
Message-ID: <68a12065-2811-48c2-8aae-95688bb2044e@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:33:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: msm8953: fix modem pm domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold
 <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-4-6098dc997d66@mainlining.org>
 <i6lymgal5c62ud3aas3qvzv6fjnjrzuncguwechraahmflr45l@5t5qli3k7npu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <i6lymgal5c62ud3aas3qvzv6fjnjrzuncguwechraahmflr45l@5t5qli3k7npu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HcCEqYlz4pmPhx72-aTwTHD2lac61b5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfXx7N//KzuDudQ
 i4NU4RfZ15JZv1XeOrVMUaQ+4aZqp3jOYdG9jLihKxUAXVfweKhMT9W9IjWWjmye5d0+AROCLYn
 48/oJS4MKSDeE00hNqkwv+lmmHv3Yo9csNPauXyQ6t2ugK2ZsuYrjGSgd9an1EXGWEdmGFgrlAZ
 g1fSL63T+vWamCIQt7TOqJ2ysg+GAdrAPw/zRBemP2l8exCpY/LZDtK4qsJQrOMDhpte/8Vy6V2
 //9tsC7saAA5S+KS7qRKUDV4IXtNsntJEoLFJ4lr9MaS7qxH6AWz31JhySVuEgk6S8ZzvWTtUCR
 elrwNMqdsrFBa8kDsO7WG6xyqJdsnS8qgXWd0/fPryt9YNVw+fqmXUuHRdQrR4DxC9XpLB26tk4
 /oHV89olzlvfFUn4QA320YRkGghkOSDCS38JyTD8EYM7HDQSYFiBt4PaXmxz/F0klUJVUqRlAgu
 nkw3dX6MqzVw4eDINCQ==
X-Proofpoint-GUID: HcCEqYlz4pmPhx72-aTwTHD2lac61b5V
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0e538 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=T6802ZzQLFeAEQQ1qNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103416-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75F5A40EF39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 9:35 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 09:11:46PM +0100, Barnabás Czémán wrote:
>> MSM8953 MSS is using mss-supply as regulator.
> 
> "On MSM8953 MSS regulators is controlled using the voltages rather than
> performance levels. Correct DT definition and model the MSS as a
> regulator rather than a power domain".
> 
> Also please squash with the changes actually making use of the
> regulator.


+1

Konrad

