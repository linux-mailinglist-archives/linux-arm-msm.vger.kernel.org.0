Return-Path: <linux-arm-msm+bounces-100643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKtiB2mNyWm1zAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 22:36:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71874353FEE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 22:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D5173024150
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E489C388E7B;
	Sun, 29 Mar 2026 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASRRQiFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1952234964;
	Sun, 29 Mar 2026 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774816438; cv=none; b=BRdFpA3yvQzdMyJnNRI6TbBpqwdSLQD0W0hc23NOLvBWnCm23I1BbJs2knPs9iZHvcNXtkoI2p6OIMqiGQLM8r6hKkiUZQUO07gyVQVWDr1araTLeSD8m0IMXjF1LbR96Yw+d3lRIRejYwoCHR8w9IzsBxgt/jWnTCCsdnnT2rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774816438; c=relaxed/simple;
	bh=Ji9NUyyxlso0qYZ5Tet7Lm8AxeCV2zV9DEAtdXjjF9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BY8Az7HNcm77Jz7cP6IIe2W63v3BwQA0xi/6N/ugIwHcx6ocyXnNGIUht1G1/sD9mSe6h827evo4SDQL57nSqibYHQ5sDqwSVjFU1JXwuItE+WytLUQ94ZnstI/klaSQ+F9dHUDAU1tRi1i/JSvzXdt1CPjay7gbzS9pPu8IN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASRRQiFP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25EFC116C6;
	Sun, 29 Mar 2026 20:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774816438;
	bh=Ji9NUyyxlso0qYZ5Tet7Lm8AxeCV2zV9DEAtdXjjF9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ASRRQiFP3sBgJCiVLF71iGudyd/vOErpVmoUFNRFrDIPf+KuzchlzwK2/rI5wzpcY
	 fjDhX02P7ZKpvxQwOIsgJhQgem6KiBKzca++dvlHmn27hDo1Kn1WR5Ahzz/qUts4LW
	 m0P2oSYBGzLK+PbOkjWPMD1bkGheow6a6w636vmqRuI5ncd3/XudTr1VJfQU9NO1JT
	 3jUPUr6CTEB8k4vpgsljTNVUXDFVb6SXlt24HegiRE1VuUdL9rCJ+UAZyz+A5zVQCY
	 WfWuNeufshbubOBru7Nw1OQ9YGg53UznxLowxpnbc3Wvviwz0FuYq8lyoGEZ48knGP
	 nmEzxx8MftndA==
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
Subject: Re: [PATCH 2/2] net: qrtr: ns: Limit the maximum lookups per socket
Date: Sun, 29 Mar 2026 13:33:56 -0700
Message-ID: <20260329203356.2815315-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325104415.104972-3-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260325104415.104972-3-manivannan.sadhasivam@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100643-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 71874353FEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: qrtr: ns: Limit the maximum lookups per socket

This commit limits the maximum number of lookups to 64 per socket to prevent
a malicious local client from sending a flood of NEW_LOOKUP messages over the
same socket.

> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> index fb4e8a2d370d..707fde809939 100644
> --- a/net/qrtr/ns.c
> +++ b/net/qrtr/ns.c

[ ... ]

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
> +	}

Does this O(N) traversal of the global qrtr_ns.lookups list create a CPU
exhaustion issue?

If a local attacker opens many sockets and registers the maximum 64 lookups
on each, the global list could grow to tens of thousands of items.

If the attacker then floods the socket with NEW_LOOKUP packets, the
single-threaded qrtr_ns.workqueue worker would be forced to traverse all
elements for every packet, potentially blocking all legitimate QRTR namespace
control traffic.

> +
> +	if (count >= QRTR_NS_MAX_LOOKUPS) {
> +		pr_err_ratelimited("QRTR client node exceeds max lookup limit!\n");
> +		return -ENOSPC;

Does returning -ENOSPC here defeat the ratelimiting?

If the caller qrtr_ns_worker() unconditionally checks for a negative return
value and executes an unratelimited error print, a malicious local client
could still cause a syslog flood by sending continuous NEW_LOOKUP packets
after hitting the limit.

Should this return 0 instead to avoid the unratelimited print in the caller?

> +	}
> +
>  	lookup = kzalloc_obj(*lookup);
>  	if (!lookup)
>  		return -ENOMEM;

This isn't a regression introduced by this patch, but does qrtr_ns_remove()
contain a use-after-free during module unload?

The teardown sequence appears to be:
1. cancel_work_sync()
2. destroy_workqueue(qrtr_ns.workqueue)
3. sock_release(qrtr_ns.sock)

If a packet arrives between destroy_workqueue() and sock_release(), the
socket's receive path triggers qrtr_ns_data_ready(). This callback calls
queue_work(qrtr_ns.workqueue, ...), which dereferences the already-freed
workqueue pointer.

Should the socket be shut down or the callback disabled before destroying
the workqueue?

