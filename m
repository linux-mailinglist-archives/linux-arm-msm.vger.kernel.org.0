Return-Path: <linux-arm-msm+bounces-95597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGf2KERiqWmB6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:00:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3993621037C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02F98306504B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071F43822BE;
	Thu,  5 Mar 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNNQxBG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLxp6qN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F108370D4A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708065; cv=none; b=TjHoGZuGTgue+ooiMc0dO6o4IeGL24klgXwwIv8fLmANOhAcBIH2oKJGmDTbkgZI808eWINdCkepISHjs9Rk6X9zlG1uzrNl0f/EuIbpVthJOZRsxK57NAHvIxEVdwEh6VbehGrPgnPuOidnKtpzefGz9GSF5kW+Jg8YCSvVhRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708065; c=relaxed/simple;
	bh=t9QH2E7XqNSSkspumDdhkdVf9bsBSjDlV09oyzrTWAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLuCUQd4zJ+PmEOXII8z6vz+42RJ1YNOIrIMbCRgSyR+sTWf+8pM4zs5znvhHTuTqIuW000XEAw0jkwG9CC2HaZrnOJAnDaCNcKvYtVcUxK9UQbcWfqKIXW8DI7lSzCPnfirrtVtHv/uHUR0tluzIp2dlQhlDOTpeFx0WON5tUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNNQxBG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLxp6qN6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AG203450634
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 10:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t9QH2E7XqNSSkspumDdhkdVf9bsBSjDlV09oyzrTWAQ=; b=hNNQxBG/Ln1XrAnO
	ZvnG59JyJlTRowKozcHnRnB6BOhlEypeg27HMEDTTl2CKs68mMgd06goHSIlGCpk
	b/QukA6wqTxUzTp9Ms8ck6BxxErHBO3QSJJHi2YxzJq5ihGZdnvBs3XPgy1SBCcq
	j9ENO4fV2ahycXatss5qGyHxwOmjzFOpSY7Efed4wlbtGvgf8u+jBw27LcqqPPfC
	PHTPY6FBcR+QxB2uhUyuvefska77sQ+I2AsRI4T638NNp2dMvWpwpVAIu33gjYpt
	o8Ja9HvwMRoXs8bCS6xvcZ/IM6+Mf7wM5pCUK6vqHi6f2Xs60TVMWOAZkibalmxc
	8KMj5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj184dfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:54:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c710279d57so555950385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772708062; x=1773312862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9QH2E7XqNSSkspumDdhkdVf9bsBSjDlV09oyzrTWAQ=;
        b=LLxp6qN6p2NkGepjIQPVTKECq2oZyEQ09FobeFeYWWwriDurQXtkLln9xRzX1wnFlC
         NUSLabjYUB6KbGbE95t127WAxzh1zv+nZ9acXLDJqtp+OOZJsnbi/yhcJEBJpdML/Xm4
         HgmBRWHsE6QJsRwmdM4aTRJJyxHE0fvez371FYPmRzG86NRQ7ZDlTLR2vSDidyanVffw
         dSjZfZaD/sXZbZArWY34W2vSV/ExI5LvyZV+kLTH9m9gXsaespbws2vpI1jbJsX3CRzM
         GqZdmdyU05h/U9DKK8kt+qHOaH3GR0eQ1n4LP7UIONTsFrO62PPL7xCS6DtzK/pzUuy4
         HAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708062; x=1773312862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9QH2E7XqNSSkspumDdhkdVf9bsBSjDlV09oyzrTWAQ=;
        b=FJ5a2Acfw9OLbwPpawDGvjIOu9q8AJ2CYkEraBRAJ/cxaZA1ClAu5hwV0d3GA1cPQM
         Wzqtk2UEPyV+AasJgA1j47V6rTIn+n8v+Ok8B7oquHDkxoxq7dlKv/LAnoxPaKV+QxYA
         +4r0SdcInenpMI2ZQ1BBCTfC0HyhT9eQuHm0zusPf1jM9BOKtUX3Y2JEaEg/V5f9jcrJ
         MQDCveLFDu93VCc9CkBgqXoaoNs0+wuIJkfwPL0oj2CaqfIASKLXt//LNJxn1sJqPzGu
         Bas1z+50Arm3PLj9oafptjmXuTm6pDWxk6uk6HRHyVbaI6HrTjpZY4KOJhPmtWPgTOjz
         v8VA==
