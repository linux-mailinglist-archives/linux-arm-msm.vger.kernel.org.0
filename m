Return-Path: <linux-arm-msm+bounces-91334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB2sAUkXfWkGQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 21:40:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A9DBE76D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 21:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F28D3008784
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 20:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DD8344044;
	Fri, 30 Jan 2026 20:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHnGPOJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTt78mPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4647C22541C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 20:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769805638; cv=none; b=bJMZI9WBT1onF3gnGaOQ5StBF9oIcznu4enPF0e+hk9HpM0my4FKykYIpNiDI+XJ+P2b7tZFUYDZhrQAGSdxS3aEfh7G2D20lMI4J7qKps6c5t8qDt7seGjOahrw72i+Dt3uex4jKWScusf6w6m/aDRf90R/yw98HLu2t0Z8fkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769805638; c=relaxed/simple;
	bh=Yw4d79IEZXffsKvRGAO+y8LsCNKcQBy63V//wFWlz7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZQKGw21U7nkXDZyIxDR+coOfIqWal9mmFWLh/Y5cpZSVsRYQQO733S3bNkz13ywIAvK/Y1pJYjLt9wXXHsbN/bwi+FG8wUIohrWn/y3fnsBMbjbTvwZT7RErqmrIk8BlCbOuNTyucxKs9xyC26dcjF9SDNAaX4IIX2HpzHrBxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHnGPOJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTt78mPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UHVd6j3216690
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 20:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uGZh6P9IyChuIO7WR1H248Zv
	7S7Mvw6Hn70r2sYjVwo=; b=oHnGPOJsYlgt7YJRMyYADhltehyBx0SaWk/ET/qE
	xxmXmHtZwb0t9nsV0A4Ia7hbwl5wGYCkEoMBUyo5Bvyr4yKV2XMYc1pjwUehGIIf
	ZoGaWl8ZLgrHM08LC7i37Atszi3chq3DdKtS+bNmxZzHUkwdLjxchld0UMrg9osh
	VJSDF4Go5Jcfs/4Cqbta4nHmT8xApwd07vtRlXCxrZtIyHYS80w6nsd9vjPrrmk4
	jv0gPerSeOpzkcJK6xrWfeApWornhJRzcPmNfkBBPSyZQcgXzly9TgQ9fcYwJkr/
	sxP+yCHu+QZHlTKzKSvcyLuJc/OTOdZ6pbdDGleZoxJvyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c114dghwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 20:40:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70a08daf3so622257785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769805636; x=1770410436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uGZh6P9IyChuIO7WR1H248Zv7S7Mvw6Hn70r2sYjVwo=;
        b=dTt78mPl4o7uImZNM/0TO0ummZqApyIMZIcGI8GClpryra9RalWQOrChRTztDU1N7w
         xVcBLRpBoMAJVDnBSObj405sbljVGex4IWtdf7XpSIHgIv/6otU3LUS2T39DR8ZVwx5G
         8T6VfIH6KwfEv+Vxng7iFyjz0fM7f6rHXQEnT3sP/qJeao/Gsd8qPN87a1cgeHMYJN8k
         lICb+xhsYfXHAvndPD48xiDRyj+U07I6DxEkY6hT2Zh/7QGtpclvgrjQTH8E98shfnNF
         Yr40H6Tiyh3QwE/a9lMu4IurEgmsNCOQ685v3qfIglDGllW5qzNNVPRveRYTeRm3PpbF
         X+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769805636; x=1770410436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGZh6P9IyChuIO7WR1H248Zv7S7Mvw6Hn70r2sYjVwo=;
        b=kSCIUqPIt5qL1rt/ErDxg9E7E4gyAyVN3xv32Q7Noup/1/zq3Lb7GeXv6gCHGqTcwf
         cc7XGPw4jvASLyLcVLTUKZzXHzKF9x5HZIw4UDHCCVbFBUuij4sY/qhO6GnPCgKUVbgO
         HGbDGk4mnEkGIWb1oOhKnR3xnEduURQsH2RQ5kRdW0oIl2/w1YvpBAflVwaMsQVpKNfV
         bydX0TnLSnOU+JjJ2/Opl9yQJHS86d0g0u7WpGtftuGH11OvTiq7JzkXSOz7vPxUgt3P
         weYAIbSkZJnR/LCByCMkM0kNHw2jY9cOBJzIssvJmHdGu8uqYmxuYogadV1rbpSr+cM9
         kbUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVprfUcQ5tRtQHo84YzUB2RWYZAZPq6xdc0AVSKNyDbB72CBcxItfCnpJ167/pegDcrD2XjnbzSv7JRKWa0@vger.kernel.org
X-Gm-Message-State: AOJu0YwRbE/3tOkmEYq2j6web/HwSPaaKi6eVqP1kAQz2XILUgyz5K+U
	dXpAwtjHkv9QPVNZEBoi937fbBQxh7OjZALowiYkbphbuNQd7CxcWfI/KOfRVdp4d8IO5ESKwAc
	t4cSjPGW4aVx/eZ13AGG3x1trZdg6r8E4J4THcAbEYafQjSv/Aln/knphBBgDAasaDNmX
