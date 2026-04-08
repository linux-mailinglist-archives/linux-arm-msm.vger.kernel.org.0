Return-Path: <linux-arm-msm+bounces-102342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6APVG4+E1mmwFwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 18:38:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2763BEF19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 18:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3583302E0C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 16:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8580B3D3322;
	Wed,  8 Apr 2026 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2Zr58aS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608363B19AB;
	Wed,  8 Apr 2026 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666216; cv=none; b=n3MKD8GEXNuAlnvX6aBoXevcnz5DOAGRhuxHjSpAinvtPBnVCN0kgPHBYpSQCwOyDKCaC73kj1jb2tXb8hZAkqAryz+bWg3bN5NHJUsJATEyOWZb24OzvEN1I22YUy3YQ3SViwt2D9wlz0tsed1uSKqjuwsF4GSNNl+kgSSlXBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666216; c=relaxed/simple;
	bh=KuEcNGVb6Ap5/FhPlqhsH6NdZliWBNFMhP5Jl72KpLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8rhs6OuRNJo55iKQGwFibVAg6BEmGvZqPz2c/F/bvQTyaLLhNIUs+n4/gIaQ/8uQantOImu9Y0P6YgHtfCgKyQ6vlgdnCcsUTb4tpBXpFKKIl9/bEf9K8C1fWKKACraHMtFX3NU+QnMCtDJqcP+Wy62o/RUGKsE1cqWTm/kTzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2Zr58aS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B45BC19421;
	Wed,  8 Apr 2026 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775666216;
	bh=KuEcNGVb6Ap5/FhPlqhsH6NdZliWBNFMhP5Jl72KpLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2Zr58aSxiv2R1lJPsvkT0mOml9ZzYY7WPFbmjS0h4r/KZd/O0HqydaIV0liAzQCH
	 V8K2gLl7I1z6IDdTNPnvuQ63eGw5gbc9vrMWZStouQcS1Tco+M/ej54AvqUSo2N3r1
	 otQH8/cYJUHRHmC2XUsO5mrK3VEKtHqiZLmfKv3Mq4+iLUTj6/M3w0brWNSzd0AASq
	 V5s1MmYTo3mV1M7OeHdnHAKMvaZoUhWRX6DgBrlBGQSQ5+isj7ObdOXDVmE1eVhIXG
	 7k9uEWMgTYWxNxFHgIX3/f7fSZ16bSsoCpXgvyM/i51achJ1nwgq9/6mdXd9SaEQXy
	 PZHMiZolWDp3A==
Date: Wed, 8 Apr 2026 17:36:50 +0100
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
Subject: Re: [PATCH 4/6] net: ipa: add IPA v5.2 configuration data
Message-ID: <20260408163650.GG469338@kernel.org>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-4-01e9e4e03d3e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-ipa-v1-4-01e9e4e03d3e@fairphone.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102342-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fairphone.com:email]
X-Rspamd-Queue-Id: 0C2763BEF19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 06:43:50PM +0200, Luca Weiss wrote:
> Add the configuration data required for IPA v5.2, which is used in
> the Qualcomm Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/net/ipa/Makefile             |   2 +-
>  drivers/net/ipa/data/ipa_data-v5.2.c | 452 +++++++++++++++++++++++++++++++++++
>  drivers/net/ipa/gsi_reg.c            |   1 +
>  drivers/net/ipa/ipa_data.h           |   1 +
>  drivers/net/ipa/ipa_main.c           |   4 +
>  drivers/net/ipa/ipa_reg.c            |   1 +
>  drivers/net/ipa/ipa_sysfs.c          |   2 +
>  drivers/net/ipa/ipa_version.h        |   2 +
>  8 files changed, 464 insertions(+), 1 deletion(-)

Reviewed-by: Simon Horman <horms@kernel.org>

I'm not suggesting a change to this patch.

But it does seem to me that there is a lot of commonality
between drivers/net/ipa/data/ipa_data-v*.c.
And it would be nice if that could be consolidated somehow.

...

