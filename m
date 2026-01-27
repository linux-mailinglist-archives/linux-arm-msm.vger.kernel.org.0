Return-Path: <linux-arm-msm+bounces-90655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB97E0hleGnTpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:12:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E575F90A16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C08773011BC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D9332C92D;
	Tue, 27 Jan 2026 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TZ8orioz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AAD1D9346;
	Tue, 27 Jan 2026 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769497899; cv=none; b=Te2cTMK0+rYmgP6dT/We9JI+fDwfqp7R/575Ent3z+/0BM1ppY7IQICxjQXqx8gZNqZlI0KHdqiuRbNSYvdL6WM0WmTDXC761ei9DU/mhYFvBqQXKoXQtLIXORvwCp0LjtZDdHp2Pbs0xkyywMDKbvj64imKXE+rVGE7L88pv2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769497899; c=relaxed/simple;
	bh=0Gfr1rwFWCkLVfSLU7RQ4F2QGghqpp1AJelz8j+FtMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv6g2IBrQcCXdIaMOmJld7NFH/MQIX1noZkFbXBr93cTtoU1qH4BWB1lnp69HNgDJyJN+SToEceGlowmhONoW79QUKtmQZTNCumtw79lDMWDlq+yDJYcVADPr7C5OxLfPz9L1PgR3qPAorhwLJbDoXLLM1OIUd/Qz7SRHfnQFW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TZ8orioz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6EDC116C6;
	Tue, 27 Jan 2026 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769497898;
	bh=0Gfr1rwFWCkLVfSLU7RQ4F2QGghqpp1AJelz8j+FtMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZ8orioz4j2SFqJXJuM8/QzvqywsFCSqwUN33XoGzeACMUnZRDpYARrVTzGBhKGzQ
	 Q9LGIOXcxcZEfrpcFwY5xLQVvMPVXkViB69nB94alr+rjG6rxQsf3rzqlL0fwzBK7l
	 1EAf5oZl5bqMmWf+RfonCUAMkG66fkcUhI/c4qvM=
Date: Tue, 27 Jan 2026 08:11:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] misc: fastrpc: possible double-free of
 cctx->remote_heap
Message-ID: <2026012748-unblock-vacation-70b8@gregkh>
References: <20260117140959.879035-1-xjdeng@buaa.edu.cn>
 <2026012641-snazzy-upstate-a815@gregkh>
 <CAK+ZN9r57ErbhCxX6hR8_G1G+eTh+UajdNftvKkUnyefYm3BhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK+ZN9r57ErbhCxX6hR8_G1G+eTh+UajdNftvKkUnyefYm3BhA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90655-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: E575F90A16
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:19:50AM +0800, Xingjing Deng wrote:
> This issue was also identified through static program analysis and
> subsequently verified via manual inspection. I believe I have
> uncovered a potential risk of abnormal execution here, hence I’m
> reporting this problem.

Again, you need to document this fact, please read the rules for
submitting patches that are found by tools.  And say you have not tested
this, because that means there is a much lower chance that the change is
correct.

thanks,

greg k-h

