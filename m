Return-Path: <linux-arm-msm+bounces-111761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 24EbCYeFJmoIYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:04:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70044654590
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:04:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QYv+LLyj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="I/FeeAAP";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111761-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111761-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 351DE3045EC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E592A3B2FE7;
	Mon,  8 Jun 2026 08:55:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2AA3382CB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:55:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908938; cv=none; b=XjWyFL5fTDGchcEx1SxujeUpx4+w53GlMU3NYlWfxIYkoopH7X3qqcyqoHimXdIJDjtOo8ASLNrDuFqyH1GDFa/8C+tkDjCWFMj5v/7CVluP6bMIFqRHYmoNfpFiUAsI+16eISkCBs+pRfpzOQCYAi+Kq1IAZb7M1xkAZQjdK/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908938; c=relaxed/simple;
	bh=fBerNiWf+MDgAZrSmTXySSQ3C8VQubBzWw+Rofp9O60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N94jDJfdsiOCFXndFzpE3Sw+jYqbDqDWoCONAbzTkidAQiPSqAvZQQrrPo/BvEjy6yID6aMWkQdJPN20HC0rRdWUISInFvYiRQGQ4SPgFAqEJPmVFQzEHxH86+ZnmX7nnE02D4tW1oIGa0bIOIjB7UsLC6CoyIe+XfGjZMgD+2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYv+LLyj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/FeeAAP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OfeR2385927
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ua1qIQefsn0KzCMxDrvAnd9Wib/2gaov9ZIiLNLNqA=; b=QYv+LLyjuU5ToV6J
	TXdyJnl3g1VRUt43hsHCzXqjBXEeTJ4o2jTCmX68L5wsdDiOAYNmw0m8khGn6uma
	zKk1NsBJA6hVxC9hmFNP6p3pck+cTYLjHHvq3QsSxnMfiuGtMc40hGgtWOwjz/B3
	jDj6Df2PIT4Blfp+Fv4gXkmyethc7IboVu9w8qpnnmzcetPeuqp+FDsj4MYpCa9M
	kYuqSTYTfWYxXt8+iDZJbtaVGc4eV2z+Ld11dmkVVcOhVNjLzbtQW2M+BGuj/Hj+
	hNFdBmBaiXk2UPhk+/PWHbY536bxMKDVNBESky+8xVvs1LUlbY1bN10RwYwZQJ+8
	lImZZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8xqs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:55:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51759082206so12439311cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908936; x=1781513736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ua1qIQefsn0KzCMxDrvAnd9Wib/2gaov9ZIiLNLNqA=;
        b=I/FeeAAPffJTARlSl96lMRgZRMThnr/AjGeAHQwiYPYnl6N2XbvXFLo8JLaXSEj75c
         9g+L658ewepekTXe/iNDsEts4zE+J/MhfvpfDxDercc5LrfvY/Z8a5F4yiZiRYBf5ggc
         sP5eUbBr/oV5u4jkFRHH/51G0vUcymNYHTdnF1JXGNIrZgg5/5fUmFVu7D/0PvBiq4R4
         Tv1laHyuoeo2oEAOUfoZJPzx5AaIv4m2SiWMbB3MDmUDgySbImNqrulXUjSEZiRkfsJg
         5YO3ENfQn0w7NUJQETuAjPxa1sp/d9lSAtaxJ+Zgobs+8SRWQckfQ+BWSePajyWo/NR0
         4Dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908936; x=1781513736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ua1qIQefsn0KzCMxDrvAnd9Wib/2gaov9ZIiLNLNqA=;
        b=nDIjcnR3DVdw/qmoyzILCZlDGio0Djje7ZzPEZK2u1P2HorB9uXVTX6eXZJYAYPv6r
         DLAGOEIkBCAweZqO9A5XugDdGFubrLDhzc00TYRqPUnHmcr+AG9mLcqG0GIGzixmemtB
         K2UcINpvIvkU34+XFzKPkXZq6dtb12HzBXYfnypAP433kVPNR2OgqOaa81DmcymJ8xfR
         T/LlhV93Msct/3vMSzIM/m1mFFVdfFmY0abHknfHwW13PtyMgyy/X9s1ov/Fyxira/hG
         R4t7/vgim4XfvarCFCKg58bV9Iz+JhyQHGjVKBr1ofEa5oGeicpyHjJOPurDN3bAqXI9
         Ftgw==
