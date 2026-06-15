Return-Path: <linux-arm-msm+bounces-113226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W2cWFTErMGp0PQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:41:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE4688798
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:41:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CNzfNWdL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SEd2JXIG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113226-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113226-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7C82308B2AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F58340DFA5;
	Mon, 15 Jun 2026 16:37:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2297740DFC1
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:37:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541427; cv=none; b=h22OT4cuOcxg8hTc9rLLZIWURcuwGmAOEqTZ5Q5B2c8zbeJ6vrNVAfCQgCLbrT6OokCGj/PXp7rWirfgcAnjdYYkF6yYGH7agK+h5KvyMmALaIFTB0pPCC6Ffgbc9f9oOqTQVFA6FwguYYafjFWo/Mw6IiRHKZo7CJdHufZOP0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541427; c=relaxed/simple;
	bh=KnykR2/mt0PbIfgCIqYRR5r7ZR1BPAjruV/C8RjstuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbd5sw9dPzQifcnBAmLdh0nSzmBSYTM47IwfGnszXwLCXPZm7fcD4YTyEz/2MUmpk90fiaapGLgE98ujNqWnRDQC+hCCWpCT0qWY9N+UXPzrkVwzfwfMTfqKbpjviHQueAEkIeyQaXsy+taT8vsiFfYSUv59gcXP/XscoGm4Da0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNzfNWdL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEd2JXIG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhtKU955466
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnykR2/mt0PbIfgCIqYRR5r7ZR1BPAjruV/C8RjstuM=; b=CNzfNWdLFeOBft8G
	6RLKBJr3sUtBissZqf9ACDDSX2oJquHsSzZzhSawwh0KJgR8YubRmJIRKt/Su7o5
	+RFxUw4QGlNyAbD6QYBz0EqeuExx7NP5IA8dr1v2li8AOH7UrfhFeg+JPgspe2VW
	sKoRog1cUd4sPVtN9I3lVd2hXSfdf7Rpm9mleB/8SF4LPrjHSuUmikW1xedAjlzL
	zcWOaAi5l1VOqltcAvfWJ/dLHktXBMHfy1l/8Q8zHa1tk4ycGk3wsyBGL6NLS74p
	JJH7yj95hSVt8Nr1aBqirgNDDrzLlbdb+M/V702pV0yW2orXK5BSS4TesDRx9GZg
	bVk35A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter21ttd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:37:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a547f4b3so32986885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781541424; x=1782146224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnykR2/mt0PbIfgCIqYRR5r7ZR1BPAjruV/C8RjstuM=;
        b=SEd2JXIG1PAEq0WeNeZPKl3+vtSFLeHot2B7R6V+Zk+V7hn4t1K7EpLkb5QUJ2GU09
         qACaN3OyIBaNFP1mMiZ0Oz89we3l7sdzKOo86aDbP4u3Py68AV9w0pnLvf2raRIPUuxX
         ID3ycYtkFDdAiNqTI20luK/uc9Dy2c1egDAl/b4H+N9GE0CAVUtqpPHtyE/hNnL3T9/5
         UAuFhI1/PdzDO23CtOlL6JKOx09ZI5Z8aKI5V4IWSbSH6+0IUFXcyQGuaLDiMfu717jq
         qRPb6TnW9Gab7IkwEroSL7FYS6a6g0JF/k+wdnBR9Mv9yHLH5g4P4qoBQ9MUjkMe/K6N
         +d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541424; x=1782146224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnykR2/mt0PbIfgCIqYRR5r7ZR1BPAjruV/C8RjstuM=;
        b=r2vu3a9aS8CSCktnAfXFoZ7Hu03QUVNAh12rggUZmEKlTdyZDno7wRz8PwHGUfJi2q
         d/KeZF/LZ2flYInmum8Yc39jxYXxvI6/dbaBSO3OM56bbWlOsGUzlqHZqipiIpi1yao+
         4qkYbW+GBiMuOu++qa79ROtY6gKu5vkkGo+EDypLgol9sJ4MLod+h/fRqxW1D7EYNe0I
         UbT7I6fBPP04mSMNMoY7CCJQIBbgkHkj31kMptsz8ymEelsBTJ/P4brb4BHrf4+rskfc
         i+U6EaIYKYdd54hDCBVpp8vkSThh2Awi4wtBVE5KLQTwsO/1e9TNXYxXftgdPrQ30pWo
         2y7A==
X-Forwarded-Encrypted: i=1; AFNElJ+uatdtsZXuarhfnILYwcZPfe2IZDQd8+VXneDRkA4aEpqaEPK9CddiJyBR1L+oBhTzJYsamf4b2LQe89A6@vger.kernel.org
X-Gm-Message-State: AOJu0YzovnPVBgZTdlsN/asDfr4MCZBA43kv8/zk/g9zv22JCupg9SdM
	ifmQQknlnHTO6Q6stJHdx/+x0BGOYizFYhXmGogUbTGSTB0QmJxF0rvmRfMK4LkS/vuy+LytLV2
	4iMj9+JbjLxcFC4wLLuu1lSmNs1DbjduGQ8EKzxK+IrbQZu3kYBeZGi1iujE4LR0EGawY
