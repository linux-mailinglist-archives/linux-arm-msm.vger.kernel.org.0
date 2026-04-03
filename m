Return-Path: <linux-arm-msm+bounces-101617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEGvENR/z2mvwgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:52:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5F339259C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A81A3012531
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 08:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3392031619B;
	Fri,  3 Apr 2026 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sL5N3/g7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094A258ED5;
	Fri,  3 Apr 2026 08:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206352; cv=none; b=uvT74cnBs5gvXPln500fIFCRz5QmlFZ5ods7uqiyt4NwCkHcvER7weciNYZhg6zWadrNStYM3y0c0oB4F7o9ftxmfG2MHoruRjmaaGKzDD5s9h7xwfiHGfUOLlSqfZoFEBiApaoAQeiFsllNq+I/Vi45J4wf2wGYJRLWVErNnKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206352; c=relaxed/simple;
	bh=IDva14KQXbd5tPuTsNnsc2rZpb5o1Jahg81DfTbN2Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAtYhyEUCAbpxuVbzBK6zZStT1QUmXBn5BbzkEob0g4dHCURc9k9V2P/xWiz3JQzsx3gjee5Cx5uIZgv8uzkvmOPcDbsOW+EKjvVmvyM4uns3BMTooKTk5A4T+HGQr2yfCT149Np1gNsFaFtqSGJq4hCJz8tb2jStYWdbZXIPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sL5N3/g7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D4BC4CEF7;
	Fri,  3 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775206351;
	bh=IDva14KQXbd5tPuTsNnsc2rZpb5o1Jahg81DfTbN2Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sL5N3/g7zGn6NwiL6MnkV2jdZodbynG59W3foy/hSC4tVB1K7QGpwzWxyurlg09G4
	 r9zPKPqSjGS9OiYreZrkeho0B6Lxu6v8tH0v8m/QGqqQJsTV1JeUOwGMf0eUh5V2n8
	 FUSbUDxClKE4Pd2tzY0voSD+ySiNXR7wOwloCxXZ4df9rvkrK2t0UNGOAMwiBhCm2P
	 mp58rwUOJBATACSKHqnOc23jfU13ncBQxvokjhQRknzs+udNenoAXtMncIZX+OWK6q
	 lu1VeR8y0cgb39OsHZ0mJp777nswVrxopbBW04xau48TMBWK97YEuMHGwwwz5V1I8u
	 lq7ZYbzklZYoQ==
Date: Fri, 3 Apr 2026 09:52:26 +0100
From: Simon Horman <horms@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, yimingqian591@gmail.com,
	chris.lew@oss.qualcomm.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] net: qrtr: ns: Limit the maximum server registration
 per node
Message-ID: <20260403085226.GA26061@horms.kernel.org>
References: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260325104415.104972-2-manivannan.sadhasivam@oss.qualcomm.com>
 <20260327095832.GC111839@horms.kernel.org>
 <as3zucfwr4z2x5pxww6ognmqcujkwnhppulm7jquex6fy6sqn5@qa33h5mxxdz7>
 <20260403083009.GA11973@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403083009.GA11973@horms.kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-101617-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,horms.kernel.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: CC5F339259C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 09:30:09AM +0100, Simon Horman wrote:
> On Fri, Mar 27, 2026 at 03:40:01PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Mar 27, 2026 at 09:58:32AM +0000, Simon Horman wrote:
> > > On Wed, Mar 25, 2026 at 04:14:14PM +0530, Manivannan Sadhasivam wrote:
> > > > Current code does no bound checking on the number of servers added per
> > > > node. A malicious client can flood NEW_SERVER messages and exhaust memory.
> > > > 
> > > > Fix this issue by limiting the maximum number of server registrations to
> > > > 256 per node. If the NEW_SERVER message is received for an old port, then
> > > > don't restrict it as it will get replaced.
> > > > 
> > > > Note that the limit of 256 is chosen based on the current platform
> > > > requirements. If requirement changes in the future, this limit can be
> > > > increased.
> > > > 
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> > > > Reported-by: Yiming Qian <yimingqian591@gmail.com>
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > 
> > > Reviewed-by: Simon Horman <horms@kernel.org>
> > > 
> > > > ---
> > > >  net/qrtr/ns.c | 24 ++++++++++++++++++++----
> > > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> > > > index 3203b2220860..fb4e8a2d370d 100644
> > > > --- a/net/qrtr/ns.c
> > > > +++ b/net/qrtr/ns.c
> > > > @@ -67,8 +67,14 @@ struct qrtr_server {
> > > >  struct qrtr_node {
> > > >  	unsigned int id;
> > > >  	struct xarray servers;
> > > > +	u32 server_count;
> > > >  };
> > > >  
> > > > +/* Max server limit is chosen based on the current platform requirements. If the
> > > > + * requirement changes in the future, this value can be increased.
> > > > + */
> > > > +#define QRTR_NS_MAX_SERVERS 256
> > > > +
> > > >  static struct qrtr_node *node_get(unsigned int node_id)
> > > >  {
> > > >  	struct qrtr_node *node;
> > > > @@ -229,6 +235,17 @@ static struct qrtr_server *server_add(unsigned int service,
> > > >  	if (!service || !port)
> > > >  		return NULL;
> > > >  
> > > > +	node = node_get(node_id);
> > > > +	if (!node)
> > > > +		return NULL;
> > > 
> > > This is not new behaviour added by patch, but If I understand things
> > > correctly, node_get will allocate a new node if one doesn't already exist
> > > for the node_id.
> > > 
> > 
> > Yes!
> > 
> > > I am wondering if any bounds are placed on the number of nodes that can be
> > > created. And, if not, is this a point of concern from a memory exhaustion
> > > perspective?
> > > 
> > 
> > That's true. I plan to send a followup for that. This series just limits the
> > scope in addressing the reported issue.
> 
> Thanks, sounds good to me.
> 
> For this patch, feel free to add:
> 
> Reviewed-by: Simon Horman <horms@kernel.org>

Sorry, I now see Jakub's comment on this.
So I'll review the revised series, addressing the concern above,
when it becomes available.

Feel free to include my Reviewed-by tags on patches that
don't change in a material way.

