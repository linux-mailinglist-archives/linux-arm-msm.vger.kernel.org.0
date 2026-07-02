Return-Path: <linux-arm-msm+bounces-115958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KDl0Cn9KRmqCNwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:24:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D66F6A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:24:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eWw6GL+D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115958-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115958-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AC32311EFE9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE513ED5B3;
	Thu,  2 Jul 2026 11:17:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9673EBF0C;
	Thu,  2 Jul 2026 11:17:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991065; cv=none; b=eC10vu8P4AzbGQolpTztkNzBkeRII3T6eentp4MFoGhfg4B+Cu6U8jmL4yKjEsBf0gg1tGXSl3A18zVlF9Xbpz0ihZ28CZCUVWVOR7zO4OBa60cob2Pi0V+UAnK86OzhfyQ4lsczMsDqDGWsnel7BWmcfnNc1aMmF/b7aNjIM8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991065; c=relaxed/simple;
	bh=P3JiAGbDg4lRW35azb1NvvsrWLy/3LSZZpRD/4IX9rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoCBxhAXVzScDsehuW1QyC8M2klaSs+Cz7IoYolDzfliKrNTbky5PfCzGIGAQU6yH9luEl4ixKbetBmA3r1zSc8oqePXXCjuL8sbWDnuJ7q6w4VKnYwUZ1aN7N7x0ks70mf7T5waZwKyWpMPn4lKX5S6WeUmKbn9bRcxQQyASS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWw6GL+D; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AK89c3591746;
	Thu, 2 Jul 2026 11:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiBxJJmXOECFdmxongIy/JqOSdBSDGfMbux3k8lSCMQ=; b=eWw6GL+D2iBh7Oi0
	+Vufi25nmSu3jbeOI9pDG/BiQeaHY6X7BNrHTQNRO4nIG1/o9yKr/wMrK/nTU+yP
	/MlCpF+RUuzKOSzw1mR9otZfKpCm9nCATPsLyCTQuNfTiWrTyu01dSt/TQEnTsO8
	8xkQPtylv9Rzsa2Qd0hagreKKjuT+PzDcFKw95M8gbupGZ8CDdX8dyLyrgxJJiWq
	TelSIURA1jB7PJ+8ROToR3KquI+tlRAuwXXy751DnkE5mtoPCxmWQ9Oc4yn/TfPp
	Prt7QPWxyuIjhqqktQbcvuXdmr+xTlKzZYWKHWBuLiEf3edu1BEf8oQenII3KDzm
	DqUSYw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9e13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 11:17:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 662BHckS003320;
	Thu, 2 Jul 2026 11:17:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kkrtnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 11:17:38 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 662BHcnc003312;
	Thu, 2 Jul 2026 11:17:38 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 662BHc60003310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 11:17:38 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id B6225B2A; Thu,  2 Jul 2026 16:47:37 +0530 (+0530)
Date: Thu, 2 Jul 2026 16:47:37 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
Message-ID: <20260702111737.2qtjcfskulav4usd@hu-kotarake-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
 <ag-NLvh4ROgTCs_L@baldur>
 <d4001407-cdb0-48ee-a138-87c94b5dab01@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4001407-cdb0-48ee-a138-87c94b5dab01@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExNyBTYWx0ZWRfXyYByk+sXxYPn
 XT9LQIh7icAdsb8HhZpxyoND/X7iKG0kJdcHbzdRIq9wj7ajawAm9RarCr88Hlq3WZ2SjzZl7dC
 DBTVCtT9A0UYCClokuEG9r9rE5MVzNZU+b81+f1L1H6/bB30TC8D1FXYBtCCMq+vtEGj9QLicRP
 dbmIR4oMG1lN3W4dYKQDLgP0c92NzMz0qfPOGYZgONr6wJaGlzUXbGM8fU+iopOuGlWqj0JEDWI
 3EvKujCyueZsroHKGeSm1SFwPfgrN2+1xHMXaEoxeQbDCs++tCz+dVpliv7aQX9yWLOcT7Ks4H/
 /9wIgvPw4d7KENLkxklQnyU7q/xagjUqsPlE0Kqr35/IsuktQR5f73vGb1xPRoU1Kz97tDke0nZ
 1wCs9cqs6VQhDjE75vVGPo8xFIfDPnWaH+Db2eqb/e33uLEIXJvtHTNN8K4PSEcioVlWvmzzwrT
 PlbSGjo/xE6alz8upMg==
X-Proofpoint-ORIG-GUID: rZErlqHlfuQnaVqnt9nPvJ5yjAf5z3eP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExNyBTYWx0ZWRfX1GVxP672Bijo
 tZjQVpOpzgw7XcJoO8A24o9I9LxgkONMiumEYPvy9ZUvpo04WZ2LdKv7M/PrcOOiIyKiOTcHWkN
 OBMB+0pO4sPMC9pM0LiN5hdl4Jp6hho=
X-Proofpoint-GUID: rZErlqHlfuQnaVqnt9nPvJ5yjAf5z3eP
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a4648d6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ikGL0yQhr-kLhHwnVnYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020117
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
	TAGGED_FROM(0.00)[bounces-115958-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 755D66F6A51

On Tue, Jun 30, 2026 at 04:16:13PM +0200, Konrad Dybcio wrote:
> On 5/22/26 12:56 AM, Bjorn Andersson wrote:
> > On Tue, May 19, 2026 at 12:29:38PM +0530, Rakesh Kota wrote:
> >> On Mon, May 18, 2026 at 04:36:32PM +0200, Konrad Dybcio wrote:
> >>> On 5/18/26 3:49 PM, Rakesh Kota wrote:
> >>>> On batteryless boards powered by 12V DC adapters, registering the
> >>>> power supply as BATTERY causes userspace to incorrectly trigger
> >>>> battery power-saving sequences.
> >>>
> >>> Does battman really offer no way of differentiating whether a battery
> >>> is *actually* present in such cases?
> >>>
> >>> What boards are affected?
> >>>
> >> Currently, batteryless support is only implemented for the
> >> qcs6490-rb3gen2(Kodiak) board.
> >>
> > 
> > What do you mean?
> > 
> > Are you saying that the pmic_glink firmware in Kodiak has a one-off hack
> > that no other implementation of this firmware has?
> > 
> > My Lenovo IdeaCentre (hamoa) doesn't have battery, what should I do now?
> 
> I was going through my inbox.
> This remains unanswered, and I don't see the discussion progressing
> without resolving this.
>
To clarify — there is no platform-side hack involved. The Kodiak board
has a batteryless variant, but the pmic_glink firmware provides no way
to distinguish whether a battery is physically present or not. Since
this can't be determined from firmware, we introduced a DT-based
property to describe the hardware configuration explicitly.

This is not Kodiak-specific — any batteryless board, including hamoa,
can use the same DT property to avoid incorrect BATTERY registration

regards
Rakesh Kota

