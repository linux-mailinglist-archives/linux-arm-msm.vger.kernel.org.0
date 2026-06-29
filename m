Return-Path: <linux-arm-msm+bounces-114973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8i6oHh5HQmqj3gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:21:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD66D8D75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:21:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YRxQaSze;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g6hC2nkg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114973-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114973-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB1443013A61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF85A3655D6;
	Mon, 29 Jun 2026 10:20:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879653FC5A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:20:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728409; cv=none; b=G8wuv4ud8Mxiu30P+/AhS28o9530VnldZ6glQYKrTFJwGK8bE/HXo9I3GqZf7NnzUYE9RB/YioGLVuYg4iAoRRhufz/Hv3ScaFlrC8cc3evGYebhrasqC8SP2TPoPWpnZtfZlr2EjorhGL8z1DqWWU0SO7D8pENJ+qm3tF3z8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728409; c=relaxed/simple;
	bh=0tcYS/TGLDKTnc+D6P6cIojnHQYd5yvToL1o1yYJPUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MB9VclJu2KedCMlyuGwURkf1d8b75AsmACa/oEF99oyuIlL/2XAeDwlnCC0Jy+inwOeV7diWIiaI8o8zaOgbf9Yl0hWpbC1/VYhcOqIACMu0WKvm+z1FRo/FVzjpaNFtpfDf7b4ADayET1drgeYc4+r61ROFiFL25rlU4y3ebJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRxQaSze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6hC2nkg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72eaj2164000
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0UGKVqsdGzbosb+05ZlN0oEU
	xhwfuM2PCDbsn8tProM=; b=YRxQaSzeimiNXwkmQKEKAkI6eUjxi0HuQqHn/ObK
	C/m60CMpRpmK2tXn/hjS8eQQqNVQQeHO7gGlbejGXkt4DWDrUv24dZ7eBDpCvjbZ
	XjJl6uFNzd4nJMRJxcgSv/qaKfeI9ZFHMNm3gT2nZOwvXVffAFt0XtkaCJ7qdXi0
	a4vj5SezFbuRh7SVUsgz9HfhBzwz37P4nkkF0HgkFDvB51VdDNjMUrmvJcYzLFts
	Upu2eTUupchJ8PURTaLNhjIEO4xleFCRaSU9g+0NIxAMUo+dn3co0LbRnnlv4QG+
	gICYmB00ti4aCwTw8WI267MDSuabGd67VZJBGveC43/bIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgtbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:20:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92b2ccd7971so573846785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728401; x=1783333201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0UGKVqsdGzbosb+05ZlN0oEUxhwfuM2PCDbsn8tProM=;
        b=g6hC2nkgyaDMa0QJz+lCngTkfGmt1CB/ycW8JsImOs2MdK8HacyB+rxOJ62feSQf2E
         irqAZ+G0w/UstonIgY+gQ2KmH2l1mrqGRsKJsSU0VPsHxEoCLc9viEFetjRBqCxqLxXN
         9v005o1zCLdjgmpbpkFfx8hRJCMjGdcoYQJicNcuzfYXQzmGT66Hdkwnyw67E8JJaAKw
         9wfY5dELswO5DRr17BZLT/n6I/gAzH+5XqNg1o4DPWMMiw0CrI48lKxtzxQUS1tLecHy
         hoX7eIfyzBO5jbOjsqV5L8iXWjDca+jm7FeeAU/8sa1n4z4/Pf2X0x3bWyCUt0cKM7vD
         zPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728401; x=1783333201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UGKVqsdGzbosb+05ZlN0oEUxhwfuM2PCDbsn8tProM=;
        b=jzeMVGEJkTChrOlaIWVOA/AjNkHwKVdvINtoEC0/4McQrq06isrGmMStOfqagdm9t4
         NBwzxd8xsxGeHnc6PFOe36BgakJEAAgSqbwRP5Mr6Wh5XKckuxY4BOZHotkLc292QpH7
         2CBkDGshoWNWkB6JPzqn9wgxfwjSj6VujguBiLmo+ZnsIYIdGp+jD2E+haT8UdwXEFs+
         V41Xx06fhevPDttS8AQAaJofFKvub2pZszQpX/PzXE+yP5Fhs47UWchx7x1ICdvDaRJj
         rsujJcZ7mkbUX0QHDluoaETjIzEw6ZNReJ/eHhJ5wlHi22dk7JOZRgakYFoD/CKskplA
         DZKw==
