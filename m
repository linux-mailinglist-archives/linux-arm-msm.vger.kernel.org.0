Return-Path: <linux-arm-msm+bounces-116246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pionKwJ9R2pyZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:12:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C67007EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:12:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fS95DitT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116246-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116246-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 695493104451
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B677D38F25A;
	Fri,  3 Jul 2026 09:01:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5149B38AC75;
	Fri,  3 Jul 2026 09:01:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069274; cv=none; b=KDzLCUAdeSrO/kV2HSVaaESXyu63bNR8CDk1P4JCBkW/OqM96BFS6G0REyvobKwbVSKM/BL+syiRTLPagQUF7suiLlpvlRotb6jCm4roaDtjvEXqaeJ+3G1/iFKbieNQYnbWdXAli1r/Qcs1iX/l+HHGhq5WavMYv8tay0+fsjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069274; c=relaxed/simple;
	bh=r7Nbx3Y7x0QogCqOEUzreQ3mfyeZE7uweJBeHx5FDuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDPnINMf+9tv1zF93DuOqsWyJy83Vmiv0IjQL2Ag83YnCU1zhrkF0gmj92v7Sx1mfdNL8IavNSlMn1rQx+jVsKr0ZD7285vwVwp9zRB7/eY/T39FuoPYuUmT3PZtLL4/49nR7usxhg+kwKlxY3SdVh6xzS00l/R0zZWUUFQJPuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fS95DitT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rdMJ3087983;
	Fri, 3 Jul 2026 09:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmUZLa21nL3TGIck9RU9XTxalcGaUnCDCdTupty31C8=; b=fS95DitT6reTUhyZ
	X2gZiXSKjqnTrqy/wSSuBLR6W5FOU6R+ubutN9HznaOtbJMsaWk8xGsdzJYFuIMq
	9ZcIJ6YQzR046rFATifAIHQk2y+qUQNFYVOCTpkOEJeH87bm0WO8RtLIqPgYzbKW
	0HqquTQ7AAuCIk3Yxi/f7RIm6l8QGKreEbQ3OUPaB9ro46gW1Qmo5Fxr/WGrw/MB
	LtOkciNTNyiJD/icVQmy5Qlnn0B0gqTHPCLxcurmeCIDMxh22chKZxaluPH7KOme
	1Wcf0DvzrO7E+ssQ1nxU5VQYcsGkYGRJ1KS9NqUarqziDYhx/IjSK94ueU2E7wXQ
	n8rZQg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2546tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 09:01:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6638xiX2030850;
	Fri, 3 Jul 2026 09:01:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f27kkw6e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 09:01:04 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66390DQ3031538;
	Fri, 3 Jul 2026 09:00:13 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66390D1s031469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 09:00:13 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 16B9EB3B; Fri,  3 Jul 2026 14:30:12 +0530 (+0530)
Date: Fri, 3 Jul 2026 14:30:12 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Message-ID: <20260703090012.wqpepzr24iaehpmr@hu-kotarake-hyd.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <F11CmcSG0NfJxCD_094ercweXNrSY-fxOnTpyBxukPPcM3UdumRt4yZahLT-uKJabq_1WaDBldjbgUvBxpeAQA==@protonmail.internalid>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
 <3a0e3c81-b559-4961-8e58-cad8dc171578@kernel.org>
 <HNlPJm_ENIaW7IC8zj9-9_SMwvX1l-pyFmJnf3dt53XeHI82XgSFYyD4obb2AEIe_2c-ev0MRppu3gYKgAU_LA==@protonmail.internalid>
 <20260702080228.tegosnl6uwt5hy7c@hu-kotarake-hyd.qualcomm.com>
 <4de2970b-884d-47e2-ba52-514f973f14b9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4de2970b-884d-47e2-ba52-514f973f14b9@kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a477a53 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pxVi1GPwOGoSIhTSctoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Tg9LyLOOpqF7lfZbw_Lc1qJ1a8FbxyRK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfXxE5kdvBH5Bcq
 CwN9y4443Wib9YijHq4DqciLFt09taGjAz7nQ2/RYZc/q3i/81LFfoA/EQbWwGcWj/xohHureAr
 UtGrRE8TMEXwmT9E99Fba1Su4s7XSXInZX2yqXR/D7rP+Eg0ku0zKM0bDCIZGwgA14mcSpIbonL
 5S168eOnLmfVUYjQooIw+uN8n+mWBr7A7PPVf6TRXgflKq6kmFhYUINKKK58REGuppXmCfnc6Go
 BkNCj7UP+eEP5qLB+exVQpplBBeBCDahM6AbEA1jWur3vbRPdTgQNCh/QLh/FpEEKIl9zKs5B7F
 HEgNlnlJZKgjhOXcekCIaasQTI2fgWey3O8JjflXEvOUm4t7YsCRbotE7Rwvjweudr/ECCH5Bsg
 yi4oQfQmfWK92YpnoXPV8QcJeqK/Q5cYo0CAOwRUCJDGhiO7ZNrVhkr5w+KYdOy8tVXRhs5Sjro
 XvjCHNkCenGkTxr//vg==
X-Proofpoint-GUID: Tg9LyLOOpqF7lfZbw_Lc1qJ1a8FbxyRK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfX9ouZJnkDX4kT
 PjsMdxd4JPxZCV6cnGAWXUt4fl5RGWHXKTmCg9lqj2eh9NEGGUYc5o+k95YfL6dECikjgV1k8/v
 BygVf/6gxlTUCyE4UUMZmG7P1jWuYWk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116246-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,hu-kotarake-hyd.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F20C67007EF

On Thu, Jul 02, 2026 at 05:10:08PM +0100, Bryan O'Donoghue wrote:
> On 02/07/2026 09:02, Rakesh Kota wrote:
> > > Break this patch up at the and
> > > 
> > > - Remove compatible
> > > - Fix the voltages
> > > 
> > > Separate things should be separate patches.
> > > 
> > Thanks for the review.
> > 
> > We kept these together to avoid intermediate breakage since the .yaml
> > compatible removal and voltage fix are coupled. Happy to split if you
> > have a suggestion on how to do so cleanly.
> > 
> > regards
> > Rakesh Kota
> 
> You can add the register abstraction logic, then add the new compatible no ?
>

Are you talking about the driver change ? if yes, for the driver change
I can split it into:
  - Patch 1: Add register abstraction logic + PM8150B support
  - Patch 2: Add PM4125 compatible

However, splitting the DT change is not straightforward — the PM4125
compatible and its voltage constraints live in the same .yaml
file. If we split them, dtbs_check will fail on intermediate states
since the compatible would reference voltage properties that aren't yet
defined (or vice versa).

regards
Rakesh Kota

