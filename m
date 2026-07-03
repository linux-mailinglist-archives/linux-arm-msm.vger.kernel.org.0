Return-Path: <linux-arm-msm+bounces-116307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JBwBLK2pR2qadAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:23:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881F97024FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:23:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CRI0TDj3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kppuVW1J;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116307-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116307-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F37283006B0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EA73CA4B9;
	Fri,  3 Jul 2026 12:16:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219B73D093E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:16:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080995; cv=none; b=Fd1YweTEJvqsc9NCB/DwjqJBglrQWAtOwogZPUex8xI1mf+os/VN0WxW3ElV28sevJr0oA6yram/sZhhnwf5bPMaBDbxnYOMmhOobHrjAl4xYKjLXanxZlB6e6/D023qqaGP42aotYECNOBka278hguhTGT95VNFYT5mfShevZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080995; c=relaxed/simple;
	bh=6NXu9te8yLzaQZaipfuVaGTwPXyX+RpS3G0mYrIZA/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeI6OjfT8EZjI+O6DFLNBeCViQl67Lgt+GHSw1cMPpld+o10eCbe876ZNd+tXHh9l+B8dmDPbp7Rsj2Z1wCsQLAgwwy4jKwKA3oEc49n0UBuMjdTrPogwux+jBvbQ3ysSg74fVCd6e4uzJf1ZGmss1QUo2Uil7Ujez54ySkpQ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRI0TDj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kppuVW1J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BKPtW2994861
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fjDEdFYbnZhqyLlsdmQqlceB
	oYHqGDyw6oOJyZWZ4Pk=; b=CRI0TDj3zvPnjTQm4QxcAvlqQesDLNKzC4zFteBr
	Can1T+Dh5WKkvbmHc0Bs9E3KzYHlpnUkjn/fVit8kzOifl9JI7/TurE2msL5ly7n
	2vshCoj4jIKl2oQ2NbPC3C4ODuocS6CZ3H9y3EWNpIUtT4XNONpJ9ItwZnMFADUs
	vADcG2v6l4LvcBImdWBpWKV2BsuoPHwdSmLk6aia/+p9Z9A3rj7zJHgXlGeSFOQ/
	pwBjy1ikBXknhoWbnOe3C1RwQo6AMhhUrkscQXNJBMg5aeewywvS6yr/QlR9w9dO
	lC3VoRh4/iRsJGg6MHdQBXXvVuOzgYx/fBwLeRhsM+xzUg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n2b1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:16:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bbd0afffso12090405ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783080992; x=1783685792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fjDEdFYbnZhqyLlsdmQqlceBoYHqGDyw6oOJyZWZ4Pk=;
        b=kppuVW1JcHXYvHXF3c9mN5CGiUZhhJRZOPeOrsQ0lgPl7iPrUtXwGYk78vPLFQ6NGG
         eKbc5OrMWjahx0AFeDztRh1qPKqnAtNEx6K7UkBwueLupvZ1X9U5MIagC/fo29H/HfXb
         ndejel/VrVaRAnERlxMq4ZFEeuA6/h6iZth90wBfTELDGvLL/CYLnn/ZxPP/kba1+CTR
         QCuQBYf+Dm7L8rg4kWSOmOTRrWrPV5CSu5kOCuGFWPuu7VKq1AjuHeR0MfKknsIpw9+Z
         KoD59HziFsFh3zj8UgjvL0Y3DRVJyHiq7sSfJ6Vj8PhrLyQrDOx5UVak2+11EB8MswEl
         nYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080992; x=1783685792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjDEdFYbnZhqyLlsdmQqlceBoYHqGDyw6oOJyZWZ4Pk=;
        b=bk7D1o6mLKka23Z7po0lVZn47dOz96H/9iT6jPdq9b4fgJZ+Wx0Ca7jr2qPnv/AK/z
         FFE5sSbgVNAwVzBjcSpVANSolyMVz5aPsJwSOWGS5tKCpYeyvobBkV2TnnWYpyaunM+9
         o+gVcdN/6Il2hFGI9ZS4ZxwSRwiKnW3EVGc8+ReWFBA/oyrAPcdP+lxSnmoAFkBgqiI2
         spop+MpAq7plhZYkHDnncMWymXerHLWwNeu2l9ca9rGmy8vjKNjrdaMnHG68i9Bflwey
         AqSRYEwABJWcMo7DCsluN9IJngQ5V2kNhXaRF4gt/1fLcGObyXvzNJKE8HK05iHrNobe
         829w==
X-Forwarded-Encrypted: i=1; AHgh+Rp4P6afwKMozforCNPsM4sSHs9SaEhpnH2OpOfB9+3G5GOXDUrh857Slqa3UsAcAAlxay5t9Er8FNuEFudw@vger.kernel.org
X-Gm-Message-State: AOJu0YzQM5c1VnSYDS8GSLWHtFZHe3uxe+KgiCH1C1RsY/eBrbtVPi1q
	VKmqJi2ZdBfmcqENzWOMBz5+qKOix3mnPMCbDNxlIuqqsGGsljr5bUlotG82ugIAOPFMv4PurNB
	Xawp/QdRduiud3l5fbwZQ/iu5yomHtdt9CUEruheR8AX4Em98gQ06zKjJZmCNhVLjv0eK
