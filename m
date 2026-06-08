Return-Path: <linux-arm-msm+bounces-111727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6PFeOjF3JmqRWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:02:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F26653C7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:02:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dAc0kSwV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="anB/7oBC";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111727-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111727-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6791E304EA2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8DD395AC4;
	Mon,  8 Jun 2026 07:56:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3596E391835
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:56:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905392; cv=none; b=p8FC76ZU+odguV+kVogD9LcCf3Ij8bBwDwKWVF7l/dEFYxkFV7uxw0tAbgp7GcV2J+Z/9IBolVUXikjiwGskUdF2IHILYMTHEnI2emVO4VbeJkoMNRwBr9ACofgwRVGYiB3Z3Y3jQtz5garv49VnFw94gcFZxDbtrM3cyD+tx/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905392; c=relaxed/simple;
	bh=KgdKlDFUiUTqm01bao1Yw3v1dGJE7B1VENQi1CGuzeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oe52BOgHRSn6uMhrqWDyfRmyFJtlnm6yYxNFmB9HZr/LW39uhoL1UhGThc9/oTVHBkgKlrEBGP3U5ruRSFqErgTBuvTcU3rF0jrvm1h2q1FkGGQn0mgCPnIAVhbT+ShtlRM+H3QgIBZQ21hSpKwpFN5ehYBJGhSgcKwxUOGpkqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAc0kSwV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anB/7oBC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OlFB2801714
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XedEyF+YcWLWUROV1EIv09BrhpY3xilBgA1jX1UONlM=; b=dAc0kSwVY0WYwsdA
	4bwxDd6F/RhRzXke7WinialL4qoVFhlKqw/VpcsqETJLJpPVuMo0kvnCuQIn7n8q
	MB83TNYVthk/iyHCr4Xknnla0DrhmEfMuziJh6MblufaFAe2Q6PtA+xShh8kTenm
	mlYamFvAzYZp+slMXvZXqdpZ+ZjKFYj4qUgJBGiD8U/xEhdNm4NTHkeSSfgUb7Ct
	G9M+61sWoPcldDirD/HsNKyADfti3IHuO17WTD5Y+MM9VeV5+qjonXfwN9uErigV
	MsIqKrdAbRrWaZZJH0p6ntuB6YV9lYAdCg6MI0zN270hvVRgucAj3dLX9GBRqxbt
	drsbnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3q26n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:56:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156dc90fdaso116835885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780905389; x=1781510189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XedEyF+YcWLWUROV1EIv09BrhpY3xilBgA1jX1UONlM=;
        b=anB/7oBCqmHPi7DLNV02R/+sMDUHPzhQ5zhERjy87LoI5fSfiknR7Sz5+johm9TBzg
         Ai81vtsmSaL5Oeo811O0uB9d5pq/xrSKMRmjlMls19rA7HaBNlnbIe1Y3cdu7f6sS/kh
         3ADZsuQaUO3f8KiltHJXO0oY+6iGMLg2c0uiTNlyNhcUqAjsxZZAYP9FsHhdpXhWVrug
         +TfyVVwGirjY8YQZeagnR0TYRmlsHB2DGwFgvv9W9Xa9zKW7olPLhZSknojrnXqTyd57
         Ao4pLCJZUmv8hfb9NU0RJGu1eJdVQ/1RvHrPRkKXWGSz99x0js4UvKsAfQ5SP+hNLc4J
         Lm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905389; x=1781510189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XedEyF+YcWLWUROV1EIv09BrhpY3xilBgA1jX1UONlM=;
        b=OdbCVAqDmxI+E++OCaGWM30Qp7bT/EYNOdvfgb9GmuAK6GafEKWnIAJfPQuVCb8i1u
         m9tnuNp/oGzfHh5VUvd9W+qhEnsx5/F2exh38Fdfy9QYJYF9Udi6Z0xgenqkVwuNZQ9i
         vhsHZXuim2wyrpkQPwNvPrElfGi/cQCDkYu9V9BqOSTa9doliLB3flQGP7UTdJg+iiqv
         yfaj4g13RmAs1p+5R2s+4ethk64UmBpNqEOjdzEHeuFJC2eTqDrLBU2nFgENKDfMRPuA
         2e8mDq3N+ILdG19bXuKfd5f95jr1DbpEVLIwKmXBag0MjaHwg2wRQbnngT01GSrRLKWI
         vABw==
