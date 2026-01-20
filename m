Return-Path: <linux-arm-msm+bounces-89916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA7TAToWcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:56:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 640874E330
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19A1BB29577
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF2E41324F;
	Tue, 20 Jan 2026 23:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLJ4M/cq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764F140B6D9;
	Tue, 20 Jan 2026 23:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768951970; cv=none; b=Gbz2OiTWCwpL+CYv3vCbCIGExdZmkOy99u1TtT6Og41KU7NeyFCZIOz0i7SjlFLXGAiyEXa4KzZIyjKW3YgwBwZWFaaApUMen3j2sckUEu143wq0txS7S6Pg+WkkCTeyH2Maykp9TC9qsE76VzU3qzVFvLUAfEJlhqQ3aTowO3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768951970; c=relaxed/simple;
	bh=TiwAfrS4S4/cPcCNH/Af8lsGdUuDKr5kui6G12uDfZA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YI9BD+ADxsp1YQVUD8ApYrCGJonMlDZjHDTl4FrCMeguNFi9XgU05EJv03H9+Pz1JPk7pLvAjgRoYpxMisPxPSdvDvtCI4CK73ibP6k6T1n1YO2SFkSAcLB3H7TA9GKLGJa18s+oDRqzh4Xq3yteMnIII9q/E9jJaDvDtH82dtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLJ4M/cq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3086DC16AAE;
	Tue, 20 Jan 2026 23:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768951970;
	bh=TiwAfrS4S4/cPcCNH/Af8lsGdUuDKr5kui6G12uDfZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aLJ4M/cqdhTjcBanfjqq3P1KjJBRJPGkZF/Qf5m+uQ59i4UZ98ARPxQt2EKx/hiSy
	 HXIgEBLG+nzBIiSgllK62eC+tMJDsNhaTnfvjRqSMZFUDXi4IB9oihhZ2H0blZMT8K
	 BSE8XOcLTuI4FY2WdFp0mu8AULbZG8Ngepr5eUmEsPhJkpkoc3/XxXP4HN5WYLAT7u
	 O3e+EiQ6uXqM7MocFIVZUaESUF3ZhlNkqZfg5Pucut+CSbdSEwVUeFb2PG2Uzh1GCR
	 3QeXZF9r6934oSUWM1ZkhLm6eKoIdq+457HUy55kMOYkVWFe/C6L0zkohLy8Uc3v6O
	 gZ5tl+nifHvIA==
Date: Tue, 20 Jan 2026 15:32:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-phy@lists.infradead.org, davem@davemloft.net,
 maxime.chevallier@bootlin.com, alexandre.torgue@foss.st.com,
 mohd.anwar@oss.qualcomm.com, neil.armstrong@linaro.org,
 hkallweit1@gmail.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 edumazet@google.com, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, vkoul@kernel.org, andrew@lunn.ch,
 pabeni@redhat.com, andrew+netdev@lunn.ch,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <20260120153248.0636f1e9@kernel.org>
In-Reply-To: <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
	<20260119192125.1245102-1-kuba@kernel.org>
	<aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,davemloft.net,bootlin.com,foss.st.com,oss.qualcomm.com,linaro.org,gmail.com,vger.kernel.org,google.com,kernel.org,lunn.ch,redhat.com,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-89916-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 640874E330
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 05:04:53 +0000 Russell King (Oracle) wrote:
> By the time phylink_pcs_enable() has been called, the PCS is already
> plumbed in to phylink. It _will_ have phylink_pcs_disable() called on
> it at some point in the future, either by having the PCS displaced
> by another in a subsequent phylink_major_config(), or by a driver
> calling phylink_stop().
> 
> If we clean up here, then we will call dwmac_serdes_power_off() twice.
> 
> Yes, it's not "nice" but that's the way phylink is right now, and
> without reworking phylink to record that pcs_enable() has failed
> to avoid a subsequent pcs_disable(), and to stop the major config
> (which then potentially causes a whole bunch of other issues). I
> don't even want to think about that horrid scenario at the moment.

Would you mind adding a note to this effect to the commit message 
to shut up the bot?

Unless the comment on patch 12 is also incorrect in which case I'll
restore the v1 into patchwork.

