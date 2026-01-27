Return-Path: <linux-arm-msm+bounces-90858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKKJCd73eGkhuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:37:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FCA98855
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D0B1302001F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72FD30C613;
	Tue, 27 Jan 2026 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukdqKGT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD1E30BF67;
	Tue, 27 Jan 2026 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535360; cv=none; b=TE30S2IMRNlqlMJPfcAjQ6I3w/XvQmZ904oX9wURd6CPU5ek/K9yT0NgL43NwpAqXOR7GJhHnn208G0kBR/O95XCnfE44Us0FZQoUzIyl0jJHMpigOsNifaYazvefgxFyOQ8/3xEDGlXYqqrG7tk+8t1t0WF4kxWBF9k2SA8Pqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535360; c=relaxed/simple;
	bh=8WMPfsv1ZMt188Yd1dynuFLReUo888DaCbA+U9+g2vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnn8HS16iYKMr+H+nEXgvUt1BihLg6+v/9ZC2LTebd7ArfWbeLHHm7AANx2TUZyKi7qvDJ5CSFHIwK7ShWFGa6x5UNklA+WhNJk3zz1/hxXXA35+5RrlokPcCJhYLTuWebLjqY7EanMkae5QFjPWsoDYz0JS34WjXP9W7LAiQyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukdqKGT0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9819C116C6;
	Tue, 27 Jan 2026 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769535360;
	bh=8WMPfsv1ZMt188Yd1dynuFLReUo888DaCbA+U9+g2vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ukdqKGT0gfODkXiE3LVeLIMjV/MUEG1f911p58FBhc8iFJRSxwXsuFSnrLOuViPxD
	 ZoOY22QAmTbxa2ojblTc9lVR+j+Bgounz1JWQDka4TQwdBXVcykv8R9oGF8NyMRXxK
	 s0Y28u7zrlniaeXcW+1Bmpo+IV7nM88HsbMGDYpujNFnmlhs5oDdTLrvYuwxqxrBdm
	 nYdW9LppSHesa31OwQZ696ckhAYI4nh0maYIKHffR26Dwki3TWXYS3Gqw2uH9KlhYO
	 M2M+CS3JsIuPG/X/JTh5+SgAwQC50NQOwsHeHtkyNh2G2/F8FILLfNfgK2OpHnExia
	 6KUavA3ChDmfA==
Date: Tue, 27 Jan 2026 17:35:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Saikiran <bjsaikiran@gmail.com>
Cc: lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
Message-ID: <2b8945c1-4372-4023-a15b-9187b9f23418@sirena.org.uk>
References: <20260127172757.75221-1-bjsaikiran@gmail.com>
 <20260127172757.75221-2-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XM4tCrTs4z9oesX/"
Content-Disposition: inline
In-Reply-To: <20260127172757.75221-2-bjsaikiran@gmail.com>
X-Cookie: I brake for chezlogs!
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90858-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 78FCA98855
X-Rspamd-Action: no action


--XM4tCrTs4z9oesX/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 27, 2026 at 10:57:57PM +0530, Saikiran wrote:

> Some Qualcomm platforms require a significant delay after powering off a
> rail before it can be powered on again, especially for regulators that
> depend on passive discharge.

> The core regulator framework supports this via the 'regulator-off-on-delay-us'
> property, but the RPMh regulator driver currently ignores it.

The core regulator framework does not support this, this is specifically
a property supported by the fixed voltage regulator.

> Add support for parsing this generic property from device tree and
> populating the regulator descriptor. This allows board-specific DTS files
> to specify required discharge delays for RPMh-controlled regulators.

This would at a minimum need the bindings for the regulators on the
affected platforms to be updated.  What exactly are we talking about in
terms of the actual configuration here, what goes wrong if we don't
leave the regulator powered off and how sure are we that this is
platform specific rather than regulator specific?  I'm guessing these
are LDOs?

--XM4tCrTs4z9oesX/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml493sACgkQJNaLcl1U
h9AP4Qf8C5VXN0HPRKhErkSbzCxUyRpbm+ToLdwkiYyleAIYO+kF2SOQe371LhFv
NKXfhjkS5FtR12REQSU00iNyudvYwbMjk1FJbrdYPS4Aj0ouwWTX7mTyJuxq4/zI
lfQqxEMts/8FLdEJ09mRq8EZzCRugyjiItl/8P1U+ON6DfRb4np4kM0IdYUJ/x+Y
fEgTdWckTumtjDUsuSOoUK/Fb6uAwCka4pUf19kL2W7D2S7v+dLedQOM2R/Ula59
q0HA1+Sz6JIcbztHiI0vGt/DiXxGQLW4iaqjbxwNOby5JvoSZCxSvNuua2INCP9c
SFjlLDJjq3RD0pAJUBHJ8RD2MBRlTg==
=Rz1y
-----END PGP SIGNATURE-----

--XM4tCrTs4z9oesX/--

