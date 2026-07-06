Return-Path: <linux-arm-msm+bounces-116619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 90+KGkIfS2p2MAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 05:21:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6070C4C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 05:21:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gHmuGCLY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WMHFEmfJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116619-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116619-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E2D2300EAB7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 03:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8733AD51A;
	Mon,  6 Jul 2026 03:21:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80FC3A9002
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 03:21:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308065; cv=none; b=B6GkzfOT+xuLzQlfYp1Vop9MhILStUYsm7c628lP6QjlAI8fulBXQ9248zInZmSfb4HyPzfBmqkD7z64D3V8yFLTkSF90HA/hXmHHYRkM0yEqay+zePSyW9WpVT82j5oUzSVsMeDR6vmwaQJ8JQInSBtZ4la9AxrhuAiFIEFCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308065; c=relaxed/simple;
	bh=Plon+k1ptMC43wXIzK+E3enat2n/BRnkToi0cHLDPaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lj385sDltr+Id+p9CXItYj+pCAEhZRMK148N2+W9epYejhEBx1krdtyuzXgoY+TT8efGfEoUD9n423vvVPe8FFwuDX3S8rnr2BESYNx4eLBX0e+3xF0hL0ubuOfB4f0iDQIQYB4bLzo//wUqY1muw3lgz20OgEd50NCBieFYFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHmuGCLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMHFEmfJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665LxTsk2684012
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 03:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vLaX8Moxxos/n9tNRNhn6IzL
	amMyiQ5H7q2UWMNWees=; b=gHmuGCLYWsdIgzQ2elBnA8MOUviMYzZ2SXykis0H
	GTCQae6YOYVzAS981IYPu9siHAeldp2JeNVSrmJ0e7kiyxVFZEmCL1vtVhnHK5dV
	nPQIyr1bm1CBIzHIGLhx92dm1X5l0hFVE+DU3LixqVevpY8vPz/8TzCdbHLIh/P3
	X553my89J3P7du2RocH2hKaiS740XDylIdxi4UUC2krE7tqf6ACPtMaCg5jgMqeN
	DKlgVBt38R5vIrz7u/4ecj0iBhhG5gYW5g0mfgBMk0FwgR30gYUHw6CSxCcHVjkX
	Kquu0/95F5hprjaST92exq9eZ0NaxZKXRt26dgCuXmozMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8m48s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:21:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc77a6943eso47119575ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 20:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783308061; x=1783912861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLaX8Moxxos/n9tNRNhn6IzLamMyiQ5H7q2UWMNWees=;
        b=WMHFEmfJUasiUn5aOJBjRy8q+h5VAQblba14cq6b5EcfK+zEIdSg1/8gyrEUrqkosr
         SRxnRqep8+FjBht0MCHpD2KceNMVYKQYMNJU4ARBcdfdnigCGlDVKcHo7QBfoYanxDL7
         1ztRlRDguO5DH6tjBf6FmdgQCzXiB7fyZqqxpCq8e9sZtQ4U5IKA4w8jQFg1K4nQzz2o
         8/l0UsXs3v57YZtXI1j3A/NK9Fjs7eeT2OyIEAT3UbLTTSC6Dt2Y8TeR790bEdTJjDhu
         nciw4jn1Z5PsL+d2sukHTqSzBfY/Virr0ZIlduUoF4vp7wPJFUrnBTF/bo2+yDuOW3Vw
         2ZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783308061; x=1783912861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLaX8Moxxos/n9tNRNhn6IzLamMyiQ5H7q2UWMNWees=;
        b=TWAdy4cPzAdWG+q/o6APu5xS6U50WM8SBNeRc21LiU4sFinDrZvCHbahyE7xtyjnU2
         RESRIF5GRTJMPOgnk95/s6wdguzJS1u91IzwfF39pTDUk7pNO25RCmnm/Yhrcq4K7K+U
         nWSqQgkfeFilKWp1t7foxgrzPAmxZEE2w2r2xzoMENhhPnMjl5f7hqKGnR4izUz1AuWz
         scZToPkXhqgLIFqYNUV5/kImgcS+CzphbXMUFqfKW+dcTZGB9v/7ZDU0UF6HFGqilbPj
         AuDZIo5CHvrgTzoJLS+GC6RC4TvHkb6tJh7xHyE6KNNNH9BAZB3QLe3XwJjVKqCwaUdm
         zNxw==
X-Forwarded-Encrypted: i=1; AHgh+RrVdtD+fZNQzqD2sSEpAvzKaf/edmWQ6Wnp8s0ZPD7HybVhYdPsRoC0oVdnCQ/euahts8uzQt/Zim00g6X/@vger.kernel.org
X-Gm-Message-State: AOJu0YzTjdighcD692BCpm6MOMhi8xCcSxrhZHBsvUX5sWqshZWO6P6A
	ESTTZxp+pyim2K1IVKF5I9loJj7MA61fBKksNotmuwvwG1r4HkqvBa3WH+ApF7sFWIDRg7C7ltr
	qKiDtiDdVVjRXGS7TQWR3tJ8rVkzkqBGNY6O2NMU796mM9siuUJKm9WeAApAHXcxiapD/
