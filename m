Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572532F145B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 14:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730664AbhAKNXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 08:23:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:35444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732514AbhAKNRb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 08:17:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 014282229C;
        Mon, 11 Jan 2021 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610371035;
        bh=CmkRPkyW+CATZH9bzTVu39t6lVrMI3J3IbU932DutAk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TzJh0gBf47sx2RbCpMXf+TfAdv1Flwn9Ae44A9KJf+tM498ABXQvqgLhyH1zYE3cu
         ZWVAf4NyLBmPLkFViDyXAtfqtdkd67K7A8vsMUt63JaA/mYr/rlGj+yM/usbcG2hAw
         qIpAe4lQ+GkuDAmEVRQSB9g+KBywqaFB9oKjx1RhcRBcqX4DzZJaelEgwYX8j9kcAT
         rr0FE7yWyXXZKyziKsETzzyvZBtfS8sFsREndoZDpvbuRkCCBkqkamIF8hRzsyajWa
         MdiNPzek4HrZ5LOo7hxb62asOoJfY2VNR+9rUIPbZTDE/gTSHpvN5LpVB1bYuLUn3a
         ApW4/7FbJuZOQ==
Date:   Mon, 11 Jan 2021 13:16:42 +0000
From:   Mark Brown <broonie@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH 1/7] regulator: qcom-labibb: Implement voltage selector
 ops
Message-ID: <20210111131642.GB4728@sirena.org.uk>
References: <20210109132921.140932-1-angelogioacchino.delregno@somainline.org>
 <20210109132921.140932-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline
In-Reply-To: <20210109132921.140932-2-angelogioacchino.delregno@somainline.org>
X-Cookie: Too much is not enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 09, 2021 at 02:29:15PM +0100, AngeloGioacchino Del Regno wrote:

> +	.linear_ranges		= (struct linear_range[]) {
> +		REGULATOR_LINEAR_RANGE(4600000, 0, 15, 100000),
> +	},
> +	.n_linear_ranges	= 1,

If there's a single range that's just a simple linear mapping and should
use regulator_map_voltage_linear().

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/8T7oACgkQJNaLcl1U
h9AkPAf+MAVILl2ffHOGp2fVUT5aN8gdBqK8rfxbiQEm6bDV5yFx+sLu7vuCGki5
PjBq8BF088Hj2i6TY9OCaYPhtoSMiQ21gcZTdFWt7zZ5dFk1oCWKxkEhVSMdsjOp
mHxAhQb1Eek8AA2R0+hMpp1D8+44DFEHE3gQnph+N8mHxXPXi23bdoUSZRF1nZeB
bAx9ojeQ5+sv1un7mNIUMl2auDlGtjJOO2m62VJovgP0CIDfP9KNCoBDgXEPf8Qb
4A5bN1oFeqkk3k9LP0LyRyzYsvnP/tn4KawgJI1kbVi/4xLdLGJTk08w0jluwN/N
q1Obh6BUqc3IRbHqDSrlITHYI9Ovtw==
=/6OF
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
