Return-Path: <linux-arm-msm+bounces-100256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FmwA2VZxmkrJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:18:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEA83425BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F322030C2DB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3903A8749;
	Fri, 27 Mar 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWOMHv7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A4129D268;
	Fri, 27 Mar 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606210; cv=none; b=nuvUndFWg1ByQJjTtH3sSe2lnVK+A+GLmkccD0PaS1N28u4t+v2W0Q6MMOlWausmbhf/zGfrg8KND6CfHGBaxkfFpvIeQ1LAnHZdywZguEPnvEM4o2JPaCMSLQqOuwR70GXHf6Ui7gL8UWc9cQCaYL+Lxec3Eb1oqCj+Kl2sWek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606210; c=relaxed/simple;
	bh=VzV0a2wBVr6FuxEykZ4Kknr6vJ2PWsntBc81QU/RXx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxV1Nq8j1vLullTbVzYQ1aSwpzS3Nir8eDTSqNwUthf/oY/YYud3eCYpdfbk5KWZgg7EJLdDWbBJmGaXqe6S1E8YA7ALQuyxk7f9+MJozyqW58g3gcqBGvcpWLpzA8/mS5Yi9G13WAKywbxkAQg7CFUU40/6xKcC4gM+NwwLSOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWOMHv7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82D2C19423;
	Fri, 27 Mar 2026 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774606210;
	bh=VzV0a2wBVr6FuxEykZ4Kknr6vJ2PWsntBc81QU/RXx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWOMHv7GdJVsNiq7QeD3LDSH7SG53YpdiOMGylNR0E1e7bEMmQxxUcCJGeVEoNKh1
	 XicN29ckV3v+haOqufcY1L8rHRPsaCwEkZX41IyJzVoGpl5kggfEglldozHeD/l3sF
	 17YF94HU1uvxgTyAVMF99viLgD5D1UFwO+twYAzEv8TrxRH1aOPA487QlapvDI2Djf
	 K1rmBmIxDaCp8mUTIvSiUY6lERD4eC3x1EJstiWEu9VeuBQWgkn8W7Pz+0tZp6NJs5
	 xkncQka0AdTLd3Bw6P7LOTXUeLGM+AOXK9LnD4dUKB260v6IlLYZXQhhGeIpEzU2UU
	 yZMz1Rc1FyD9A==
Date: Fri, 27 Mar 2026 15:40:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, yimingqian591@gmail.com, chris.lew@oss.qualcomm.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] net: qrtr: ns: Limit the maximum server registration
 per node
Message-ID: <as3zucfwr4z2x5pxww6ognmqcujkwnhppulm7jquex6fy6sqn5@qa33h5mxxdz7>
References: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260325104415.104972-2-manivannan.sadhasivam@oss.qualcomm.com>
 <20260327095832.GC111839@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327095832.GC111839@horms.kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100256-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 9DEA83425BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:58:32AM +0000, Simon Horman wrote:
> On Wed, Mar 25, 2026 at 04:14:14PM +0530, Manivannan Sadhasivam wrote:
> > Current code does no bound checking on the number of servers added per
> > node. A malicious client can flood NEW_SERVER messages and exhaust memory.
> > 
> > Fix this issue by limiting the maximum number of server registrations to
> > 256 per node. If the NEW_SERVER message is received for an old port, then
> > don't restrict it as it will get replaced.
> > 
> > Note that the limit of 256 is chosen based on the current platform
> > requirements. If requirement changes in the future, this limit can be
> > increased.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> > Reported-by: Yiming Qian <yimingqian591@gmail.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> > ---
> >  net/qrtr/ns.c | 24 ++++++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> > 
> > diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> > index 3203b2220860..fb4e8a2d370d 100644
> > --- a/net/qrtr/ns.c
> > +++ b/net/qrtr/ns.c
> > @@ -67,8 +67,14 @@ struct qrtr_server {
> >  struct qrtr_node {
> >  	unsigned int id;
> >  	struct xarray servers;
> > +	u32 server_count;
> >  };
> >  
> > +/* Max server limit is chosen based on the current platform requirements. If the
> > + * requirement changes in the future, this value can be increased.
> > + */
> > +#define QRTR_NS_MAX_SERVERS 256
> > +
> >  static struct qrtr_node *node_get(unsigned int node_id)
> >  {
> >  	struct qrtr_node *node;
> > @@ -229,6 +235,17 @@ static struct qrtr_server *server_add(unsigned int service,
> >  	if (!service || !port)
> >  		return NULL;
> >  
> > +	node = node_get(node_id);
> > +	if (!node)
> > +		return NULL;
> 
> This is not new behaviour added by patch, but If I understand things
> correctly, node_get will allocate a new node if one doesn't already exist
> for the node_id.
> 

Yes!

> I am wondering if any bounds are placed on the number of nodes that can be
> created. And, if not, is this a point of concern from a memory exhaustion
> perspective?
> 

That's true. I plan to send a followup for that. This series just limits the
scope in addressing the reported issue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

