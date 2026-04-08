Return-Path: <linux-arm-msm+bounces-102340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB5NIMKD1mmwFwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 18:35:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2213BEE30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 18:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 265503008A48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 16:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A3439F19E;
	Wed,  8 Apr 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAyoqdhz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77397349B16;
	Wed,  8 Apr 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666082; cv=none; b=G1+NxJ6TVwun6rIctfVHJq18RlebHMa9Db0fdfa7RXR2qClQ9v4apEASwAmC60hwOu+3OBq4WO9opHVNIvj225gE7h0MvEXV2V0TQxfZoQlz9Q/1AuFd96ynpCBFCEedY728+Qf0US9EcrU5j05k1mmj1LvZzwTBIpy1x98wVjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666082; c=relaxed/simple;
	bh=lZiW9wnvIQ5z1GIGwWPDRKIBOo0jR+9C4AkQvBOxj2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8oYg8LioyaIxKtm/23PDWcwSMZ3P4d3tpguBK1fwNIIJOdl0WLvAXcMssGR+tX8+/FUbNb1oOF4/5t9BMlwtKkQWJ0m2j/7hd1DDRsut9/GxLJAS7Qij5vU19KEMK7LcONKT0pDRbxaEhd9gMmdBMMg3Yk2BFX+n5EAC1NGFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAyoqdhz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1B2C19421;
	Wed,  8 Apr 2026 16:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775666082;
	bh=lZiW9wnvIQ5z1GIGwWPDRKIBOo0jR+9C4AkQvBOxj2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAyoqdhzuIrbzJn3tXGCb0718n1Z9JXjawhpHRBN3Yc32LsjcIniXJp/LLTmaZ2r8
	 KN+4VUxsUnIXmvV6YaIGhz+0meSBZUpPVw6BZBp8Oa8UGNah73DHqsg+qfjEAG/xz4
	 hK5HfxflMK6h+s6vdvMzRKJSENZ/gYpyPJYG3lI3aa9wPX53Uvk39SP/Gpl6gvui/e
	 P2vwIS3SO3VskQD5C5uFCT3NGIYnpcXVn4YdilhQ2pZFbay3FH/KrG01xH43Y/eND/
	 Ao9AVCek0sZk/xkSBKTPrm6hfIRF/44b9TQvKHQGOGuwRsForWzqLg7l1PeHBlAAN4
	 hshMEdCHTMouw==
Date: Wed, 8 Apr 2026 17:34:36 +0100
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
Subject: Re: [PATCH 1/6] net: ipa: fix GENERIC_CMD register field masks for
 IPA v5.0+
Message-ID: <20260408163436.GE469338@kernel.org>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-1-01e9e4e03d3e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-ipa-v1-1-01e9e4e03d3e@fairphone.com>
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
	TAGGED_FROM(0.00)[bounces-102340-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: DA2213BEE30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 06:43:47PM +0200, Luca Weiss wrote:
> From: Alexander Koskovich <akoskovich@pm.me>
> 
> Fix the field masks to match the hardware layout documented in
> downstream GSI (GSI_V3_0_EE_n_GSI_EE_GENERIC_CMD_*).
> 
> Notably this fixes a WARN I was seeing when I tried to send "stop"
> to the MPSS remoteproc while IPA was up.
> 
> Fixes: faf0678ec8a0 ("net: ipa: add IPA v5.0 GSI register definitions")
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Simon Horman <horms@kernel.org>


