Return-Path: <linux-arm-msm+bounces-112502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 44yBJZ9uKWo+WwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:03:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D0F66A0FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:03:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UnrbPtSu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M7w7LO8b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112502-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112502-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 361333048B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA13D231A23;
	Wed, 10 Jun 2026 14:01:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21F4275870
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:01:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100074; cv=none; b=jRf4ZLoYeQdCmB9CGbsECRaHeiqkVD1GBmKpEwJQJG+rML8FDBT+PlvUNLbcC/GEmpl5RRWHU0Gr4Hgtp+OsXYGDyIfChKrOryEnFD2PIF5mx86JwKYdEGde77MThRNEym/84fGP+4KERG7cJ3HhgJN2jG/MEvT5VkhlD3On/mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100074; c=relaxed/simple;
	bh=4eiS+kUYjXkA/CvALLB6tTd336SKOSdr1Q4pSJh2b74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meOggbloIzrfZjA+DN4l2bV3xn/BQ73QTSsMhdSkqgLTJo02tVnQJBPYOwMORKyhaH/mvl+Cz+vbnmNfoeT8cbYz7vFvLjNTqrhSRNgwEUq4tDdgMoFx+R8mjqIT0PB9+GcRou+e0EOcgC4qVx8gKhaZR2nwQ8WVyHwUI5vHoXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnrbPtSu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7w7LO8b; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC5UO3764365
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aal1Mp+rcNQykDJS2aT5UL079LVfF8dm4C64yY/zbBA=; b=UnrbPtSuKMl/ItjR
	Hm1ylDUS9YOsP/YxGefG+vJZlVfmd99/ZUb1UsYt9NMw93lXx5oTeinUYkM3p8qC
	xNSZ0/Tjva+v13f66TwpQAYuzhz4ZwNOJU834H+SSKa3vc3/olyym1YWcGmZFruS
	rsSQbyHfI+1yORGDGnXK1bhH8EJhrP5w6S7P9Cli0kmPP22GsFckAJkH3krglB6J
	3wU+orXqwY1MCeTDaE6CqMikVx8dFNBSz0LdYrYdhcmA2syKS/OlxWsQsUka+hnO
	EbIhnQXbkDmRBL2Yl/hOI82EulH4SP6wDm89/+R/Jdndn+z0JEDP8EdyDPifMsP4
	yMhnsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnets2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:01:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175bf22b2bso12711431cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100072; x=1781704872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aal1Mp+rcNQykDJS2aT5UL079LVfF8dm4C64yY/zbBA=;
        b=M7w7LO8bmYVC0Q1cdNtOjYLtLC2XvE+YsdFV/CgPs/HmKg95QqTLbShp07qQfypMus
         2XeALTpe4gqPiahdw6dZA8MDNMFmfiQlkyXzJdEr4F/8gyhRJVGZZeNKpS6ofBdUi6SC
         ld4oyoFe6zjWUDRr8RKq2rkIkjZqfoNunAN/O6kgYUjvzPPvL/sbuU5/5/76y9rTfV9+
         xJ3zb6g+WuCb7D/q+RUGQOoPL1Fazak1cB808CBtr7i3WlOvt9nGpN6wjsA0NxcLv1Ea
         YxUuv22qrscc7nWoD4HGJ+95Qsue08Zfk4u6N+Mog2Gp2/F5WCRVK+1g9K8zPQR2sTqG
         9+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100072; x=1781704872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aal1Mp+rcNQykDJS2aT5UL079LVfF8dm4C64yY/zbBA=;
        b=ZvUALgdBh7xDbJ8nvwkpEVyf2A9oTVCJmQc47Hwv3t3x/OdRLiA5Xf03P/MEsNfA93
         5yTNA0BmJ8hJ1D+QG4Yv7gYJLFhRLCUre3Bap1FeJUoJBVTvAHf4ceV3WCuci+PsEK0o
         CzbE42gRILHUtzqTpkdsd7zjfW/E68AwMLDmy+GmA3jIjYx6b+p8RN9LpkLUtNj/yh8s
         ujs/BTpKKuE04UJMn10TFuWK7QGL1TXPw9RpNhbOz3tIq9S+yn2yRKOuOhv2FQ/eITQA
         e0w+fu9MyHtanr80/uh1llmnWrMzixUtxc0yGiZNBo90Xi4ONalmInDyr7ConTvTII5z
         O5MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/l0kaorgvUoftDiu+Ttlk0N1VsSxrP9Z7uzgU5a5RSUl47kz6LcBUArV2E+1SIzHCNDx2cT65QMvJUDwCS@vger.kernel.org
