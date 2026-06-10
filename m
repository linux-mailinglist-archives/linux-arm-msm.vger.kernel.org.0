Return-Path: <linux-arm-msm+bounces-112485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zTN0AAFrKWomWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:47:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFBA669EAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:47:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pP8b10wm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZVbje47j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112485-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112485-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A72FD300B9EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CD94071CF;
	Wed, 10 Jun 2026 13:42:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC8540861A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:42:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098928; cv=none; b=OIPQXLj3eBUOxzaAqKmI7bo3eCFXoParQ5Hdba1l3cCCWkRkFzn9IIdUDTZnx5dnV5HqbN2mVeGvZ/r7ywoY9nAVF6FHdIwFkQ57MKXgIzlOVf8Fx+hN4TfmOd9ZkQ4ebXF0tmyYRMR5oaW3bMV83soVXvkhUIvJZRGzlzvfYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098928; c=relaxed/simple;
	bh=elJRuIraj9LIEayHYukMMgz/xD1kzi2NjhMOTQ5gYd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7jnURlpNPb+JkFf6/q5RhBdvf12R6hNh2qiloRd0s4TeXtqv4EW4YZK3foORXkmmt2Sl4O3oKZ0/nOH9aW8qGb8H9fEZBVWmJVaBnCGeQQeAZIo43y8nOiwRW4JIbAg+P9HOhcymv7Zu2whvPw32eqIdp1d3+B4b0cHoFxEbdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pP8b10wm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVbje47j; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC5xv1600507
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYnE2tPNTKuctm3/u9D3muC5XwJ0vpdtl+XoYeIZ1mc=; b=pP8b10wmZO//51Xl
	I5AMUWEu+gL7jwhLl/tVtpQttKyZ/us5SbZIIV9JyOI59XP08HmToOc14Ef6vRyI
	w2NJeK4GWAoQS1i//PIMVGkJTlhvlYz5fIntJqwzaBnh7Aa1/QDDv3zSD0G1Dcyf
	n6vJKOz+zLQzFgfmbDdCvda4ImCujHlk9sWDFC37+a3aMzLGQIciX4o0moI+Tbv2
	tMEOL/NOHAJwqIBDYk2jOY5RjIt9dV9HCdlqgHZ57MOi5RBy1KO8g+6oNibZ4ILP
	/SkUkvH/K/WtJsPzxOwqwOC1vf3cyBI4A/zRL2ti51q5BGKRakpMwv1D3dWsdiWk
	RRC3Iw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg1uj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:42:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a4ca0a4aso202677085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098925; x=1781703725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYnE2tPNTKuctm3/u9D3muC5XwJ0vpdtl+XoYeIZ1mc=;
        b=ZVbje47jsqJGtysU3r4dAN7gLFRgP8ET+MNv/jzhR8P5BGZNRVQxufTiBfh5wj0Yoc
         A2CPMFM6I6xMwfAs8SD+wXDpAXUXPcHPvrdXAFUKn4JIs2w+64klrpRoW+UvnovbA4Za
         7TM3RcXw5kGid/osv9I9hICV2+r6C/+h/GwwCwuonr8zOPj18d8yHZB//Xuyu9TQ5oXZ
         W8WpkIqooQU9mF4NOY4nAX/TTyuQPXg8f5OCl1FpD9NXAa8NQcNyGaNvKL+pL3wRo8sI
         P+kSue0xFdLU7KB2xWQfKsDNOuMmo10KSk/RMacnih1LCvfBuZmZERQDU0CJqC6edKja
         k/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098925; x=1781703725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYnE2tPNTKuctm3/u9D3muC5XwJ0vpdtl+XoYeIZ1mc=;
        b=LyFtO6oO8F+dPlbUAZd46SoAL4ovCDPc3ofZajXGg+qkTa3lvt07/6s+kLcP7m2lTS
         2VufCW8bqKTTO2Ad8lOOnGcN3HD330mvxoegyJ9TeFK5VuTpiqyjGNfj+UN5V+Ob90wH
         ImIGHZd8F2gUB38nf9c1lnnpdmtR11mP9Gvgc0G8O5P3cLjUH4LxXWYsRZ/Pi8rhpmpt
         9BMrjplp2aWiKRBnF/ECw9VF8v5uLjafReTUirn9KmZbCvrGIInoYTXBMiGNfKm1QKl9
         Np5SKUqKhN8EDvsDCtpCQaRGDNT4e3t79sY8Xh5sQAvkRd/lvnKcaU5Qpmzj7uwZmxVd
         7++Q==
