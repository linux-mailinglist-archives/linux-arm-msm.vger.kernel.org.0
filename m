Return-Path: <linux-arm-msm+bounces-16947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD68D89E047
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 18:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEF041C2188A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 16:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD0D13D8BE;
	Tue,  9 Apr 2024 16:22:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B3B137C38
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712679776; cv=none; b=GmQKpQ+KFFmScycO3VQ8DDcds4s/w7nLpTlGOJh0ylSs17uzwfhoZtGhH8KE1VytgdvGV1HAtfoOmQ9gHTo8ee9K2x0e9gHYg7PqnJGkgpvn58P9VLpLLrNBboe/JhBNuarHQn2HDkjXvYTKqTXwpFh/KCiVQxAXd25LcNeqOSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712679776; c=relaxed/simple;
	bh=FDlhhqXXUUqRdmMllo+GQgjl5AGe5DPOH7xrc8MnbNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b83b0cFa7S2z35X5KxBsR9tKGTVw3zZeGZcGbxwwj99tey+NMn6I3B+ePn+0uu0i4ofm2X67bSR0rNp/5jyv9kMdDHUr1Ev3zllKfJRVmLv3nfPBO7gmOIJkb1FBFJuLbGn5XyWd9PebyPQbBTBe62jvkxxu/ECMn/ziteLNiUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEFH-00088H-7A; Tue, 09 Apr 2024 18:22:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEFG-00BKt2-Jf; Tue, 09 Apr 2024 18:22:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEFG-00H3s3-1e;
	Tue, 09 Apr 2024 18:22:50 +0200
Date: Tue, 9 Apr 2024 18:22:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
	kernel@pengutronix.de
Subject: Re: [PATCH] slimbus: Convert to platform remove callback returning
 void
Message-ID: <z2s24xyecxdbjmqbpysj2m4ebjad2yeuma33pvzduiyv5ap4t7@psz4d4wyrjwa>
References: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ex24qbuczfox3i6r"
Content-Disposition: inline
In-Reply-To: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org


--ex24qbuczfox3i6r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Feb 25, 2024 at 01:19:12AM +0100, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert the slimbus drivers from always returning zero in the
> remove callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

gentle ping. Who feels responsible to apply (or give feedback to) this
patch?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ex24qbuczfox3i6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYVa1kACgkQj4D7WH0S
/k6nigf/eVi4R2FNm3XqCNfxM9brE7q7OzW+rZU4vQRkRIhPlz5q47EvNR0XXOAa
Cb652PeaaCpdgN16UEfwu+glm9tZpJgiYsdDlDyvDUPmjTnFJMMUm/EbEEmfGAi0
58ITc92RazK9LauLiahI9+fIy5X8B4lku7WE9VakDvJFe4f80XEtN81ExsZUk5nT
GrycHvWgxwAP0Dn+Nd/Bp7QbbucAYYbgOEiYOSxXo4+l4UEjmV5eCBL9JIDt2X7W
7wm/XgefnDgACffRsNbCc45h2eTK1GCGX28Wf57G5FdxqFMhIWHKxvK3rICsnP1l
J3/YEhJUPZKuJMDzQQqhrb7ML87KeQ==
=LxR+
-----END PGP SIGNATURE-----

--ex24qbuczfox3i6r--

