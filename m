Return-Path: <linux-arm-msm+bounces-116249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K9p2NYJ+R2oCZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:18:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB677008B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:18:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oOdUrb0q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116249-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116249-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FE85301BF74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD0439EF2A;
	Fri,  3 Jul 2026 09:13:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C796939DBFC;
	Fri,  3 Jul 2026 09:13:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070009; cv=none; b=Izg51tGHh+mqgvuLsSTqvRyqFAhY8tUQoyR7TQJ+WY8YUn6EujUnhxcyhx4d3c4T1gdGssVQb0rWGv7xHez79y5tcccpyRReWfGt67Yx7OBGT0+ilJ4FqspiRS86bRNCR12SyqBnjkrvTwqKg+iRlqdTKNgaDQVD63pqtP5NgJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070009; c=relaxed/simple;
	bh=v5KmJ0z/bxqk3TvLUrI6lQ9DJyqFlU4B0jZq7CTgywM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/i9xxpTOt/xuFtFM2IB9Jul157ic3DCGOrFg/rGEQRqmek9fqEnm+aGv9SV5F4lLaTCUQRBkyIfB2JTkZ7pl5x7nW/VDxWAxrzoHUw/murPErGTjaPUfujY1gyYHkwzgE8MmPInquw77yTVJdYpmMPaNjPUGAf/iCrKJ9Uq6ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOdUrb0q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637Zgcf3410047;
	Fri, 3 Jul 2026 09:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gQvzeAh5/Ks620jhgb3vOovSQiIvG3/KfCRRUdTf0dI=; b=oOdUrb0qrWamfPhK
	/5NbXg32XPhYZkLbv0s+LvfLcTUHrxyD7UgCWBuJMwb3qCTyqPUloisQ9I74GZbw
	fNDH0cOcx2x9TqGVlE2rjYqMZofLXGuZSNazE1217slUXP3nsol6WeotHHmgaG/O
	iNJlueFxXKhHkyG47TEkYcWLZ3y7Tj/o4eooFVQGJJPf0for5e4Vh1Ey2529b/f1
	3W3v3StLly66sMRUf0JmQf7nr6o/ZbOXwsL16jwdzkgOZ94VgQ1nt1Ui0hBVGJRZ
	b0NMDiqa+OBTWp/O/oQi5CJ1p+6fPkBPkPj5eY83Ewf2X8SfTLq9leXWouDKMRAm
	7YV3Qg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u30bn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 09:13:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6639DKTJ020291;
	Fri, 3 Jul 2026 09:13:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27km9t4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 09:13:20 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6639DKg5020285;
	Fri, 3 Jul 2026 09:13:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6639DKqt020283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 09:13:20 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 4D442B3B; Fri,  3 Jul 2026 14:43:19 +0530 (+0530)
Date: Fri, 3 Jul 2026 14:43:19 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
Message-ID: <20260703091319.5kcsqjtx4e4rshsy@hu-kotarake-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
 <ag-NLvh4ROgTCs_L@baldur>
 <d4001407-cdb0-48ee-a138-87c94b5dab01@oss.qualcomm.com>
 <20260702111737.2qtjcfskulav4usd@hu-kotarake-hyd.qualcomm.com>
 <5d5c693b-bd07-40a4-aea5-d9e1884aac50@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d5c693b-bd07-40a4-aea5-d9e1884aac50@kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: wTRR2OUagiPc0LuXJ7f6JJ3ajz1JZ84J
