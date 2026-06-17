Return-Path: <linux-arm-msm+bounces-113522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6K7kGJVlMmrGzQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:15:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE15697CF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:15:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RfMeHfXC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dsyx6OHr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113522-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113522-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 755003028B39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AEE39DBC0;
	Wed, 17 Jun 2026 09:09:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B6B39022E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:09:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687341; cv=none; b=HBKKgcQWhMAUKnqMr26JOeSvbGjFs0eqnyoW1vd7DDN/vQg90GVyeOwE5MjYOgXDWJF+bUSVebZHfsA1o9pbULkywjg3TecvO87jUUutDQA46MN93lFbD1U3+WHTfrpOBbb2idlZcWamRrS4uTm8mzTOfAq3+mLBuGkx/e+WF9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687341; c=relaxed/simple;
	bh=e2Kp3Soq05+lSK3JRLtqfQN5LfZlG+t3TI8v5a0y3qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAIS84Kua/ZbZMfYXvyZcPDoQ5tSFHf7IYEa9WdCIbSSebtxSfGA5ZTigY8YtVD2jUnZOldjUIHpM1/wsiqQEA0zsQ+Q/3I6sRzxC9+Hyo/38N1TPtoVp/l3z8hmEtFOGE1R+8fI9MZBRWMDSugGwe03NB90eAcchju9EBOZv08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfMeHfXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dsyx6OHr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VtgG2192068
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VN3qeIiBcSYhjGDki3/bjTA0
	cHq2yUWAS4Dqv51Ypwo=; b=RfMeHfXCjDmhbEpYZAEq0vqqR9EX0zbmyIcoY1B9
	fJkiqsqFUrc7+LPPi5lGlR5AlXLGuWTtUgweyCi/OdYNBKlWhBdyYn0187qRTYfR
	XgM7Z0hFXb1pNTAf4q42cGCwq/tHIGeMXDGYEjjCYhh5ZiPhaDf4BNkReanym/c3
	kDeveXBXKxlK41AlSxhZPJv8YBhrWhsj9bFfKFnZ3WmWtnyafRIKctmE/4rZzBz6
	wnMacJA6Oyz2vm9s/Ek/uirFsrqvY0pm7LKPD27PiM6xQHedlK9HHUNu25vr2cc5
	SMgJw7x7Q53Vgv3j7M1XMs+as8/whTvfQ9fb4HrGvPitBg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesjcnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:08:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-307fd7138b1so7966838eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781687338; x=1782292138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VN3qeIiBcSYhjGDki3/bjTA0cHq2yUWAS4Dqv51Ypwo=;
        b=Dsyx6OHrcn7olaMH4Cg2K6hb+HRTb1Egla12b+iXGu2iz9/Vqw/ipJjfG0zgPgG2m2
         pRHvqMYGs/tvKZ4BIu3Ul5mmYP4B+PBVPdIfgIvXvy+YO9ezETgyBqAGQTX9EEU+ipqv
         epgna/hV2HC8hGy3L83SgYxdDgdCUwOB8uiEtQ0w/iGhdFKidECfFdKR0zkozPmVE/Ch
         uKj/Zr60LmcqLFrSTN7HUCqIIukxgxZ4UKIcEytbBEV7/T4uSzNcsMi+BAJYJaBAt0k3
         cJLs6197u01ad7dhurcFQSqdMhbQMBiWtyNy6KE1PF5oNd1978WPpBEtZB1xeUpEVMLr
         HiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781687338; x=1782292138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VN3qeIiBcSYhjGDki3/bjTA0cHq2yUWAS4Dqv51Ypwo=;
        b=fdAKn8KQaQTecNJ/Alc16oZ8v/0FTQEdCifUKy3E1uTLPs12BdimCCWvHvMUEn95Ev
         1Emf+/0bSMyJQgh13uyaJJVDHNUvdccl+gY8QCo+bOFEFiCZ+Fk6+aYwEQnLHyLDdxJ3
         wRT1QkM6WYmJm8rvjrvpJrQc2tWBwHO2uG6hxlj+HQaqhrSj5AWiPfvQukhZ8msykphL
         SCICRVhrCqD8Wj9QZQFMLdtIY6Mc4FrD3GA9vfbsS2IkX6Q4oQ9kZQ6Qm3pczMMt24fo
         fdjYj7Z2+uBfRk9Yah7opmSwe9uxfx3ZRkanwZeA/F06rY7ug/CQBZEeGmlkIwsg0WBt
         3QhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Q1Qpvl0a32VlJb3PhHWyquoNT1mwlAsdRxnE/N10anQd2eSMqZPAX7m0q1kmEmxbM/i0oQ+rTf5KoGrUe@vger.kernel.org
X-Gm-Message-State: AOJu0YyXzU1N1UVXP55xU18EnXP+AhOjA31qIZ8/8g2+V9QXIsGEHxYm
	ORDM3nfcR6rWCMew2rMzEQLEMrz1X/Qr1PUDAG87jZB5EMrgVxZrNDdZNeA76gA7UsMxp7Wkhy1
	Pvf2AwDgi/nbcn1vY/+NDrpPfNt3h/n+c0CVTwNHm8MRidbdkYtUcOok0bdkIYZ3cvLBZ
