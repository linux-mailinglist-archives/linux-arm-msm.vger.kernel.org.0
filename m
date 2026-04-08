Return-Path: <linux-arm-msm+bounces-102341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK6yHAiE1mmwFwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 18:36:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BABBA3BEE7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 18:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88DD0302D0B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 16:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15CC3A2579;
	Wed,  8 Apr 2026 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kx/A7RcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1592116F4;
	Wed,  8 Apr 2026 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666109; cv=none; b=pSVdvzO8rXI0n1baJa6TJWb3hT7TZltWn8FB3CmQTp8JntlvNbMFYrmLJxaefukNY75oKecZK9da5kZiB9jaSw6YKYrLVqnq6nwnwT1b+QPfC6RZFxUjLGo7WxMrVGftvSuSeFCRX3uBmWHvXjrXKG8u19wp18KlF0qASD2ilLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666109; c=relaxed/simple;
	bh=vATiDMhsta6VlMnFfplcnAkqyj5Cl1vmJDsd4Rs3ybk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvTUfmqacss9da7bLGK7qAE6x6b7MeSeq/38xLnwJObuOtu2VX5riCZdsbzRCbaMWm2B72VpnGyJWuxfO+cbrg+q6Ikca8k4CD7veCdxB/QIv3mo1YXMkEeseo+Mybrz0RfJVpGP8iJUeJJfo7zTQYTnIZo1cdDp1ajhDvmworU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kx/A7RcC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9426DC19425;
	Wed,  8 Apr 2026 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775666109;
	bh=vATiDMhsta6VlMnFfplcnAkqyj5Cl1vmJDsd4Rs3ybk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kx/A7RcC2jbeClV7Brea5zmRM6Kh1bYkjnk/8YnefptrmzlXc96B5HJfeLrygzCV8
	 PEEx+3vSlbC1FlSEkDSTov5gZSgSx64evn3Ehn4fZHUlQNYKKgjnTRD+n81saec3tU
	 FBAHLRchxAKRnPcuzbmVSlYTRjDFzY4mpJQ6gkqOMCapgE0Ly6xNvYjm7bsrFE2YaQ
	 b1ctMQp8gukNeHaNi+3hRa2Qe3VM6GPzTxWEit11J4wEzaP4PwkmWpAEcEnZx5sZ1T
	 b6xDss651xtW3exzKssaVFEpN9BHJUjPVC9Rxn9TFIexkbWloyXtdumB4+s0himCke
	 Fi9IKY3dGNecw==
Date: Wed, 8 Apr 2026 17:35:03 +0100
From: Simon Horman <horms@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] net: ipa: fix event ring index not programmed for
 IPA v5.0+
Message-ID: <20260408163503.GF469338@kernel.org>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-2-01e9e4e03d3e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-ipa-v1-2-01e9e4e03d3e@fairphone.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102341-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email]
X-Rspamd-Queue-Id: BABBA3BEE7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 06:43:48PM +0200, Luca Weiss wrote:
> From: Alexander Koskovich <akoskovich@pm.me>
> 
> For IPA v5.0+, the event ring index field moved from CH_C_CNTXT_0 to
> CH_C_CNTXT_1. The v5.0 register definition intended to define this
> field in the CH_C_CNTXT_1 fmask array but used the old identifier of
> ERINDEX instead of CH_ERINDEX.
> 
> Without a valid event ring, GSI channels could never signal transfer
> completions. This caused gsi_channel_trans_quiesce() to block
> forever in wait_for_completion().
> 
> At least for IPA v5.2 this resolves an issue seen where runtime
> suspend, system suspend, and remoteproc stop all hanged forever. It
> also meant the IPA data path was completely non functional.
> 
> Fixes: faf0678ec8a0 ("net: ipa: add IPA v5.0 GSI register definitions")
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Simon Horman <horms@kernel.org>


