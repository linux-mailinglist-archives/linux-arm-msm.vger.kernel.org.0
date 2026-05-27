Return-Path: <linux-arm-msm+bounces-109995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIMeFKHhFmpIvAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 14:20:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C46FF5E4145
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 14:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1492130215AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D152B3D4128;
	Wed, 27 May 2026 12:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9OXhVm/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E413D75D7;
	Wed, 27 May 2026 12:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884372; cv=none; b=Gwn1fY2BkIEXCd9GRpTY0pyXHjrABTLYAckY8ajAqH3ICZn+RlGlqENbtNHz0DaiTOFX1VI1Jo6Stkc42ekYTjJLnuXqfH6gei8Xhf7NB84VcTCY+RCtbWPg3jJk3URWPpuqwqosF/ti3vKd1CEa6prQqgcJPmKNtwBUxgpT4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884372; c=relaxed/simple;
	bh=NTqrsFgZYzjFDorc5ajghivwrJzWRcF/dI0w0mslG3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPbulxFoLRClhxwi4c9SYCqMM6SzlRJ21njp6/IgsTZUoAX0Grnfp+L0m4F2LiMDtPrd26V4F3VGk9pPx74USvDhFkEH4XNnmFg90/2mhPoykA0g64n2NmHNi+eBFUk1D1o2hnRVgFpEBZfPzb43XLxXxitrBBA85IS5BI3BysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9OXhVm/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE081F000E9;
	Wed, 27 May 2026 12:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884370;
	bh=hoWFpLVya6aj+VNsqRuxJvv7z0oG+wJ0KemRuuVlvQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J9OXhVm/1GDpfUk7HEjUp1nj48aO+RDXk56PkOSEDfCbaxbFwS0JxsvMvaPCrmtgk
	 HTrFwyC0tBUfQUyzywBzIJOk9NgJyTG7bcuqjFeH6k0/AXJkhZBHkWJRbaVkCB50Gx
	 9aeKuTj01lDb2ndyg0SmUXQTlaL7PKKmvzCheUBS7pk1U+cEEHfEgkNy1vTgP+cBz6
	 SQnAv8VBZWME/LbKsUh8Ih4cqg6jFeoHak81ZAa4Gz/niL1E2fnNsDitbzGiYZ6pda
	 4CDmpYim8A4YZ+uPL8n0Z+OXg5ivQaXyAQ34cLgeM0abXqw0zYB13gy5Y3vWcpiQKV
	 pfHSJ1i09UMLw==
Date: Wed, 27 May 2026 13:19:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	mohammad.rafi.shaik@oss.qualcomm.com, alexey.klimov@linaro.org,
	ravi.hothi@oss.qualcomm.com, mathieu.poirier@linaro.org,
	verhaegen@google.com, andersson@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] ASoC: qcom: qdsp6: add push/pull module support
Message-ID: <2dbb7b31-0c8a-4bbe-82b2-85eabd4e72ca@sirena.org.uk>
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
 <177983641184.868420.5216505688708523357.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aWEimgdkcPBfGac7"
Content-Disposition: inline
In-Reply-To: <177983641184.868420.5216505688708523357.b4-ty@b4>
X-Cookie: I left my WALLET in the BATHROOM!!
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109995-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: C46FF5E4145
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--aWEimgdkcPBfGac7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2026 at 12:00:11AM +0100, Mark Brown wrote:

> Applied to

>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

> Thanks!

No, they're not - this is b4 getting confused because they were pushed
to git for CI.

--aWEimgdkcPBfGac7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoW4UwACgkQJNaLcl1U
h9DfBAf8Dal5wUXimf8sR1n+4gt10AJaKX2sPswH2uxFgzclvMcKhP5ZMUSi3GK+
PzAeRTwplorCAKyNjQCN2Tnj9bz4ahfmjTK2VKP3QJQ4Lj6Aux3iXNN1LbSW1tfU
rw7GiCwGQH6y45E8y1k6y5L1lkomMoSRGu3TjlhIZcAaycRk35qyri9z2RFmLNn3
PHVnSbhLQmQk3KgL/l+Yfa45g4sMPzB/KGcT7o8Gnhx0gcIRzrtwzWOfoUC3T9Xe
q7w+R4zueJDgn91jsFdHVMxTpR2wrzJhpYddyiQKi75dfALcmhtZZmhueM9ujkTq
bmb8kSdQ2MVsd1X4HtqUWP8OypU8Og==
=zprX
-----END PGP SIGNATURE-----

--aWEimgdkcPBfGac7--