X-Forwarded-Encrypted: i=1; AFNElJ8l2vBMEUvGuD3pt8VbqE2vr2yV45DWyeEJHWm1DGBFrsFlmneXWQJmgGE2ViZqogi3lOERKGenlyBdLWmK@vger.kernel.org
X-Gm-Message-State: AOJu0YzkGz5itE5VxkPvQtzn5avgYjkdmqaPh/16lGuqEu00LEEofwBf
	aSx43RPlXlxH4buRumiPpmU3gruoOJhLPeW0UBcSfQbMZEqkA4lDwPb0U3OT+4oT7AY3L7N4vQW
	mnfcJkOdmCNjVe7s8V25/bBx7TjzWMvPJOCcrJ3hrfryK4SUSpx2Bn/Wfek4RQvJc8K32
X-Gm-Gg: Acq92OHD3sKYccpuyjiZVGKSP+Na+JScA/99CT6K2kDvoclOE436Z6G9R5cmcbnWo26
	rFZBxQPpQxh0x0p3qp7b0rwMUD6d4tHjZijgk5TZXbbR+XbbTZXESwQKIBQfujYeUJPM1a/mz64
	ovz8+p73wVbf91/vxDkeQN3iPTEJYgApINSXOXpkuMDS5M8pylvme8bAoW5qWH3MVLkN8xL9TlA
	TAcbg+hjGyvzAufawMqO0v+h52LZ4QAUxr/jS1Pygdek9YyC/CUpUYl1TEz6uiFf3ZEU6MWIfBk
	IuE5yHOmbFlaNCNkpRYPZz4AczShO5LXNzNhrz+E5R05kU95PfM60mkQsWhABam0MpcgAzvBRSh
	m901aqPd+HLMm4vmV97BxkcJXvP9a6MTTWSAoPOE/Et1u9zm0cPmJ6WO4
X-Received: by 2002:a05:620a:d45:b0:915:e7bf:e6fd with SMTP id af79cd13be357-915e7bff664mr501602085a.2.1781098925204;
        Wed, 10 Jun 2026 06:42:05 -0700 (PDT)
X-Received: by 2002:a05:620a:d45:b0:915:e7bf:e6fd with SMTP id af79cd13be357-915e7bff664mr501598585a.2.1781098924327;
        Wed, 10 Jun 2026 06:42:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ab61sm5457550e87.45.2026.06.10.06.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:42:03 -0700 (PDT)
Message-ID: <a19d593d-5b6f-43e6-9640-83305fe2f9cb@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:42:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] clk: qcom: gcc-mdm9607: Fix enable_reg for
 gcc_blsp1_sleep_clk
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-3-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-3-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YnilHl2Gm1n0akoF5XjH78D6ErQPar3i
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a2969ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=94LYJJSoxN27RZodj4oA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX5yLZyxoUD5lR
 2dCkrhRwXefqBsfL7RHeb7zgdsUlVL8k8vLL82gnT5xJUP6RqwRcpskZon+XUASvNOmKEuGRfsK
 9nfh4qgdNcZeiZCm557vFECWstvu6jYhPAmVuT20eqIkHSpH2gz/E0sP7NU8R8CQYflo3YPGKUX
 sex1DstDScD/mCQOOGJ5nreF8TvmZ2ZrUAUBCkK5uLVpyDm1woDJPGwF62IGeIUk3BZOgD3pAu5
 YizA30VORn0QzqH2gLuo+qYeqC8yvkQUBImo7cZFJGzCV4hGcu8PTTD7sSjRUNKPfdDT5Z3/FB9
 AOdY4xv5KwKhjrhWzZfQPXQiYieTZI7yTgTAaOoVbq6gKNnzvR1FFp3a2rbPaWBi5FMaztQl8S/
 Zuqan+2UpF7Bf2lhGjcOWa3wzoJqmUPGR+Y6KU+Nhe9Ej+Scqrilfj1CNcyyQtsIAdhN8+ZI79a
 9QcghKOdnZ2QBCGhM+g==
X-Proofpoint-ORIG-GUID: YnilHl2Gm1n0akoF5XjH78D6ErQPar3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112485-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,gerhold.net:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CFBA669EAA

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> MDM9607 is similar to MSM8909, where the GCC_BLSP1_SLEEP_CBCR register is
> read-only and only has the CLK_OFF bit to check if the clock is running.
> This is a shared vote clock, the correct way to enable it is to vote for
> BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

