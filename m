Return-Path: <linux-arm-msm+bounces-90654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOiUAfdkeGnTpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:10:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 935FB909E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2893230041FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA0832B99F;
	Tue, 27 Jan 2026 07:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EZASAtY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E54329C74;
	Tue, 27 Jan 2026 07:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769497845; cv=none; b=eM5NkWcjbNJsLZ1Ww64udEZhCuqWFUMlxoYPphjGopY+cqMl8SFaEQ6nbexwFUUYK9HZzGNuCUjFgy1dT7fKBJrU4sZgcogIHMxuTDZFrG1JpJWujNDYyPAUfrCYwdJ+lC2ApYh53OvNsW2LrMeo/VbLLLYBITMhaajKJQ4mcjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769497845; c=relaxed/simple;
	bh=yTkcis505tVmLiRq0eQhz1yZqVct1c05x3BfbdMPMeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtqwID3AvcNBtvMOl1CSEQYWpgmpOb0G8KKv5q5nRZCvBPvs8LXgAtInSBuzh5hf5q0fq9DP6wOUWyYrD5WhO0nbA1jRUCIpLDIK1w03m+/gbQBAu1ezHqn3PkGdXGLy00mYT894gRB6w3xUAS5hh660D09XzQlrPP+5MJ8JA+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EZASAtY2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332FDC116C6;
	Tue, 27 Jan 2026 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769497844;
	bh=yTkcis505tVmLiRq0eQhz1yZqVct1c05x3BfbdMPMeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZASAtY2j1BEMUjViKbzK+agy09tHmk64JmlX7MlcecYkT/jWFGdM+R/cvZ/6xRO+
	 zI4WiYuUhTsrTeQSfrlSIYziE+/1IBua0YueqeO9iPhCG/NgktBbuevZ8PsjfB9N9g
	 6H2N7ogpAuh+hGWdpi/5j5LMgg0pFnfbEXpVX7Yk=
Date: Tue, 27 Jan 2026 08:10:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, srini@kernel.org,
	amahesh@qti.qualcomm.com, arnd@arndb.de,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <2026012758-sacred-slouchy-45ca@gregkh>
References: <20260117140351.875511-1-xjdeng@buaa.edu.cn>
 <2026012631-suffice-enforcer-8553@gregkh>
 <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
 <CAK+ZN9r+oCbSNjSf=yKQHGT9=Cqfw02J+TS3eZaUgrd=PfV7tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK+ZN9r+oCbSNjSf=yKQHGT9=Cqfw02J+TS3eZaUgrd=PfV7tA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90654-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 935FB909E8
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:18:38AM +0800, Xingjing Deng wrote:
> I identified this issue through static program analysis. All other
> callers of this function validate its return value, so I believe a
> validation check should also be added here.

Please don't top-post :(

Anyway, you MUST properly document the tools used to find issues like
this in your changelog text, as our rules require.  Please do so.

thanks,

greg k-h