X-Gm-Gg: AfdE7clDhpFp7UxIIhDXF/N69aQhJYsza8XMaeSR8PVFz6cUWwgy8G7IqM070oteTZN
	ATUh29PclqGDhbfe/covcmShjjWhelG/rz+qjmhD/UbrN+IxmWeHr9vhaLpxB/Q4E0r3+QVOFff
	uf6DVcIzV+ss6jzNGyN/WX2EG2CdRyAAzuaAShe76e4iYXWCLgyaCjt06ai4n9sQwy8IhJXLd8i
	XVvdpyXmP3WIw4STX3qqtLlOy8pkpic68sJfBmhIjKpz1vYbvRLbsA2CtyIobNahYL2x/N/M5jW
	3pqrcqHmCPSEXm7Y/cSaBnhkIgPcn98XJRGDoCua8lP1a5G1lIzoeUCdAJWrpSM7peb7XMDaw8c
	wGE151GIduHCUzLu+tWWo3imQMYynWEwG+1UrYjSYTybD40B9sbqtESbdHw==
X-Received: by 2002:a17:903:b85:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2ca7e8ed115mr112319435ad.47.1783080991918;
        Fri, 03 Jul 2026 05:16:31 -0700 (PDT)
X-Received: by 2002:a17:903:b85:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2ca7e8ed115mr112318965ad.47.1783080991366;
        Fri, 03 Jul 2026 05:16:31 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad77651b5sm8942955ad.42.2026.07.03.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:16:30 -0700 (PDT)
Date: Fri, 3 Jul 2026 05:16:28 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Message-ID: <akeoHGv905FTOiy9@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
 <20260703-godlike-artificial-coyote-3e9ba9@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-godlike-artificial-coyote-3e9ba9@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExOSBTYWx0ZWRfX7SFBG3F94dPf
 75etkp4AP/XjWrs6p6uua7hz4z7qW/8tpD6MgUc/O1TrQ4QCKy1aJ+I9SS4otjIrn4sRVSmnIum
 oc6YfvBJXVIIo4DVqxD8GrP1wghLXtM=
X-Proofpoint-ORIG-GUID: _GKfUt9he0aDB_kTM_L8Q0KUZNeI1fop
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47a820 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5am2cag36p0NohAFmmoA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: _GKfUt9he0aDB_kTM_L8Q0KUZNeI1fop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExOSBTYWx0ZWRfX24bJp/IiPeZm
 9/SlABzo6Izxa9Nnw2sPA+pyjm2pG/B9aFAXF6q3SPPL5i4O6ahkQ1sew8o29sedB8iDp3wZeQJ
 l53G73Br3Kd6WdJotbQInOVYzukmMW31xd1X21saRKgNFr0WfT6O1GqHXepWkq4phA+zQg/HGHe
 g+pHdRcZjybi8J3PKXeptCFNF5PT8GuMrK0zWRyGYS3X7lsCkIfkR2YbbcR1JAzTFXeNwZjeKsv
 ZSsDUNOWzssUkn7ZhG66ND0Q9cWOH/6SN7anUdlRRssDlzwTfXbb5d6EESYmGUbIArgwtkkY0B2
 SIo9eMre9R6wIVqFeNx1RYThkUWqKFnF77W7j12QCE5p4fyFCKbeVKckaj3Phmqp58LIuP+Y0ys
 tCsQrxFw59+xCYEmMr3qUEgFOydaJfFfV0gBYmuUtksmpDyu4gN43es09tzKfu5959LtDUY54EJ
 hoOau20A8RrJKGKrhyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030119
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
	TAGGED_FROM(0.00)[bounces-116307-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 881F97024FB

On Fri, Jul 03, 2026 at 07:58:00AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 12:36:11AM -0700, Qiang Yu wrote:
> > The QREF block supplies reference clocks to PCIe PHYs and requires
> > dedicated LDO supplies to operate. The digital control interface for QREF
> > (clkref_en registers) resides in TCSR on glymur. Since QREF has no
> > dedicated DT node of its own, these supply properties are placed in the
> > TCSR node which acts as the control interface for QREF.
> > 
> > Add a dedicated binding file for qcom,glymur-tcsr and document the supply
> > properties. As this binding will grow to cover more SoCs, mark the
> > required supplies per compatible using an allOf/if/then conditional.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> So you dropped the tag because? Where is the explanation?
>
Sorry for the confusion. The patch was substantially reworked in v7
based on your v6 review comments on patch 2: the compatible was changed
from const to an enum, and the allOf/if/then block was moved into this
patch upfront. Since the diff changed significantly from what you
reviewed, I dropped the tag rather than carry it forward silently.

If the changes look good to you, a fresh Reviewed-by would be appreciated.

- Qiang Yu


