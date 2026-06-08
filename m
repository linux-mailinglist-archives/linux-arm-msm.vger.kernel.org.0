Return-Path: <linux-arm-msm+bounces-111690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RkRkN5ljJmoEVwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:39:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BC6532E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:39:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kugHaf6W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f0pw9oEP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111690-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111690-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 287B7300AB03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B4E38E133;
	Mon,  8 Jun 2026 06:38:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092C438E10F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:38:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900686; cv=none; b=QiwgNphQniudWcuXf4fcwS8xC50LnF4U3O6ImtvUAWnlOsxqWbpTOkyL4Q7dVmbqfPxGNcqmrXuXM4vLHswxcBL4KZ9s7uNh2iuOyds5B88vpCHbsPNaGmzqQMNqAIBEZPl6pgc4f1cVJNc8Qvz8UEFL0+i7aZixSOJ6yxkMAl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900686; c=relaxed/simple;
	bh=W5gEErv6Q3hVKFwPx1HgbCQspesu6nSxLYNOEoOV9iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaKrDkQlZSU7AjR1oxDelPXEfbtruIWZ7G/WuldYhoC4JXNTeAzOG88V9U1C8YyuWuFu/XiEqRvC+llPP3CAdIeDcoigyMeXIaeF4UkC+SD4uhwdEHI00AH18B/crg60wWNOVfTyah7qnWLB6kZIRExUhdWVIsIog4/Q5U/giC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kugHaf6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0pw9oEP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Oe3n2385846
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GzbD86PS+yb3OAsCbIu1GxEp
	RjklHGCsYXNUOB6It0I=; b=kugHaf6WQXtSez9Kh+KtJt/OGqcLJTEx5MB9npmf
	yaayAEHx4VNZuv46ayOQ9JJezqNyWP6UM8EfhICj0neEtKPDOzODdNOuGnFoZ35j
	tiVf5C/mxWvYXoh+vzfM3Az0pXr//uyMaU0f6fTobhlAI17M5x0OZr3NRv1emuXy
	KBPWS0wCkvNdBpQAKVtq78/mHjYjPeAaQIdMamO0sdlTbPEQfJyqk19EyMxUaTRa
	LryLv3M875EH+EgMe0+UwC7gDkkNYbzEugI4LFqyTOw/3FkTeB6XlvLBDg/mIYji
	UjLFG1a9TiydkRVjgXCxT3CrNluwH/a2rYXvk3s8k6U/Zw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8x39j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:38:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59ebb69acadso2371727e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780900680; x=1781505480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GzbD86PS+yb3OAsCbIu1GxEpRjklHGCsYXNUOB6It0I=;
        b=f0pw9oEP0ArhWoeww+thh1rEfKjEgUEUnqPl9H+qKa6FPp/6klu+n8Q7EtdVL9fv6w
         nMIrZdj7Ud19wmmRB6mc8IkT69V/VZUsp0R2HHo6+5agHWBWAW0wtNHDwBz35F0y/+vt
         5Vi0t9A+XQXhTGPyDx6q4hlBDG32d1cQ1H9onAWh7+9nAthsHzfiScm+TS67JJ8zcVUp
         8o++nLmnYxxy3Ut28ntvvelozc1hUBfifiL9bMUycivAKscjDZn+Y0nQ8dDiRWmethUT
         qSZXcwU9EtqYN/vw7XIJl9GYQVD7DtuVc3ZJsOrRpreSXQxouWDxVdik/7H3Md11Q383
         5p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900680; x=1781505480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzbD86PS+yb3OAsCbIu1GxEpRjklHGCsYXNUOB6It0I=;
        b=HDh3PYbfZZ49pNc2u/ZE7CiGDewXoc4JOs9RAR+VrzcPHQGDGO9f2TOBmXIM17By23
         VDZndDpTxi9hrwa7xvn3Aa/cQjyBEDoNdgU6VohR/64QpK67PZzojQDo7ox/bFvmecsv
         2seyrZHwiYpTeZYtDJ8Znc72adTDgrZwHiwHtT8/vteCH4oDt76u3+g4sgZgz1bpFEuH
         Uj/Ir7KeC7z3aIyIjGoBmzy14wV49AdOI9qcvYnzn8nWsC3Q/po5F0q55aFNXtbaEq3r
         KHQw/cmMtWCnvAXFK/ENDIo6Cckyqav1KS0gHP/hYJqodQTB3l2GpwiDX80tnkOvNciE
         Yyrw==
X-Forwarded-Encrypted: i=1; AFNElJ+v377Y2UMepudn851KTpEoPYB9fIwz+3ORyEsQPGAe90OOmqeQDbCdexl1saXcrkccBgSmczwZdb17zEQQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzys4RG15V0JtUPMTkfPYbVpxrgZ6NzAlGf3scUSQRULovY4WdM
	IUGiZwMUCd+QnEg3otnsIlLH5XtCJeOt/PpHcZnPP8gtFG50DITAbxgDeq7IECnvFPSbBNO+MLr
	F4YyFKYdLdSPv0d5OywYJrNGXYrbCZkIPEsomWNRsskL2pct45FvnIZIYgBMEzn8k5r1O
