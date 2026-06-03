Return-Path: <linux-arm-msm+bounces-111048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QNCrMUuSIGrg5AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 22:44:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B45263B310
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 22:44:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HmoxdPPK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111048-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111048-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2803300EABC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 20:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21530403146;
	Wed,  3 Jun 2026 20:43:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32C402B92;
	Wed,  3 Jun 2026 20:43:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519393; cv=none; b=mUGw9ZFPMmZ/Kn1OFgqNXjcoKla+ovgq1/CyrkUmuBJMOkQkUhN/S47qTxxZgy1dClNfTNryTKOXnAo772Z/4HFR3mVlfKfHV+COp6jQ7wAA/LcercpAQgrxcgCOzKCIhZvbYGh1D1W1vJrKCbE13VtSVsJ8YUUpOc+xVPwXai0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519393; c=relaxed/simple;
	bh=Ln3VwH9jZTalQzCV8EsDvrH3SjB0I48DwYVoGUc9akY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIK41hEG+jsl9DFsEDfN50jkJ35PpFFsbutvL5e0cJ75zUxY/s58Ecilkmwk2rOYBLq0da+r9U5xtGvndjtyw6zEdh3LHaLcRk15BQLzhP5Eb/XPM1LHSbXy+onJEbISzqcsNurxojTb4zU/UV29f1vXEnzg+gAwZ81rYWvUILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmoxdPPK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0B61F00893;
	Wed,  3 Jun 2026 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780519391;
	bh=UHEnKo0sJMWL3eFxkaTo2A19KZ4igsoSLZLGEVthVrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HmoxdPPKn0BKTWDaXW4Hr1AVaL4PdbG+EhVGUpdcqeGswZ713rb7vybCKqcNAcyOS
	 NXDFcLvael/QoEG2l3Ztv9W7gUz05ZHDEZIpXx2Rl63m616LUTmT1/ei2upsudnRqk
	 rLAO5FSfL0e2apKltXOQK3cP9uo8Uy9e381h1uNUQCr1T1whp6X1CvsBb8fngKFT25
	 Bf3EbH4KRBjxY7XGqFdU/xgcUaexw+jdgce3VVRcTdG4i0iM8Bj7IUzWPbRmBSK1RS
	 IVq7aTMBjdA3Fs6QOIsJELhqckI0cmGEDjoIAK8PAzJKFIM7Hi+YOszkSHTj6xHA/g
	 I7n9rOGjGkXEg==
From: Simon Horman <horms@kernel.org>
To: w15303746062@163.com
Cc: 'Simon Horman' <horms@kernel.org>,
	mani@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	luca@lucaweiss.eu,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	25181214217@stu.xidian.edu.cn
Subject: Re: [PATCH] net: qrtr: fix refcount saturation and potential UAF in qrtr_port_remove
Date: Wed,  3 Jun 2026 21:40:39 +0100
Message-ID: <20260603204037.3852840-3-horms@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530082243.1123402-1-w15303746062@163.com>
References: <20260530082243.1123402-1-w15303746062@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111048-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:w15303746062@163.com,m:horms@kernel.org,m:mani@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:luca@lucaweiss.eu,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:25181214217@stu.xidian.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B45263B310

From: 'Simon Horman' <horms@kernel.org>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev
---
Subject: net: qrtr: fix refcount saturation and potential UAF in qrtr_port_remove

This patch defers the socket reference count decrement in
qrtr_port_remove() until after xa_erase() and synchronize_rcu() to
close a race with concurrent RCU readers, and also switches from
__sock_put() to sock_put().

> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index 7cec6a7859b0..9ddc8657f7db 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -707,13 +707,13 @@ static void qrtr_port_remove(struct qrtr_sock *ipc)
>  	if (port == QRTR_PORT_CTRL)
>  		port = 0;
>  
> -	__sock_put(&ipc->sk);
> -
>  	xa_erase(&qrtr_ports, port);
>  
>  	/* Ensure that if qrtr_port_lookup() did enter the RCU read section we
>  	 * wait for it to up increment the refcount */
>  	synchronize_rcu();
> +
> +	sock_put(&ipc->sk);
>  }

[Low]
Is the Fixes: tag pointing at the right commit?

> Fixes: a365023a76f2 ("net: qrtr: combine nameservice into main module")

Looking at a365023a76f2, that commit renames qrtr.c to af_qrtr.c and
consolidates the nameservice into the main module; it does not touch the
__sock_put()/xa_erase()/synchronize_rcu() sequence in qrtr_port_remove().

A history search with git log -S '__sock_put(&ipc->sk)' on net/qrtr/
shows this pattern was first introduced by:

  bdabad3e363d ("net: Add Qualcomm IPC router")

Should the Fixes: tag reference bdabad3e363d so stable picks up the fix
on every release in the bdabad3e363d..a365023a76f2 range?

[Low]
Is the rationale given for switching __sock_put() to sock_put() accurate?

The commit message states:

  Furthermore, replace __sock_put() with sock_put() to ensure that the
  socket memory is safely freed if this happens to be the last
  reference, preventing memory leaks.

Can the xarray reference legitimately be the last one at this point?

The two callers of qrtr_port_remove() both keep additional references
alive across the call.

In qrtr_release(), sk is still dereferenced after qrtr_port_remove()
returns:

	if (!sock_flag(sk, SOCK_ZAPPED))
		qrtr_port_remove(ipc);

	skb_queue_purge(&sk->sk_receive_queue);

	release_sock(sk);
	sock_put(sk);

In __qrtr_bind(), the rebind path calls qrtr_port_assign() (which does
sock_hold() for the new port) before qrtr_port_remove():

	rc = qrtr_port_assign(ipc, &port);
	if (rc)
		return rc;

	/* unbind previous, if any */
	if (!zapped)
		qrtr_port_remove(ipc);

If sock_put() ever did free the socket here, qrtr_release()'s subsequent
skb_queue_purge(&sk->sk_receive_queue) and release_sock(sk) would be a
use-after-free, which would indicate a separate refcount-imbalance bug
rather than a memory leak.

Could the commit message be reworded so it doesn't conflate the
__sock_put() to sock_put() change with a memory leak fix?

Simon says: I would go a bit further here. Based on the above
            I think the __sock_put() -> sock_put() should be dropped.