X-Forwarded-Encrypted: i=1; AFNElJ+ywUNz9bTmu3KaBaDerpSkWqmIl/Jk12JXkSDD3YTK+AIpOjHRPQBwVE/4zk1n55Zh7/O4FhukxrrwVjzI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+BxGNAjumtjuIfpfXE5EASkhlqIe1YDBx98LK+ahHrWcoAFbJ
	3Igx24lPaO6MLvznskgzZWvbHDNsa1ioY73C9I1Qp03KdCYbMucgThQIipnghyflIpnCJZ5Vg2Y
	oniAHuGyTGoXw8sra4A9+8o8Bm03S4khVSsZ5IL2Ppn9tCNC7wJOtMpUWMvppaEm5F6hpFL8kzA
	5v
X-Gm-Gg: AfdE7ckznmigt6wFSEzwVUukPB+2Q++zKmvKrJkItXVF7TaJw3IcgYD2HVBtgOu14p0
	wh0h0SU8XG4x8eELOAJCP01thq4LGxSvjAYqbnnI2g0zhLBIeTJceMYlLhhAKDl/xLVHAfci+l6
	XS2IYkwV4nRajH5kzsjtMamPGkGgPXm7wqBVzkIljV9mETQ8rRWKpSel+VVWAbhY7UCtZS6ppGa
	O8lJI1vVHN6vldOVa4KqJ3GRpex1DK/loDXU+TSifkJnzlb50HLKQDnTb2kmQoIq3YXvWf6+qs2
	3y99q9H/p218d9UQAWorZOFcHrlrNkDIzAIVKWbZq6NhYvlEUSJwzziPyphoPMyQSQ9XPtnq3Vl
	bgz79XiUI5Fr4FPmoHKjmtsH4aNnfXxPqwqAbcEKFVpby6+P1Ib5na8dfXw2xYCmsH4y/g7qwhU
	uE2G+6xhFGe2Jqde6wDfwHHFWh
X-Received: by 2002:a05:620a:2308:20b0:92b:6805:eae4 with SMTP id af79cd13be357-92b6805ee71mr984800285a.65.1782728401180;
        Mon, 29 Jun 2026 03:20:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2308:20b0:92b:6805:eae4 with SMTP id af79cd13be357-92b6805ee71mr984796585a.65.1782728400683;
        Mon, 29 Jun 2026 03:20:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b01631f82sm10787451fa.6.2026.06.29.03.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:19:58 -0700 (PDT)
Date: Mon, 29 Jun 2026 13:19:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: me@samcday.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/mdss: keep mdp1-mem interconnect alive
 during suspend on SDM845
Message-ID: <j76vpo5gxpwek7vpsjz2hydgcyibhvjueljftj24j2ritpb3mr@ej6bf335nxq4>
References: <20260627-rfc-sdm845-interconnect-collapse-workaround-v1-1-608a38de3715@samcday.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-rfc-sdm845-interconnect-collapse-workaround-v1-1-608a38de3715@samcday.com>
X-Proofpoint-GUID: SI1nIUUOKUmtpmVvpSF6I95SvPl0ZawR
X-Proofpoint-ORIG-GUID: SI1nIUUOKUmtpmVvpSF6I95SvPl0ZawR
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4246d2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=lKQ-AihTAAAA:8 a=6hj42vQ7RftltVCiR-cA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfX4cR5PvjUixU4
 kkJTrI7kZUULHQ16/qK+mlLeThrEzc5Nkqkx7mrLSiv2vjtbnis4Ca+ehpoe3v/kuPgIjWwaG05
 2kBFsNyYKG0HqLuEp+uoUseQHiKowkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfX1ag5Jie9v9GU
 g9egx43xa3c9Z2rKqPNWys5YGDwh1lubAlmdeWVHzKy8a3aTbUoQFVoWTxjv2ET0xz3IP2oTz0R
 qLftKP3qgyYFZ3eELzDa1mnPBafTzsG6J8QlQzjtSL2XccAcMvq9ZIozlPSjUr/oMIU4dDGiMk6
 nT5xplUmPVvEXs0XBZm7LYtZG/0BqJLEoUhqJInyykvY+brWfMk24xsWWP3wK0gooomyfvxTCA/
 HlL0LfhSodHFmWMslwRB5NeaVNxPEm1Bd71k+MeP6mwH/32eZmE1OOAHwdySL/hnWWWESDcjZcs
 lYYbCSAZjix8q52g3kcljr/gnYmsB+2G7RnS0S+2QBfOOBnxOrZxC2h8vShyxbVdSfYqxkCCtwa
 nCe/Y8v7zlw1Dv4YC4MXXGBk6jwKtGu88bNNJeeh6mbu4JyZcrrujM/izZ1KdTN3vLEekk5tzXp
 aQffrVUjqlwGD51T5Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114973-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:me@samcday.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,samcday.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,ej6bf335nxq4:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDDD66D8D75

