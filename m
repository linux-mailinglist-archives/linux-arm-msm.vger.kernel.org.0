Return-Path: <linux-arm-msm+bounces-112385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mBizMqctKWofSAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:25:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3A0667D1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:25:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LBPH6Wnl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TE6jxPeE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112385-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112385-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AE9831C86D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE602C3268;
	Wed, 10 Jun 2026 09:07:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7EE3B6367
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082464; cv=none; b=HEeO6unHNv32oSTXEv5n/sVgfxgR74aNywYP6VysHHvVjlYY+sLSPU8/48vTMsd7CLA6GEm9pB42Tu2mXKRBPPeMXEpsXoGwo8HUaJ/i1pSKkeh6alXuF6IB258kYdZxiMOp2Hg8Baf5ulW5Ixsad108IcwgDc5sBC2PWCDSaFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082464; c=relaxed/simple;
	bh=5/mNPrIGccvB4YmjKw31XjbzhKLj7C+1Z/64vdlyjzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWXahsN8aMKkCWCaQSpzTj74i/wY+Ujt6StnHxgoidy03y5Ia8fmey+gr/rJ4YEsMoozzCPqpvMQ+xiULE+tfzPy8iZo6AUvz3yt2K9NJIemdJiCcbwjayQMnjIJ22h3hKH2dLx34OBHgWG5JBfxkmYRFxXKryz3Vc/heFOIQ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBPH6Wnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TE6jxPeE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i2w53151943
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=; b=LBPH6WnlVkF8XTV8
	Af+cN0FL1EWATgyiLRLO1rPcY07OlMhw7XYPN/OAyM5V6LGKWMEBxDeE2lB2GUw9
	Jj2kCq/qT7XAqwlF1xBkqop2ziFldUs6IQlmE4q+SE9S/04+/wXToThEgiTc/f7q
	fYRpUYMd0MnTKuaRoq+8UXYvEZ2WNdATFieq9Px4yVqTVTsUiur/Wk1OfJIpCr7O
	D5otzVQIWyiv2msVACw/yoXRnCznMGnXwbbSWH1aKohbiwIBr78vpAMcWddmRdFh
	caogT5mgoGvj1lkAFsYcafaJMrIYxd14e3DrN4Oe9M1LpKE+GwCjpsbSRR+YA+mh
	9oIaBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesnqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:07:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517865e6219so13687011cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082462; x=1781687262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=;
        b=TE6jxPeEDYE/M+gtQh7TcgQB9MwmeFeykyOfy/KcsTGxQu3qLwGPnef9YeHdQ4UpQt
         r8LT/399uHPSk/epsVqeIxAp9TcalfPgerkQb9tMR4Ou/S0n5A0gzXdSY0YLv2szv+Xf
         l+hITot2MuJrf2eqJE31/L1ecW+JQH9BjFXkX4TaryRPsgoZd2zNIkqDEmOlgPFtxLob
         TciyE0QVjLtmJPXx+jtNHyo1f84NNmL21mei7sTv7doEg6GlHM/wDWeuDY8R46XmdXy4
         vOTJ0/ZkJ7zxQfwFY2iWHq/XRktRofQ9eCnZV3DNSHwVDv7B0CAvUJSNNyv2T/IwJSas
         6JdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082462; x=1781687262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=;
        b=gOX6vUFle90Luj0uyJwP4Ig+bF9Xf607AKfXALvC7U6nsQYm+AtQuuAAXfZXUIOmHY
         oLngyfnOUCb8Zd4O8rUfDaBVPJGzIhUqgWB2d1T6GBaCc38k4i9pV3WpETU8jHqSp6dS
         axlsE1dyQ9ZjSRF0VGr8dyOHpKKAY3bmcuEguSp9w8rOO3+qCi84hU4VwmnHKExyTR4V
         sMqI7gwL2aHaxwWAKqqBivz+DtEt1SPF8p1PlbY0Bcz1DZNqtkLDuK/eyKoHQgLoCWi6
         Gbqj+JxDZb8D1N9W+yliTLhWZ59QiDw2uSrlSjsaxqYAFllXRDJWcs0cRArTj0KR1sP/
         O66Q==
