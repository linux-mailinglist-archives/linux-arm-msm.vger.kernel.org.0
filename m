Return-Path: <linux-arm-msm+bounces-111886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8pYKBsXCJmqakAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:25:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 524DA6569C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:25:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=R+adxrp7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111886-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111886-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F143306885D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F1830675D;
	Mon,  8 Jun 2026 13:15:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CDA262D0B;
	Mon,  8 Jun 2026 13:15:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924555; cv=none; b=a6aaGkh1ASfSqXiaPDzXp5kZ8tLs/P8y1M47IX7SVrzNLfvHVX9HWF5fiFnQlksJD2EkOQL5IvcDE17joX/TwJlufcqhSSO+Mp1wJ+azi7QrZ8rO+5X4EFEPUD7t854o1U7hj92nKhUlZTMm/a/LLiIoBUD11kUF8rVRXTYijts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924555; c=relaxed/simple;
	bh=0PmjobEK5RIy8U9k2P1HUPuw8Q9vZSEr46XySqeZcsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMWJf5XAxUslnd+SXlEuhZD+gmFX27ZwNnYBj/2gLPZ5FoGMhf0BZQsO3/kZRVcSgAnb0f0mBXNhvdWm/zVEZmv9Cc9nkge3BlRO20/7Az3UL+IhodWoNs9k73PahEi/HstV+g50P/o95yGqua3gDIXqiQ3NK51kuMvFUH1xDok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+adxrp7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6311F00893;
	Mon,  8 Jun 2026 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780924553;
	bh=K2CO8R+uP6TgA1CrFSKqCjPkfGEqDgtnNBedtqJ03V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R+adxrp7ykSBobxhTPqVANynZ4d5InmXOdrra8k8dYkrOFJd4eL5VCV0CnCF84vEz
	 OxIfr5Qz/spXinfFzTqGh+zBcGVxjhBQKxbEGQi5cOt87xtXkX2xxcaFgsz5ISUl11
	 LIY9Wh05pwzrl2ZXTXuov+DSufla3j+wQks4b4vaEQZAJc1wtGu5/blZpuCo/OvM8S
	 5pps1FNpWXV/fIuW42YWS7C/2eyw0eBWbXoMegpsGHyoJVLA+xjXDL1nP5rtdcAojA
	 wwpIpgBENh+Nk17P/KQ+9zpzZE3AgzRDiPXZAex1KTxnMtCzRqoQ3+dqE7IqjZgla8
	 HWpCrImkfy+eQ==
Date: Mon, 8 Jun 2026 14:15:49 +0100
From: Simon Horman <horms@kernel.org>
To: w15303746062@163.com
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>
Subject: Re: [PATCH v2] net: qrtr: fix refcount saturation and potential UAF
 in qrtr_port_remove
Message-ID: <20260608131549.GI3920875@horms.kernel.org>
References: <20260604064801.1180388-1-w15303746062@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604064801.1180388-1-w15303746062@163.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:w15303746062@163.com,m:mani@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:luca@lucaweiss.eu,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:25181214217@stu.xidian.edu.cn,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111886-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xidian.edu.cn:email,vger.kernel.org:from_smtp,horms.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 524DA6569C6

On Thu, Jun 04, 2026 at 02:48:01PM +0800, w15303746062@163.com wrote:
> From: Mingyu Wang <25181214217@stu.xidian.edu.cn>
> 
> In qrtr_port_remove(), the socket reference count is decremented via
> __sock_put() before the port is removed from the qrtr_ports XArray and
> before the RCU grace period elapses.
> 
> This breaks the fundamental RCU update paradigm. It exposes a race
> window where a concurrent RCU reader (such as qrtr_reset_ports() or
> qrtr_port_lookup()) can obtain a pointer to the socket from the XArray,
> and attempt to call sock_hold() on a socket whose reference count has
> already dropped to zero.
> 
> This exact race condition was hit during syzkaller fuzzing, leading to
> the following refcount saturation warning and a potential Use-After-Free:
> 
>   refcount_t: saturated; leaking memory.
>   WARNING: CPU: 3 PID: 1273 at lib/refcount.c:22 refcount_warn_saturate+0xae/0x1d0
>   Modules linked in: qrtr(+) bochs drm_shmem_helper ...
>   Call Trace:
>    <TASK>
>    qrtr_reset_ports net/qrtr/af_qrtr.c:768 [inline] [qrtr]
>    __qrtr_bind.isra.0+0x48b/0x570 net/qrtr/af_qrtr.c:805 [qrtr]
>    qrtr_bind+0x17d/0x210 net/qrtr/af_qrtr.c:901 [qrtr]
>    kernel_bind+0xe4/0x120 net/socket.c:3592
>    qrtr_ns_init+0x1a6/0x380 net/qrtr/ns.c:715 [qrtr]
>    qrtr_proto_init+0x3b/0xff0 net/qrtr/af_qrtr.c:169 [qrtr]
>    do_one_initcall+0xf5/0x5e0 init/main.c:1283
>    ...
>    </TASK>
> 
> Fix this by deferring the reference count decrement until after the
> xa_erase() and the synchronize_rcu() complete.
> 
> (Note: The v1 of this patch incorrectly replaced __sock_put() with
> sock_put(). As Simon Horman pointed out, the callers of qrtr_port_remove()
> still hold a reference to the socket, so freeing the socket memory here
> would lead to a subsequent UAF in the caller. Thus, the __sock_put() is
> kept, but only repositioned to close the RCU race.)
> 
> Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
> Signed-off-by: Mingyu Wang <25181214217@stu.xidian.edu.cn>
> ---
> v1: https://lore.kernel.org/netdev/20260530082243.1123402-1-w15303746062@163.com/
> 
> Changes in v2:
> - Reverted the change from __sock_put() to sock_put() to avoid UAF
>   in callers like qrtr_release(), as suggested by Simon Horman.
> - Removed misleading "memory leak" wording from commit message.
> - Corrected the Fixes tag to point to the initial commit introducing
>   the race (bdabad3e363d).

Thanks for the updates.

Reviewed-by: Simon Horman <horms@kernel.org>


