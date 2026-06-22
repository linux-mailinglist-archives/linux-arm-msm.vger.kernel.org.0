Return-Path: <linux-arm-msm+bounces-113979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tW1RDU0fOWqfnAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:41:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEEA6AF2CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:41:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cDyLj9M2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Gyr34QP+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113979-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113979-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43299305E19F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE81E2BEC2A;
	Mon, 22 Jun 2026 11:35:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D92C21C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:35:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128152; cv=none; b=P9I9xER/xRqAa0lIecm3H2eLOthXKsTipdd+qtJsP4ymqhDN9trWXPDnNvY/lwdUNoSYZrNif2YPLrfixFbF2iuhhfbrwfmzGTODUjPRNH94NolwTgxL6s4p5v5SxzvPIYJXeSGX2pRBWjYpos2ZsjKYHjvUEUGmItc1Itf1Hyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128152; c=relaxed/simple;
	bh=H+bLQ8sY+X/DAsTuwmbLcqsX2rytoWHHNQhtsBoNsOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwORIQ6j/KyoCJxVvHksyyYNpR41GiDOmAc6E9QiR8UDxypngHqqUPooXheJEFZSUYJSniNMlYAggEJG0fSwsoUDHnGSJJrtdGFkZJwjJDiUhUD+TbHubv0K/HUOS2h8z5XBSxFla+YXZ+n+YgJqnNxSD+WsseRwcyJkqlQT8K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDyLj9M2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gyr34QP+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoe98740790
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbcXRcBRms5XtWRsr6Jwip+LyAqtjDxP7W2eMPw/Zi4=; b=cDyLj9M2KIRbuwDe
	lgMj4g3vlk0TuSDqWKt0e2xnLWu9Pw8ml6XwPFXLMiPvIRcDHOXX2hDw99pA4ctl
	xtEu+KtkzdvLhGt0PYOWQnl0ZgF3UdvyaWolhyflehNfERcRMWvlwhRC5Rki6YN2
	JINQOY87Onf9ELTUUVn2aWT+Iv3gp7ItbB44SloGcspyNE6yVtbqw32UPfUPxRZS
	/ae2SCCzrWmQNU8fmzZ/7vWPg3xgWtwANiDCCdL/zETIYQS/mYnRLpR8uurYcD3o
	+RUWmF2hHU3MZBKSC8DDussTWy7TnO82bK8F+ROgWB4PnL1Ou/4z8z68v5pAjoOC
	gZe66A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1sabt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:35:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9229581de9eso6433985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782128150; x=1782732950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbcXRcBRms5XtWRsr6Jwip+LyAqtjDxP7W2eMPw/Zi4=;
        b=Gyr34QP+xELpVnkvZ8c7LTVVrMNVQz5/WC9feTQ85CtQJdyRdWijsEmyVbDhrBQlSg
         JY+SaBM6pdPUaZgqmeKsAP+LqIh6gs9NCzK2ASxK6gk4NsR5gct7imfyWkrERwMME7p1
         8sHsDH5xPRa5QgOCysKs3IEYsGCu0kcluSBk9h9zYooI1yzngOYAKrozvJ13Lc7NYibL
         pbModrZvFxkcO1AFEXZhptTs6rpBLeuGwtNVfaYBw7dZmaWbpRfL16Z0vh/wERxWDO7k
         zZZnLyFzPDAyf/GDsPnM8x/ZbV0tm94BZiFApQMJqAHoz+TtnLqR/YE3ikyn/ykBRMa7
         yzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128150; x=1782732950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbcXRcBRms5XtWRsr6Jwip+LyAqtjDxP7W2eMPw/Zi4=;
        b=EELcbrmWs6BL1pE+z/YLDRSS8ykRJH897GL8Cce7ImyHHMx6zKwDnuKNf/61Xqmk6D
         4uxPl5dar3xZJcn4V7/fC8WGoSKKhcS4mV1c1YpoL2rpwJ2NADwsJ/9BC/swZMS+gJ+F
         BDOGTf102pvd628HOq+4bfEog0NNlpr6tx2Fy5nIZGA071FtXXQPXJFoV/nNe4BjX5cG
         pc6lZXMCUZ9FsTaMzfjCckDS5A3e6hDgLjbFRArrwEswz05ttW7Ac7b4Vav8jcHYCebm
         L5N1ku63Au8kJlTsAqZoWYs88ZsCZ/ylExwhjz5zGbpPUgUs8hrK8WLZjI9wQ9i8S6fb
         gP8Q==
