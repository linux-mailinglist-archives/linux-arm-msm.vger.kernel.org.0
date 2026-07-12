Return-Path: <linux-arm-msm+bounces-118560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kXCSA1GGU2pibgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:19:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468F7449DA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:19:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cisodzbT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IJPq5er8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118560-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118560-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AE133002294
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B058B3A7D6F;
	Sun, 12 Jul 2026 12:19:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBCA3A71BE
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 12:19:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858766; cv=none; b=sE6/FgkLnlsSeKvH0Box6LShbH1PDxtFVxTPg4i3eOzt/0Us0ERamuqb05DHnCXl4uXEg7PED58RNbiPC0IyMt4jgWp1m030sdPcsYdORq82VXA/8VEr36U47v34yWXcUbl2w0MJZdsq6kizufsZe0XUJbptbF5UoziH3XZqmDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858766; c=relaxed/simple;
	bh=6IPk9HcggP18K+zdirzdUvoMGtt5SM+UOEmQBp+gdp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwwd8aDdETrUDMi1Jwke/VhuBqwp7IdCuvNlTsvQd++Hf9d6DwgDoUGFowJO14ZR2aYnZ/MBRg1EUhPrmAuav9r3aI7tmIWW5eBI8WxRJMXbhznyu7UtWJCHI8rz7uQYYjJy9LNMMd0sEL+E4bqkDd0R5ROTsLQDRX0kEW4gYGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cisodzbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJPq5er8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAc0Bw2369869
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 12:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3P6NWxiezbjvCb/uAW4I0e+M
	ddZtoeR/tFnBxYO27XQ=; b=cisodzbTXyib9ov9XPV1PKyXlLMn4ror7HGrkXLz
	Gp4HczjK5LgAZlSRx3HN/tQYY8kjdngGkSPbCYHGJBBBzvJ9zrfGoSRQUMXqqgy4
	13zV7Wl+p6AIC2OnRjvW9ndK9FazOqIN1nbpJfDxd3XBg05GEMuuJeRxpcCf1JO2
	dn/Ozqy0ZmmTC27VDNhBZI5P+g9vaNUbGjSxEd/yIf6lNs5BAh/iXe0MIvr0OHI1
	VVkTuT0dtTADcK6LqtkAjyCoKyGkdtN1RlX0DlbI7aJyXUUpaylRa55HSdKw7jva
	b+uklOpbzmlFQtSX2LHhv3lumWJvPID67VwmIRlmqmfR7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr2ntt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 12:19:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso26598311cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783858763; x=1784463563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3P6NWxiezbjvCb/uAW4I0e+MddZtoeR/tFnBxYO27XQ=;
        b=IJPq5er8m9IvFDJFlElotJ8RIlX2hqxScpDUc84CBq3QwGbPOcLPkYVhw08h+1NDOE
         WnCNZ2gpP7F1gQsCWnnusJNBDmBa8Jm+Qt8cjOyhRPewk3kQx2/HvJ/1+Nx0BDbJXKxU
         9OGG6CUoGG6fAhxxel7owBZM8leE/wQr2Eu6xR5SaPxiniy29sJiOZkgShGaqjx2f4hQ
         Y9VECQlcA0q4E0uahvvTcxVRWGJ+0hIFvI0iyVao89gMDy6NpoBQ5gC9yfkVG0S4J1Rf
         pgjpFxOmyzTuv2gk/uvneffuiJ//vHkLWIuJ4MIxWdaodE73/UDvckPyyUgBZtlN7jAH
         U10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783858763; x=1784463563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3P6NWxiezbjvCb/uAW4I0e+MddZtoeR/tFnBxYO27XQ=;
        b=Y9d51/+f1mouDkk2ZVDojh+cg2dwVcumPgxlLNIDoLogwYrAspWVHkHB3iQZShExZW
         MvplzFBG1tpYn0F6lYgyBV/LV/LJ460ob7+JcSl9k7unP9Y9tIfxgcQeyR8QeacT5psD
         d6DteeiqooHM4jzPplJKXWowv2vwBYtXuT596b7bI73fY+tmqP3IckWgAmfxx2pKbFYX
         J0t3fMFb3mWVb5rkAqmhvNn7Robicby6kOdVoy7t0u+W1Vc0ejFYoD/zxYXr81LuSVY1
         +C2VXwJbeAoMR5hPsYkhv5H2zXMROecjSxqIXWiUl01RZfjv8zf4B7Rxrv9yvU/FoDJR
         /Krw==
X-Forwarded-Encrypted: i=1; AHgh+Rqu3gdn9NiVv4f2lry72bohORfYF8WYf9voIbcZIaIXeuooYdAlt56Dm+iPTWwAElAhDyyx5nnskBts0NFG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0kVvhKRBgAKZlWQ9p1T/Ssze9/KF8a/O2XP27wxN6qhZGgWYo
	0jRU1YICgJ/lkW73N5hhLk6DtQ469RaHZkYfdFe7taCXFOnehESNLV6Mge2VRxY5vGoAy3Pa9Qv
	cZSA3eQHIxwvpm47b4R6pr067lSkrgyErGQSMO/VPw4I4T3Kyz04ym4FmDZpTeClQJwJQ
