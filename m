Return-Path: <linux-arm-msm+bounces-94558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDaFMpk9ommq1AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 01:58:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFFB1BF8FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 01:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 887BA3135EA7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 00:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDFF2741B5;
	Sat, 28 Feb 2026 00:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRJG/cV8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA45C271A6D;
	Sat, 28 Feb 2026 00:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240158; cv=none; b=oVL4t+5hqe2clWv3Uxk//IdnMn2vVZOHZNIM/AAVnQx2i1ZqEotCxIA3Dh5ywfKp2tlqSRHJXSBZlxdTOwBDL4vPb09EBGds8l4B0lvqmu1AswkPUhRs0chy/LX/jGUCkCl+XQI5T+dI7OXWsXjZ94ZJyE39UeIrdgJePbFvOIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240158; c=relaxed/simple;
	bh=vrU43BCMFUhI571ZBbWK67TPeRBthBSfjXT1gOjxGvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WvwshUacSjr3ipMb26cENucSVo4T95NXUK53IaqhgirLdcOifihA1FcmHz/qQu0UeKFZhTuKTOn9MAqChnlq4Z7qSxU+00wM3g6YWfZLNRWzP7vPcp1USDo7coegqvuFOW+R73RyBG12HdgNnRg+DjcBavqzKAh9zt3zNOcnFo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRJG/cV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE281C116C6;
	Sat, 28 Feb 2026 00:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772240158;
	bh=vrU43BCMFUhI571ZBbWK67TPeRBthBSfjXT1gOjxGvQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dRJG/cV8UO4EPLOKG0SME4XWTL4z5+/lxOI0LO0x5zNDpR+qZweaw3EUQYWAzB9FT
	 37zQcfCwjx1gG5dRwZp20pzpF4TNkFE5UcmOT4hRk05N1ImyGFMBPXQIcdcuZCcmas
	 dC8O3aVwWe/GhZIG0cUq8VJgxRXIniKxAfZXa7g/2NO9Y4BXlWSg86KbHD5w2PZtr7
	 EE7dPsHb0FyJSR/rEvqBiohBTTyWqg4hJikV+Rnp9QyjIAr1g6GZLFvHHnwuDB8ewn
	 C4Yr7XlOLRxL1OmTNEj/wkzNlWm+/HxDV2UK/fMes811tdjUuzNMlvHLbDjQUiy6ze
	 k367Oe98bd7sg==
Date: Fri, 27 Feb 2026 16:55:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260227165556.5cf9e844@kernel.org>
In-Reply-To: <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
	<aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94558-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6CFFB1BF8FC
X-Rspamd-Action: no action

On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> The AI review for patch 7 says:
> 
>   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
>   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
>   .set_mode() and .validate() methods") by making phy_power_on() call
>   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
>   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
>   before attempting calibration.
> 
>   Should this commit include:
> 
>   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> 
> which is _wrong_, this isn't a bug fix.

Yes, that's what I thought but then I saw the other thread..

> So, in light of AI review being incorrect, my comment about re-sending
> due to the AI review is no longer relevant, and no changes are required.

Okay.

pw-bot: new

> The only thing that's necessary is to have Vinod's ack added to patches
> 4, 5, 6 and 7, as he gave them against the very first posting of these
> on Wednesday. This is despite waiting the required 24h before sending
> the first resend.

