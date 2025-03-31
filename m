Return-Path: <linux-arm-msm+bounces-52879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5EEA766C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 15:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94C623ABC42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 13:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8079C212FB3;
	Mon, 31 Mar 2025 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnyIzlPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BC4211299;
	Mon, 31 Mar 2025 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427331; cv=none; b=tTPzsC+oB86PYa+p5E9aIBRUnn4p+CsjT5dfuk7Wr3XHtKYkBZpQ/PZu0Jh10JMd/mQsQDzNPJF3HMgsXY84jo07hjzLZvUFXUi8ddP2Aie9wiVQvAad+h3+CcN0E4bhHc7msOC/kaTUfpoz0/YVdehga//j4jqqE3Ld41O4EfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427331; c=relaxed/simple;
	bh=l+M8nz8oc9ljOq0XGbCmnbUsdV66Va4e9LDC63VS/RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQMQswSRdI6hGrlfReKptoiRTLYG/r0HS6Da0TmchESYKf7ubZ0Be/X8UnU/qJuhCkrrxP9rSQkt4o4J0d4uyR9xyFQErTzMQLon41nBDeqeOZ30RD0NT1ORe0CmRIwroT6i789zDDaJ9uaYeMW0lN8gveLZPVZTGUFZLENwthM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnyIzlPK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A61C4CEE3;
	Mon, 31 Mar 2025 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743427330;
	bh=l+M8nz8oc9ljOq0XGbCmnbUsdV66Va4e9LDC63VS/RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnyIzlPKedFcQGQFpBxPZq3o7+kE3aifbdeMjmfIxdQ6WA5skDzc8ygdeK2ngFdEl
	 7mWrht1oiAAhdBhKZLFxTxOdKrZwr4Pl2NGamo7v1T+9XOrqP66Vh6gA3rREVKmr6/
	 UX25k/VdxPXJ9/5w8sqteMAJN7fOAzIE+mvhnlyv6fidycDxnSCUAND8Xp/k6YOL+4
	 Sw94VKyMaeOVB3QW9H02sLnpTe04SzEAVSOTZVftSkKoXNe7VNy801qEFSRc2VaO+9
	 rvEfN23VFBpYiOAKgh3Go/QIho0/tpai1J611RKC+mNgNRFe/6Xtu/SkHHLVOR6huG
	 WOPWThWlcTC/g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzF5h-000000002kp-2i6k;
	Mon, 31 Mar 2025 15:22:13 +0200
Date: Mon, 31 Mar 2025 15:22:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: srinivas.kandagatla@linaro.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
Message-ID: <Z-qXBfrZOEkOpMHK@hovoldconsulting.com>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
 <20250314174800.10142-4-srinivas.kandagatla@linaro.org>
 <74214537-ad4c-428f-8323-b79502788a66@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rg65BCmxPKy11upH"
Content-Disposition: inline
In-Reply-To: <74214537-ad4c-428f-8323-b79502788a66@sirena.org.uk>


--Rg65BCmxPKy11upH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 01:32:36PM +0100, Mark Brown wrote:
> On Fri, Mar 14, 2025 at 05:47:58PM +0000, srinivas.kandagatla@linaro.org =
wrote:
>=20
> > Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> > Cc: stable@vger.kernel.org
>=20
> This commit doesn't appear to exist.

I think some tool (e.g. b4) incorrectly indicated that that may be the
case here, but the commit does exist:

commit 9b4fe0f1cd791d540100d98a3baf94c1f9994647
Author:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
AuthorDate: Tue Oct 26 12:16:52 2021 +0100
Commit:     Mark Brown <broonie@kernel.org>
CommitDate: Tue Oct 26 13:50:09 2021 +0100

    ASoC: qdsp6: audioreach: add q6apm-dai support

    Add support to pcm dais in Audio Process Manager.

    Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
    Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
    Link: https://lore.kernel.org/r/20211026111655.1702-15-srinivas.kandaga=
tla@linaro.org
    Signed-off-by: Mark Brown <broonie@kernel.org>

Johan

--Rg65BCmxPKy11upH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZ+qXAQAKCRALxc3C7H1l
CMpoAP9vVtWlHVyXeOMjM/V7JH4VDj3ljiWP12QIXAGMSsnwgwEAgc2vhIdSmbrj
+5ze2fONomgE1YN7tAR1CM4ZoFdDpQs=
=NYZe
-----END PGP SIGNATURE-----

--Rg65BCmxPKy11upH--