On Sat, Jun 27, 2026 at 10:18:45PM +1000, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> If the peak vote for mdp1-mem is allowed to drop to zero, it seems to
> cause the fabric to collapse that path entirely, which causes the device
> to bus stall and fatally reset.
> 
> This issue was identified specifically on sdm845-oneplus-fajita, so this
> workaround is applied narrowly to SDM845's MDSS.
> 
> ---
> This RFC patch is a spiritual successor to the "Addressing stability
> issues on SDM845 with the -next tree" series sent by David and Petr 6
> months ago.
> 
> As Dmitry pointed out, the patch introduces leakages to the runtime PM
> refcounting. In practice, this means that MDSS never actually gets
> suspended, which is why the patch appeared to "fix" the issue.
> 
> The deeper root cause is that, when msm_mdss_disable() runs and unvotes
> the mdp1-mem interconnect bandwidth, that seems to collapse the fabric
> entirely and causes the bus stall -> hang -> reboot behaviour.
> 
> I've confirmed that a tiny non-zero peak bandwidth vote keeps the fabric
> alive and avoids the issue.
> 
> Of course, this is still a fairly egregious hack, but it *does* allow
> blanking to suspend and resume DSI + DPU + MDSS properly without the bus
> stall.

I'm a bit sceptical about this patch. The Lenovo Yoga C630 uses a
variant of SDM845. There I don't observe any issues with the MM itself.
But cluster suspend can cause issues there too. I suspect that there is
a missing vote (or undervote) on the CX or MX, which results in
suspend/resume crashes. And if that's true, then your patch does exactly
that - I think it will add an internal CX vote, which won't be dropped,
preventing CX collapse.

> 
> Here's what I've validated with instrumentation:
> 
>  * DSI host disable, IRQ disable, PLL state save, host power-off, link
>    clock disable, regulator disable, SFPB disable, and PHY disable all
>    complete successfully before the fatal reset occurrs.
>  * DPU runtime suspend also completes. The bandwidth accounting was
>    checked and confirmed to reach runtime suspend with 0 refs, with no
>    pending frame state.
>  * The device survives through MDSS clock disabling and mdp0-mem
>    zero voting, it's really just the mdp1-mem zero vote that is isolated
>    as the cause of the stall + reset.

Will it work if you suspend the MDSS (dropping all votes) and then
forcibly break the device suspend by returning an error from the later
stage?
> 
> So, I'm not really sure where to go from here. I'm sure that this
> workaround is not suitable for inclusion upstream as it still seems to
> be papering over an underlying issue... But it's unclear to me if this is
> some kind of hardware quirk on SDM845, a problem with the SDM845 DT
> wiring, a driver issue, or something else entirely.

I don't have a good advice here. Try disabling cluster idle node. If the
device still works, it's not a mdp1-mem.

> 
> I'd appreciate any advice on how to further diagnose this issue and what
> direction to take from here.
> 
> Kind regards,
> -Sam
> 
> Link: https://lore.kernel.org/phone-devel/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz/
> Signed-off-by: Sam Day <me@samcday.com>

-- 
With best wishes
Dmitry

