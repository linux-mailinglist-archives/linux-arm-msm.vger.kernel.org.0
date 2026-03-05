Return-Path: <linux-arm-msm+bounces-95486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CBhDMfiqGnzyAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 02:56:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E220A0CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 02:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BDDB300D341
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 01:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C086B244667;
	Thu,  5 Mar 2026 01:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AD88mOdV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2F221FD4;
	Thu,  5 Mar 2026 01:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772675779; cv=none; b=aiqd6MXhjn5McMj+2+TugY3KbJqbcOSNA8ScVIYNV5d/TSDZyToHA4+deCTl9e0VsoTOXAC7bAlwSw43jvE3HLmR5mm1OnGGeFzjuHCziVkkO8P6OlstO31JrpPsvIx9yYIYGFL0+Vf6iGBWKH/FUA8moCvoWIuELviN98d+PCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772675779; c=relaxed/simple;
	bh=7f9FrJn1QE1Ys6n+lCWljrWlaMQba/yHYK2P2Vp47yo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XmfUlJanHmmHChJxz7ors24hCoZ3vM/N/Hl2DkdsuwxfuPGfcEku7qRz+1lK2AS0nH9JsivzQZVaIHI+a+B1OzIthaMw3yEZbeEhGg45aERTscpj8hFvoOff8enX+V+3CNQN0jBtTeeoYRyUvrylIe+hXNCpLX8aHFUcnXPWmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AD88mOdV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7454C4CEF7;
	Thu,  5 Mar 2026 01:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772675779;
	bh=7f9FrJn1QE1Ys6n+lCWljrWlaMQba/yHYK2P2Vp47yo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AD88mOdVAEzXpXhiJiSgq7SVc/mtFICynd6q/ArWcmpp6lYu5I9Qq/yo+45DrgBI9
	 6IACN8SqaZcht2gCmkz0858h03LSFSRHkjJCR2OTMOBy8vf65edEwDHamH0VJHiRsO
	 DtQxFTQXx3ya8il/2YSY/x/vFTsewZsqGVJf6huhe4m/pWJAjoMgGydLxc/FhUA9rl
	 GUA/5TSiJYxc9uo+ZKM5NAryp2NusjQQRdYWlrCZl5IpKM71HbUtAoW0ZZRzBwPF2z
	 ytbQ4N80Vu5+kj+fkQlk7svM5XfaduqHZ1yELL+22Grfcc6PBvDXbeX1YRl/GM1Emu
	 M79q3lJivjyww==
Date: Wed, 4 Mar 2026 17:56:17 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Mohd Ayaan Anwar
 <mohd.anwar@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260304175617.3974d064@kernel.org>
In-Reply-To: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
References: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C90E220A0CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-95486-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, 3 Mar 2026 15:53:02 +0000 Russell King (Oracle) wrote:
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.

Hi Vinod, given the dependency on the existing stuff in net-next
are you okay with patches 3-6 going to net-next without at tag
you can pull?

