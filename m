Return-Path: <linux-arm-msm+bounces-101614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNzaAyt7z2mvwgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:32:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A19AD3921BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14966300C31D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 08:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C2E372EC2;
	Fri,  3 Apr 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2hU96MR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4F19D07E;
	Fri,  3 Apr 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205159; cv=none; b=OZSRK5StSnftr5vu+ntrimbF+EX9fhGV+sAQt5fwszfEr1WczBFfapovOnLmkwCh+2QhfEEyu34CrhzZQ2eliLy9vL882xoBawm8T32FQN5KNds9z0U/TgzCqw82o5CrJN9RVbf/EBFSFzCBaZGaMQ1pUzOPgyHVEuSYvQSYN2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205159; c=relaxed/simple;
	bh=X3ue6DYRmQU5xsro/VZB8UpEGt/pWXZaKTyBr9gKgGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV/UMNRuOiYJyhdlMdJJr5OArZWMtAkUoneENc9BXa2EMj4Lv7K68f0B82x3SDJ9eoGf0QpG3jYCb2O4ynIS+6vhjcWgGjX4pBXsPoycDXFIz/wxCRr8UC0rGlgxE86h8JoUB4GuE0syW8QnHBFghApAvCso1OdRVDbXMw56NX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2hU96MR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4AEC4CEF7;
	Fri,  3 Apr 2026 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775205158;
	bh=X3ue6DYRmQU5xsro/VZB8UpEGt/pWXZaKTyBr9gKgGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2hU96MRIpzQYkGb167h4xmyBFNrwbLokMwgEqxXCiOPIbOq4xzTPd9wiEesX3yJo
	 Z8QPziFbqDBpk8b77fVlER50eStl/1ltEgZgfErXp+aBW2zyuJR5evhK21HUvUsDvH
	 NBx52eY+wyAkWj5YZtnNJnN7gachq2swi/eIuRFACHKSO3lpBvvfBwZnpr1bWX1ufZ
	 WZmoH5cUjkQVzjhlsOVRjdSxeVXsr7H5Z7rg5MsBbtVfSH6bB9R9ZssRjblxZla8JB
	 DgJUO6Wp+ANmkmBH9AUFeJKHNPN0JuQourHpqMluuMXyk7hiUvQC5YScTyrDR5Z9mp
	 qfSUQTsxMrneA==
Date: Fri, 3 Apr 2026 09:32:33 +0100
From: Simon Horman <horms@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, yimingqian591@gmail.com,
	chris.lew@oss.qualcomm.com, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] net: qrtr: ns: Limit the maximum lookups per socket
Message-ID: <20260403083233.GB11973@horms.kernel.org>
References: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260325104415.104972-3-manivannan.sadhasivam@oss.qualcomm.com>
 <20260327100709.GD111839@horms.kernel.org>
 <b3i64wszqrmxmpl453z6mpaiqmuespxiioexb3wwbt3bz7mmen@rlewkfc4v25s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3i64wszqrmxmpl453z6mpaiqmuespxiioexb3wwbt3bz7mmen@rlewkfc4v25s>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101614-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A19AD3921BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:47:13PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Mar 27, 2026 at 10:07:09AM +0000, Simon Horman wrote:
> > On Wed, Mar 25, 2026 at 04:14:15PM +0530, Manivannan Sadhasivam wrote:
> > > Current code does no bound checking on the number of lookups a client can
> > > perform per socket. Though the code restricts the lookups to local clients,
> > > there is still a possibility of a malicious local client sending a flood of
> > > NEW_LOOKUP messages over the same socket.
> > > 
> > > Fix this issue by limiting the maximum number of lookups to 64 per socket.
> > > Note that, limit of 64 is chosen based on the current platform
> > > requirements. If requirement changes in the future, this limit can be
> > > increased.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > ---
> > >  net/qrtr/ns.c | 18 ++++++++++++++++--
> > >  1 file changed, 16 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> > > index fb4e8a2d370d..707fde809939 100644
> > > --- a/net/qrtr/ns.c
> > > +++ b/net/qrtr/ns.c
> > > @@ -70,10 +70,11 @@ struct qrtr_node {
> > >  	u32 server_count;
> > >  };
> > >  
> > > -/* Max server limit is chosen based on the current platform requirements. If the
> > > - * requirement changes in the future, this value can be increased.
> > > +/* Max server, lookup limits are chosen based on the current platform requirements.
> > > + * If the requirement changes in the future, these values can be increased.
> > >   */
> > >  #define QRTR_NS_MAX_SERVERS 256
> > > +#define QRTR_NS_MAX_LOOKUPS 64
> > >  
> > >  static struct qrtr_node *node_get(unsigned int node_id)
> > >  {
> > > @@ -545,11 +546,24 @@ static int ctrl_cmd_new_lookup(struct sockaddr_qrtr *from,
> > >  	struct qrtr_node *node;
> > >  	unsigned long node_idx;
> > >  	unsigned long srv_idx;
> > > +	u8 count = 0;
> > >  
> > >  	/* Accept only local observers */
> > >  	if (from->sq_node != qrtr_ns.local_node)
> > >  		return -EINVAL;
> > >  
> > > +	/* Make sure the client performs only maximum allowed lookups */
> > > +	list_for_each_entry(lookup, &qrtr_ns.lookups, li) {
> > > +		if (lookup->sq.sq_node == from->sq_node &&
> > > +		    lookup->sq.sq_port == from->sq_port)
> > > +			count++;
> > 
> > This feels like it could get quite expensive.
> > If many lookups are added, it feels like it may be O(n^2).
> > 
> 
> Lookups are not something that'll happen very often. A client only registers
> for the lookup once per service that it depends on. That shouldn't be too
> much. And then once lookup is registered, it will be used throughout the
> lifetime of the client.
> 
> So there is no overhead associated with this check.

Thanks, and sorry for the delay: I was taking a holiday.

I'm still slightly concerned that this may prove to be a problem.
But we can leave that concern sit in a corner by itself for now.

For this patch feel free to add,

Reviewed-by: Simon Horman <horms@kernel.org>

I notice that this series has been marked as changes requested in patchwork.
So, unless it's being handled by some other means that I can't see at this
moment, I think it would be best to repost this series.

