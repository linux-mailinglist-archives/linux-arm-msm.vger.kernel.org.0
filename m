Return-Path: <linux-arm-msm+bounces-101613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFR+JKl7z2mvwgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:34:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2A3921FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26331301A432
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 08:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C373137B416;
	Fri,  3 Apr 2026 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJx9s9Ij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9492E1F06;
	Fri,  3 Apr 2026 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205014; cv=none; b=kFuN93iFC6Rhw+Ta2buLKeHx/ciqIpprFwijB0iOUufBqF88c97luroPUydAhJf+WrMPbin7Up9HwpnETygUQt95EriSKCM94Jw5OFYuuwtCvJkbwt+MDqYXENY/Q2Q6kpR6yLjfDk3dnfBAEWky4Xly7q8TMI5l4gTCgfIE7kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205014; c=relaxed/simple;
	bh=Cd1EZ76xkf/x2fz9/IYK6lBMjtKYjfEikACFflOtBW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofIJwxykgjjocwz9CclgkIMnHt+Y0rqaHknIvRt3BD+M54s3KLMCw3HnHQb13TVvG6kbZmuP5NslntULeFeKOUxlcmN8/+KbzeHrWTXXt2zkUZEcKWD7a7G1m1DXL6PPGvhBmdV1VEtkYnoIxHAIHK2e1xqfcqM4+3KDNL2qztQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJx9s9Ij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91EEC4CEF7;
	Fri,  3 Apr 2026 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775205014;
	bh=Cd1EZ76xkf/x2fz9/IYK6lBMjtKYjfEikACFflOtBW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJx9s9Ijnd3WYIlzq+9eC5jyjv5XIWfpQzQ5SvH7iVQcsBHm6h3SN2ad1110jvuWd
	 bMnVTfBPmFp7gUltNJ2jUKy5HVCDcwMaqWPq8u05RCXMBx3rB0BePm65f0lM+i8FTW
	 jrginlok22FrxLXRsBNqv3l2I4Wtmdzr2fJFxtqaBCNz61Zq81BLWhx6ApV8HC9PRD
	 9hL/udhzm/BoqyKQlXBQg8t2syDTeWxK+5ZOpeYMgH9CWxI5UD15xSIXxgsQal2pFJ
	 F8syoL7Ugpx/zV0Snia938z1XZWEeVrbtX0WJIDHIlaD7jGjQL97cmZlprkXWSQsHT
	 WTFku4cedjzRA==
Date: Fri, 3 Apr 2026 09:30:09 +0100
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
Message-ID: <20260403083009.GA11973@horms.kernel.org>
References: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260325104415.104972-2-manivannan.sadhasivam@oss.qualcomm.com>
 <20260327095832.GC111839@horms.kernel.org>
 <as3zucfwr4z2x5pxww6ognmqcujkwnhppulm7jquex6fy6sqn5@qa33h5mxxdz7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as3zucfwr4z2x5pxww6ognmqcujkwnhppulm7jquex6fy6sqn5@qa33h5mxxdz7>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101613-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 93A2A3921FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:40:01PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Mar 27, 2026 at 09:58:32AM +0000, Simon Horman wrote:
> > On Wed, Mar 25, 2026 at 04:14:14PM +0530, Manivannan Sadhasivam wrote:
> > > Current code does no bound checking on the number of servers added per
> > > node. A malicious client can flood NEW_SERVER messages and exhaust memory.
> > > 
> > > Fix this issue by limiting the maximum number of server registrations to
> > > 256 per node. If the NEW_SERVER message is received for an old port, then
> > > don't restrict it as it will get replaced.
> > > 
> > > Note that the limit of 256 is chosen based on the current platform
> > > requirements. If requirement changes in the future, this limit can be
> > > increased.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> > > Reported-by: Yiming Qian <yimingqian591@gmail.com>
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> > 
> > > ---
> > >  net/qrtr/ns.c | 24 ++++++++++++++++++++----
> > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> > > index 3203b2220860..fb4e8a2d370d 100644
> > > --- a/net/qrtr/ns.c
> > > +++ b/net/qrtr/ns.c
> > > @@ -67,8 +67,14 @@ struct qrtr_server {
> > >  struct qrtr_node {
> > >  	unsigned int id;
> > >  	struct xarray servers;
> > > +	u32 server_count;
> > >  };
> > >  
> > > +/* Max server limit is chosen based on the current platform requirements. If the
> > > + * requirement changes in the future, this value can be increased.
> > > + */
> > > +#define QRTR_NS_MAX_SERVERS 256
> > > +
> > >  static struct qrtr_node *node_get(unsigned int node_id)
> > >  {
> > >  	struct qrtr_node *node;
> > > @@ -229,6 +235,17 @@ static struct qrtr_server *server_add(unsigned int service,
> > >  	if (!service || !port)
> > >  		return NULL;
> > >  
> > > +	node = node_get(node_id);
> > > +	if (!node)
> > > +		return NULL;
> > 
> > This is not new behaviour added by patch, but If I understand things
> > correctly, node_get will allocate a new node if one doesn't already exist
> > for the node_id.
> > 
> 
> Yes!
> 
> > I am wondering if any bounds are placed on the number of nodes that can be
> > created. And, if not, is this a point of concern from a memory exhaustion
> > perspective?
> > 
> 
> That's true. I plan to send a followup for that. This series just limits the
> scope in addressing the reported issue.

Thanks, sounds good to me.

For this patch, feel free to add:

Reviewed-by: Simon Horman <horms@kernel.org>