X-Gm-Message-State: AOJu0YxZc5Wv5yuh1mf62WSllQtcoMftFGylJmFEbp3XkKEK7NWA0SOy
	MjHZ9Ziql12HUQN37lwXwPsjHZQyg57HcYMFehiceN+qalZmsTO6tqpXM2AwL+hhwJnaXRRmcP0
	O58l+xjdla1CMdAZyG9/lJMq95GA+XAqa8CLgD/oGuklFiiqvw9o4Ic409Baq7v4vIfpn
X-Gm-Gg: Acq92OHnj+w99aulp3Gu6uCLCHkvughDHXWJtrNW9ma27+rBJiayGmTS6NeRzaxhlMV
	7ws0k0JzBvJz1E/cZXt0VVxSWzTFRSDWlPRV9vvXjfZe/HWhqVoBh6Ta09IxCBrgD3+DdK+B5pB
	hZRxVNwNEEoeVwWQtWC9Fbsp2QBv70WXPBeAI07/poEYWvJBWM+cFyTeje/fX1iphuOwXRmCY6N
	txF9Hed/1Muku/Yq8vmjylmUvB0vqz8KUFWIOGe4yslGK6TkYD7hvIigTbJfQNx6Zl3o49c5GbT
	QleaBixe6zfDXhKcXy4QqVI0CLxKyUzPE3wvmurxhGuGyfRs9x9RRm8/FUmGEx2CXWMDTl6nySU
	W3bOgdDucnDqUIIXSzs/LygPodDheXo0pWSqeeSv2E49g0+7NPIDMm9Zk
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr215927941cf.0.1781082461869;
        Wed, 10 Jun 2026 02:07:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr215927641cf.0.1781082461469;
        Wed, 10 Jun 2026 02:07:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03709sm1158881866b.30.2026.06.10.02.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:07:40 -0700 (PDT)
Message-ID: <4b53badb-c3e7-4870-8cd8-dcbb4036f0e6@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:07:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: defconfig: Switch Qualcomm SDM845, SM8150
 and SM8250 drivers to modules
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-7-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-7-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 17OhzYLOGqb1oHI2vu6i-bMlfVYa9YnB
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a29295e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ySCF49DNHzRfUD6l2y4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 17OhzYLOGqb1oHI2vu6i-bMlfVYa9YnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NSBTYWx0ZWRfX2dPEmFAhi0ad
 3qO9s9R/+c0IdVqmP7y3xz88tZ0Vxrf2DYHFriogYj/ZNv0PT1QB+yDihdXslNhvcTNlV6IVwt6
 f2JHwi5883QODEfHBqPjM/3xzDfYgKWC4ZQ3apQ33Y+J6s5uxSYjxRQ7y2nGCBm9lGgRUPMj3zL
 TTzZ3GFhHkMdOMTwZHL+P0adLPB767n8vACjzI0XPCQCO8INJVolVbPfcEd4Secu/N3s3vqOnoU
 Iu8pEonDHTqXkphd/km9H4mUbxj8x00Ggm4ko30CqU2eZ+6/V0E3ZhunfZIFJ/P+TMg6zkJtmys
 TBwstY/0No6d8a4CdHUWBOnb47Ow7mVpCHFO1KkqGvG6V8bHxGlkscE8Lzk30YptVgu/s1OPvyL
 U2jwwnn3Lkyw9jlKKWwb6ZgcrnFc3yqTaglpr/PaQXSgWhvo3IjaP2bmrXZJssTRyAVyqy8p8f0
 IVDYBZAaEtSO/n9Lo/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112385-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F3A0667D1C

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Display, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
> SM8250 SoCs should not be built-in because they are not necessary for
> platform bring-up to shell or even mounting rootfs.  Drop their explicit
> selection in defconfig, relying on defaults which makes them modules.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

