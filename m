Return-Path: <linux-arm-msm+bounces-100246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDy2CbVXxmmMIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:11:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF93423C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDA2630D0BC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C093AB291;
	Fri, 27 Mar 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3Nr0bqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8301C3AA4ED;
	Fri, 27 Mar 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606035; cv=none; b=EGADt46bl9rASS5j/kwepN6mZcDTC/BkqPd2PpooRPk5BwPBdIv3eCIL+0cWXDg+oeJfmlsF7kXR41ArxpuGWfIQxfJxsspRIJQ4yYMpX95ubFPkiB+4axXPx0wA1JhQzo5Mcb7ulNiHquOX/weqyIFFmk4RA2qdK01630rQbe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606035; c=relaxed/simple;
	bh=ovOyy2kcZLYATa+BAEOlArPqj9H9aS1yBsPY1boEDG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8GqOtIGkfm7F2lsVIcQYZ3C8hEWHHD4QlsnRDzuMR8XGEw1Dq1TxpgvsNo4qRtW7AKYDX8v3cEM8A0J28pC0n9uonJ1joaOkb/NAo6z1xUQFWgE94f/XiJh7UZQrSLEg+Vnnkg2WeBBPuuIp1384aY2JORpArgmy/OcvHnzSXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3Nr0bqd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F53BC19423;
	Fri, 27 Mar 2026 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774606035;
	bh=ovOyy2kcZLYATa+BAEOlArPqj9H9aS1yBsPY1boEDG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3Nr0bqduTvE7mhxUZjTtHlGCJYch8XASzFAFOGGVy3CrDohJflSRmAlfQLmdksv5
	 DOyHmb3N1x7mzulEUMRmB9jOMvpDxhpyf856adndIDpZ2Ha+vH1RmXMvDr3jXojZQk
	 5lRR45fBWzum4t/E29qCeEFv7cZg+NmigCNMHzG6s/6GVC+P2dig6yQ/Z+wW0qwf66
	 ygQpEBD/RA0lqmlmAktmKWsiReK7mR1iH5nNoSmlePIExLwL8Rg50bt5AoMRpamcmX
	 Qv52kgSeQpaFjlAeyIoycDX6LbktIaUOeJvNjLmaEyNaQdtWjNst2mGz+enVH/aQFf
	 Dh7GNvxqFCAgA==
Date: Fri, 27 Mar 2026 10:07:09 +0000
From: Simon Horman <horms@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, yimingqian591@gmail.com,
	chris.lew@oss.qualcomm.com, mani@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] net: qrtr: ns: Limit the maximum lookups per socket
Message-ID: <20260327100709.GD111839@horms.kernel.org>
References: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260325104415.104972-3-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325104415.104972-3-manivannan.sadhasivam@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-100246-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,horms.kernel.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDDF93423C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 04:14:15PM +0530, Manivannan Sadhasivam wrote:
> Current code does no bound checking on the number of lookups a client can
> perform per socket. Though the code restricts the lookups to local clients,
> there is still a possibility of a malicious local client sending a flood of
> NEW_LOOKUP messages over the same socket.
> 
> Fix this issue by limiting the maximum number of lookups to 64 per socket.
> Note that, limit of 64 is chosen based on the current platform
> requirements. If requirement changes in the future, this limit can be
> increased.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  net/qrtr/ns.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> index fb4e8a2d370d..707fde809939 100644
> --- a/net/qrtr/ns.c
> +++ b/net/qrtr/ns.c
> @@ -70,10 +70,11 @@ struct qrtr_node {
>  	u32 server_count;
>  };
>  
> -/* Max server limit is chosen based on the current platform requirements. If the
> - * requirement changes in the future, this value can be increased.
> +/* Max server, lookup limits are chosen based on the current platform requirements.
> + * If the requirement changes in the future, these values can be increased.
>   */
>  #define QRTR_NS_MAX_SERVERS 256
> +#define QRTR_NS_MAX_LOOKUPS 64
>  
>  static struct qrtr_node *node_get(unsigned int node_id)
>  {
> @@ -545,11 +546,24 @@ static int ctrl_cmd_new_lookup(struct sockaddr_qrtr *from,
>  	struct qrtr_node *node;
>  	unsigned long node_idx;
>  	unsigned long srv_idx;
> +	u8 count = 0;
>  
>  	/* Accept only local observers */
>  	if (from->sq_node != qrtr_ns.local_node)
>  		return -EINVAL;
>  
> +	/* Make sure the client performs only maximum allowed lookups */
> +	list_for_each_entry(lookup, &qrtr_ns.lookups, li) {
> +		if (lookup->sq.sq_node == from->sq_node &&
> +		    lookup->sq.sq_port == from->sq_port)
> +			count++;

This feels like it could get quite expensive.
If many lookups are added, it feels like it may be O(n^2).

Is this something that has been considered?

> +	}
> +
> +	if (count >= QRTR_NS_MAX_LOOKUPS) {
> +		pr_err_ratelimited("QRTR client node exceeds max lookup limit!\n");
> +		return -ENOSPC;
> +	}
> +
>  	lookup = kzalloc_obj(*lookup);
>  	if (!lookup)
>  		return -ENOMEM;
> -- 
> 2.51.0
> 

