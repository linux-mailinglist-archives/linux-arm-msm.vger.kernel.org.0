Return-Path: <linux-arm-msm+bounces-90901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCBjNj6neWl0yQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 07:05:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E69D50D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 07:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C60A9300E14D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 06:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCDD32ED44;
	Wed, 28 Jan 2026 06:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R2X4WQkU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B25156236;
	Wed, 28 Jan 2026 06:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580347; cv=none; b=lOwEZGmAfv+KJv+PimjfiMXSm+SR3x3p3LUXJOcxaVL7dj3eZkyGUy/8FEaN3x0/SNfot81Gav94ob+XFqeoqS/tIS8Q3JQY7gIrTU7QA8HrkYRjSnTak/aRzdFtyioe5YNuZbzW+nsfRXRxcBZQxMOYfF1C7hMj6GQEFXgtTkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580347; c=relaxed/simple;
	bh=sFWU3dlGxLQ4/g8lu15o4SeGT+7vUt8Mhx2ZfHi0KdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAqDRplHZIiqA5tL9FJ/iSpbCgAG+PXADzMMwCPtjCEOgqdIeIMfd7QQC6J17e+fEBi8uzH7oQvKHy0IT0dk9jI8JGtdK8zg7QG7bwZbwJFv1lE5b4968BRJ4mBjJbRWInWXGsu0BIIABevQo/22lB5n9gWo+KOUp4Jg+g2ZTtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R2X4WQkU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93F7C4CEF1;
	Wed, 28 Jan 2026 06:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769580347;
	bh=sFWU3dlGxLQ4/g8lu15o4SeGT+7vUt8Mhx2ZfHi0KdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2X4WQkUr9Ucc9bTF2+LGN5TdhPHrdc6E3H8s1uloqSXPcp8uxWcc8Adbj2XzopvW
	 TLj/tQp215efBjV0dJ9jalKTcVcszre/xzoIR8juhFunzSVhpfIlxaszuVAXNfzNSR
	 DRlW3MOS8QvX9KMtEuMZULpR+IaFCZQeWCRpK4eA=
Date: Wed, 28 Jan 2026 07:05:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] misc: fastrpc: possible double-free of
 cctx->remote_heap
Message-ID: <2026012807-engross-pettiness-4cab@gregkh>
References: <20260128042600.2641857-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128042600.2641857-1-xjdeng@buaa.edu.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90901-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B2E69D50D
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:26:00PM +0800, Xingjing Deng wrote:
> This issue was detected by a private static analysis tool.

As stated before, you need more info here, otherwise everyone would just
use a generic line like this and that's not going to help anyone,
including you, out.

thanks,

greg k-h