X-Gm-Gg: Acq92OHZCBiD8S5st0hoPeowkhPOPAXiSe+H0ZOA31Hn7faQ/x+rx1TI1GTfPmzkLE+
	dPUOME3fwo8objMSfl4GZKCasxLC7HV80xB2V5VYqz9eUrd3Vb1hlGlMmYsVoZJv9z3XqwaWwMa
	5pwGCtHRqmD/nSEw0Ll+8Fj3vVY18PeMBA88aHIcOcxcYtc2XBSTQGDEeS3BNjGfhJGZqavJNJk
	Q49EAuJC7mCpwXD6QP7F2dkkkEhb6wHduw56s6a5/rBWTWQwBNA/gBgiGzGmGrq81uBdxf+Drz6
	6z+eUvCnSFt1yjbouM9HCTAsAhtdpGXArj+1yspzxqP3z95R0s9IKQwA4Ht30Pa88aUj52I4oiP
	srREeSyT9rkretw0AjkBQsitWX9IYEBNjOMXF25BqyqZGrg==
X-Received: by 2002:a05:620a:1a20:b0:915:fad5:9096 with SMTP id af79cd13be357-9161bcd5533mr1337894985a.7.1781541424087;
        Mon, 15 Jun 2026 09:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:915:fad5:9096 with SMTP id af79cd13be357-9161bcd5533mr1337890685a.7.1781541423607;
        Mon, 15 Jun 2026 09:37:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b556sm3774679a12.4.2026.06.15.09.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 09:37:01 -0700 (PDT)
Message-ID: <b51b4d7e-fdea-4793-9007-c9e3ee922f70@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:36:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
To: Herman van Hazendonk <github.com@herrie.org>, sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602042747.277270-1-github.com@herrie.org>
 <20260602042747.277270-2-github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602042747.277270-2-github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE3NSBTYWx0ZWRfX3pwAgGcHguKv
 +Fr/nRAcCNhgbbcZ78cGYF159YtiHgspngYeoRhw7OsDB4o6lwCgL5+vnkKt2rIpEa/DxTPvBua
 zS1civ1Fq8eA2+4I5L85obxfpfiMiTM=
X-Proofpoint-GUID: xwF4EOG8WE3qxeB_7qWN-vgaT8WyMdwX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE3NSBTYWx0ZWRfX+QsyBFxlticd
 nFqovQatAe1QfbOkYAo3Slu8BSr4iPMaScCtD4LJxnpuIAlDzEkilrNLz19BCE5Va7jhmpo6+jq
 k6VBcbnUuoeiZSzT/F19Nch5RXvO4w8YUDtUOLPLQ4Eu/P4/qgwPkLYTtis6NGrffm3n4Pv1Lp7
 pitmOiQjDLirv0cjE3Q8m7IMSs8p56xh3dOsG9yeoPsVA4MKAWqcwdgKxzjuLKW8k5a/CJB0P8F
 3nTRGJXZ/nmIIjRCOJbbD9J+8ZgUvfE2PCLNBpZY7t1hl7M0JzBnk9l5XWVCPpjbvsuVpRFoHoW
 R8n6lxmXZ6yuBqqeBybxCCCLcFlp2TUSb1vFeAXUHKb3GZhiqFUXBGJIm39Sfumssf9PqqCxd+R
 14/J0Ra0gskOqVWDyhLLuRHdvL/Hhl0HBn8tK+R2OH9N0ne7M5CDzieSweOGiotUJAILrHjsg/z
 nN2FoDt0g8yZG7Ao5ww==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a302a30 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LvhWEcBnrMCrogBIVCUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: xwF4EOG8WE3qxeB_7qWN-vgaT8WyMdwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113226-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5DE4688798

On 6/2/26 6:27 AM, Herman van Hazendonk wrote:
> On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
> a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
> existing dt-binding header already reserves CE2_H_CLK (ID 77) for
> this clock but the driver never registered an entry for it, so probe
> of any consumer that resolves the binding fails: the CE2 MMIO window
> reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
> signals that never arrive.

[...]

> +/*
> + * Crypto Engine 2 (CE2) clock.
> + *
> + * On MSM8x60 the CE2 block at 0x18500000 is gated by a single hardware
> + * enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The vendor MSM8660
> + * clock-8x60.c routes both the "core" and "iface" consumer-name lookups
> + * to this one register, and the upstream QCE crypto driver requests
> + * both clock names via devm_clk_get_optional_enabled(). Without the
> + * clock present at probe the QCE MMIO window reads back 0x0 and DMA
> + * hangs indefinitely waiting for handshake signals that never arrive.
> + *
> + * Register a single clk_branch: the consumer DT can reference the same
> + * clock phandle twice under different clock-names ("core" and "iface"),
> + * which yields the same struct clk for both clk_get() calls. Per-
> + * consumer refcounting then works correctly and the single underlying
> + * enable bit is asserted while either consumer holds the clock
> + * prepared, instead of having two independent clk_branch structs
> + * racing the same hardware bit.
> + */

I don't find this comment particularly valuable, given it ends up
describing the fact that the common clock framework has refcounted
enables (pretty widely known) and details how the DT is going to use
this (which we can read in the DT itself)

I think the commit message is really exhaustive and it's a better
place for this info anyway

Konrad

