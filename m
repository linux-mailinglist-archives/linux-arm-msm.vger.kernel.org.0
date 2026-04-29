Return-Path: <linux-arm-msm+bounces-105110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAvcHXyN8WkaiAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:47:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEA048F3CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CA4530378AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99652236F2;
	Wed, 29 Apr 2026 04:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAnFuNsE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A466E14884C;
	Wed, 29 Apr 2026 04:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777438073; cv=none; b=UMg/345fWUxX5GKZwxScQKeHgKBCY0khrqRb6FxnQ4aUfvbL1gQ9dEZSSDREuwBrSNHjQJNjSthAhrjqnN2G+crm/JfUqw2bUOS/Q9Ug7ugU4ZoUhDyKUcr3cCxcsDjFQTaoNO9h5xDZ7wGN+ZVnL9ISm/DF/00Ce9Lqn1DKvxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777438073; c=relaxed/simple;
	bh=1QPeg2HMqn0cuMiNijKQLOYSHin1rxESbDR9vpY7cOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEKmqo2/r1l75DsT1clzeBWKYAX52dRedfJ1dyd78VlDyqT+79Ck9VWq5adgwL2xuLPqMGJKD3yorwF/Wxzi234xVCcr1NIZyH9twdtyFhZa+4SgSCzqqZZD2c2k1T3TIfMQTKrnJoI1FwpUvQyfz2y27vxMmZJEILdcNkGpdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAnFuNsE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1762BC19425;
	Wed, 29 Apr 2026 04:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777438073;
	bh=1QPeg2HMqn0cuMiNijKQLOYSHin1rxESbDR9vpY7cOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAnFuNsETIVqNJJ4CmZ3HYmdW0hVxi5XTZVPsVvjfuxJxSEe8iu1pGX1uDJ+jFvUI
	 FtcGlE+dmjXRtqFbmLrNMkZf+gT3ynJG26vDPaXCTbqHEinoZ66gwVknbgtT8B8wH8
	 2WMLnNMn4Q2lhvZ9nFbv/M2pYBN9jJ5rFKJC3oIDAd/eiFqeOjU+eE4CAQJl+DdPto
	 p0VAz52gG7zB3u543F0VJbjd58eUDE1FLQRNgYOXtVQ1dEnjdbtUO5AvbtVCFH+5qs
	 1AIWiYBQdcHuphv9oRIgDfg4uJVPskOR2/jnwQkqLTroYjqe7oNocj+/q592xwJlIm
	 Murdz6Xgc80Mg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B19081AC5855; Wed, 29 Apr 2026 05:47:49 +0100 (BST)
Date: Wed, 29 Apr 2026 13:47:49 +0900
From: Mark Brown <broonie@kernel.org>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] Add QSPI support for QCS615 and improve
 interconnect handling
Message-ID: <afGNdfKrJCzGPy6y@sirena.co.uk>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I5J05lFo0LBJntig"
Content-Disposition: inline
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
X-Cookie: 667:
X-Rspamd-Queue-Id: BDEA048F3CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105110-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.co.uk:mid]


--I5J05lFo0LBJntig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 09:52:39AM +0530, Viken Dadhaniya wrote:
> Add QSPI controller support for the QCS615 (Talos) platform and improve
> interconnect bandwidth management for QSPI controllers across multiple
> Qualcomm SoCs.

This doesn't apply against current code, please check and resend.

--I5J05lFo0LBJntig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxjXQACgkQJNaLcl1U
h9Am+gf9EW2MCf14LSb91y6FrGdcGqCo0qv3U55Vvz4VxKMfeDBfTcpbEeSfiVsX
XTTk6iTrgQyEWy37B4Zd5D0fK7uhIcPcwT9OhKnrWodOwjEYSiTJ97cc534r5Fj8
jKDFTEeBduZy8RKuHdUFIaKqPvbzPmRZJcBRMAjXeC5NhWHgL3bg6nrGyvW0yJR9
Y3v7vWcb4vLtXJi9VtZVYwrgJv80U6mCEMi8E9GErvcqg7gATGvC+qj1o6TZSry/
LFq6xQ/XOoIdN932VKohYy+qSihb3DT3VfZZL53wqkCvEYymcnoZ87QEEksjQLPe
DvLTWePfuQb3J70fHNRhb9w5vAeHQg==
=8dU8
-----END PGP SIGNATURE-----

--I5J05lFo0LBJntig--

