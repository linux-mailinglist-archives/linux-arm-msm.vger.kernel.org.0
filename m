Return-Path: <linux-arm-msm+bounces-100244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGlyLp9WxmmMIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:06:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC8342276
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9C4830F7DF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0197F3DCD86;
	Fri, 27 Mar 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1Xv15HH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4C3A640A;
	Fri, 27 Mar 2026 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605517; cv=none; b=JxsCU3Xq/kFwKzu6zMzLv7VxXujKtkhW6S98msIs+9AH0vGPDduAVK+vvjtqohUn6HW35l/Z5+7wXfZU8CxoqD/LCsEBtfXz6pk57mrZCgdbBbvRpeiWj1G6a81M+E8pqj3s0Wq6pqFBQdX3iJm0EmJt2/mBI0RFQz5B1gfQRWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605517; c=relaxed/simple;
	bh=AM7rnISf7JfBForn0qmjVQiKgfYkEahF8MtcviElcvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PawQqFoSj3wyY09QKqZQJ0kSkOuTfiykADmRujLzPoNdU0G0awzg89pEp176memDSiIk2eS2JAx4M4YG4u9CnvaanmBOQTtxRSeSFEnkJDxOs8kT/DDungecRQFJ7L5XQtamXwyy4yp9MMm/XwIL5n6ELCXCAW2k0nSbX6Vc5pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1Xv15HH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2136C19423;
	Fri, 27 Mar 2026 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774605517;
	bh=AM7rnISf7JfBForn0qmjVQiKgfYkEahF8MtcviElcvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1Xv15HH7yLF6fAOMtRICCySYjBqasNemIAF+Pim2aYv0NGnvuEvkMzhGts+MFvdX
	 /8ORLVNvMBjnGj1hxMT9OmC7qFm10ih+a3CAMgU2GG4025yVzMQONF8xwg7xbxDIby
	 p51akux4xygWk9fX8YyUmhvGz6rhAljIeRTlKtMqE+PTVI7U39pIGm+Q/+UlvDRFS0
	 5mGf9AIJCT454nvwqkJIsFn7v3dpcpeiuSypyxsNgHYLsXXslfd4msHH8/xeW2w9jZ
	 1jKJNDj0tRhfbCmIMqrRSx+2hXs9hQL7W4gB6OgDxTaThgA2sZYRZa68Wak0zZyJZJ
	 UaqrsNJaQf0xg==
Date: Fri, 27 Mar 2026 09:58:32 +0000
From: Simon Horman <horms@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, yimingqian591@gmail.com,
	chris.lew@oss.qualcomm.com, mani@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] net: qrtr: ns: Limit the maximum server registration
 per node
Message-ID: <20260327095832.GC111839@horms.kernel.org>
References: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260325104415.104972-2-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325104415.104972-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-100244-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 59BC8342276
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 04:14:14PM +0530, Manivannan Sadhasivam wrote:
> Current code does no bound checking on the number of servers added per
> node. A malicious client can flood NEW_SERVER messages and exhaust memory.
> 
> Fix this issue by limiting the maximum number of server registrations to
> 256 per node. If the NEW_SERVER message is received for an old port, then
> don't restrict it as it will get replaced.
> 
> Note that the limit of 256 is chosen based on the current platform
> requirements. If requirement changes in the future, this limit can be
> increased.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> Reported-by: Yiming Qian <yimingqian591@gmail.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  net/qrtr/ns.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> index 3203b2220860..fb4e8a2d370d 100644
> --- a/net/qrtr/ns.c
> +++ b/net/qrtr/ns.c
> @@ -67,8 +67,14 @@ struct qrtr_server {
>  struct qrtr_node {
>  	unsigned int id;
>  	struct xarray servers;
> +	u32 server_count;
>  };
>  
> +/* Max server limit is chosen based on the current platform requirements. If the
> + * requirement changes in the future, this value can be increased.
> + */
> +#define QRTR_NS_MAX_SERVERS 256
> +
>  static struct qrtr_node *node_get(unsigned int node_id)
>  {
>  	struct qrtr_node *node;
> @@ -229,6 +235,17 @@ static struct qrtr_server *server_add(unsigned int service,
>  	if (!service || !port)
>  		return NULL;
>  
> +	node = node_get(node_id);
> +	if (!node)
> +		return NULL;

This is not new behaviour added by patch, but If I understand things
correctly, node_get will allocate a new node if one doesn't already exist
for the node_id.

I am wondering if any bounds are placed on the number of nodes that can be
created. And, if not, is this a point of concern from a memory exhaustion
perspective?

...