X-Gm-Message-State: AOJu0YxdGwSlw8AYtnikK/0SbwQxXnNzF0akXIaOFl5BHvivJYpCmFi2
	VPS9ZSGXzMg0qiYKNn1wEiZMRyHm6vY3xUybx69C5NxX6mKh2TN7G/m6hpAslrYpP3mfWGEO3Jt
	zfqLssQJ7myRmOexiUt7SekCuVRDKl7gv/6nZUJCm6tucaaxtBWFr5aw9YmowSsUcQkbf
X-Gm-Gg: AfdE7cnBHGetxa8fkqckw094LNfGMfISJsArr0r84P5N5djc2oH/O3SPuou/kuuAaYU
	IMV8VG9odyxe5lzbXFsk9RzJ7iUCoRWCQtJ8CnXfd169F8wMFFEtaXjTXVyq/QrFvbQBZyz2hZj
	q+jhVPOO/m/09pDG3sRF3LaZAl0UTGgfkW4XLJNgsTBFp2oEfodEZ0YIaqQnHBbq6Zmisl+mE20
	aaZu6dtCs8gtIJn8etwYYifwJR3YXD3wxcw9fvoBeNTttu6sJTbE5Ba0ZMRlli+wK00nzk2izbC
	1P+PbDMSqvDWbMEphOKB3N6P3vZGffMv8pjFvCdyhBfttn7ohHCPtinHGsTF2mklFZ41B1QR/oP
	q0CAFOOyalTVErAezFSbB3AJjMFpQhr9ovAI=
X-Received: by 2002:a05:620a:6488:b0:915:8055:3f9f with SMTP id af79cd13be357-9208debced0mr1222851985a.6.1782128149187;
        Mon, 22 Jun 2026 04:35:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6488:b0:915:8055:3f9f with SMTP id af79cd13be357-9208debced0mr1222848485a.6.1782128148721;
        Mon, 22 Jun 2026 04:35:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5ef8eb38sm339442366b.28.2026.06.22.04.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:35:47 -0700 (PDT)
Message-ID: <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:35:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m44swJsIF01AAmPAXyIJnon0892z-b6z
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a391e16 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oO_X74roj20hkPR3ujMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfX9Nx0rEiK/LtQ
 efM2HfzhEwW35BDRA3dj4ZEyybLxokjclB4eAzh6RDVnFaI/lbIwEXVFuno721M15tm7vUaveVe
 NxfZ4iF+wwsUpDoAret44FXHTq7jfsQ=
X-Proofpoint-ORIG-GUID: m44swJsIF01AAmPAXyIJnon0892z-b6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfX//1uDUSll3rg
 GBLo+tDnG9DyVE5KbMHhGPG2pyYzffzb42plgvmJ2+Ny5rh9ONDLyG+6+v4mvQlHMG4W3rBhMSv
 cG2ct5jRWq49g/l/RiIbBzjpSMsMQNa0zTOjp/FmiDCL6eXumkWMawoDUhViAIdDsXafAMfaGFu
 XE0QvJO3Yf3wfxuk2rgyA6Cvbbpyi5Pr8+4FmWO7QaUG99uGin+5V5whZriC270SZWz+r3eadpZ
 laxyifusbPxH+Bm71VSuuA+MH4SeYdm4SB917zCCYcStV7qq6Uo2pf6TpqtW47oE1I1kkBre8fF
 yGPJsf3YbSUwwfZrgmtu749YUtdiZ5eDXZdvhBBjtOihkiXfH/Rb+p0Cj1mOp8CoSKbWouNUmcM
 PFuRl25Ooxfkv5kyLk7F+btwbEDeEq/sye2CVNrnHDQiYKMfJ/hRIVhvpb3VWMBwtF+LqnXwG7y
 cW6G1FBR6+46ErBlS9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DEEA6AF2CC

