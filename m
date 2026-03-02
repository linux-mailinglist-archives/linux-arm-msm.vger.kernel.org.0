Return-Path: <linux-arm-msm+bounces-95029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCHCJ6UepmmeKQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 00:35:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BA01E6B66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 00:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D22A30FF4BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 23:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FED7337BA0;
	Mon,  2 Mar 2026 23:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKt/ujlm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC923375CD;
	Mon,  2 Mar 2026 23:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772494189; cv=none; b=H/SBPtesKDrg+q2RadS1HPVpOrc94DzsgUVvqTSiP81RhW+w8SuYVnKxpvcpxmLxP/r41O1Vj5Du+92AkQQKTbhRCjQ2nRYxoD9xZSwHDWyEXBjva1Qe4+qWzrN61fjkLeCb831GQHOgKldrvrX49mtMa8LHI8JPAJXK1MeLITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772494189; c=relaxed/simple;
	bh=JjhsBZbYD+PYZg+8Sa8bG20c+cqtp6NekCY1b69oRyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0DKKQIIb0m3TDHrzobcWpzYuuetbYkAMoTvAFhnG2Jhgxi6b54N47g1kjTUOqT2yfEVQNSxGqTtTDk7pKSf0gPHZry7XzYoTVB9aIU7+bfHZPTQBVw6uc/O5J1Xl136+bC4BAkrgl8HSZ4Az6aTA3L/xPhVkgHwpIYE9tSW2SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKt/ujlm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38149C19423;
	Mon,  2 Mar 2026 23:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772494188;
	bh=JjhsBZbYD+PYZg+8Sa8bG20c+cqtp6NekCY1b69oRyQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EKt/ujlmky2u6ZnrW0ZzIzvKVdvfswEr0r5SgScQgGqScbTcrnJfKRuu0fvXxqRid
	 /hGQfglqXwH5c1P743ShC+bWlVez3LWQSj3+LVw6GzJYp5JUIGfOBH+QT8LapMMqha
	 0GWr8KXbhvMqimB8TJZJZkPt3p1jWNLC8zVfE7u7MN2ViPCaT6+pQzoYAwSR1kLfzz
	 W0mPDaNfumIKp5D/kuzKmmViL8TO4MkLJswpI6fEVP0JKiMRBKw2h1SVzKczhk9TTM
	 RDrhQXwMIEuxDcKkRdlRVD6Yokio18R8Hd3P+6sOVU9mKyAlHRowZPoKEFw7rnbseo
	 ifkm0+P7hNdCA==
Date: Mon, 2 Mar 2026 15:29:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Mohd Ayaan Anwar
 <mohd.anwar@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Vinod Koul
 <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260302152947.3f2a0c2d@kernel.org>
In-Reply-To: <20260301120824.ot53bhv7z7kn5lfd@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
	<aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
	<20260227165556.5cf9e844@kernel.org>
	<20260228083111.5df8550c@kernel.org>
	<20260301001453.lpd2rawy7bqxyivp@skbuf>
	<20260228163229.1024f263@kernel.org>
	<20260301120824.ot53bhv7z7kn5lfd@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 27BA01E6B66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95029-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, 1 Mar 2026 14:08:24 +0200 Vladimir Oltean wrote:
> > I don't recall us ever making a "dirty tag" on net-next which would
> > propagate few 100s of netdev patches into someone else's tree :S
> > IDK how Linus would react. It's the least good option IMO.  
> 
> Just for my curiosity, what difference would it make to him?

The PHY PR will contain a bunch of networking code.

