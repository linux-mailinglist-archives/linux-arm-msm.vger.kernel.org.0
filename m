Return-Path: <linux-arm-msm+bounces-113988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gxSrFHQsOWqrnwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:37:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4EA6AF79F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:37:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XpEzBezg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WAHnf2XA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113988-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113988-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED1793006141
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF451377EA1;
	Mon, 22 Jun 2026 12:36:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8736C0CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:36:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131803; cv=none; b=tXuhx087SbWQ81G3jIT9Q00DGT6A2t1GmqeCt+lCp7mdjK3mFgaS0g9rmKXzr/e7E0acqm+/GSEThtVa87/jVxG/OOFEWdqOlGAZYgq5ZquNme9KqluztHjhgehVBYqlJjIOPZibetICjBhfnSBQi1j/MUDrgTB8han+Js6OP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131803; c=relaxed/simple;
	bh=EtA61302bS1g+OEx7q97izo9hwr0uljIlqxMSfwOHTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rr3hwlqi8V2+R8Ak1MJ52zELhtCTBqCenqtevNp4NWjziR1GuLWg2DE/ZzIdssTSMmlVyoxzc0xYMMrg1M42lMRRZaBB7kO1aRutyCocBc55epi0MPRwGPxD4sCJQqAMZDN4uJQ3sGgXlHfwKNC4ip3EehWOkIr27tk7E8s99g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpEzBezg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAHnf2XA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MApU7s773881
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=85/xXwMZH/nS0cbMX5lIOK4H
	cBaA7dvKpaLQZ9tszvk=; b=XpEzBezgf2F7MPBZqvlQ1bLk32SRv2csVgo/yFIj
	COGhaq5HPTUjlEBBtsDQB4V6k1M3B6w15y8bz1y2H1XjzsU/ihdTaKn7R/gWN2O8
	t0Ddtar8D1y2OEgu4wjdu9i4Dc58i9wclYvOXWVR5juQg0DudfbrqYprUuQ0dQYE
	ZVuBpzMySEDoy1eX12uwHPPSvkOZ5TmX+dsGYJ3eU7Wy3dK2tAXNWjYW2TEjqoYP
	2XtJBjJyyUbddmRQZiCtsUUL8HOPr7jb8lIL86EXoYUta9FtVrgEZO0xFJ2483Y9
	EShWAXZpyrCkjitcm96N/jjFrYX/SafewFAT4lqE83YpeQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h6htq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:36:41 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7fe0184fa91so63506107b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782131801; x=1782736601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=85/xXwMZH/nS0cbMX5lIOK4HcBaA7dvKpaLQZ9tszvk=;
        b=WAHnf2XAVRwfBo52BfsEkNmOu5B6trAJnBPjT4yuRzwzvsbjiYrOpxaQNYiAzgqVY6
         AJV4ocGcaoh/x0cxCkfNnCub7b1hCQHYXnGdvNI/O15aNC44+aulF2okbWyXgXWEGH3Y
         vn4TiEWE8ct2l1sJswvU9k9bB5v/+u82BvEjmDa7RbCkDlJK1RtiWZzkZYIxjXBJ1Eon
         Ls/+CMDyX5Fckdrpn58B4XStW7iHVlN10l3UkoQ5SWhYODjqwSr7a1xO5Mfp1RmezpV3
         /qLBQhgswpdPA1Bz3mksTPEN5AGRSWhjyQhn2lwz8URn53tYghagUsgdBn+XCn1EICom
         Ih0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782131801; x=1782736601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85/xXwMZH/nS0cbMX5lIOK4HcBaA7dvKpaLQZ9tszvk=;
        b=EouQ+w+cm3oxW6wo0H0xrDp/aZ3BDOLK5RU2cGaybFLVbOs+bBB/qophv5BdlYUXTB
         bpL8yX9+RQ7x3QMRHA+tPEH5RS21jJp7AzPbrCePtVkXeT7Eh3YNxR842WpixtFHwPfn
         Cf4MrthQiFOwW0Este3U669GHvIy20RNW1mDXyPhVN7yVdDJuu405+0480q1q2Y0rW/4
         EgGAKluhOaLbLiRvVCY4KT1+/N1q4I7Br0CQ+mGY0i5rx2DHxJ7T1iDcDuvTMIRHENlD
         RtT5vUoaCAxIn7aWTGZVkOlBf/pI/PZD9wGaRoGQ6wKLXMjwQM2qTpTFel9oWvydoZ4N
         Hs9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rplx6GceRhi3b5QzoPxzd5B4LZyK7m8QG3xxWYbVSsobOLX9Bsfpxls1KfODJT2jrcJxZHXxtCVh/W++VqN@vger.kernel.org
X-Gm-Message-State: AOJu0Yytrx7WipUKHO9zC0kdy3vlqetjqSx7IOJwW7/C19qFsVRh/p+x
	hsqC7uzwUAE5qbotLxeCdq3w4muNN8z4fEurAb5cI0oBmOXBlbW2DxozKD7toxk+77ZLbovZxK/
	K/KqHSTvfCbAhaHfyuVRdrJjX0qDuVbrrDMgWZTxXClp9ZaKEVGjWig8pW5YTHmUV9mqPWzTd2g
	6f