X-Gm-Gg: AfdE7cl6mUL5SVjR80cQoGnDndXu2vBbslEmsOWVFQwfCX0ypjtUKpWbEILh/PV+30+
	5RSInAd9Yu9OABbMMEFFtJGJkLKbzwC5wMkHKXbHoI5u/Oik/fNPGEVHtmL5RSN4h9wsvN8UcEm
	vCIwd6KJX57kBpgsD4sAPqYyPSgkQpEj9CCynfneVPcowTiXB5OAT41InC4zSETDNlmhUFtTR2o
	5MGH+np2DctO4phX5oDzbWK3LEa+j5robwQ3jsC8VlgNYFtcKqQ3Ydl4YB4HQRR9eNmFoEvRvTr
	jeAcSpG+n/GH/GSvkiK1bjrAWBudFBmdrMtpLPaupS70WYkvV++gwbxNe+jmPDf3ZjU/iFpiok0
	ua5xvR6Qm3O7tecjPE37Cyayj2aaZxpfJclOHopxGiD/p7bdjVuC7TzPHaA==
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cbb9efe254mr90496075ad.43.1783308061404;
        Sun, 05 Jul 2026 20:21:01 -0700 (PDT)
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cbb9efe254mr90495655ad.43.1783308060898;
        Sun, 05 Jul 2026 20:21:00 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63915229c88.1.2026.07.05.20.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 20:21:00 -0700 (PDT)
Date: Sun, 5 Jul 2026 20:20:58 -0700
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
Message-ID: <aksfGiIWxW1RUTfx@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
 <20260703-godlike-artificial-coyote-3e9ba9@quoll>
 <akeoHGv905FTOiy9@hu-qianyu-lv.qualcomm.com>
 <6d23a482-4d5c-4444-a533-d89a4602a4dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d23a482-4d5c-4444-a533-d89a4602a4dc@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAzMCBTYWx0ZWRfX2e8mmjfUj/fC
 E3hkMtubXVphHr4wsIYhf1/G9F1r7TV0K/+E52p6XPpt84mBAzESrTdNWKF67Bpsgp5gzj6Gv2Q
 AzZ+HCSfc9QdqMwt44mYu5nfu+A6ZU4rDQ4BsKO6zgCG/xq17eFpY/GD40ht26ecYER0zydE9F7
 v8tI+rlqDDBgUkX31ho5lTURksfw5T21gVGO5Ez7t+JNxzJOcCob1uOQAEU8gsmyiFMvLLysUAB
 VldiPZY24IFyCtPzapzcB8pGGd/jNNwct677mVmbBbZF/pz6X2kBfwlPBDWWD1SWVmDgXFv72hi
 as0GGHN6sXrxqGx5ZT6kECRAqBNsZRglvCw5IFYu8Y4eavM4BpnEI1RZfMPHN1bXoxUkqNTobkF
 x/lfPuKGHsycLVmJZUq4nFyNfjuzvjnhUJzQVxRAEy1cfuPCnu7PryWdGpGKyMCO1oE9+JoRg3q
 7y4Q8figpHyKbUbIE2g==
X-Proofpoint-ORIG-GUID: 3h5OakJ2hgcD_6me5Z-sWQ08ZSjUmb8H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAzMCBTYWx0ZWRfXwUE3i0G/jDPw
 W/ihpRBdvqtkl/HSIkEQ6coVF8i5/zu+T9hoA4pfLL/gs2Ah6IuhjWfEseXlhUaRtDORN0Ca8xi
 uS/pzhDUmzRRaDSJEO0GydJKfL4Dpfw=
X-Proofpoint-GUID: 3h5OakJ2hgcD_6me5Z-sWQ08ZSjUmb8H
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4b1f1e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0RteJoaA5KIU4r5rSwwA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060030
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
	TAGGED_FROM(0.00)[bounces-116619-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,hu-qianyu-lv.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: B9D6070C4C9

On Fri, Jul 03, 2026 at 04:50:27PM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2026 14:16, Qiang Yu wrote:
> > On Fri, Jul 03, 2026 at 07:58:00AM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Jul 02, 2026 at 12:36:11AM -0700, Qiang Yu wrote:
> >>> The QREF block supplies reference clocks to PCIe PHYs and requires
> >>> dedicated LDO supplies to operate. The digital control interface for QREF
> >>> (clkref_en registers) resides in TCSR on glymur. Since QREF has no
> >>> dedicated DT node of its own, these supply properties are placed in the
> >>> TCSR node which acts as the control interface for QREF.
> >>>
> >>> Add a dedicated binding file for qcom,glymur-tcsr and document the supply
> >>> properties. As this binding will grow to cover more SoCs, mark the
> >>> required supplies per compatible using an allOf/if/then conditional.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>
> >> So you dropped the tag because? Where is the explanation?
> >>
> > Sorry for the confusion. The patch was substantially reworked in v7
> > based on your v6 review comments on patch 2: the compatible was changed
> > from const to an enum, and the allOf/if/then block was moved into this
> > patch upfront. Since the diff changed significantly from what you
> > reviewed, I dropped the tag rather than carry it forward silently.
> 
> Dropping tag is fine, but what do the submitting patches say when you
> drop someone's tag?
>
Understood. As per Dcumentation/process/submitting-patches.rst, The
removal should have been explained after the '---' separator of the patch.

- Qiang Yu

