Return-Path: <linux-arm-msm+bounces-115860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3TquNycbRmpYKAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:02:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 570606F488B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:02:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D8QNFENZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115860-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115860-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B15A9301178E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 08:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA73A3D7D70;
	Thu,  2 Jul 2026 08:02:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D933D1CC1;
	Thu,  2 Jul 2026 08:02:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979357; cv=none; b=JRZdeaE9kglBXyD5gdH9bh9bAwkC8Prvj2lIpbQNkrPY9aCs7opThLP0JjIuOCdOiB3lsJ2C0LO2jS7NMd6zMHWHw0Ucn6MKJfGCHcD5grfovotgD7cVuamXUBN5vIRmzngi7YN2Ugm0kjJobMjxlJWWFDb43p3Kv4hIBvhqUDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979357; c=relaxed/simple;
	bh=aI0BDCXKz6wl49Bv34eWd7tI7KHNsGMj4xTuBowEV7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkoWAFnRq64zYUzvcTbpZl9PIav2KDkHHRROQrbEZYOPUpZddg5q0L79h25Ed+rHey9KI6ts3RQ4ZazAHm8xEZMHIZI73R2epqdkD32/JAO1F29K3UUTacfbq3AXNK6Tfdjj1u/+7+9E9YGupkqqmjV7qK1hoZMR8KEa2oJQwpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8QNFENZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KPIi3067831;
	Thu, 2 Jul 2026 08:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfPzTrZwZls4md/D9e7b/2zG
	B8v+IVxpFyXQuLD8cfE=; b=D8QNFENZboa97D9Tq0cFK2bOkm3mZ/V0ilHwo4Og
	knyoXR0vZw1gef0Q+6n+ZNVxoIrYQWcBL6SrGmJBImzHkc5k3YYb8xrJqvwjEmwO
	A7OVYA1CTJHQpuXdvKgBXxg1gQzAMhpC7XGPbyGv1WkybvAlfFncJXbsL7ZCU5M/
	IEwuVJhSvhBClVsghLPp1erQeV1WrUp1j6d9Hj04ATHJhxCtJ5iC1FZiXt1lH+Ja
	kDqBxBdH52Cp7hYdpWwqLU3ZwsE4N0JGbJVcnZH8xiZno+zQEiOhRKOAtbm8+72o
	G78Bwwwp/DqXDQbVEfKRTrap3hBIQXPmZPDl9jZIM9kmRQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510amh19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 08:02:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66282TjR023647;
	Thu, 2 Jul 2026 08:02:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kkpbj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 08:02:29 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66282TwL023639;
	Thu, 2 Jul 2026 08:02:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66282T6s023637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 08:02:29 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 644C0B2B; Thu,  2 Jul 2026 13:32:28 +0530 (+0530)
Date: Thu, 2 Jul 2026 13:32:28 +0530
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
Message-ID: <20260702080228.tegosnl6uwt5hy7c@hu-kotarake-hyd.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <F11CmcSG0NfJxCD_094ercweXNrSY-fxOnTpyBxukPPcM3UdumRt4yZahLT-uKJabq_1WaDBldjbgUvBxpeAQA==@protonmail.internalid>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
 <3a0e3c81-b559-4961-8e58-cad8dc171578@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a0e3c81-b559-4961-8e58-cad8dc171578@kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 545p74l3GeezOqaFPcMY7XxC_S70n4-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4MSBTYWx0ZWRfXzEsn35tQ5NE8
 4+K5kIZmOeCB3liV03GKHw47z/7fugjHbnp1Ejn7Fmc2vj1Zi8ekdYY9S/mjXL1CrSSdIIa8BzM
 1EBB9U7HsffhZc2rqfXLJM7tMEZDnhMC1Io+LKDDbTAIQ/fMnK9geonmw4heUMHW/OyjFe4yIvC
 pAkL1iLHYzGaOdQwcs1HqNvb345ohMmN08plz9E52AdrsEvLseCBoX1x+lGCO/XlgLejSbrF8jw
 0JXP7wtGv70Cjsg3t/N4oQxJrw6xUTVobpMNpNiBCV9OhBq8StVSS0KITzgmvDIRub8nC3Q1nbu
 JrzLXRT1TmFdDZQS/SfVQjlyF1g916TI1nnqkvbh3FQ05I4JFHvamshh+gGb8sZnyvov27ZVp99
 4yCLJ5Cw7PoWFiW2IiSEzQEey29ndPdVxHJMRH5qKqpqnM+ewramjdwUfewEL3Oy/wqvYX3X2Z2
 lfNB/CYgnJ+1Yd7WmtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4MSBTYWx0ZWRfXxhsw9KsTjteJ
 NUU6wHAwp3SKHfCcfn9A664BeVJrlP+wldV/d90+a4dx46XB62WzMT2t3CuZzghfLAdvjfiqsn9
 lyeuSQo1QSpxNeeXH3PQJuNVFAv7n/4=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a461b19 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=aWefJ__BOnlCMLiTjL0A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: 545p74l3GeezOqaFPcMY7XxC_S70n4-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115860-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 570606F488B

On Wed, Jul 01, 2026 at 12:29:35PM +0100, Bryan O'Donoghue wrote:
> On 01/07/2026 11:28, Rakesh Kota wrote:
> > Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> > constraints in qrb2210 DTS files to use microvolt instead of
> > microamp.
> 
> Break this patch up at the and
> 
> - Remove compatible
> - Fix the voltages
> 
> Separate things should be separate patches.
>
Thanks for the review.

We kept these together to avoid intermediate breakage since the .yaml
compatible removal and voltage fix are coupled. Happy to split if you
have a suggestion on how to do so cleanly.

regards
Rakesh Kota

