Return-Path: <linux-arm-msm+bounces-115685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9xZtCGX5RGpe4QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:26:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7667F6ECCB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:26:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HtzKR283;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115685-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115685-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1812530315FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5D8477981;
	Wed,  1 Jul 2026 11:19:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4A046AECC;
	Wed,  1 Jul 2026 11:19:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904797; cv=none; b=iGDcYzUCTqD6hjj0rIrS0yisP4nFsWGmF/tm4jDpTtMJERNDiamRM+aJDv5uPXVjp98kJhUKMvI2EDzJRVgKFzL88kh+WByKv34LKq44Wk0LReKXYWS1U+JAxU38HH2yWB1vFk7mgBtoz/nj2EqQP3frOFVQnUqddxuyaH0jzSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904797; c=relaxed/simple;
	bh=WohFoISc91VwHJVthJFHvksz+FbLresw6Ebv+AWBTds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyFtuvBxTIjCz5DIuVcfERarDhmMJHOkHAD+Y7OfLWhwpaGqf/y1CmKCRKUs5g3pwFSMv5s/iOH3N0mumBACjGO0HfWI9Z6xHc3NnUpkgoG23Vfewdd++FqaIPzs0RqU+ArChZ8uaIJbh8HUFjlb/ZxSOvIVlNuVXepJnVYn9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtzKR283; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82E21F000E9;
	Wed,  1 Jul 2026 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782904793;
	bh=WohFoISc91VwHJVthJFHvksz+FbLresw6Ebv+AWBTds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HtzKR283CyXohYi2ajZTOUVjEvBiIGjg6NBBp42z6SQvaxZWbOe/kSpctbXhtjHi1
	 ftmJ/MtqBq1XNSgCi0XtUqDLehM09RP6iDDtZ77XVgCf2AlI+rIvXnyXsL2sJk+5M8
	 QlzEY9+q38InV6rltIsCG9RCTYuyHhuhu/7rQ2fGF+b6my9BSLljE1ajcRirjcBGy/
	 /5Omw1bmMgcGHGUBp4SLKzq0CuAsozU7+lltmdFg5CjnhF2lgvUAwc7DjgPRJr3W6t
	 wiSexxDJFLsAPEJJm4Zo1ogd5gwaON1sybGMwTBO1XDRWl2/PgGo0TnHmHOFQxpjsR
	 NxquSIq7aqp+w==
Date: Wed, 1 Jul 2026 12:19:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
Message-ID: <41b2321c-c747-4884-9d35-f4993afe8c58@sirena.org.uk>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4RsKAl5xxvVtPpfD"
Content-Disposition: inline
In-Reply-To: <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
X-Cookie: Do unto others before they undo you.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-115685-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7667F6ECCB1


--4RsKAl5xxvVtPpfD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 04:27:47PM +0530, Harendra Gautam wrote:
> Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) controller
> DAI IDs. This provides shared constants for devicetree sound-dai references
> and QAIF aif-interface reg values instead of using raw numeric IDs.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--4RsKAl5xxvVtPpfD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpE99QACgkQJNaLcl1U
h9AVtAf7B93muBgJ+hTafM8Lc8StigUL+gs5uAioddtM0eeSbJJNi85pip8kC62M
zuZF+suH0XQXRpqau7r7YZ98evY1JQ7rAMNi8feUuYjBNYf7bn5dYeWLqM0Irj11
YoEkaZJ5MWnBeGjEHO2w8woxyX2HuvY4y2YYPxrkl/SzLC16HGnbMr9q9CEBmPAl
ArzUUxYORsJBarc+K3/wU3RsmlTK5ytAWKs/ONt5NYk/9hQB429u2KHmQkhbTIfV
pd3eDT3AGdocWQV2woDm6F0XuSZiDvyb4E5/pSEhdOHUsyXuAf3qVUeGE34jFaOa
fgujhbthX7SjLBr3QOGfwG3LG96v0A==
=P8AN
-----END PGP SIGNATURE-----

--4RsKAl5xxvVtPpfD--

