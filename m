Return-Path: <linux-arm-msm+bounces-100260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDtzD9taxmm+JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:24:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3834279C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D8AB30B6D0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BF33B47FC;
	Fri, 27 Mar 2026 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9fOKIL+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D83B0AD7;
	Fri, 27 Mar 2026 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606642; cv=none; b=mCd2uQJsfoCwWR8NypEGIBTZrSRwunwm+zIbJxUO0HEDO8bzGX34pFmRsb95FnlnBWtzoy9FnhHGGKSON/wGUkXIaesfVWqD4zNsGfqryVzKP1UJvWOqmGrg8YFrTT0devJFyaLYGITlh9N1bbfkTAG6MkJ0M4+nTefF/lIgARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606642; c=relaxed/simple;
	bh=bACH9bXuLwoHnf+XcfEWG6Dc4J1VuQFONU9E2meVulE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxBo8n6crUMa4xU33VrKdj8D+fDHpoIA9e4eyL+j5LfpmnoH/dlXCk5YkeRroxbmjsxX9zce/SMMEVh/uIiU1PUcO0u6TTxn44YDoM+Vphh2TDdxLytIXWG4N71V7dO6OpzRcR0ecJT4lEyX/8FPzlt7FK6DeS0E/cu65YqiGQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9fOKIL+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F308C19424;
	Fri, 27 Mar 2026 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774606641;
	bh=bACH9bXuLwoHnf+XcfEWG6Dc4J1VuQFONU9E2meVulE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9fOKIL+dX+W4/MXW5OX2tHskObWyXv2ANnHyDH+xl/+4baLZPdd25uKJhOpyga5R
	 AASsDavOsscwyeMGbaFi6qMvF5uTIYzQb7zLn6mpkkm2awK+eemQ/GjagQW1GwsH7W
	 Ye984MS7w0xSKYeuW/ImHfOvf28lJpWPYvand9LA1B5rzTXkry9ELImzkleKdGrMn7
	 bKyA33V9Q6ATrLa4VyFY+sfEpSuCLg5xRdtYQlLY8tnV8QHKt/Dp6cxn+UT7ZwvEto
	 WRBYEjuN08VI/LK1ekpzrGjpFQFW6PZWhja6DYyWq7pszI7CCJXPAfEy/ukO5BGMjY
	 YsrXLeZfQMO8A==
Date: Fri, 27 Mar 2026 15:47:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, yimingqian591@gmail.com, chris.lew@oss.qualcomm.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] net: qrtr: ns: Limit the maximum lookups per socket
Message-ID: <b3i64wszqrmxmpl453z6mpaiqmuespxiioexb3wwbt3bz7mmen@rlewkfc4v25s>
References: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260325104415.104972-3-manivannan.sadhasivam@oss.qualcomm.com>
 <20260327100709.GD111839@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327100709.GD111839@horms.kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100260-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B0E3834279C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:07:09AM +0000, Simon Horman wrote:
> On Wed, Mar 25, 2026 at 04:14:15PM +0530, Manivannan Sadhasivam wrote:
> > Current code does no bound checking on the number of lookups a client can
> > perform per socket. Though the code restricts the lookups to local clients,
> > there is still a possibility of a malicious local client sending a flood of
> > NEW_LOOKUP messages over the same socket.
> > 
> > Fix this issue by limiting the maximum number of lookups to 64 per socket.
> > Note that, limit of 64 is chosen based on the current platform
> > requirements. If requirement changes in the future, this limit can be
> > increased.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  net/qrtr/ns.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> > index fb4e8a2d370d..707fde809939 100644
> > --- a/net/qrtr/ns.c
> > +++ b/net/qrtr/ns.c
> > @@ -70,10 +70,11 @@ struct qrtr_node {
> >  	u32 server_count;
> >  };
> >  
> > -/* Max server limit is chosen based on the current platform requirements. If the
> > - * requirement changes in the future, this value can be increased.
> > +/* Max server, lookup limits are chosen based on the current platform requirements.
> > + * If the requirement changes in the future, these values can be increased.
> >   */
> >  #define QRTR_NS_MAX_SERVERS 256
> > +#define QRTR_NS_MAX_LOOKUPS 64
> >  
> >  static struct qrtr_node *node_get(unsigned int node_id)
> >  {
> > @@ -545,11 +546,24 @@ static int ctrl_cmd_new_lookup(struct sockaddr_qrtr *from,
> >  	struct qrtr_node *node;
> >  	unsigned long node_idx;
> >  	unsigned long srv_idx;
> > +	u8 count = 0;
> >  
> >  	/* Accept only local observers */
> >  	if (from->sq_node != qrtr_ns.local_node)
> >  		return -EINVAL;
> >  
> > +	/* Make sure the client performs only maximum allowed lookups */
> > +	list_for_each_entry(lookup, &qrtr_ns.lookups, li) {
> > +		if (lookup->sq.sq_node == from->sq_node &&
> > +		    lookup->sq.sq_port == from->sq_port)
> > +			count++;
> 
> This feels like it could get quite expensive.
> If many lookups are added, it feels like it may be O(n^2).
> 

Lookups are not something that'll happen very often. A client only registers
for the lookup once per service that it depends on. That shouldn't be too
much. And then once lookup is registered, it will be used throughout the
lifetime of the client.

So there is no overhead associated with this check.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