X-Gm-Gg: Acq92OFnAFgfBh9udbxTB9kHkOw8IbRf6HL9kJtBh5+dEt36kLGwjt5v5b8CPlysKb7
	UFgGuDw/veLuAHDzvYD/6tLu26RSA2PPjwh5riC3XF2MKFZHi2/02npyrMUw2iQNl+zfK4ORHNb
	P8Im+J46jWDarpzLYbKevtPLsLf8l9bSA2Uz3scBjnuS9P2NqUcpmqzWTYNDwE6A50yyS2dxUKR
	FuVfrGVdsRrFKw4DuxlW7QGZIRBsKpDh71vB10NzFbVpvO5tLwEPanWO+xR90rFFemjyZgFwwvt
	cE4oZK8jecZKnAm9aNIW8hL0l7xcZoPKvX/sWXo62GMuQskXN2Cpr4EKw0X74WyKUrvI9jWHAzI
	bSsS0UIa+zZoP9OBlT4mfBK4SeyjdMO03TbSrvaj5aZXG4XBoJVnOTaC6EIpHKbhjO5wn3ThYkH
	b3srcFgeGIgQsZzAMOqwWOYHdybs7dnGGdR6i9FZJn1lqElA==
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr6692205137.20.1780900680014;
        Sun, 07 Jun 2026 23:38:00 -0700 (PDT)
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr6692195137.20.1780900679575;
        Sun, 07 Jun 2026 23:37:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b98fddasm3534447e87.64.2026.06.07.23.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:37:57 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:37:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v7 3/5] misc: fastrpc: Fail Audio PD init when reserved
 memory is missing
Message-ID: <mdmtc4sfeoishc64essdbrzcasd5kotbwtulk4pajjzvcy56fa@2dcpz23uuxkw>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
 <20260602071750.526-4-jianping.li@oss.qualcomm.com>
 <bcm2eufawifaq65i5qlqmbam4wtv2du5re6c54tiamdbynmras@lbfd44kjb6da>
 <ddeff296-abc0-4e1b-a721-761e2cbd331d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddeff296-abc0-4e1b-a721-761e2cbd331d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MilSQfJp9HvhpyMBydUAoMZbllqLJzkF
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a266349 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VkaHa-le0D-4vWXTXWcA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1OCBTYWx0ZWRfX4yUyYmNYTyDw
 nnAfseeyDGlMw5NdUJ7e+wSPnd3C0aONrfVi4jmFOojd1z4szezpK+ou8X/k0+CefcjyT3hSdZY
 Swax5gvhfOHKm9FAhl6fJvB6mOT4ZoBeiIY9Z1QCcanuN3HvZSTHMiNjdZEg62HpnYNrha6QTxf
 Du4GeTcZn3DEV5V/QBfy1jFCf/bJBapYKHF0dV7w/DTyJwf7K1v3of5SogAdMfaB5SVRjZOQNrX
 aoBe4Yzsbo5qI+nBYCHIJWzByKIJEpOkrXL1fIxof3AUcdP28Zl4R/Zbo105h5swKzw/BgVX1Br
 hDBPrdeTxNf4o6NLgZNPZbfCy+e6OtEixQddDcb37LlyF2wTBr2UOMIzI9tJIEHq7d1v7gQVNml
 tRZVxiWd2laHeh497DFSR7xwJrC0YbymBCPAw6BKhGzbxyrW8oPiLUyl3psu9tk4rvRIvkVnjlE
 416G2RVxyhKZcZAP1ow==
X-Proofpoint-GUID: MilSQfJp9HvhpyMBydUAoMZbllqLJzkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111690-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,2dcpz23uuxkw:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D6BC6532E8

On Mon, Jun 08, 2026 at 02:29:13PM +0800, Jianping Li wrote:
> 
> On 6/8/2026 2:11 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 02, 2026 at 03:17:48PM +0800, Jianping Li wrote:
> > > Audio PD static process creation assumes that a reserved-memory
> > > region is defined in DT and exposed via cctx->remote_heap.
> > > 
> > > If reserved-memory is missing or incomplete, the driver may pass
> > > invalid address/size information to the DSP, leading to undefined
> > > behavior or crashes.
> > > 
> > > Add explicit validation for remote_heap presence and size before
> > > sending the memory to DSP, and fail early if the configuration is
> > > invalid.
> > > 
> > > Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> > > Cc: stable@kernel.org
> > > Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index a8a58f889d07..f46a8f53970d 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -1354,6 +1354,13 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> > >   	} inbuf;
> > >   	u32 sc;
> > > +	if (!fl->cctx->remote_heap ||
> > > +	    !fl->cctx->remote_heap->dma_addr ||
> > > +	    !fl->cctx->remote_heap->size) {
> > > +		err = -ENOMEM;
> > > +		dev_dbg(fl->sctx->dev, "remote heap memory region is not added\n");
> > > +		return err;
> > > +	}
> > Won't this check without the next commit break the kernel? I don't see
> > where else the remote heap is being allocated.
> 
> Yes, this check depends on remote_heap being populated during rpmsg
> probe from the reserved-memory region, introduced in a subsequent
> patch in this series.
> 
> If there is no dependency on the next series, the remote_heap allocation here after the if check.
> The logic will be wrong.

So, at least you need to squash those two together.

> 
> > 
> > >   	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
> > >   	if (!args)
> > >   		return -ENOMEM;
> > > -- 
> > > 2.43.0
> > > 

-- 
With best wishes
Dmitry

