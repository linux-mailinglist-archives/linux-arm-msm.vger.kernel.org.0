Return-Path: <linux-arm-msm+bounces-113116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ONtoHGu6L2rhFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:40:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A2684A26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:40:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KjqIPMh4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="I/fhEF48";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113116-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113116-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D908F302415D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EF63D5252;
	Mon, 15 Jun 2026 08:35:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE993D3CF8
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512500; cv=none; b=Qo5u/08h0ZeWzRFcEy85VtyrcAi9bccUCxExhQvjjcvPWczybUJQAOpNjDoqIVN4C8YIcghUBTCJQGVlqAtXL8xzXPnm/cT26Ml9ALBEHKwhgaWJcSDTt8bms3dWlauKf5RzaEV++grw/xXQTOaVtCRTA+W1f29mLRir6hlnxv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512500; c=relaxed/simple;
	bh=ahpmKFOPe4LlOsmuVsaSKybMb/iYYSuAslh1JkXf3Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQaRKYeYtIzCGZ6/9VVWDv066poBbPEosoPPji5lWcdi6Nt0xqCnCx6j+bFERcuLcICuG5wP3uf35aMWDSBHqKvlwaWxQLtIpFY4XfmgVkeKiS3QuoDN9pRU3Lky4qF68z4btv3H4Z4gwNivLuVc+YkBbMvl7N9AC8AoeIDej64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjqIPMh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/fhEF48; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LItM3828718
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hPc8xs1suGXRUY4bN6+AiHsY
	kPpfPjS99CY9Muaoq8U=; b=KjqIPMh4x35FLiKxjJtT+6EebHU/3pbGmSmBKelO
	UADrAwRg3LVTZtcOoWz3H3GWDjmnHHyKAMO9zPUV7cb3nCacg9Y7gTsVRnRcF2RH
	ehMiup1wAazJI6n0BHsHeRmyiVuK+DMJ0gNPmVRwEYYkMgM+jze+TaNWM9q8Uxwu
	CtbsUw7LgW8FFJLQ7PEyj1RIwIHuEzmAOQt6JUiO29hdNxpAxA+B88DOguCpnsZS
	TuxmniLQoUVMJPeLd0xxX9LxiqefflM+dW/u6YXaxE9cMQdvXJJa3+10PG7g0n+Q
	2qJBjfq9JzGT2nOEnhPdwXKg5xzKOXX8fctI2klXLAwH9g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u6dwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3074d4102a9so9037506eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512491; x=1782117291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPc8xs1suGXRUY4bN6+AiHsYkPpfPjS99CY9Muaoq8U=;
        b=I/fhEF48tiJEErDW5c9L5q4cRFN59JOBqslABtc2KKIWxRj63A4MVIvia1AdVwi71l
         a4mwntJ9D7jMIhzaBW56tsdcdnqRpyzWRHgdXkfLR+yGjut3RHF6SyVQTBLCLUAdBR+D
         peSishPd6Prpv1bFGlE0pItOmPyO7MmITN2e6gafjy24s9sfXnx6t2dQET9KDbNF1/zb
         1LdZDHBQIEtekMCo95ueTNjiUOehCOe9QhfbE4BP2kO/qvLIb/+TsZdHtRTsx1khs2ZB
         gQiWRX4xZTuWQE1B3SGl3UhcJ4KbKCRlpwQWxfKt1mnEgpmM+lQbpSyv2rAB9POHgyzV
         OMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512491; x=1782117291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPc8xs1suGXRUY4bN6+AiHsYkPpfPjS99CY9Muaoq8U=;
        b=h0fKx7uP1g27BQqzjcfS1DQOFxtGHze6hdVXYZCY4y4wwoD+pZwUon2r7CBGjmTSd9
         1haplSSUTK4WWUlD6Kxhk5TMmiUM1/6UAqfi55ZjnymfaPIi1vHUW99S9KzO8a0cV4Km
         MQo41IoEQLfSRSYgTNrd5W02oExqF0VzGXgQpLeqFFJ9S+jGxMiP2IULF4szVHc2CDyu
         Cpy0A5zQryRGV8KecjZMLhv66jH1rUHQkmAYezI12QJ/0FhVSeSWC9Tppw7kGxWF4xYC
         id8JZz9oRz6uYX4JTHfrgUcDIg/cucCDU91eUnTLRAC2yMG9FxM2JN2CnsUwbTzUp1vp
         I5XQ==
