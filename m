Return-Path: <linux-arm-msm+bounces-114995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 91msLGRXQmpi5AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:30:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CFD6D9717
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:30:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RWH9tdHr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114995-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114995-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9810A318434A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DEA3B8948;
	Mon, 29 Jun 2026 11:22:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC540D598;
	Mon, 29 Jun 2026 11:22:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732168; cv=none; b=qaQKkRLaQ+dMB9RHTKk3KuwKi2vmRKcmX/RAlSt8laV8gJ0nyX5AB3dz3bSEENyuWxPjPjIwUNCSqwaNaIg4ke2pvebkbNT103XkjUoPLerpTmne1ATzQdiAECQOyCnduugH9jX4UFZM6xRlobJvIm9+xok4P2MmVN7dE92NZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732168; c=relaxed/simple;
	bh=R8yifLFnqJzUH1P7/YT0As6VAy6Hi9WFvxUr9kRqlro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+Q2dSkcf9bSrzXRR3EQqmQngPoPyJaISO729WCXqBb1Aa38OocQNs2Dj+4goVKxfKvkgWYU2EHCegVqXvaCCGNroJBiEwGEyoCs6gflOD65leup1RwablHlglIMkBj+/0hLbwAAVYIYj5nnYqhNzBJiBwr4KEUxkoUyCE5KBgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWH9tdHr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756311F000E9;
	Mon, 29 Jun 2026 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782732167;
	bh=R8yifLFnqJzUH1P7/YT0As6VAy6Hi9WFvxUr9kRqlro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RWH9tdHruTeGVzbeyeLbLoqbO1nAcWOkQJSuM4WbKNBsl3iVLK74M9ilP/FRPx4G0
	 t3k1VVewdOs6kkJz8xnqR7/c53vebvqY0oViszBuygnUkrgbulp6oip8/JX3ugdgN4
	 1wWw3r9n2pW3BNWOmXskqceUlMpFwme/rPVlLHusOAiXC3pJWN/WMuEzE9BO9eSqmp
	 B1urn10a0sksFg7vAVEIFwnlWSXnnQjgGaDKfn6Y2LIo+JaWIrplXJsyyOa9ndFNv1
	 uqY8stpepqBkBsjrFP7J4O205O0XZf7c6657c9Y54k9rFyI3lhILY4xib+jXspUQR8
	 1KMth3GpknufQ==
Date: Mon, 29 Jun 2026 12:22:42 +0100
From: Mark Brown <broonie@kernel.org>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] fix: sound/soc/qcom: qcom_snd_parse_of: leaked
 device_node reference from of_parse_phandle on error path
Message-ID: <be400453-5df9-4897-8144-34378f8f8d8e@sirena.org.uk>
References: <20260627034915.59929-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YGfqRBIy/LPWFpQ8"
Content-Disposition: inline
In-Reply-To: <20260627034915.59929-1-vulab@iscas.ac.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-114995-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sirena.org.uk:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33CFD6D9717


--YGfqRBIy/LPWFpQ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 27, 2026 at 11:49:15AM +0800, WenTao Liang wrote:
> In qcom_snd_parse_of(), of_parse_phandle() at line 124 acquires a
> reference on the platform's sound-dai node, stored in

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--YGfqRBIy/LPWFpQ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCVYIACgkQJNaLcl1U
h9Bm6Af8D6UortXePgrmV9GYmLax13roMLkP5TMIkXN4KksLpI9Y/M0Te0AJVoL9
/SLp3akLWnbq01fH59otkW8br8bHfOIfnKBsA/GXn78VKM3gGlWDbUXJjVZTh3du
ToeCNcWfSEOCrIRfN8H6oex2t/ilO5dtMhPUAmrtQGJl8RyOq62WwPBmj3GmRJds
2zmusJYTjPg+MHvmXDsdyAUza2y4CtTfVK45tU3km9EquEraIiO+tQ/HDO00UEoq
apEGZ98iZMI+S+boTrJgnureJ8SShRCrwk/ylscFmBntkc5y6AQshayDXSfZiwG6
BhyPLg15E2miUUme2fwh5GL6mcZigg==
=iXjp
-----END PGP SIGNATURE-----

--YGfqRBIy/LPWFpQ8--

