Return-Path: <linux-arm-msm+bounces-93001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABX4H4xEk2kP3AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 17:23:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9F14614D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 17:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 109EA307AA43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6971231A051;
	Mon, 16 Feb 2026 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmiHrJNq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE5242D76;
	Mon, 16 Feb 2026 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258732; cv=none; b=M9RGtWTS2FkvT9k6B/9mLq2tbvzKq7BM13/k1h/DiSeAOK7P5dR8/Xt3KDXQiim/XXIPoU/wzrB8JHIylL0hC6OErHvLywzyFjHNmLIR4EwcThnh9DCFmG7FMwOV/cbQZDMjglWJ8GTTtJ8OL6MST3WVUykaFwYqhSQoRQmATvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258732; c=relaxed/simple;
	bh=F/7kMux7UiS30cFkbQa7Csbuon+UVNw6jKcpxOTHHLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIAQ4GkjCc6eqeqIP24mWlshVVeuvopHn8l81uci4hF61x1ons9nbr9Q192c9IZM8XHMjJSW4eHZR+sYh/hLTnZe4OjJ3js8RLrUdqgYpXVgVbv2INVbyjmDKO7AKJs+Z8elcYt2Q/XpqFdeMRtm9POPcLBNyBJadKygeVD7gO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmiHrJNq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B58C19423;
	Mon, 16 Feb 2026 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771258731;
	bh=F/7kMux7UiS30cFkbQa7Csbuon+UVNw6jKcpxOTHHLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmiHrJNqtsChwmJr9CphEWVcyUxaVUVsNEDVEjtsV6ah/QJg0yltcPCUqR7uMKbv+
	 ZbineVo0UHpfkmMdjhND02XJyolmL3yr9r488RNM+/DBrC8EHC3pN3uksRE0/0WKvH
	 Kiqrj/yRslyWZaxgk6vsZjBe866nWwVZCe4Ub7Occq0WtOCd8Xkd1j9xqhnzEo6R0u
	 t9Zo9G5CQx1MIOo9jd433xoqR/Zwjxbe5Exwoq9QmFPrrGXAnDTJgzbv3o+uLt7C7X
	 6zbz763icAaAz7gJzYijAamw1F70YlkoHB1wDGysBYFWE//ykmRZZRvNPCvyP6dUQg
	 rfB/1XqV+XCag==
Date: Mon, 16 Feb 2026 21:48:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: Re: [PATCH v2] net: qrtr: Expand control port access to root
Message-ID: <hxf347brl3ujlnrntfqfyc4snim43athuhx7bduyjj74mlysi7@vbtyz25shsqq>
References: <20260216-qrtr-control-port-access-permission-v2-1-71c15f2c5c7f@oss.qualcomm.com>
 <szn3j7huoz6sayxxrmbm2undysbai2ac3xkeu4i7qadbcczd3l@ykrbiqzyyrc4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <szn3j7huoz6sayxxrmbm2undysbai2ac3xkeu4i7qadbcczd3l@ykrbiqzyyrc4>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93001-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9B9F14614D
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 09:51:21AM -0600, Bjorn Andersson wrote:
> On Mon, Feb 16, 2026 at 02:11:45PM +0530, Vishnu Santhosh wrote:
> > When qrtr is loaded as module, QRTR NS runs from SELinux kmod_t
> > domain. On targets using upstream SELinux policies, this domain
> > does not receive CAP_NET_ADMIN, which prevents it from binding
> > control port even though QRTR NS is a trusted system component.
> > 
> 
> This part looks better now.
> 
> > Granting kmod_t the CAP_NET_ADMIN capability in policy is possible,
> > but not desirable, as kmod_t is not expected to perform networking
> > operations and widening its capability set is discouraged.
> > 
> 
> Where is this discouraged? Who discouraged you do to this? Wasn't this
> exactly what Stephen suggested you do in his feedback on v1?
> 

Yes. There is no point in respinning without addressing all the comments.

- Mani

> Regards,
> Bjorn
> 
> > To address this in a contained way within qrtr, extend the control
> > port permission check to allow binding when either:
> > 
> >   - the process has CAP_NET_ADMIN, or
> >   - the process belongs to GLOBAL_ROOT_GID (root-equivalent tasks)
> > 
> > This permits QRTR NS to successfully bind its control port in
> > kmod_t restricted environments without broadening SELinux capability
> > assignments.
> > 
> > Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Replaced "qrtr-ns" with "QRTR NS" in the commit message to avoid
> >   confusion with the deprecated userspace qrtr-ns tool and the NS
> >   implementation inside the QRTR driver.
> > - Link to v1: https://lore.kernel.org/r/20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com
> > ---
> >  net/qrtr/af_qrtr.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> > index dab839f61ee93b876021d904ae6b8dca8ed43745..b0e252c16f156c05973988fbdf317a149ad9840d 100644
> > --- a/net/qrtr/af_qrtr.c
> > +++ b/net/qrtr/af_qrtr.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/qrtr.h>
> >  #include <linux/termios.h>	/* For TIOCINQ/OUTQ */
> >  #include <linux/spinlock.h>
> > +#include <linux/uidgid.h>
> >  #include <linux/wait.h>
> >  
> >  #include <net/sock.h>
> > @@ -738,7 +739,8 @@ static int qrtr_port_assign(struct qrtr_sock *ipc, int *port)
> >  	if (!*port) {
> >  		rc = xa_alloc(&qrtr_ports, port, ipc, QRTR_EPH_PORT_RANGE,
> >  				GFP_KERNEL);
> > -	} else if (*port < QRTR_MIN_EPH_SOCKET && !capable(CAP_NET_ADMIN)) {
> > +	} else if (*port < QRTR_MIN_EPH_SOCKET && !(capable(CAP_NET_ADMIN) ||
> > +						   in_egroup_p(GLOBAL_ROOT_GID))) {
> >  		rc = -EACCES;
> >  	} else if (*port == QRTR_PORT_CTRL) {
> >  		rc = xa_insert(&qrtr_ports, 0, ipc, GFP_KERNEL);
> > 
> > ---
> > base-commit: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
> > change-id: 20260205-qrtr-control-port-access-permission-bfea19994a58
> > 
> > Best regards,
> > -- 
> > Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > 

-- 
மணிவண்ணன் சதாசிவம்

