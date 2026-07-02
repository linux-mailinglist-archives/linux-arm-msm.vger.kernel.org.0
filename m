Return-Path: <linux-arm-msm+bounces-115965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ra74OZpQRmpTQgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:50:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E92206F7068
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:50:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZolEsJ49;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115965-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115965-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A496630F7253
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF35741229D;
	Thu,  2 Jul 2026 11:30:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EDD4189D9;
	Thu,  2 Jul 2026 11:30:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991821; cv=none; b=jLlAcTdDSUCyRuO//xI/S5iFqGMu/Tb+m+0AT/kM6+K1nQHpLPPLP+xKG1+gjNATRw3jo4g7JqNuwwH99x1bCm1f3DkK/VXUF5kbEib8yxWN+rBWXOO+lE7aNaaBJfkH+IPRl0MVpi54tKoQMZ2Kqm+MnTW25wrNzNg81E6CZFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991821; c=relaxed/simple;
	bh=l0w+n8I3EpX5DnM9hbiDuz6Ka4fy/n+CmFn4TLF8cJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQFQCH1xo0xIhvD/Ux/Mbux/IrSnvu6qtTrFqwukecBG29K/sLh2XfgswkAAVFYGkWysfConzDP+PqfRhr4xHte3DKfZxSk2NhxSYY64kgUxMs68IO8aszPDswERujInLIIuPJZaR7jNmKiMpJr7rEbapwbXgnrYeyfsYgjrnYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZolEsJ49; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AaK8E3591072;
	Thu, 2 Jul 2026 11:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0n6T3VUvqrwQFYo+kQxR/wRZf/y5fYIkYNo6YhrKNpY=; b=ZolEsJ49ukzOSasW
	T894XcZxOqQOTpMm31kZ2YTt6S0fT480TnKEiUin8l35m0GKa0swO0wHgIB4XiCb
	Q/2ap1LAtPPKBaphVqH0nWxea16QmoFiYOXkUtWegyjmOmJqXAxX+fZEZJF3RY8T
	Zo1Pr4dUr4ZsGG2O4nT9TilqReARzKDCEuvFsKtWnCYfnk+Fgokb/bloinQkK9zP
	P5JP7ihpB+xln4bbF78YZV5Tu8mnfyd7ESd7L+p0ur19g+lK8M14cQ+9DGKh12S5
	aIRMEKjvFwiOISFi26KOjgGo1fbQO6rPoWQ3RbzZGMjdkvt3kQYp/tq4yWw5RvQc
	+rwHXQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9fdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 11:30:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 662BUB4J021139;
	Thu, 2 Jul 2026 11:30:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kkryx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 11:30:11 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 662BUBKR021132;
	Thu, 2 Jul 2026 11:30:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 662BUAwb021127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 11:30:11 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 4E76FB2B; Thu,  2 Jul 2026 17:00:10 +0530 (+0530)
Date: Thu, 2 Jul 2026 17:00:10 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <20260702113010.zjrk4kr7fpjp6asj@hu-kotarake-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
 <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
 <20260525120139.dyfnm6nwfzuoxd7p@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525120139.dyfnm6nwfzuoxd7p@hu-kotarake-hyd.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMCBTYWx0ZWRfX6eM9A/hXnY2Z
 hO13vnuPXA1g5JvYJzqX0JkicqcED1tJYXE7YnlPYUFgPKWvtXJ5K9lRQ30X/+vPwtUNP8d+/Yp
 zccrrFkXHwZ8RXRx4hFGZuG5XKFN6GYzA2V12KBjHdQVlr/TGPzhE0J/okhhbd26VzP0ge1JOIc
 W1DKkurZRwuod5B24+0AnNdZeFaydRBq1nJKq848kE0AQfUpq/SKued/7Q5jL0afddn8IGidcqh
 V2BbkCqrQAOOwH6bFBJ6nUNkC3W7Jc7Ui1UqtB6g3qWHLh93JgZg+KzH8UmOL1rZg3nCtb+BUTL
 dXEv/JPD5tnmfizu31RX+jk68diBDD0A4MnLNLtTBO63sgih+qIiA0gciLSndcJWKLFdMVvzFOO
 aF+a3s5ixk+0jr2FUE6X28sbzkrwUvQ/4qYIr8+SovCW7q5t6+PcBv95OUtdF108f9BkrCDG5yE
 9aujSVaBk/AeGHetBtg==
X-Proofpoint-ORIG-GUID: 0eCh5IeNmFv2zlTB2dxGDAB3_trdEPJi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMCBTYWx0ZWRfX3fqQtvjvGAd7
 JqPgrcj3ExiYxgKHz4FyRyvIxAJMan95/ZB5hkh1WqTU9Zgz+fWghtkywVp4TKVEZrU8dzD2W8K
 CcPc2EUWDUn5hgddO3l2IJKtltA/Jqo=
X-Proofpoint-GUID: 0eCh5IeNmFv2zlTB2dxGDAB3_trdEPJi
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a464bc7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=vq6V-Kc8it9GCgzh-0QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,hu-kotarake-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E92206F7068

On Mon, May 25, 2026 at 05:31:39PM +0530, Rakesh Kota wrote:
> On Fri, May 22, 2026 at 11:24:19AM +0200, Konrad Dybcio wrote:
> > On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
> > > On 21/05/2026 10:46, Konrad Dybcio wrote:
> > >> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
> > >>>> Since firmware does not have a way to dynamically tell if it on a
> > >>>> debug-board powered device or a DCIN powered device, We are required to
> > >>>> add this new DT property.
> > >>>
> > >>> Neither debug-board powered device nor battery-less will have
> > >>> monitored-battery, thus again, why lack of that property cannot tell you
> > >>> what you need?
> > >>
> > >> A device with a battery will not have a monitored-battery either
> > > But why? If for such device property "no battery" is suitable, then for
> > > me "monitored-battery" is suitable as well. IOW, if you say that having
> > > a property describing batter is not a accurate hardware property here,
> > > then neither saying "no battery" is, because no batter is basically some
> > > sort of battery (just like empty set is still a set, empty array is
> > > still an array).
> > 
> > The battmgr service running on one of the remoteprocs already has all
> > the information about the battery and it also handles all the type-c,
> > PD and charger configuration, only letting the OS know about the
> > results.
> > 
> > Hence, unless there's some other hardware at play (e.g. for custom
> > 200 W charging), which wasn't fully implemented in the QC firmware,
> > there is no reason to describe a battery separately, since the OS
> > can't do anything useful with that information
> > 
> > In some abstract way, perhaps monitored_battery = <&pmic_glink> could
> > be thought of as valid (since that's the data source the OS gets to
> > see)
> 
> Should we use monitored-battery = <&pmic_glink>; If so, would it be
> incorrect to mark pmic_glink as simple-battery, as that may cause the
> schema validation to fail?

Hi @Konrad Dybcio, @Krzysztof Kozlowski , 

Following up on the earlier discussion — is monitored-battery =
<&pmic_glink>; a valid pattern? And if so, would marking pmic_glink as
simple-battery cause DT schema validation failures?

Any guidance would be appreciated!

regards
Rakesh 