X-Gm-Message-State: AOJu0Yxi1i/dQ607ly4mAtWi25xDt8v0ydL/SNEjHbavCsymbeB5Cvn/
	vH8kZUvKJ+DSqQHKtbHu2nIw+XDhr8mWSO3OwKgkeJUnIK86KTbcRA4EHdxBy12cI33uTs9IcG+
	HhWMN6c434iMs3BpA0B2AXNHiHtXft31P1F6IFFvj4JSgPCgrXtyNaPthEOn3bNc9C2ed
X-Gm-Gg: Acq92OHBYqff16iX+qYlMjuM5Bc4k0WebZL5CZbgORDMTtMq0DtDiqCufcuoQ1rTZ8w
	9bvgpzML5qBYYCfg6wJ+meAzkAzbEIeUtC7npxQcV60sdfqnDqD8yXwCGstsqIMVlkihrypzwHM
	bRQzz4whz53dH0Blxs5HL63YFhJX6RsGUCpDvD77tjGiO5ryQAZu5d4Z9VG135ayoXqYrJTDkMj
	2oGx5T1Rr7/5kmH9wUxc6f0cl5QXP2Lms1LtDw6swD1IDkICqRztfnMJQtq32GoAC1arV2LTF8U
	0JAVcTHLIxzZ/xk24VksjDk5f28bxZS7thfa43naInUdY/qj2LCMxqZShvvP9hIovMM1iA3BXx+
	xlzWtd2lM+sQBQwaVn59/w1RuXmHqGNO+v7wtsFpyTRS6p5d/qbcPPTR3
X-Received: by 2002:a05:620a:198f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-915a9db3db3mr1315258085a.6.1780908935916;
        Mon, 08 Jun 2026 01:55:35 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-915a9db3db3mr1315255885a.6.1780908935398;
        Mon, 08 Jun 2026 01:55:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e650287d9sm6980528a12.12.2026.06.08.01.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:55:34 -0700 (PDT)
Message-ID: <e0faf562-f882-454a-8719-1d5716ba6fac@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:55:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] interconnect: qcom: add MSM8x60 NoC driver
To: Herman van Hazendonk <github.com@herrie.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260606-submit-interconnect-msm8660-v4-0-6e1e5c5efa26@herrie.org>
 <20260606-submit-interconnect-msm8660-v4-2-6e1e5c5efa26@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260606-submit-interconnect-msm8660-v4-2-6e1e5c5efa26@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tSaFlL7HQ0Ad_tkPZGXstp3X65F-emT0
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a268388 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ClTuqyqIc_xs18_e7JIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MiBTYWx0ZWRfX19VJgOZ+Fl6D
 Th/24rqEsaYI0Q5tgprq7fYW8bUYFACt8imVezEo9v/Ru7Kxm+2R+3WRRJ4HUhXBfsoqEyyC6oA
 Fm3g1BfgX0GruH/UtNOzRrUg9Gg6HJdP6b9MHkdqZXBqE8q2kBLxnV0RwcttIIcJ8rqnc5LXplB
 c9St58SbrnOfUmA59ahn3pNKvbZRHyvMlgVxwSELOs9pHbbHs/AwOKFx2mGmjv6ZW5Tb7D0cwGS
 MMI6duCfzcixgJTiMmV3xsUTeByZuD9HNQy7/ttIibdnmJZg7hXbO+4L4woBVephuKI0q9m0rI+
 wPgZDMaK/9OUPAhe0th0zCeeVzj4KyM39RXzUwsUMw7puIio8bq70KDmIhR7Jrxz8aUkA9vb8Io
 SBZHVrTjzPVuFB9mkQtqFsQOyhvqiE5023HqWYWvX/EWi3FkTZ0+Ye1CxA37FeNFTryF8+vqMxM
 f0t1wIIJbdKsOBu6lrw==
