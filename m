Return-Path: <linux-arm-msm+bounces-90899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCPfIjijeWlMyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 06:48:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 124899D3AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 06:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FAE830164B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 05:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49621D9346;
	Wed, 28 Jan 2026 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XF/doAP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E9C136E3F;
	Wed, 28 Jan 2026 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769579317; cv=none; b=SMLwbB3ZTfp1mGVO6+2kzYOZe6rKywFdpYhPkq+B4Nn2hvoHCALCTwlt2fNzqqbz5fjE1zcaaYPZPeFfHaonnH/fnaY4ZkikRZddQ8Xkmpx1bHhA82IrdSBpP8C3oJ9P+6xv+RA+LVhMYfopehUQPVqDKYNOkFs2amSNwTrw1XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769579317; c=relaxed/simple;
	bh=uUU1GFk6W9A2OhC/0i9QZZ4frb720ycWNzcpj8viw1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHpjcnivo3LH5BGZup0T0n/LRaHvBCPle+ceZObQtUbuZkGMarxkhYVvZQBp+G6z8A6yLazlf6hdYEbKgbsH3UX9rJK79LfbcTotlJ+U0+6GnsGxgmI7CSB6XuGNi0w7Tnz0Ug6mbc/SI5AtThQBBCCChac4PzY48T8yucD2lEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XF/doAP2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34D8C116C6;
	Wed, 28 Jan 2026 05:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769579317;
	bh=uUU1GFk6W9A2OhC/0i9QZZ4frb720ycWNzcpj8viw1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XF/doAP2FUIHDmBvQznqagpDoIj6aOJq6sC881I/0ERPwAmVrz3nOglVNpUzyfPz3
	 HIf0gjszE7GZ8D/aZbv8GHN9c3p0XIugnwLf+mSLmTzIwm9qZcOt22fkDNNJaTKlPS
	 DFP4FiTTAFvzAwGYWh0pU0/+DWd8gm4iDv2RmSkI=
Date: Wed, 28 Jan 2026 06:48:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH v6] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <2026012851-precut-apostle-1d38@gregkh>
References: <20260128033454.2614886-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128033454.2614886-1-xjdeng@buaa.edu.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-90899-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 124899D3AA
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:34:54AM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not checked.
> 
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration.
> 
> This issue was detected by a private static analysis tool.

As per our documentation, you need to say a bit more than this about
your tool.  Please read Documentation/process/researcher-guidelines.rst
for the details.

thanks,

greg k-h

