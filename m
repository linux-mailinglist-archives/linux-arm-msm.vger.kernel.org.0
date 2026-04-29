Return-Path: <linux-arm-msm+bounces-105098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNlNAKiC8WmChQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:01:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805348EEED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E708630480F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354D32BE7DD;
	Wed, 29 Apr 2026 04:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNkjBacD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6iq3i0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4CF169AD2
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435295; cv=none; b=R/AU2J7N6SveLDMG6SWoCUWTJUTE0VqWC9vDDw6tZdjN1sth9VZl2BQtMtN+jjxC6ke9aIsSnl4lcLtMZ75AjR2CPcT+6slZKlTnsiDqsYioAvz8mMQHgU4KA7VpRf+H/bch2YjjvbcfeCTb7GoMXk8qF7mckdlrShMJKk/Wsyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435295; c=relaxed/simple;
	bh=wWwq+KhbkFxgwgPt7dPMwgoRpN9PMBmSkiRZgZ9cims=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akbGbTnW56PiK8C7UwK4MQR96A3JX3su3aB5+4RNzbehpVh7FS7pdyQle44KgaNu8iV2iXAkDZyEVqGhkDtKhHYT0KClEKGwkJHjlyDavwpeiGhd6NIfOpy5hpouYzURU/JWcC3uiE01I+hIbK4/9r8n+yLz0LSybhsm+o0yvh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNkjBacD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6iq3i0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T35tUV831369
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+RvcmLbtjwmDSQmjg5NMkpveSVejzGuW6m1WWEJaTo=; b=VNkjBacDR2+5SsTA
	DQ5OZnYg9M86d7YfqDCjOj5haxJvONLqxvzHG65jiYtdIZs4yYHYK5LYeyxHufXp
	Oj0vO5+SkHBNd/3xAXEtK+3O1tto6utfHc4/7cu3tDSqyzFizPcJIUlR5aHVvBVt
	iW08qhcTHk4hFh79Sn1XVtpS3EqDysblJhR3dKfd9uu7Pk4FX25wAyMavGLXnjGW
	8t5foEo+CRyoGY8Iu2hZF0ruz79LHi8i31Tp+boT5RiDHqOOob/PjVLlvbwnhZwQ
	tpoE9cougmQculqK9Jm2YloGCqncLVwJiV6lm70yVckhtgVpZD0pA2JR/9ICuMXw
	/LswJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wq9y10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:01:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c6280732so13912210a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777435292; x=1778040092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+RvcmLbtjwmDSQmjg5NMkpveSVejzGuW6m1WWEJaTo=;
        b=I6iq3i0gtFUPnbc1+WMkTGmXMGWvoQ7aPc88loRzS2/qpxYh4p3T+qxKA4WXEoh6ls
         4zSwDiadqQun1Hf/wHYjr8D2Gd2troGwE4ffr0EjR0NXAeMp26Jf4Tm72iIMDskW0qew
         sYl+SAbWRB6Ox+qqOjPhJewLaTQHNFCYAIOtXxgB48ESVAVcZkJaeJyW3+QYR/Z6t/UM
         eZone7AYy3AIiOaKxDE56pnB4zG4m7SxCdLzjXqXvhHDmWcwEo4M6nCKcbRQFc1bNjJf
         WGahWBanFsXJdmxrSHrmSqTjX+NbQUv7RIVtNvaJCGR0RcEOy0dpVnLHKNuNPsQBTlGO
         QYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777435292; x=1778040092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+RvcmLbtjwmDSQmjg5NMkpveSVejzGuW6m1WWEJaTo=;
        b=E3TFJVeuOKCvy68aqiipulkEjjIH1dFpP6jon3vDoH7k9yg1tMd2u7/oPyo0oXQgnC
         y/rVrHAaaSV7HklKlXWq4W6l9tJDDfpcBO/DUbz6ut3phab2KqtnTE6LyyP41XRlJ8Vs
         V9o/qjq7n6B8Ti3fP3Jk3NlDmWKkfsvJ0Ydr9M9McnpWAbdiRPyTnxOSfKzq+vTSjVVZ
         JbmK4jqJAjzCoQBHnenv3Mwg79Bxbyl4JKBTkgl6eWad4wqvNVowaDt/TJNHKmSq8MJC
         K5m+AkL3NXFV1Wis4lY1x5laFjZf390gawP9NihakTypEqIrBT6VlaNGyZMaL8+l7vTm
         eUDw==
X-Gm-Message-State: AOJu0Yzyv42U2bd71GH3mIutLeenTBSICCFPTpxf4aBChV9ea3zXvdsP
	YvnYkjg6iy75EtcGK2ECc1nOn/NqqGjpAyZBACRAykjCdz21mBkH/XwIxGkMYg9pye6fx1vbxLI
	7NOuiuxeFNQQlOM2cyE1gZ2Of7ViRUK50v0yjXLApvb0W//mjqp6IX/6A4UmvCPw+5ErC