X-Forwarded-Encrypted: i=1; AFNElJ+08VXCL8ZOWe2Kjai1prh2v6QUneCYLFLs0mx5N9AusF6lYBS5HL0bc+WXZgL6I9sYEY+o3nKi5zPohTKR@vger.kernel.org
X-Gm-Message-State: AOJu0YywAf2unhuzytvJMDwAyIQlfcmnHTpzbT74CebUbO8vZQnivlOE
	gZQKqfH3UzPsarzStmBVvNkQWScUfUPA4/5GT/3skUvZ7LQmlI5H++la4iwoapXBb5ENy2DILwB
	UkrkQW6qq7gqHMfPEDcyaV1tGIJWMwfWmdhl7beH5XIqzQ6iDc8Dt8k/i+zgcbc9+uese
X-Gm-Gg: Acq92OHO4OwXUBTcTIo4PZ5iBpAE715ljDcrQBWPGf/urEXpC7zlJdJYlBKy62tHiL5
	diViV09LrxytZV4ZjSmhEM/1hdfltPmPQEPcCKVmGtE4KB/TM6L93qynBtVgtw6P+U79VSgf8BJ
	geJ5kPie77kqa+L888mKe/13dT41M+AkMHkN/WIg1zZfhfyp8kWwDn+K6ETUNR3kyRn3aOSw/xJ
	6iHF00LPzuX2J4tuyGLvcEU6f+j2oo5ayHHrQsvBMzKRmNSvJEFk87o6Wjb5A6XcTlv/ItBAgzM
	9UlEAUQDPeNVWav4LHiKp3r1qcJJGna1Pkmah7VFv5Y8O2p+rbOM073RPjcTqEMj13tMSEKPtUQ
	CspuD5TZnnTOnW17A4z3KpxdCU6kx0oXWYuU49f2yAFgYGA9OOdihoYZE+b08WT3RXiL0
X-Received: by 2002:a05:7301:19a2:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-30820262d7cmr7349899eec.33.1781512491207;
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
X-Received: by 2002:a05:7301:19a2:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-30820262d7cmr7349871eec.33.1781512490626;
        Mon, 15 Jun 2026 01:34:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e489621sm14099720eec.6.2026.06.15.01.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:50 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:34:48 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ai+5KOgueiN9FTq4@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <034a70bb-43f7-4b94-8a85-dce466081473@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <034a70bb-43f7-4b94-8a85-dce466081473@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2fb92c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ukEeeJt9K7XwON3hb0cA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 0WGNBsinHE7u4cb6igNWuEvsoUJxEAlF
X-Proofpoint-ORIG-GUID: 0WGNBsinHE7u4cb6igNWuEvsoUJxEAlF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX9ZU8xnkSq/cY
 w+yMBoYH7sR2WUyzCTAXu83/1mpE0h0oLCS3I/Q925r6YK76qeYvzy5ogb/8q3cmtfb+S3DMtRm
 HE43AzEx+wn+m+58ccnUXM8bg+Inra0LTTeCV/m9oKE8fyeHVI6wCXhXthVkigA/mxBozCZQRQ8
 L51Hv7cLOmP2uWzyJszTBPPs/bzmT+KekssiLGFGFv/hJ7EeQmYVXkQEWNjFgmbUE3/8FpvqfdT
 wBxnKcyWyLP/BJgJ7xvpSI5yBE89A55vTPORoNsqDBwFnip+KEdfhdYG+azNnhI7w4dSEwFeEOU
 4X1D+n9NJWxtDq3QpjgoKTSAq5xTDgn/5tWD3zXlEywy8E1+HV0JY3FCGSAFsnug6KPkcj9Yf3u
 jSYcqqisa/6CC2V2PbCNINNqVou42H4RPgyYCSZChP7eNhzYCCZsTrgETVwIpTFxPDfApwKe42c
 VTaO2YxD+g167Wkznww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXyd5QtY3xdyYU
 1AJMN2KOrrFhyPfnOUber4ObMV2l05ceZ+7FgoarP7PamHHee3xyG/X9rWL8H26ua+Wv24IuFRZ
 nl5NupF1Cm6/KV3xWQaxKJFUak8LIfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
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
	TAGGED_FROM(0.00)[bounces-113116-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-qianyu-lv.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,init_data.name:url];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE8A2684A26

On Tue, Jun 09, 2026 at 02:38:08PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +struct qcom_clk_ref {
> > +	struct clk_hw hw;
> > +	struct clk_init_data init_data;
> 
> We don't need init_data for each one of these, we can construct it in
> probe scope:
> 
> struct clk_init_data init_data = { };
> 
> init_data.name = clk_ref->desc.name;
> init_data.parent_data = &qcom_clk_ref_parent_data;
> init_data.num_parents = 1;
> init_data.ops = &qcom_clk_ref_ops;
> clk_ref->hw.init = &init_data;
> 
> ret = devm_clk_hw_register(dev, hw);
> // not needed past that point, __clk_register zeroes hw->init internally
>

Thanks, will fix in next version.

- Qiang Yu
> Konrad

