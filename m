Return-Path: <linux-arm-msm+bounces-110943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CWnNIE4TIGoPvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:43:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5EB6372C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:43:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=StpAk205;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LxrYpFKn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110943-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110943-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9280C3014646
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F9C44E04A;
	Wed,  3 Jun 2026 11:33:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC113423158
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:32:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486381; cv=none; b=YlOHz2HqmGSeGAwWi2rLZ4S8fvKZ+z/fO1yoyLffhaQSvuqHhtoHffb82Kh5Pxk1puw4e0gxpjzlarOY0uzzRNYM37IhiYgcp3Ph1cTV6iyED/FVzT4y6Yx0NfGt3crFq1DH7dGTDLG68OU/ZNyCa+5vPyAOujIVV6dvGV5Yc6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486381; c=relaxed/simple;
	bh=/Pc/wzjnWBRO1drRD4S4BwOsTHAxkyw+aMmqnWzA720=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UK2/cAhMXDJ7iuoyIgXf7ZkILyY6lEskq/vLwTnD+gafy1WvRwPeFYFapPD0xEiq/YI0D2JkV0eBJ/JAVu/glyDour3X9E2G3agGNCphnAOeaZtT2cuL5+RXJPYiGEafQJjZn2DA1n+eu1hbbtIwhSaz+O/N92l5f4EVe73+WmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=StpAk205; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxrYpFKn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536vXGa1756374
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 11:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Pc/wzjnWBRO1drRD4S4BwOs
	THAxkyw+aMmqnWzA720=; b=StpAk205VYO/LQNc9dByB0AwF0Zn5ZVd7wpBgtK+
	OevugUoleNsrJadw5rVAmCD439NnC0MMDJbwM2kcecorVBOraAUsXzv20tGVNuXn
	S9fpWG72JJsW0zhuWw6PugczE9AzaPMQ9OY8Z8HzOPZ3uqVODwS9TMDP4KJPU08m
	sq9q+agnUak28F2ZCrCkPvnshUdLSVqh9tYnLXIlUSOvEwgL0MCWIbkdHjl+d0I7
	NGjlJKOy5i3+wm9I1ww6NavDJfpDOymZVrP7CHpOP5IX37Mdlb/qpdAxDL3vrXv6
	vG+XWoK4M9o9cxt0DI/iKuPcyb0K+2dLMmVf3/zJCr1LTw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff0152u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:32:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423efbfb61so2528433b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780486378; x=1781091178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Pc/wzjnWBRO1drRD4S4BwOsTHAxkyw+aMmqnWzA720=;
        b=LxrYpFKnwbuvnrk+0cpJypjANthMSQmCZwnaeppQt9eUxoTdl1UhI/XlVkxKgskSW0
         ThUJUYgjKTp6TLFkRsDtHJ0pSGy/G3bttvCs5rVJ8WGg62l9eVKnEpiH2Zv9BD95UfHj
         d5lYkJW/ykomtyL0TXyWVWAndDGrKPzhoyITZFajitIEvu8P4JlR1HcCjTta+GcQNTAr
         HmeTHJ61Fy001aj7ASUxcaVqYSwJFIY7ZA34b9e8pHAdaJg+YulxiXvQVnp5HJ9ExrPL
         DgI53dlIcBSCcHZvHGcWy9D+9Du8cIsOTNNGK2CCY5pKVTPgUZlHwjBn3BpmmJZ98AjN
         YhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780486378; x=1781091178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Pc/wzjnWBRO1drRD4S4BwOsTHAxkyw+aMmqnWzA720=;
        b=ZanGZqBy1XHOClQW0JZ4Cza9IzM/kQ56f3zSLcIRvaJ002rWc90RSmj0xbr7IjYMGl
         swjiQ1gUMvq1ez5zNyvw2mlDwgxZYK6ZlrDSqLi3buLa5I2TiIX2SWuHzp99L9+P9mfx
         5Lt2tOgo8xRaqjR6NaGyI7C8+/+Km3I8UjGI1K1dqVYgcv3ay68MXvAEMtQ5bDk8Zlfz
         xbBycAWdVWAWGvLkUPDQn6a4B7FiTeP5Hrdr+jUQHqsIsX9MDhm6UoILzBHBYkr6cAjs
         w7BykSUNjsr2Fupo0amz4Acv/fg0w6P9Zps8mPiRMdBU7Gl+Rtmg3OQXbSTm8O/f6CWA
         SR+w==