X-Gm-Gg: AfdE7ckO3mjGPfZH+tW0SCyHJF+njgq0IjidEgiPcvDknn+1GDHddK+2dDuyvD3DBY4
	apbjtl/Md34f0nFXvHRMeSIvEYJh3iHKiOtK1GSmyWkViP6YKeV/kTQwMrbOIZDp+BqKeXXhGtr
	GtQm2S+QMxzeqrtCDgi5U/bWdQQP30kKIvwdKfv0Ttb+N0XDywPFfg8kvRz/PEpKPKpZXhGQiAX
	GgBO1pr/5xYUYh91cnCQiSqJpiErwiw/XEKVS1Nt4qJShnkasMrtnFTcPzwYELMG2x21apbfVKL
	fXVQjize/0aHdU4dbfMaez5wqcTNbS9VLggR9ScI1a7mxt7zGZR+ZN6vxr9CEM+NNAfBSH7s/ZP
	VD7uifiEbNwcqLL2bu24VlXddxLrrf49IUk7plOz7SdKDPP3jtA1OjgoAP7g=
X-Received: by 2002:a05:693c:6391:10b0:30b:d865:4bdf with SMTP id 5a478bee46e88-30bd865534emr357819eec.23.1781687338178;
        Wed, 17 Jun 2026 02:08:58 -0700 (PDT)
X-Received: by 2002:a05:693c:6391:10b0:30b:d865:4bdf with SMTP id 5a478bee46e88-30bd865534emr357805eec.23.1781687337602;
        Wed, 17 Jun 2026 02:08:57 -0700 (PDT)
Received: from hu-yutlin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd8ab412fsm1347950eec.31.2026.06.17.02.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:08:57 -0700 (PDT)
Date: Wed, 17 Jun 2026 02:08:55 -0700
From: Eddie Lin <eddie.lin@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: fix memory leak in
 fastrpc_channel_ctx_free
Message-ID: <20260617090855.ssteqlkldi3la4ex@hu-yutlin-lv.qualcomm.com>
References: <20260611-fastrpc-cctx-cleanup-v1-1-28097444116c@oss.qualcomm.com>
 <tiug7vw6ozzel3oed62qzogcjxo36h5vfy2d7xwlfqjecqptuv@m35i37kapu7s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tiug7vw6ozzel3oed62qzogcjxo36h5vfy2d7xwlfqjecqptuv@m35i37kapu7s>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4NSBTYWx0ZWRfX1QsAxBSQ2HeM
 sqFhMwVTmTypxL6ud6oRy5aOnPpAizMn/UCvMnblr0uWcpYQrntiFTD974eY7++dzR6O1RSjaks
 QzlWmT4fI+YnfhR+RjpjTkPG1oGHlbjXaWQUfdpuLZXtK5C7GRDTciubcKAWnE6o9e/03mc10Mf
 jlJjgSzcgSNRzyPnZKQDxKnPBlUfwXNOWfTzhoEqeCSlNaOAcUSJBy0z8Hv/aTI+QExZYvgzZzD
 Ghrp8NX4K1+llG7IjXL5VAb3ySnLklRyCUaLhFPvZHHGYdtfm0/l4wKIe+krx1v7itOWGUtK0e5
 Tpmh7V/Tv+IBkxXVI/xuu00TTNpLl9UuBGJiXSbY/3tBEGAeeCvmriVnYkvYjXougLRuLlcxhLN
 oFH1Xf5hEHflZXDZUMCDsHyd2UeYfSTUpNgdpBCF3GeRuC6W7fbGOMYhWSeuEIx1t5TbT5bKrSf
 aAOTifPJTPfay4Y6BPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4NSBTYWx0ZWRfX4FxD1Sb5HUJi
 2aiFWRGDWi8u4xoU35e7k/sAZ1UuRYgmo4tRSGz+BajLniLGZz4ORobQ0wDKiOwUHg/LjtqesId
 Yuch5d9pG3cK7s+bBRfCtUZPiZtOqug=
X-Proofpoint-ORIG-GUID: LP73WIAk4RvfGMb5jrF6Tt3AP_TAZvM3
X-Proofpoint-GUID: LP73WIAk4RvfGMb5jrF6Tt3AP_TAZvM3
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a32642b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=A19_TmA_pFzYmWefrn8A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-113522-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AE15697CF7

Thanks for the review.

I will address these points in v2, specifically adding the Fixes tag,
adding cc:stable, and cleaning up the cover letter to reflect that
this is a single patch.

Best regards,
Eddie Lin

On Fri, Jun 12, 2026 at 03:44:42AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 02:21:44AM -0700, Eddie Lin wrote:
> > The 'ctx_idr' is initialized but never destroyed when
> > the channel context is freed, leading to a memory leak.
> > Add idr_destroy() to properly clean up the IDR resources.
> > 
> > Signed-off-by: Eddie Lin <eddie.lin@oss.qualcomm.com>
> 
> Missing Fixes and cc:stable.
> 
> > ---
> > This patch series fixes a memory leak in the FastRPC driver.
> 
> It's a single patch, there is no series.
> 
> > The channel context's IDR was not being destroyed during cleanup.
> 
> Duplicate info.
> 
> > ---
> >  drivers/misc/fastrpc.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index a9b2ae44c06f..7727850e9240 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -492,6 +492,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
> >  
> >  	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
> >  
> > +	idr_destroy(&cctx->ctx_idr);
> >  	kfree(cctx);
> >  }
> >  
> > 
> > ---
> > base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
> > change-id: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0
> > 
> > Best regards,
> > --  
> > Eddie Lin <eddie.lin@oss.qualcomm.com>
> > 
> 
> -- 
> With best wishes
> Dmitry