On 6/22/26 7:11 AM, Qiang Yu wrote:
> Mahua is based on Glymur but uses a different QREF topology, requiring
> distinct regulator lists and clock descriptors for its PCIe clock
> references.
> 
> Add mahua-specific regulator arrays and clk descriptor table, and use
> match_data to select the correct descriptor table per compatible string at
> probe time.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
> +	[TCSR_EDP_CLKREF_EN] = {
> +		.name = "tcsr_edp_clkref_en",
> +		.offset = 0x60,

EDP goes through CXO1->TX->RPT0->RX0

> +	},
> +	[TCSR_PCIE_2_CLKREF_EN] = {
> +		.name = "tcsr_pcie_2_clkref_en",
> +		.offset = 0x4c,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),

this is apparently for PCIE4 (the name you used unfortunately actually
matches the register in TCSR..)

(ok)

> +	},
> +	[TCSR_PCIE_3_CLKREF_EN] = {
> +		.name = "tcsr_pcie_3_clkref_en",
> +		.offset = 0x54,
> +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),

This is PCIe3 (actually)

CXO1->TX->RPT0->RPT1->RPT2->RX2 (ok)

> +	},
> +	[TCSR_PCIE_4_CLKREF_EN] = {
> +		.name = "tcsr_pcie_4_clkref_en",
> +		.offset = 0x58,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),

This is PCIe6

CXO1->TX->RPT0->RPT1->RX1 (ok)

> +	},
> +	[TCSR_USB2_1_CLKREF_EN] = {
> +		.name = "tcsr_usb2_1_clkref_en",
> +		.offset = 0x6c,
> +	},

(usb_hs phy)
CXO1->TX->RPT3->RPT4->RPT5->RX3

> +	[TCSR_USB2_2_CLKREF_EN] = {
> +		.name = "tcsr_usb2_2_clkref_en",
> +		.offset = 0x70,
> +	},

(mp0 hsphy)
CXO1->TX->RPT3->RPT4->RPT5->RX3

> +	[TCSR_USB2_3_CLKREF_EN] = {
> +		.name = "tcsr_usb2_3_clkref_en",
> +		.offset = 0x74,
> +	},

(mp1 hsphy)
CXO1->TX->RPT3->RPT4->RPT5->RX3


> +	[TCSR_USB2_4_CLKREF_EN] = {
> +		.name = "tcsr_usb2_4_clkref_en",
> +		.offset = 0x88,
> +	},

same as eDP

> +	[TCSR_USB3_0_CLKREF_EN] = {
> +		.name = "tcsr_usb3_0_clkref_en",
> +		.offset = 0x64,
> +	},

(mp0 uniphy)
same as TCSR_USB2_3_CLKREF_EN

> +	[TCSR_USB3_1_CLKREF_EN] = {
> +		.name = "tcsr_usb3_1_clkref_en",
> +		.offset = 0x68,
> +	},

(mp1 uniphy)
same as TCSR_USB2_3_CLKREF_EN

> +	[TCSR_USB4_1_CLKREF_EN] = {
> +		.name = "tcsr_usb4_1_clkref_en",
> +		.offset = 0x44,
> +	},

ok
(although there is a comment suggesting this may be NC..)

> +	[TCSR_USB4_2_CLKREF_EN] = {
> +		.name = "tcsr_usb4_2_clkref_en",
> +		.offset = 0x5c,
> +	},

CXO1->TX->RPT0->RPT1->RX1


You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2

[...]

>  static int tcsr_cc_glymur_probe(struct platform_device *pdev)
>  {
> +	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);

Please null-check this

Konrad