X-Forwarded-Encrypted: i=1; AFNElJ+HX2NZIz3akBGN9MGUA0QDfHtZBHWYMMxiDb8h7B2F2B4CuGQ5VzNf2ihawn7kAJjYBXTrH6NqfImvb9fZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwtoBICdniCGMM95dq+oeTW802Arej9EPjXxPmQC+dDqDeK0A
	TC/zzqGz+W3qO7ehRLstLPtX2cKGUdQhEUrF8QC5MEbTfhQIeaMuc+lDCeV/yoIR8NA7hRjxQCR
	LpU/2UnaEr1X5PCH0EJqrAvD/x4MmgEIOn+aVQ85RxmSipfNypleJ2XUDXOIbm4fOlQgH
X-Gm-Gg: Acq92OFAGD1RcssE3ms1flVlR/l/LQCOFI5sTkMwFZVy6Ee89ZuOqHiOwvoK8KUcykl
	F8efOJsHEkuYLa4PBwfrk2jhK9+iQsQUHdcRIxHSO1dtFHjgsBNI9dCwO9XmZKFSqm1nd99ARcI
	99PUw5Ma0UYH/0dPp+GFGH5ScbGa5Z8vUWCtiO5P2ZOHzB4mVzFNdgKRZcjL5LTB4PQhc19S14M
	wRK0plU9faCBY3D42sPFcCbiv9BhDKdK9T5vpI3g3So4e78irxty7dwlWT699kyf88iXM7fbHJW
	tMItUCy3BQFFxwIgKxojvPrsI6RjsEzPkuGeOXZz8AIEu0pTQoxj4kJ4GCMunVLN38mkCqwvmP/
	Wvm9d4m6uyTiMYZod45GWBuhlsIkdYpynxtQzFZ4ITE5M98J7rBua1y3L0amK7D/hvYANsDmckA
	nZH6Q9bpcwHuYXS1WnnHTv/tZdhVSUtIJubgGn5NzcDtvY03PBc9XlJk871+lh1g==
X-Received: by 2002:a05:6a00:3e05:b0:842:5711:9a44 with SMTP id d2e1a72fcca58-84284f39d8emr3034289b3a.36.1780486377764;
        Wed, 03 Jun 2026 04:32:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e05:b0:842:5711:9a44 with SMTP id d2e1a72fcca58-84284f39d8emr3034262b3a.36.1780486377306;
        Wed, 03 Jun 2026 04:32:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372502sm3039152b3a.16.2026.06.03.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:32:56 -0700 (PDT)
Date: Wed, 3 Jun 2026 17:02:50 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Message-ID: <aiAQ4lzRoRIzAXT4@hu-varada-blr.qualcomm.com>
References: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>
 <20260516-hungry-ultraviolet-lemur-ea9aea@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-hungry-ultraviolet-lemur-ea9aea@quoll>
X-Proofpoint-GUID: 9y5ioxC_c44FdEl30odQJ9Jppg1n6Ej3
X-Proofpoint-ORIG-GUID: 9y5ioxC_c44FdEl30odQJ9Jppg1n6Ej3
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a2010ea cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=CRREdHZMeJ1pAzRtQh0A:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExMCBTYWx0ZWRfX65IvI98L3ym8
 m8gKv6aRi+qVEoKuFBmQWBQB+sXvQYjFMLy4S78W+4foVw0v94InnLfBf4C5sSCVMua9z1DYxvo
 wyVNiH+7gh1qof43t5DILDPQitqV2Qc5idpzV3HMvfGy+gufS3eR0lvByW1sbFogkCcOpEIdcKC
 MvIF/oh4uvNWqAFy39+WysOC8cE6XBrkijiWlXLQB5Gu8TCpIf2yyAtxoI6fFH0Noqq8utvpejB
 VsnD5qZ7bhsDQvwA4N2uOUj9SEKpAViAalMj0FgrM4KPbl7lh5p6AwVozzKKGyItApfYQ4c1vC+
 tmB5HpuM4m9ZBvKBWUr/9WfsMnsbONh7XPRmDsCzaRuMQhj89BWCo6zwVlE5DH2/n8eXWELNzEm
 fNt1gy2bbpE1rqLSplQ6GBffJwO15rJ59H6tqnM0VJHm7rxzAVFQTkMS0nTKgkm6WeLG4dT1ZG7
 X8mVNMSmPxNLuCcn8OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-110943-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE5EB6372C0

On Sat, May 16, 2026 at 11:55:35AM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 15, 2026 at 02:54:34PM +0530, Varadarajan Narayanan wrote:
> > Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>
> This applies to all your patches, not only to this one.

I had incorrectly wrapped to 72 columns instead of 75. Will fix that.

However, in this commit log there is only one line, not sure what to change.
Am I missing something? Please let me know.

Thanks
Varada