X-Forwarded-Encrypted: i=1; AJvYcCXB6bmKl6fo1ovpN2b0oLQdU6YUM6PdgPkLCah4+0UFHanG3Tx321egXPaz5bWVyJLZ4rt1CtCIMXcsYaZg@vger.kernel.org
X-Gm-Message-State: AOJu0YyEK69xhAoMCtURvpR1FzUUtCCY4oGhNkI4nFtndHVJJwzoPOvc
	ZT2DAdCIjTIUda+lXOhaAa4G2nJ5+iy9WhTnqZbNri3UcsFBNnqIFFXJ2qzQPvy+W01bwjihlbJ
	osiizFDeTSaYsy9hPyLCaNDuwVaXx7Q7HeGmJx5duCt7mw1Pqya59W79UtBzpJvU2e8mB
X-Gm-Gg: ATEYQzz7NgCK6wTyWXLqVWAuDxhtsYytpzX7Fmo7zKi8aL99Hd39khYezD6DDPpb5bT
	aio9+c1CCFzo7XET9aPsVoKOKZbsY9X3ZONTFdxh40bYwedOhMd0GL4Mm99A0fyJDshWToxu03M
	dAfk+cOEReqGSkCOiVZ4iTVKdWyhiJx3PMjV8ngm2Nh8LJ7dvo4GI2aEwSdj51VtHlRQX2s0ECn
	l1hsKqrGUG+PKQO2zQ31xXMnRcdE6t2CelGMBvZV2ejg5VhuTKE6H52F0CNYnAyfpXQ6PndoXGl
	dz9UatgfVfM8+KMvuoA06jpJ9gcIJvjjOkYghlhWnBBet5RgAKK8AMdXwNu84ks+b14gIr8R6s0
	E2AUTmJPqpYyxqk60N3zZ05fC8wAOar9E0KvCgM2l1aXwyRHkGpvQ4A4De2jo03NGKvDxqsEWtA
	cRBus=
X-Received: by 2002:a05:620a:29ca:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cd5afb6a0cmr465301785a.7.1772708062418;
        Thu, 05 Mar 2026 02:54:22 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cd5afb6a0cmr465298985a.7.1772708061909;
        Thu, 05 Mar 2026 02:54:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935a597d02sm892756466b.0.2026.03.05.02.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:54:21 -0800 (PST)
Message-ID: <f141a098-efca-46f1-bc1a-433ff03915ca@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:54:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290
 compatible
To: =?UTF-8?Q?Wojciech_Sle=C5=84ska?= <wojciech.slenska@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-2-wojciech.slenska@gmail.com>
 <5bba973b-73fd-4e54-a7c9-6166ab7ed1f0@kernel.org>
 <939f55e9-3626-4643-ab3b-53557d1dc5a9@oss.qualcomm.com>
 <CAMYPSMr2JCQCX69PGUk1=7=-YfBcyFDpqQ6tMQzFP040srBA7w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMYPSMr2JCQCX69PGUk1=7=-YfBcyFDpqQ6tMQzFP040srBA7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GDk4vl2oDe7ejNiFEzYQXPYOhTzN6C5n
X-Proofpoint-ORIG-GUID: GDk4vl2oDe7ejNiFEzYQXPYOhTzN6C5n
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a960df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ZWoRivunr3MPqjVuc7kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4OCBTYWx0ZWRfX631P5gqh06bu
 pwRFplexAJqd873mqKCy1xPrvw31zUtrO+XvhiyxdL+NYdnPycVXU4Up7c1lU/LpZj90su/WlNn
 xbYpTlW9xP2hyhizgypXEOTPybgnqlLTpBMYbYJAd3xXBV1MNSqZhPIeonhdHm6EeCsHsEYCyti
 YNipYGUgchbhZLxiz9SMWOgsIp8NrAnmHrGsc/EIx9a4rYUWrLv2vndwc5GLqiwqdvCy4y7j5QG
 MT0Rqbwp7gYtYaxS94OHBiwTP7XsGqjNTIBuzTp+VZoTrQXS4bv5/EyyQ+P4RgIjY/2r2utn3jS
 m8sFq54VQRs6Qez2r6swrTA89XYC8cMCBk8VkRU7/ETsAtX/cFj/mfQb30PFlsy3mJ8O0f7EY8c
 a21bsD2b76o+WEETHkdrwhM6Dy30jSVPyLlfbKf+nmQ9p3lpx+3iSm397jUdbKldTIVD8XMghJG
 W2h6b0c6CyE0ZoQL08Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050088
X-Rspamd-Queue-Id: 3993621037C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95597-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/26/25 9:39 PM, Wojciech Sleńska wrote:
> pt., 23 maj 2025 o 01:30 Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> napisał(a):
>>
>> On 12/21/24 9:44 PM, Krzysztof Kozlowski wrote:
>>> On 20/12/2024 08:35, Wojciech Slenska wrote:
>>>> Document that ipa on qcm2290 uses version 4.2, the same
>>>> as sc7180.
>>>>
>>>> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
>>>> ---

[...]

> Once your changes have been integrated, I will resubmit my patches.

That has now finally happened!

Konrad

