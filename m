Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9872FA81F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 19:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407293AbhARR6g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 12:58:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:50132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407346AbhARR6a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 12:58:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0CF622BEA;
        Mon, 18 Jan 2021 17:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610992668;
        bh=EEyVJLZ5jFQ72gpJ+iRvZBf84rPHcUeWRZnKPD8+AxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hJoy3iGkJrKVdqohtDcz2FnDHvu8B0R8WcT8AeTHEgUOOR8eF5qXO+pHiav0K5IGe
         ylKl/gz/PwSKpQ/k60vWASPEodx4QgeWiy9BYr9lwuNLVjawlbVnInRoZ0XXF4v4jw
         a/lgRM1F/tWzYaraDnz8mIfM9Qx3gtQko1dPaQUQ8WFXuYsy/7alEr38Tzm2sxla9e
         9yB5OFMxmuEUM9WBER6h/dDBh1Azm4W0PrFIq34doyZHG9CDzKAMUDLCI4906C8G4z
         0zrQAyoiOFPqJe4HEZAnFetfkDO1zIBHaWuu5W/VmvatUPqRycyOJlIToGKjQsJ64M
         0SL9Z7RDyxybA==
Date:   Mon, 18 Jan 2021 17:57:10 +0000
From:   Mark Brown <broonie@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH v3 1/7] regulator: qcom-labibb: Implement voltage
 selector ops
Message-ID: <20210118175710.GR4455@sirena.org.uk>
References: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
 <20210117220830.150948-2-angelogioacchino.delregno@somainline.org>
 <20210118120453.GC4455@sirena.org.uk>
 <032d29df-9892-4774-2a61-7b634deafe06@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H83aLI5Lttn3Hg7B"
Content-Disposition: inline
In-Reply-To: <032d29df-9892-4774-2a61-7b634deafe06@somainline.org>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--H83aLI5Lttn3Hg7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 18, 2021 at 06:54:26PM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/01/21 13:04, Mark Brown ha scritto:

> > Please do not submit new versions of already applied patches, please
> > submit incremental updates to the existing code.  Modifying existing
> > commits creates problems for other users building on top of those
> > commits so it's best practice to only change pubished git commits if
> > absolutely essential.

> Sorry for that. Should I send a v4 to fix that?

If there are any changes in this version then yes, if it's identical no.

--H83aLI5Lttn3Hg7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFy/YACgkQJNaLcl1U
h9DILwf/W/k0KmU3tk6fbj3vqLj4p3aN45BnYBPEUgOt869NEKwIEyov9iGBqF/j
p4+uKx9cZR4oh5QGRec6KkMnCNoE4aUgZITh0X14/beFR//TPKbdEOp8NCyLFyzy
LyiMHysKL5uVWcjLmk5bJi2n0HT8kyttHATO0hGX1hL5aBWqCRb0/zVJwhzIdbr5
w8wMJpc93QWqCgNODc3vVbOilsuD2A+2W8uO1q2gGEdYLrgOYmrH/G+/lcCGmvtR
ux+dJvZ9Zv1RJEiFNnpb5FrJyBxrffP0MEvRz3lReBPDXvzIQtJVHNuCiSDGE1fq
rjygJzfS3pRIrX+/yDViRGzDLjuEeg==
=hJqq
-----END PGP SIGNATURE-----

--H83aLI5Lttn3Hg7B--