X-Proofpoint-ORIG-GUID: wTRR2OUagiPc0LuXJ7f6JJ3ajz1JZ84J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NiBTYWx0ZWRfX6SuYPRiPfnKW
 MGPJFm1kgoPlSlnPF1f8didpgEbDexqkNzIZzFzjt9NQunGYkRc2n1RZl+r1/WnxeaE3xl6fX2l
 tVgo/sWuAlxC1789+ABGTKGT2uCYxTI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NiBTYWx0ZWRfX9/ovW37IzNOn
 /n2tnh4JtgZP9ktUpvKgHJuU3Wj1+qP1eTilFOU4UDQ95AaCsd8ILAwxwz1ol1v2IzjHxloIIsS
 OE8cRFu+teUVkIyf6hzESSdVSmhpeXyiiULa0P2Luv2O24pwlKI50CJUiGikgzJ22AY3dD/exVS
 aHSNnKOm27HqUsISZWLMAC9Oapi7erfpgkth4vh6mtO5vNako4QUWhKaVWeIVFi6n88/kPLdx0E
 5pJ8nqd2cTGiMIbTttjVPw6eB7vZvqaTkT/+PJlcvW4uesI+H2xj72MrBZZ1g8Ii7q4fvCj56y9
 rFhM2Gs418fQ0l1CufPj3Ju9lUephovyxpwz47GRQRixLCm8ocW5NZ2ILTyvWQifV4CV8ZtXF72
 VTzhAhPaR3LgS8QC9BOdfy8Azl9EP4uiSk4XQxkUNfFM+8AImvwo6lZK5c8TThEYhuB4u5M9uZl
 T2zx8tCm3bAC7idPEEg==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a477d35 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=o4KM0EdopPOV--rjvPkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116249-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,hu-kotarake-hyd.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AB677008B1

On Thu, Jul 02, 2026 at 01:28:35PM +0200, Krzysztof Kozlowski wrote:
> On 02/07/2026 13:17, Rakesh Kota wrote:
> > On Tue, Jun 30, 2026 at 04:16:13PM +0200, Konrad Dybcio wrote:
> >> On 5/22/26 12:56 AM, Bjorn Andersson wrote:
> >>> On Tue, May 19, 2026 at 12:29:38PM +0530, Rakesh Kota wrote:
> >>>> On Mon, May 18, 2026 at 04:36:32PM +0200, Konrad Dybcio wrote:
> >>>>> On 5/18/26 3:49 PM, Rakesh Kota wrote:
> >>>>>> On batteryless boards powered by 12V DC adapters, registering the
> >>>>>> power supply as BATTERY causes userspace to incorrectly trigger
> >>>>>> battery power-saving sequences.
> >>>>>
> >>>>> Does battman really offer no way of differentiating whether a battery
> >>>>> is *actually* present in such cases?
> >>>>>
> >>>>> What boards are affected?
> >>>>>
> >>>> Currently, batteryless support is only implemented for the
> >>>> qcs6490-rb3gen2(Kodiak) board.
> >>>>
> >>>
> >>> What do you mean?
> >>>
> >>> Are you saying that the pmic_glink firmware in Kodiak has a one-off hack
> >>> that no other implementation of this firmware has?
> >>>
> >>> My Lenovo IdeaCentre (hamoa) doesn't have battery, what should I do now?
> >>
> >> I was going through my inbox.
> >> This remains unanswered, and I don't see the discussion progressing
> >> without resolving this.
> >>
> > To clarify — there is no platform-side hack involved. The Kodiak board
> > has a batteryless variant, but the pmic_glink firmware provides no way
> > to distinguish whether a battery is physically present or not. Since
> > this can't be determined from firmware, we introduced a DT-based
> > property to describe the hardware configuration explicitly.
> > 
> > This is not Kodiak-specific — any batteryless board, including hamoa,
> > can use the same DT property to avoid incorrect BATTERY registration
> 
> Unfortunately the answer might be: fix your firmware. Since your
> firmware is the interface and we do not expose battery in DT, then you
> do not get additional properties. You made conscious design choice of
> abstracting some things in the firmware, so you do control that part of
> the software stack. If you make one choice, it might lead to other, like
> rejecting such properties.
>

This is a hardware limitation — both the debug board and batteryless
platform use the same Batt_ID resistor (10K), so the firmware has no way
to distinguish between the two at runtime. There is nothing to fix on
the firmware side.

Given this, would a new compatible string (e.g.,qcom,pmic-glink-batteryless)
be preferred over a DT property, or do you have another suggestion?

regards
Rakesh Kota