X-Proofpoint-GUID: tSaFlL7HQ0Ad_tkPZGXstp3X65F-emT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080082
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
	TAGGED_FROM(0.00)[bounces-111761-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70044654590

On 6/6/26 3:00 PM, Herman van Hazendonk wrote:
> Add a Qualcomm interconnect driver for the MSM8x60 family modelling the
> four NoC fabrics (APPSS, System, MMSS, Daytona) that connect masters
> and slaves on these Scorpion-class SoCs.  The driver implements the
> interconnect-provider API to manage bandwidth between specific masters
> and slaves via the RPM arbitration tables.

[...]

I'll skip the bulk of this for now, as Dmitry asked you to drop the
clock interface (and do rpm writes directly from this driver, see
icc-rpm-clocks.c and smd-rpm.c)

> +/*
> + * Minimum fabric clock rate to prevent bus starvation.
> + *
> + * When no consumers request bandwidth, the rate calculation yields 0,
> + * causing fabric clocks to drop to minimum. This creates bimodal
> + * performance: fast when other subsystems (like display) happen to
> + * request bandwidth, slow otherwise.
> + *
> + * 384 MHz keeps fabric fast during concurrent MDP display scanout
> + * and USB gadget traffic. legacy vendor kernel docs: "AXI bus frequency needs to be
> + * kept at maximum value while USB data transfers are happening."
> + * 266 MHz was insufficient - USB crashed during display activity.
> + */
> +#define MSM8660_FABRIC_MIN_RATE		384000000UL	/* 384 MHz */

So, are there any issues if the USB controller is offline, can we go to
the aforementioned 266 MHz rate then?

> +
> +/*
> + * Maximum RPM ARB buffer size across all fabrics.
> + * MM fabric is largest at 23 u32 words.
> + */
> +#define MSM8660_MAX_RPM_BUF		23
> +
> +/*
> + * RPM fabric arbitration data format (from legacy vendor kernel msm_bus_fabric.c):
> + *
> + * Each u16 arb entry: bit 15 = tier (1=TIER1 high priority), bits 14-0 = BW
> + * Bandwidth is in 128KB units (bytes >> 17).
> + * Two u16 values are packed into each u32 RPM register word.
> + *
> + * Buffer layout: [bwsum pairs] [arb pairs]
> + * bwsum[slave_port] = total bandwidth to that slave
> + * arb[(tier-1)*nmasters + master_port] = per-master arbitration entry
> + */
> +#define ARB_BWMASK		0x7FFF

GENMASK(14, 0)

> +#define ARB_TIERMASK		0x8000

BIT(15)

[...]

> +/*
> + * =========================================================================

Let's drop the =s

[...]

> +/*
> + * Pack bwsum[] and arb[] arrays into the u32 RPM buffer.
> + *
> + * Two u16 values are packed per u32 word: lower 16 bits first, upper 16 next.
> + * Layout: [bwsum pairs] then [arb pairs], handling odd boundaries.
> + *
> + * This matches the legacy vendor kernel msm_bus_fabric_rpm_commit() packing algorithm.
> + */
> +static void msm8660_pack_rpm_data(const u16 *bwsum, int nslaves,
> +				  const u16 *arb, int arb_size,
> +				  u32 *buf)
> +{
> +	int i, index = 0;
> +
> +	/* Pack bwsum pairs */
> +	for (i = 0; i + 1 < nslaves; i += 2) {
> +		buf[index] = ((u32)bwsum[i + 1] << 16) | bwsum[i];
> +		index++;
> +	}

FIELD_PREP(GENMASK(31, 16), bwmon[i + 1])) |
FIELD_PREP(GENMASK(15, 0), bwsum[i]);


> +
> +	/*
> +	 * Handle boundary between bwsum and arb for odd nslaves. When the
> +	 * fabric has no master ports (arb_size == 0) the arb[0] access would
> +	 * read out of bounds; pad the lone bwsum into the low half of the
> +	 * word instead.
> +	 */
> +	if (nslaves & 1) {

& BIT (0)

> +		if (arb_size > 0) {
> +			buf[index] = ((u32)arb[0] << 16) | bwsum[i];
> +			i = 1;
> +		} else {
> +			buf[index] = bwsum[i];
> +			i = 0;
> +		}

similarly as above

[...]

> +static int msm8660_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
> +{
> +	*avg = 0;
> +	*peak = 0;
> +	return 0;
> +}

I think we can drop this

Konrad

