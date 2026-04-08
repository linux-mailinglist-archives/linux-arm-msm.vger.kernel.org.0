Return-Path: <linux-arm-msm+bounces-102339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GTBPIQSB1mnDFwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 18:23:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7EC3BEC93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 18:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A47DF300F1A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 16:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735B134AB06;
	Wed,  8 Apr 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2Wrpp3B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4915127EFE9;
	Wed,  8 Apr 2026 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775665409; cv=none; b=BO6guYLZGmw9j0eTyOTUd0c92tpyUDbcYgEFmPnlUKEUMk6wKcuRqFvpzrnPZaEgJYnaZ5BhXhFdbC6CaVuBeroP5ji4PxmYEG0q6fdmfLTeihiykh2fk45OoMAa5k1r9tyw43ACmxa1Omp+iBEjnLGfeaIgt5HUeMYVGcGa+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775665409; c=relaxed/simple;
	bh=d7s3hrpf1KIsN/M7lWyW01HXZUuo6L5BdYFQrNspxtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=So4UFhWxT8v341M7bf4+HGyVfFQGtf9mYUj/tkPH79EbcJ6yCHAXLupAB3Kh4vtoCNTlsXfo/HRK7OxO1mN3FvuyuAIE1XdfoYyFMxaltopu/kYEVjBt7VN6Hf03KD+Blj4iTCGl57CnTEtsz/i9zBk5mmeHsg48x88g4qnhbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2Wrpp3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FDCC19421;
	Wed,  8 Apr 2026 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775665408;
	bh=d7s3hrpf1KIsN/M7lWyW01HXZUuo6L5BdYFQrNspxtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2Wrpp3BA3tWZ7wm6j/wz7KbPt/s8D8jiMocv1RxSGbKbvlwANn6Tkepqwu2ZC3P9
	 SRCWyydWLJjw9J0O5TyhZIgnlKtva49GLD57dYLGjGL3osRiDcPx3g0tHmg/VvyjaO
	 Xv07sl/1ABb7Ix48yT2cunHUl9UJ9NVPHBmPXwVpGBxDHeg2lO1epgrhfRNMDPIOyw
	 AOt2CxRdDqfmNfPIEdJ8rLwDl7Gfmxi0PplbVbgUFGQ4moZRgFYA1q4V7IHJOS1p6/
	 GK1+tb/2sP66cl3gcb/uPuZ77yxvMY3aBix2RmlcundvWMbzRo5LgnKmXs5Kis4Aoe
	 blAJW6ZBqSL6g==
Date: Wed, 8 Apr 2026 21:53:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 5/5] net: qrtr: ns: Fix use-after-free in driver
 remove()
Message-ID: <ygxq427xqsewzqz5ub62v4v2r4mt2rclilwfg3apynemew3m4k@oefumgql46nl>
References: <20260403-qrtr-fix-v2-0-f88a14859c63@oss.qualcomm.com>
 <20260403-qrtr-fix-v2-5-f88a14859c63@oss.qualcomm.com>
 <0ab00cb4-8335-472d-b43e-3bbd99b41480@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ab00cb4-8335-472d-b43e-3bbd99b41480@redhat.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102339-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE7EC3BEC93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 05:33:55PM +0200, Paolo Abeni wrote:
> On 4/3/26 6:06 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > In the remove callback, if a packet arrives after destroy_workqueue() is
> > called, but before sock_release(), the qrtr_ns_data_ready() callback will
> > try to queue the work, causing use-after-free issue.
> > 
> > Fix this issue by saving the default 'sk_data_ready' callback during
> > qrtr_ns_init() and use it to replace the qrtr_ns_data_ready() callback at
> > the start of remove(). This ensures that even if a packet arrives after
> > destroy_workqueue(), the work struct will not be dereferenced.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  net/qrtr/ns.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> > index dfb5dad9473c..c62d79e03d64 100644
> > --- a/net/qrtr/ns.c
> > +++ b/net/qrtr/ns.c
> > @@ -25,6 +25,7 @@ static struct {
> >  	u32 lookup_count;
> >  	struct workqueue_struct *workqueue;
> >  	struct work_struct work;
> > +	void (*saved_data_ready)(struct sock *sk);
> >  	int local_node;
> >  } qrtr_ns;
> >  
> > @@ -754,6 +755,7 @@ int qrtr_ns_init(void)
> >  		goto err_sock;
> >  	}
> >  
> > +	qrtr_ns.saved_data_ready = qrtr_ns.sock->sk->sk_data_ready;
> >  	qrtr_ns.sock->sk->sk_data_ready = qrtr_ns_data_ready;
> >  
> >  	sq.sq_port = QRTR_PORT_CTRL;
> > @@ -803,6 +805,10 @@ EXPORT_SYMBOL_GPL(qrtr_ns_init);
> >  
> >  void qrtr_ns_remove(void)
> >  {
> > +	write_lock_bh(&qrtr_ns.sock->sk->sk_callback_lock);
> > +	qrtr_ns.sock->sk->sk_data_ready = qrtr_ns.saved_data_ready;
> > +	write_unlock_bh(&qrtr_ns.sock->sk->sk_callback_lock);
> 
> Sashiko says:
> 
> ---
> Does this lock adequately protect against concurrent callback execution?
> In the network receive path, __sock_queue_rcv_skb() typically evaluates
> !sock_flag(sk, SOCK_DEAD) and invokes sk->sk_data_ready() locklessly,
> without acquiring sk_callback_lock or being in an RCU read-side
> critical section.
> If a thread processing a packet fetches the qrtr_ns_data_ready pointer
> and is preempted, could it resume and execute the callback after
> qrtr_ns_remove() has already finished destroying the workqueue?
> ---
> 

This is a legitimate concern. I believe adding synchronize_net() before
destroy_workqueue() will ensure that all the RX packets are flushed before
destroying the workqueue.

> There are more remarks from sashiko:
> 
> https://sashiko.dev/#/patchset/20260403-qrtr-fix-v2-0-f88a14859c63%40oss.qualcomm.com
> 
> AFAICS they are pre-existing issues or false positive, but please have a
> look.
> 

There are a couple of worth fixing issues mentioned there in the error path that
I'll incorporate in the next revision. But for the issues not related to this
series, I will defer them to follow up series.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