X-Gm-Gg: AeBDiet6cF/3vxXYNkM3JGYdr9jCF0Et915gZ2gDNteFTcOwQOXXMwcJWt2gerjOedV
	dJMBgwG6B3WN3/3jBLyhxydBkrNq6JRvbrevd75hEgyJnopFvhVEXBDyAczPoeKg7b99p8lZKd4
	YPrg0SYJ0OsLR/mqOCF2s2i/bv2qBZOKEKXzw6Z3cS4b8krB34+WsRGbp2wTuHLsJSEzrc/886E
	BQXAOeAOSqGXXRDllUumua0O2OLFGeoIpV2xD+Spx5NnecwMA20s1uvP/0CpvC+qGhyqZD+hxQp
	4JWfu1gJxaIEi77Sv0QqEUQdHLIRlgNxmoju84gi0gYNMtcEPHDrZfbjQ6Lr2b8slz9XrBM5AWG
	30TcGZI6SLCnXD6pR68sCxChpqPLNRHo6alpj1/DDtT6097NAPCxXROL9BTPmio4Msfd3UhJyUA
	==
X-Received: by 2002:a05:6a00:3989:b0:82f:8a29:e3b4 with SMTP id d2e1a72fcca58-834ddc9558amr5619416b3a.50.1777435291999;
        Tue, 28 Apr 2026 21:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3989:b0:82f:8a29:e3b4 with SMTP id d2e1a72fcca58-834ddc9558amr5619381b3a.50.1777435291564;
        Tue, 28 Apr 2026 21:01:31 -0700 (PDT)
Received: from [10.48.22.70] ([27.60.165.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6debacsm550349b3a.33.2026.04.28.21.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 21:01:31 -0700 (PDT)
Message-ID: <6a2a4766-2dd8-4da0-a180-0c8ce3dc8d8a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:31:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ9650 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
 <6ca50a86-0b2a-4eb1-8873-cb80f893174d@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <6ca50a86-0b2a-4eb1-8873-cb80f893174d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1HTRg_UzKXYBxcr__ahQgXLI90Er37QS
X-Proofpoint-ORIG-GUID: 1HTRg_UzKXYBxcr__ahQgXLI90Er37QS
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1829c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=XvYZRKXU5Z7yJT35SDuk6Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aBoApAjKkzgGVCnEwe8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzNCBTYWx0ZWRfX0S1xJsGiCWES
 2Se8JqmyP2ZY0PIRdJvUIXSDfAZ/URM2aqizcYCT1eP7mIHj4/doCeqH0KmVsfYJB4MeKdQ7sDV
 fPhE4YAAKGr3G13GUWpe6vMqpGjOzU+VfQvzxaelOSAEB30r9s0CH96yTo0BvQfRn4j02u3w/3M
 elh0NqmhDjoCAIqgOfQ1mOX8i8vt+96srGZYkfJQMQg62gcOKTsuNHb8HWTaLNPBU5r+1RTOI7o
 AMXpkiIDColY9+hwZBTWF3+d2jZAGzQ7H80mUhLGz/KorxZev1/5V9+TemJO9nz+YwwkTq8UCL5
 pHMXKn9O+qH5CwspvR2ctHuZGGQ/rVYYftqrUXVPr/v9KzL+MiTw9UPfQEP84ncmoGNI7wwVXtF
 lhtuj3CvGGiCtEnWR+iYKwwKi++GaS8b//kZbrnBo4QW6poMfhRJHgQ/+rPxSqEHa0TAIB68Z+G
 30M9M3xFK1JvVeV1zZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290034
X-Rspamd-Queue-Id: 1805348EEED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105098-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/24/2026 5:00 PM, Konrad Dybcio wrote:
> On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
>> Add support for the global clock controller found on IPQ9650 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src = {
>> +	.cmd_rcgr = 0x31004,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_0,
>> +	.freq_tbl = ftbl_gcc_pcnoc_bfdcd_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_pcnoc_bfdcd_clk_src",
>> +		.parent_data = gcc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>> +		/*
>> +		 * There are no consumers for this source in kernel yet,
>> +		 * (will be added soon), so the clock framework
>> +		 * disables this source. But some of the clocks
>> +		 * initialized by boot loaders uses this source. So we
>> +		 * need to keep this clock ON. Add the
>> +		 * CLK_IGNORE_UNUSED flag so the clock will not be
>> +		 * disabled. Once the consumer in kernel is added, we
>> +		 * can get rid of this flag.
>> +		 */
>> +		.flags = CLK_IS_CRITICAL,
> I think this clock is normally governed by RPM.. is there RPM/H on this
> platform? (doc access still pending..)

There is no RPM in this SoC.

> If not, what's your plan for this? icc-clk?

USB and PCIe clocks uses this source. So once those peripheral supports 
are landed, we can get rid off this.

>
> Konrad

