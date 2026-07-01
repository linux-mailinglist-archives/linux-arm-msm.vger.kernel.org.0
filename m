Return-Path: <linux-arm-msm+bounces-115697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id axGVCl4ERWp05AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:13:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D926ED1A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:13:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=B3Eh8XmV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115697-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115697-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88A8A30C6BED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 12:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B79B480DFD;
	Wed,  1 Jul 2026 12:10:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D11D480DCD;
	Wed,  1 Jul 2026 12:10:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907817; cv=none; b=fiZ8CkrjGhyOp993Fh0Otckv6jyZVAPaCPOaGGyNYcfDZvBZvyX0vJYHM5W+g1qJVU1TnolYhlbQEoNBL72kY6IUythA1gPE86KS+9zbHmyy16Ic3R9/qHtGWTpqpeWOMKcI7+ks+6qQTHfEbBXRF+ZKM1/q+HoUBR57l0ffeL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907817; c=relaxed/simple;
	bh=XkbJDs5b4CyYbA1/0rCpG9hMz1MQDgXS87/m3zexQT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABEHsiltFoPcNyu3mHbUungg7jKo4Qj/ZQIU+AJPV6FzIQE3GyAO3W4AsRoMMAp7595NQtxpFxQmpIRIvctTklJOPAys2UfF/Dd8LSGeLMqKajVn2WGUsCBKyHOPVdNZ8LM4iJL/75gRoYCoz6c+aytS7T+sCVUwzsV06/wdWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3Eh8XmV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6CE1F000E9;
	Wed,  1 Jul 2026 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782907816;
	bh=nFGxHZ57BxESwOnyfTQk2h/Dar922p/Ic+StsVpQ0zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B3Eh8XmVM0rWEtUNTwzFEHDHhcgW4/l57WMjJSWBl6faBkhM6GfXkKhO6hs6kE13f
	 SJxVGQyIk9/LC6RgWG4s5un+XlkeUX7YcYFj0XMlHndGGcALJ8d6wgE79vGNyE2xbV
	 ynRSg/pqU1fQODRrXRPU2Lg06GKQnxp3TsLRT2RP+qtlN93FFzKUwhFegBFIb7rDiR
	 vvlk0evIhjEYChTOeLopa/zcjtBKB09ICnRUnuZJ/uhN7R8xVkTAzksyaAY3aE+qbW
	 //F7Oy6HKjksy16X2AM95yDriURvNCYhnqsCDnsfSy9NNYXJ2/dcRmSgtZDoasTnDG
	 32qTxDSsg1/2Q==
Date: Wed, 1 Jul 2026 13:10:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <d58c9336-5681-421b-9968-d44b0a8fba0b@sirena.org.uk>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
 <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
 <66f59c2f-f759-44b4-9639-d8845581ae9b@sirena.org.uk>
 <20260428213331.mwnybqlnognnrpfw@hu-kamalw-hyd.qualcomm.com>
 <afE_iAU9xdIzHA9x@sirena.co.uk>
 <x7bfmqz3xq3sglwypqg5qyegb5mh3yaqvqv4dsitjtbemslj3s@dokc74swe26l>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9lyKN3Br5Ofuxgpk"
Content-Disposition: inline
In-Reply-To: <x7bfmqz3xq3sglwypqg5qyegb5mh3yaqvqv4dsitjtbemslj3s@dokc74swe26l>
X-Cookie: Do unto others before they undo you.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-115697-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kamal.wadhwa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:lgirdwood@gmail.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64D926ED1A1


--9lyKN3Br5Ofuxgpk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 03:36:47AM +0530, Kamal Wadhwa wrote:

> It seems that regulator registration failures happen after adding the read
> support ONLY if both of the conditions below are true for any regulator.

> 	1. The [min or max]-microvolts values defined in the device tree didn=E2=
=80=99t
> 	   exactly match with any of the  selector voltages supported by the
>   	   regulator.
> 	2. On top of this, if the initial value read is out-of-range of the
> 	   DT min,max limit.

That should just work, if there's some problem with that fix the core.

--9lyKN3Br5Ofuxgpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFA6MACgkQJNaLcl1U
h9DnLgf6AvhwuiL503xhX4wOEaYPVjMRqZpAYXpzPGJUjDK6O4AXDfWhdk8S8Sxx
DUNEElymFC1o/NTN3CdesCO0QD0QlxWWxAgL9wE8uyUjoin6LgW51FFJEeWolze6
2sTEbRUM+pPspASTQ7hTRHR+HHxKonaWzvYWFaXBlgHC8jrKP4Ytgagv+/da2xZM
Y/2CSGNFHKs1s9NO+j/yvXUynwL14cK31amRGXJsv7PH7ZRBDEgHRq3H1x0oXGJy
5EZkAGtk5YBvb8fIaK5QnOreKBusYFjs/RCU6QUKe+I141VNgWjt0PLVE5uc/WRg
YbttPZrkAGBPfSlasPhNubdLAQxHVQ==
=3MnF
-----END PGP SIGNATURE-----

--9lyKN3Br5Ofuxgpk--

