Return-Path: <linux-arm-msm+bounces-100642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIwXAyiNyWm1zAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 22:35:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEA353FC8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 22:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2ADC30086CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEB627EFE9;
	Sun, 29 Mar 2026 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fh1x0AgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99F133EC;
	Sun, 29 Mar 2026 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774816436; cv=none; b=oHR+QEBQn4RWfYcj6gjPchEI149OL8O3SOdxurK7BKLHg+wuxAeX/Q6qhJk48R/LB1w+IrlqscU4X10v4zzv/c4G1xY/wwvlhMXuT+bVrPR7a/TitlSOSFgqM2dZvK2forX50g+qxXQPl/+YxtBUGlTneYuCjQY7r+Fkc+Bg2gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774816436; c=relaxed/simple;
	bh=PcF2fZnONsHuYXsCn3/zAMIuouW4cMzND8TkC8YmK1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLjnCg1yYtjnFsY53aXKIBmT8i/BJoptiCdhSqz7IKp/7zs1ew34o4xg8bd6w8uRIB+3VPDwlgdMtBOoEvk6mYY8jztMxG2A3zKoxdY8Zjye47+mhkhfG2TAywIUMOvZdqeVorKfPN/UEHKUYqGgnKwjEHFgQxQh8xEpRaTjZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fh1x0AgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A50C116C6;
	Sun, 29 Mar 2026 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774816436;
	bh=PcF2fZnONsHuYXsCn3/zAMIuouW4cMzND8TkC8YmK1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fh1x0AgW5HL1zuXVe96x3l6VDcNbsMNspKz4CD93oOjn+Nkbhg7mfm7Xz6zbGcqrU
	 MFzYzZu+oy7V435iNplGUIBq0P70LQ0orsUKmgHZy7QRYE49dFyNdGorKRT1HRnTiJ
	 Gf/2XHpesh/odEVfOv7ZIHe4CuEie6gUjmoHriYWbsk6pFvpLgiRbXUAhYt+9BeE8H
	 ujluBfWtac1FTzNu+azRV7JjKg2u+Sd4RjPFLS4+/wF81/qZItugRsls95bfdi8A3w
	 8zNmjWsIPJ+2GEb+1LRzkU3Vv/GFeaAvjenhfUGXidjrSeExNSrnT1l8isLbUXF6cU
	 B4ndRn9wWdT7Q==
From: Jakub Kicinski <kuba@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	yimingqian591@gmail.com,
	chris.lew@oss.qualcomm.com,
	mani@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] net: qrtr: ns: Limit the maximum server registration per node
Date: Sun, 29 Mar 2026 13:33:54 -0700
Message-ID: <20260329203354.2815284-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325104415.104972-2-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260325104415.104972-2-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,google.com,redhat.com,vger.kernel.org,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100642-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4FBEA353FC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: qrtr: ns: Limit the maximum server registration per node

This commit introduces a limit of 256 server registrations per node to
prevent malicious clients from exhausting memory by flooding NEW_SERVER
messages.

Cc: stable@vger.kernel.org
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Reported-by: Yiming Qian <yimingqian591@gmail.com>

> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> index 3203b2220860..fb4e8a2d370d 100644
> --- a/net/qrtr/ns.c
> +++ b/net/qrtr/ns.c

[ ... ]

> @@ -229,6 +235,17 @@ static struct qrtr_server *server_add(unsigned int service,
>  	if (!service || !port)
>  		return NULL;
>  
> +	node = node_get(node_id);

Does this per-node limit fully protect against memory exhaustion?

If a remote client spoofs the node ID in the NEW_SERVER message, the
attacker-controlled node_id is passed to server_add(). Because node_get()
unconditionally allocates a new qrtr_node structure when one is not found,
an attacker could continuously send messages with unique node IDs.

Could this result in unbounded node allocations that still exhaust system
memory despite the per-node server limit?

> +	if (!node)
> +		return NULL;
> +
> +	/* Make sure the new servers per port are capped at the maximum value */
> +	old = xa_load(&node->servers, port);
> +	if (!old && node->server_count >= QRTR_NS_MAX_SERVERS) {
> +		pr_err_ratelimited("QRTR client node %u exceeds max server limit!\n", node_id);
> +		return NULL;

While this error message is rate-limited, returning NULL here causes
ctrl_cmd_new_server() to return -EINVAL.

In the main packet loop qrtr_ns_worker(), a negative return value triggers
an un-ratelimited error:

	if (ret < 0)
		pr_err("failed while handling packet from %d:%d",
		       sq.sq_node, sq.sq_port);

Could a flood of excess server registrations trigger this un-ratelimited
message and cause a console logging storm?

> +	}
> +
>  	srv = kzalloc_obj(*srv);
>  	if (!srv)
>  		return NULL;
-- 
pw-bot: cr

