Return-Path: <linux-arm-msm+bounces-115741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aT/oAr45RWp98woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:01:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A79376EF72A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:01:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=P4fFqFWg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115741-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115741-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C5D3305F047
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 15:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D19B48C8B9;
	Wed,  1 Jul 2026 15:56:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290FF3358DA;
	Wed,  1 Jul 2026 15:56:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921379; cv=none; b=PW0qTmqndca9vm3s1cTQ6rufPUKY1/SE3KfF/eEfIbQ8muK2jo8xSHghG6HUt5Nqa9qv+2vptXcXssHfUR1CQ2tcaL4dPg0V8m2VzAXz8TwxhJspJWqDpnVzdK4HLMb92HsVFYKkk435QUPOfnX7i44ERfdAf3JxG56WDqPibGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921379; c=relaxed/simple;
	bh=odUDUn9bptXTGCErV7nDVJzNgmhnYi+NRCBQsHjr3fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZrMo0nrVR5P4TyuRzJWAuDC/nDh6XHpPhY+6ghkFBEdQQro4zWZRclE+U13sw86cvstcqFdYQlw/iBh4DJ+U4ygbHyrIJK/8/YPzREfqLRIutcqX6uTvCOQOsPpSnSTqEKirF6tRrOPFtahwE1ZMzxp0W36bPYAFf+EFljjLBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4fFqFWg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91481F00A3A;
	Wed,  1 Jul 2026 15:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782921377;
	bh=odUDUn9bptXTGCErV7nDVJzNgmhnYi+NRCBQsHjr3fI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P4fFqFWgoinm8meuAtDrj+6VGIVK9yi8mPovfVyeHbx/idLC4qjEfMW3l3SicjcsE
	 CoAh5Cykj3nGtJgx3H4KhjiTgz85AzzDw87mbAnhJ/Q3ckdJKpPVPuuNkxJ+6geFUn
	 c7qQjABCTOUw2AX13jx8QevTIrAqg//fRnwHntfbG09O04mega0c+0WffDfKNNOymZ
	 Fk/BmKvw+8dbS9IS9jXDN0CmU95CtVjbZ2ouH4hkp/ULekYA8cdttU4LSyRuf3g11f
	 0A541O3w52dWw1CB0Am7K/pYqZdkmEHX6J1EE4JdXH6m9UGZSMb6C3CnqcTjCQCFUq
	 t+1C5m6pSUSBw==
Date: Wed, 1 Jul 2026 16:56:13 +0100
From: Mark Brown <broonie@kernel.org>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] fix: sound/soc/qcom: qcom_snd_parse_of: leaked
 device_node reference from of_parse_phandle on error path
Message-ID: <d7480f1f-7cd1-41a5-b6e5-b52503b1cbf0@sirena.org.uk>
References: <20260627034915.59929-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="un8xZbQd3zWXXNpi"
Content-Disposition: inline
In-Reply-To: <20260627034915.59929-1-vulab@iscas.ac.cn>
X-Cookie: Do unto others before they undo you.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-115741-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A79376EF72A


--un8xZbQd3zWXXNpi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 27, 2026 at 11:49:15AM +0800, WenTao Liang wrote:
> In qcom_snd_parse_of(), of_parse_phandle() at line 124 acquires a
> reference on the platform's sound-dai node, stored in
> link->platforms->of_node. When codec initialization fails (goto err), the
> err label releases cpu, codec, and platform from of_get_child_by_name(),
> but does not release link->platforms->of_node from of_parse_phandle(),
> causing a device_node reference leak.

This doesn't apply against current code, please check and resend.

--un8xZbQd3zWXXNpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFOJwACgkQJNaLcl1U
h9CXHAf+MkPNM7rJGQ6uZNhFbFFsEiPBMzl0NCTROU/Kdwgq8uI7tnor3eQ/rFnH
t5p1eJ6qnrDsdmc90NEWvz3nno986XWoKvUF/D3ObkhHCXFwBiKP3U+pPDFfTQax
jl0/BC6tQ/vQG4V96RyW8YerOP9f1dgfLbrKBQkG5NKUyrcWcSMtJ2MnRebd/+pT
8M0dyviuLi5NZ9eGjpDlSmAn5r96xNMJENbZVLZRujOch+4SVuuVXUgNlYUy7Lht
ULN5UMoG6g10RA90y0XGLcevHMdSsqvKtRfS04pg81wuQEMMolZ5989qTSTlE2gp
0lV/YG9HwlS8L3KkKM80IINCGRkNlw==
=OarS
-----END PGP SIGNATURE-----

--un8xZbQd3zWXXNpi--