X-Gm-Gg: AZuq6aJXCkwgIAfNXKJqT0VHFfp57ze1vcoxzsDIi/M90bFd/iK+ngXnEo64OinHz+o
	sc/lr9NJdp3M6HHT9g2eZDyvbU1atE/ljK5sOPHwMfsHsAqX7fah4paWfZiqCsB4TeditGy9aOl
	Yq9Oh6PioPFxM8Rb71fmSeutB1wqEIbyxIpzhqN6h1Q/IBd1egJ0BCNtCquuDtJ5OhfwFbUVKpE
	X0Jdv5pliLzY7oFol79JiKf3bSDnKmMrJ9ZqenDKgD/uTFRtlgNGYRLZpOupR2E6DxsNmeQyoST
	XoS6umP4ZNnGsgeuexnLK29qA9jzFkp638fa+p4oJzsRBRyAK1+eo5LDEqNrKRycYBhL5vkri4d
	eTxu8kAi9J4GaLmaCIwoJSo4g
X-Received: by 2002:a05:620a:40cc:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8c9eb2dfeddmr508955385a.51.1769805635491;
        Fri, 30 Jan 2026 12:40:35 -0800 (PST)
X-Received: by 2002:a05:620a:40cc:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8c9eb2dfeddmr508952485a.51.1769805634986;
        Fri, 30 Jan 2026 12:40:34 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm25014137f8f.35.2026.01.30.12.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:40:34 -0800 (PST)
Date: Fri, 30 Jan 2026 22:40:32 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
 <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
 <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: h4-bQz88R0xkso-e2rHXCJDQpL7skl6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2OSBTYWx0ZWRfX/HbDK9uH/xqo
 CRbuTgt74PGA9G/+7q8a44dbgC7u8+y3wsT4lSLNOxEgVY9O2yoa+laZ4QDqdOVPzBhCwjKly4d
 /XKzIs08RhYKYTAkvdvR3MEvqKb3hiFGh4g5GrmpVn85/oO2jFJtmFYQkXOPg44dpHrU9fYY/fb
 5XJb8uhEUsTvZJhM5yYN3JkVQTws0t65gEtZ3/NoLyLi5ct2r5wrqnANunV6nlq6NeWddsWRN2W
 1irAI8Z90X2l533eEBJwm6ZwyXuag0KBdu7D0C5ctAmX8A03ejGF3qAsDhioLLtqT4dcO3CVJ5H
 5v7VIFGT4sJOQIEq5OSznCY3YsaXzYs7x8OhYRpQ933Af0p2IpTwnpOsL2uVAGyc5SyVHJXuptW
 3kM3gQ65lda/ewbL6+OaVzzhUFGeNUSRujW31BkCMWQNAKwdZ1ViVyFT8/0RFm0Oftbng/Oggu4
 MF4N5uokb6X/Pc8msuw==
X-Authority-Analysis: v=2.4 cv=F7Nat6hN c=1 sm=1 tr=0 ts=697d1744 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ynA9qmrkdMhaH5VwOwYA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: h4-bQz88R0xkso-e2rHXCJDQpL7skl6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300169
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91334-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56A9DBE76D
X-Rspamd-Action: no action

On 26-01-30 10:43:44, Konrad Dybcio wrote:
> On 1/28/26 3:10 PM, Abel Vesa wrote:
> > On 26-01-28 11:34:49, Konrad Dybcio wrote:
> >> On 1/27/26 4:03 PM, Abel Vesa wrote:
> >>> Add the TCSR clock controller that provides the refclks on Eliza
> >>> platform for PCIe, USB and UFS subsystems.
> >>>
> >>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> >>> @@ -0,0 +1,144 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>> + */
> >>> +
> >>> +#include <linux/clk-provider.h>
> >>> +#include <linux/mod_devicetable.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/of.h>
> >>> +#include <linux/platform_device.h>
> >>> +#include <linux/regmap.h>
> >>> +
> >>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> >>> +
> >>> +#include "clk-branch.h"
> >>> +#include "clk-regmap.h"
> >>> +#include "common.h"
> >>> +
> >>> +enum {
> >>> +	DT_BI_TCXO_PAD,
> >>> +};
> >>> +
> >>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> >>> +	.halt_reg = 0x0,
> >>
> >> These regs certainly aren't at +0x0 to what we normally expect to
> >> be the start of the TCSR node
> > 
> > They are if we add the TCSR node with reg range starting at 0x1fbf000.
> 
> "if we take the wrong base, the wrong offset is right" ;)
> 
> The docs for Eliza don't have the nice separation like on e.g. Hamoa,
> but 0x01fc0000 is what we generally agreed upon to be "tcsr".
> 
> The registers that first appear in that region are the same as on Hamoa,
> and so is the address, so let's continue that tradition

Sure.