X-Gm-Gg: AfdE7ckmybQHPxYOSyVq2dbL1Me2Sy2OF3I/2wrNkMWQoMoEUinUFhrPNNfIObVW6fS
	QewArexpd5/w3AKRmMBfAwHXXU6SycMGhDEktBADVo8/8bK1otE1JSEjHMdiJhX6NhwJ6MyjLZT
	GTS1pwLQXcjTtPsFISRowizDhZgiEmUF6ttDCH4PD+iHEDK0Os9Fg8Y+DUkL/JnjdjpU3Mq+QiB
	LcgF5o8zFvA0qPbeV0bUCbGnXwITcLsMTiLrAfrSq96zb7l7m2R2dB5YpPPMP6I1rHb8NdPKu8p
	nXH6I3WNFHFkluQQS+9OxUNeAnXLXSnlBXU9aGD79CjWei5YiJ5638cFJoKnCnNT1x3EiofvPe7
	T/e27lmPFidrKlkn/dEA1tjO0CV2RLPr2/d9ZTGYWFzapKxDZTFEfeva9rg==
X-Received: by 2002:a05:690c:630d:b0:7ec:5c2c:1d27 with SMTP id 00721157ae682-802647b610emr97805367b3.15.1782131800879;
        Mon, 22 Jun 2026 05:36:40 -0700 (PDT)
X-Received: by 2002:a05:690c:630d:b0:7ec:5c2c:1d27 with SMTP id 00721157ae682-802647b610emr97805187b3.15.1782131800421;
        Mon, 22 Jun 2026 05:36:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025c96f1d9sm30796847b3.4.2026.06.22.05.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:36:39 -0700 (PDT)
Date: Mon, 22 Jun 2026 05:36:36 -0700
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
Subject: Re: [PATCH v6 3/8] clk: qcom: Add generic clkref_en support
Message-ID: <ajksVP9WirekaMrw@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
 <032d6002-2205-431a-abc7-7c0a010c9897@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <032d6002-2205-431a-abc7-7c0a010c9897@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyNSBTYWx0ZWRfX2eSPAb/rNj+c
 vH/aCWGpjo+aOv3J+HcSjDCyB3I8oncnCA/WXnuYnY1WqnMyPd101IxO8MTYm0fOMbuxEKETNjg
 qFDrfY9yR1OYaAJVA/nhDk/Tv5hLZIgan947D495yXRhn0rqNawoRDmF3mqkYvQCQixc0L8/5cJ
 sfb4rFD+l14GuZwNGjBv8SJjDwS5AxOZHwj82OPVKbL+u9xzJpfbM4KY7VFUOPKRfiWd7J9onJl
 BUPE1VVMbM0lV7mwSQTlZJpL1MKAWq8hk34ZgobRyj3z7Seqzw/62P48PpoX6yZMwg16RaAAtDl
 Jj8arUrLMrKpfYAMFzy8prl+ahHsTYnFPeyuEYMryenYvp2fF07QDJ/VraXU6MTOaYhoOHofj2p
 BKsoRsiEAwAfx5OS16IC4vTZJqyg3Qh1eA7ZWZcG8zHCDMWTnQ58xlfDbv1cq9y+PMoSEsWetcv
 NZvrOXwU0+LQw8KNpbw==
X-Proofpoint-ORIG-GUID: aD7Y147b855y4h4GNg4d4rJMMDmGfuww
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a392c59 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZFdlRjhBVKwB3rJM7cMA:9 a=CjuIK1q_8ugA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyNSBTYWx0ZWRfXxeini6jH0zBd
 cBYHuPAYYA9OMrB/S3a7h2YccqSzDsXYFWDYOJxxkYnY6RUP52nUVJ9/52xycXV1Mw8WPw42OZo
 KKotYz1KWNVRrAMFSLSyScob/0M6cv8=
X-Proofpoint-GUID: aD7Y147b855y4h4GNg4d4rJMMDmGfuww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113988-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C4EA6AF79F

On Mon, Jun 22, 2026 at 02:13:22PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
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
> > +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> > +		clk_ref = &clk_refs[clk_idx];
> > +		desc = &descs[clk_idx];
> > +
> > +		if (!desc->name)
> > +			continue;
> 
> Carrying over from the previous discussion:
> 
> > // this allows "holes" in dt-bindings for $reasons
> > if (!desc)
> > 	continue;
> > 
> > // this makes sure the programmer did not omit something important
> > // while not taking the entire system down
> > if (WARN_ON(!desc->name)
> > 	continue;
> >
> The NULL name check is intentional - the descriptor array is indexed by
> clock ID, and mahua has fewer clocks than glymur, leaving holes at
> certain indices. So this is expected at runtime. WARN_ON would be noise
> log here.
> 
> 
> ->
> 
> Your worry is captured by nullchecking `desc` (i.e. descs[clk_idx])
> 
> because in the mahua case we've got (ephemeral indices)
> 
> tcsr_cc_mahua_clk_descs[] = {
> 	[0] = { foo },
> 	// [1] is unassigned - OK
> 	[2] = { bar },
> };
> 
> while (!desc->name) checks for:
> 
> tcsr_cc_mahua_clk_descs[] = {
> 	[0] = { .name = "foo", .offset = 0x10 },
> 	// name is NULL by virtue of partial struct initialization
> 	[1] = { .offset = 0x20 },
> };
> 
> however I overlooked that we actually just have a normal array of
> structs.. if we turn it into a struct pointer array with assigmnents
> like:
> 
> [TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 	.name = "foo",
> 	...
> };
> 
> we can achieve that

Okay, I got you. I'll switch to a pointer array in v7 so that we can check
!desc and !desc->name for different purpose.

- Qiang Yu


