Return-Path: <linux-arm-msm+bounces-78356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC96BFCD42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 711713A1274
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21A2203706;
	Wed, 22 Oct 2025 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVuwVY1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675BC34C12E;
	Wed, 22 Oct 2025 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146156; cv=none; b=boC1R2GwIchNrhQ09toEOkHTdx85awpr/gv9e3lSX+lXjoS/ahssCKoB7buxhImstfP6+xjEB5KQIxSk1NpWpJX3BAQa4lgJKPRt6AsAv+w9xzj2NLiI5ihEgrunzYv6jqvOmbDMdmzmBecXFzVfZV4KFcuylZi2r3UkXPZYARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146156; c=relaxed/simple;
	bh=DY7m/1Drcfnz9srLaEJv8TgnI3rF94dqUJClKKnLqVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iphQ4VqPMZJBORV8V1CMQQlaWNv7nsg64Pg8DGeo9q4QRHClO+Xx77KojryeJCKeTbirIxEaEvGEwe6FXWwmKNDqoY9RaVUQYqqrC6h5rJ7ElHA8BKjMUHPriBqrUSJG8o0o4yn2v6u5lbpbfcWdJTaUUAGiN0eKY6D2JZYHA/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVuwVY1h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204DBC4CEE7;
	Wed, 22 Oct 2025 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761146155;
	bh=DY7m/1Drcfnz9srLaEJv8TgnI3rF94dqUJClKKnLqVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVuwVY1habr+hisaNN/WYzOtW6ioCbZ5TNzHmxCJb7gKwwZgcwb7oFc5WiUx0xdZH
	 TUkHmf/IT6wtLUiY9aY7si3LFrERf4xpGfxMPwBMCOau9XFub7XfCayw08iPET5HmS
	 sWparPpxkfhYbsEu2+vJVLloZelnt5Z1twrikwORkWQxm/aISbD2Nd7reDFbxkK5rO
	 ILWsQEPxFpEJU9Rr/+De5eXaRVe1Xw3R+1WpjVmD/6SBfE8i3gT4M+uSmsdw4C/JkH
	 UI/EmpuVS+z5lOZUBewO6o9wpC4E2s5u3u6FIN7E6OQ66+3yd7O08qsFDVYB6n0+fQ
	 Sa6JuFuTPpH4A==
Date: Wed, 22 Oct 2025 16:15:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] regulator: rpmh-regulator: Fix PMIC5 BOB bypass
 mode handling
Message-ID: <c3fac2a3-dc89-440a-9958-f2e904c42f5a@sirena.org.uk>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
 <on4zcfs5qdaekc7teo2iq6vpw7o2mp6yiqjkbznxo7wcxgutj3@nb35f55fkugv>
 <61c299af-c4f8-47a0-8803-306c08792b17@oss.qualcomm.com>
 <xlki5jwurnixdxaph5mtxg7sfks2cww3xbswgtf6dbn2z72o2r@smx5hxo6obxj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KQhQy1tYRVhCaSGK"
Content-Disposition: inline
In-Reply-To: <xlki5jwurnixdxaph5mtxg7sfks2cww3xbswgtf6dbn2z72o2r@smx5hxo6obxj>
X-Cookie: Remember the... the... uhh.....


--KQhQy1tYRVhCaSGK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 06:11:46PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 22, 2025 at 04:58:15PM +0200, Konrad Dybcio wrote:
> > On 10/22/25 12:23 AM, Dmitry Baryshkov wrote:
> > > On Wed, Oct 22, 2025 at 02:38:53AM +0530, Kamal Wadhwa wrote:

> > >> Currently, when `rpmh_regulator_set_mode_bypass()` helper function
> > >> is called to set bypass mode, it sends PMIC4's BOB bypass mode
> > >> value for even if its a PMIC5 BOB.

> > > The universe will end, the Sun will explode and Ragnar=F6k will be up=
on
> > > us. Please describe the issue, why sending bypass value is bad.

> > I think you misread, it sends the magic value which corresponds
> > to BYPASS, but one that worked for the previous generation

> I just wanted to point out that the commit message makes a statement
> that it sends some value. It should document, why the sent value is bad.

It seems fairly clear to me from the above that the driver is sending
the value for the wrong device type which is something so obviously
wrong I'm not sure it requires further explanation.

--KQhQy1tYRVhCaSGK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj49SYACgkQJNaLcl1U
h9AF0Af/Xs/r7Jj1o3KdFUA5l1DhtAOXEAHYpV1SiWtLwq7U6GtMzVB1Bp2KKPeO
U824YHguVEXi1mS2XOAYJxefbkClMnSiVjhvhzdM7gSVNGZ4uucVC2qDaCMgwBEv
KSV1U6e4QjaGWnnE28vFv3lk7gzR8FpxN8dofDTtwkeSuoDn7trtCi3wOUcdNQUD
8C0verSHhG7zoiKWEnfqA34jxdeBBHKEQnw/K6tTL4NlVCNFgnPkhYNw60SQZFJE
lFgUwquZsEqBbUkNfuQjuTXJuqcyxQROrTAkqYqfL8smVJFV2HRTqkKB6iMEtKFB
PmfqnwDdpUoEpemn4mY3sN8nWdxEvQ==
=6uCd
-----END PGP SIGNATURE-----

--KQhQy1tYRVhCaSGK--

