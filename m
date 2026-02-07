Return-Path: <linux-arm-msm+bounces-92102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tkD2BsGkhmlrPgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 03:34:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65329104AB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 03:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFB0A3025D01
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 02:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB5013D51E;
	Sat,  7 Feb 2026 02:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r082eW7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F090C2745C;
	Sat,  7 Feb 2026 02:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770431678; cv=none; b=ZNyCJ+E97GlknYBUm74kqXyLBmK3YxOmOuxVw4ajvIeGw72oCsP2dny9HFbk9pn9G/dLkpxuvdwCXx7oFFFh19D7tNQOWtHxm+vtfAxBnvQOeiY0x+NBR3lmmYE2ctxs0BBAe/RR+zWt13KRJ7yeqZgTGcV6uQP72r/AzQgIBjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770431678; c=relaxed/simple;
	bh=EgtPV/kyUetTXN4izoQxcSu+SLV26kRPPbjQ58oYLaY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MA05I6SEHAdisXByF3se56QRROD26ExJiQmbhTOe3AUWd8R+VKyE308lwxfRcnHryj5h4V4cjpZoapO5vdQa1DnoYuIwQTVX+8mGsSi00RRtcxsuh0yxp/+75vMO7Oz4ixfLx0t/wNYA1b0IX+RRXk6O5heXmb+h0yRDBPIPkrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r082eW7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E6CC19422;
	Sat,  7 Feb 2026 02:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770431677;
	bh=EgtPV/kyUetTXN4izoQxcSu+SLV26kRPPbjQ58oYLaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r082eW7Cn/xahB+xezQNiqzNYi6FmH6CqDgQAimoo5JB1acXMoYnKAkSQ8s2LKNPZ
	 WgTQrUOOaRS8WPTTcuzZKK8Sxv7DX1hsleqmlzVQ3Ew9SY8j8PiKaQ1Z3gt4QPnlq2
	 Bdc4E7pJkRmgW4r0eZuvD9Z+W2Pbk4RPmGyZ/kg5NfwhQUYvXY2fiiQ90rJpM0gbca
	 JWTXF5B7d3ifXkQd9ilV+Xh72ZvGVYXUTie7G2wdjxevvrtpSYd9PBamQ9dPnP4QeB
	 DEOHyoM/G24fUl7b7+4wlwbff/VR/4dD8BJGobSZXqVqSKaUOMoGS70Dt3rlZOrBn+
	 znGiVBN9hNgNw==
Date: Fri, 6 Feb 2026 18:34:36 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jijie Shao <shaojijie@huawei.com>
Cc: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, Manivannan
 Sadhasivam <mani@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bjorn.andersson@oss.qualcomm.com>, <chris.lew@oss.qualcomm.com>, Deepak
 Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] net: qrtr: Expand control port access to root
Message-ID: <20260206183436.3291c742@kernel.org>
In-Reply-To: <7f32eb7f-3402-461c-a932-66ba36399fc8@huawei.com>
References: <20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com>
	<7f32eb7f-3402-461c-a932-66ba36399fc8@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92102-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3.ai:url]
X-Rspamd-Queue-Id: 65329104AB0
X-Rspamd-Action: no action

On Fri, 6 Feb 2026 11:59:44 +0800 Jijie Shao wrote:
> Sorry, I noticed that this patch has several check failures.
> You may want to pay attention to this:
> https://patchwork.kernel.org/project/netdevbpf/patch/20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com/
> 
> 1.Single patches do not need cover letters; Target tree name not specified in the subject
> 2.WARNING: line length of 83 exceeds 80 columns
> 3.AI review found issues

This is not public CI, the maintainers will point out the issues
in the code if the failing checks are relevant.

If you'd like to help with code reviews please focus on that, 
reviewing the code. We do not need help with trivial process matters.