X-Gm-Gg: AfdE7ckugYE7iqT9osFWUrhkwrL5HqUl/w5Uq1VL59kSZCGvnSAOKcmx+k6Dd/eewJm
	TuFAO/uDpZSlAv7HmDNNcaqjYMpGH7h25JAZtqzlxqnMsQQyV/KICxZlRa4JoghQKp75fJ5JulZ
	i4WtBsXs9musRvKSK0fxP4xQ0yg52XSWr5ccdm9u4q1jsg00I7UqnmhN4D8i2qC6lG7951u9i5d
	7O/cbj9SQLZto9SCU1at0u5Qp7qV7uM9Yvy+EJ8s9gMWlxblk2Dv0r7VlyrspnB540yiabP4OUB
	jYp+eCbKAY946AG0KCfvrB3djWV7Xmda13TxR1zYlmRk2C5XjrmHF0YMGAFMaC0duSk2JtzxAvZ
	0EqaS/BxhRz3ojkfMhQdUqn4hF7oLn/OjvMTLDGP+waT4mWtUdyn1tpr4E76IfPmjS639RgnE0U
	2Koyq1OtwKOV4kHVdP8O2wVn5o
X-Received: by 2002:a05:622a:429b:b0:51b:ec5a:ec0f with SMTP id d75a77b69052e-51cbf0d04d8mr51443521cf.27.1783858763413;
        Sun, 12 Jul 2026 05:19:23 -0700 (PDT)
X-Received: by 2002:a05:622a:429b:b0:51b:ec5a:ec0f with SMTP id d75a77b69052e-51cbf0d04d8mr51443151cf.27.1783858762897;
        Sun, 12 Jul 2026 05:19:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caaf40esm2023077e87.71.2026.07.12.05.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:19:20 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:19:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Message-ID: <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <63t_fLehIKEom4-JPN9kAGFEjUG4_yFoHMhB2aEAppwPHb2oPbK666eGkGgXxEAHRJnfTRRUwuf2EqNRYe_gjA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEyOSBTYWx0ZWRfXyissnnCs5K/5
 g3mah01DPLf5T4zVhbXXo07pMu8hhE698u+i5ojsN7RcIhf2+OqbGXah5tRvd8zCqdn3w9L0S2F
 S9HPX8E4Z6bhm1WbpuFXa/jj9aMaFF4=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a53864c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=XO5u-L0pxnv9NeBEmIYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 55jQ8j2ehzoop_kJKHj2bx3XxnlE_8lc
X-Proofpoint-ORIG-GUID: 55jQ8j2ehzoop_kJKHj2bx3XxnlE_8lc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEyOSBTYWx0ZWRfXw+/hYxOyKOKY
 GzJVJBeiRBU7zP4N3XGE1iI6b6mGvuH3p4BDu0zYEoOCmLKLUO+WYwqLtv9KjicjJfJc1yYPLqU
 bEw4ytBbVqA8O2FuTxyyQa/jVXY1kuU3o6C9tLMZPGeooUR8rOO0Y0ZzORwKuEs/9u7KRMVbPak
 4kO4VvOagHE2hTdSwQ7tLsJHiBnuIXYXeMheXMJcSIP2PGwKPLcuUrrODoWelS4ZTYSe47X3uKX
 Cfscrpdx6Yax/KnWBz9ObTHTcsNvmh2Hal/RwGc/T+9K1Hqv9kwMWiaLEOexIsRxlYI/Mc8p5QF
 DqK1E2pcg0CylsdmGr2wDTqeKn5+hW7obC6YtOxYKQPNX5sVaG9zuuDSaBZQ0IHIwgbPzfGyMnD
 Mnkn7HCmdznDieeC3cYy+actbBXfUm9nEB7xi7vpsULU+ugRJfNAt81NZwR7gv84wjKwm83kJEH
 8el4xprUXqOTDKzM39Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-118560-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5468F7449DA

On Fri, Jul 10, 2026 at 11:46:58PM +0100, Bryan O'Donoghue wrote:
> On 09/07/2026 13:35, Vikash Garodia wrote:
> > The Iris VPU has separate streams with different IOVA constraints. The
> > non-pixel stream must be limited to the 0-600 MB IOVA range, while the
> > pixel stream can use the full IOVA space.
> 
> 
> > Using a single set of IOMMU entries for the Iris node does not describe
> > these per-stream limits and can allow accesses outside the supported
> > range, which may lead to device crashes. One such issue was reported at:
> > https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> > 
> > Add non-pixel and pixel child nodes, move each stream ID to its
> > corresponding child node, and add a reserved IOVA range for the
> > non-pixel stream.
> > 
> > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> The thing of it is, this _is_ a bugfix - perhaps its not one that can be
> backported, actually scratch that, this isn't possible to land in -stable
> realistically.
> 
> So what is needed here is a strategy for fixing -stable.

I think, we need to start with defining, which platforms are affected.
sm8150+? SM8250+? SDM845+? MSM8996+?

> 
> That could be apply Daniel's patch and backport it with Fixes: - with
> mainline then say applying this change and reverting Daniel's patch
> 
> or
> 
> That could mean some other solution for -stable - up for debate - what's not
> up for debate is this series needs to _address_ what happens to stable for
> all of the target platforms - and then transition mainline to the new and
> shiny way.
> 
> That could mean
> 
> - Applying Daniel's fix with Fixes: and cc-stable
> - That patch needs to be extended to _each_ Iris platform containing
>   this bug... all of them I think.
> - Updating bindings
> - Updating DT with new method simultaneously reverting Daniel's fix
> 
> And I do mean doing that in one progressive series - a fixup for mainline
> alone isn't enough.

-- 
With best wishes
Dmitry