X-Gm-Message-State: AOJu0YxpN7Jivgwm2lN1HsLZfJ+uQuaPhSdqsyuBuajMEyUKNVbmyptH
	7ScVdvzIGVyObLIT6VvcXn3wAi/Fs3aliyC+Wv6arJECiEJVappaqBNbhduE3BDTYDjF312gjiN
	rG2RoFa7YiRGspTqd0dkQA70kzfDqW6QVWNuUWcvMdGynQMknTydnQx2XGzLMNmAq6IUs
X-Gm-Gg: Acq92OFlDhiiQzRxVk4KYPplPNr3fYuBtQ0dbBS+XGdfj0+SQqOm7yS+2OCWhmw8Pqa
	6GXxJSrqmTvnIPG5wuLOeAHy404v3W0tj9QI1rUZ2uXfvfn3hZDA3VGU7QvspLiqOsMMy8vCvVt
	H3clc7XSUdqyBk7sT9V4fwvsQ+ERiBg5JTbcIhasZyFPg6olUbaRrABbK6sV4W1qyj9zmtULVNn
	fqVeXOIvKOOIRBCEcyWVQZOnA4FXtNeQP5KiR9a+xWCWzUM6q4pzBWInakXd2wmXf8bP2iFiCep
	urgrnF/Zg6IrTPfABP7/NiGmFVrr03Gh26jUjzqaDffRD1T/S9wu6yduTQFkKRzGAmp+hW2Vuii
	eTKYHunlo2BeMOZDvA+nBRxIXnj5lPbHV9awdCkwmI+WnyQ7+mtAXHUYS
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr227780661cf.2.1781100050929;
        Wed, 10 Jun 2026 07:00:50 -0700 (PDT)
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr227755911cf.2.1781100037281;
        Wed, 10 Jun 2026 07:00:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm1175978966b.45.2026.06.10.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:00:36 -0700 (PDT)
Message-ID: <55a34f28-26ab-4bba-8a0d-282b5fadd374@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:00:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HyYB8heqobizUTiK--jBCYwVu8M9L29P
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a296e29 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zpiWAdgaf0cvek-7FL0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HyYB8heqobizUTiK--jBCYwVu8M9L29P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNCBTYWx0ZWRfXx0DgsBqwoUBq
 0/6MdCeyd9sd+nwaGeXY4BL3hBkclwgSg/ZgggOBMDFmXru7M8ZWe2gq6qQwy7C/HhJLwejooEC
 kwNe98+18FBzsT865ICpu/QXnBsKUbYy0gcJJhdoAWKSkUGh6R6I9j1m5rRvZJvwQEDt3E2gB1H
 R4COUS4QQZ8kH356JdgQ5csF6p2sTjneO0hpN0CqBeosigKjx4mwbZOaZnI9cF6LgRJ6shnm+Cz
 s9E93K5dAVTIcsFUk9CROLY3S87EgnkoYgNe9zxjQC6EiAwnqIvFVfrAFpvJZz17jn8dZ3I+IkP
 ocspX+bFlJ8Hgpq+HTDnB7bbO0sEpAElTPxch7Jscr8cWtqttCfoazozZILUO3xehtBdJ2KdnlQ
 AY+fHGm1RhdwXtAB0W07y0AJHdYp42ZKwX19J+BDSWKymRMmMKUk+P8rhH1q3VsLeiDT96+4rrh
 YAaxwqdLUEtTOPNRkcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112502-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9D0F66A0FD

On 6/4/26 7:26 AM, Imran Shaik wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

This RCG isn't marked as "safe" downstream, was it overlooked there
too?

In any case, this needs a Fixes tag

Konrad