X-Forwarded-Encrypted: i=1; AFNElJ9bcJ39+3JQdselaLdWHhe6/w7aRQQ5WdQeFiBW0tdM8m7saGNv+9PVGq0f6XVtTxYCW6WGZv2O73pzF2Hf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhs5hvxv9K/SRDvPOkv6FOEVrq69RyK8nKf8xQLtR7r65dbBDx
	QJojOTuddtOCyV2QjdHDJiY+kcQv8CReOkgu2Hr3aOgNYw1aT5E5Dhj5AFNjFRxt76/ZvfgOmWs
	hE0owv80c66Pqzj8hNmpxSp49W+Trhrhmm/c1jySbl5Y2KoihJ069cSfFQfectHUOHrcE
X-Gm-Gg: Acq92OEskNyiGAOrVf4tNGw/h0sE6cPW/Z5MlK9FgBubk0pRYZOPOmM79Z1+c67GjQI
	iaK/bwHjRSx/kyiMhT3t6rLMY0EFvldfZrREvGxdYnY9gRB8GBuisZ2J8qcDro7x65MhHncRDz8
	ToC23XUxOeUL/32aLcaIHCq92BLbjS91cGeJmTABY//rjsptw338oUEXI/jriHasVg11IOGuygl
	Yhpu9mhoh/KiQ9xIyjrHXRLySTIXx7yyfhMsmo3se/zyynccjh8W3As/eFa5XJi1uVa05wqUFU2
	F5fYrPbJl/2sHYTD0Pl39Lf1S1Gf9fmUqF5NLw5vxwDEkShcDwOBqh4HzrdPi66RRDccUK54p/E
	XUxt3Meik9uj20ZX1rEtQUNC1biuZvpvt0cC4d2jYS17dxnLNlbephn62
X-Received: by 2002:a05:620a:40ca:b0:915:83fa:b3d9 with SMTP id af79cd13be357-915a9c21c3emr1311097185a.1.1780905389510;
        Mon, 08 Jun 2026 00:56:29 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:915:83fa:b3d9 with SMTP id af79cd13be357-915a9c21c3emr1311096185a.1.1780905389135;
        Mon, 08 Jun 2026 00:56:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e05199sm803704766b.29.2026.06.08.00.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:56:28 -0700 (PDT)
Message-ID: <79266b8b-1c9a-4d91-a567-1f4934128bf1@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 09:56:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] crypto: qcom-rng - Enable clock in hwrng case
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
        Om Prakash Singh
 <quic_omprsing@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
        stable@vger.kernel.org
References: <20260530020332.143058-1-ebiggers@kernel.org>
 <20260530020332.143058-2-ebiggers@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260530020332.143058-2-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MiBTYWx0ZWRfX/aSAsL4pNsgv
 B4AjrF9YZkXIqGkfXSqydiz0TBa1KMrSI9sISevEI0M3KQJe96u6lzh3UThbXW+HAE7pydbEqKg
 2OFGkm13Sv2phs0fEQWQzpjq8qmMRhROFu0JX9qeJIkPezqDib3Xl7U0XxcndJzUlFdP8rbKNos
 lUx7f7RvSxtiHMUCnAg9r176kBlwyx6YIfOwUXgOhfDFwH3p1GJAtOlS64RW5+QbSgNqAHNjedv
 m3WjVYOJX+RJnnPjFEj91C6Uqd6lYp7pJCWub8rujoa+jgLnijsj+KF91kX2nA4e4u7z13uFOv8
 TRde2lGg5GGLwIl/dwuFk2rhEZ0FqK81oMATsfVFuLjAWW+cRQl8J3FhjO4nKLZ0B1mRSM0vuEv
 0F4+OghlfiCDW0BCMXep3GlIYSx9zmGjOI6rcSjHhp+0VdFBghazqU4uFG5roJhYqUZ9KH8gydi
 F4OrOHgGWnsWpfJmnyw==
X-Proofpoint-ORIG-GUID: 9wJTNM4znJSfWJEuq1mUSjn_Pf7Yqxiq
X-Proofpoint-GUID: 9wJTNM4znJSfWJEuq1mUSjn_Pf7Yqxiq
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a2675ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-B5nq69xhfM--Ug7SGMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41F26653C7F

On 5/30/26 4:03 AM, Eric Biggers wrote:
> Fix qcom-rng.c to enable the clock before accessing the hardware.
> 
> Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

