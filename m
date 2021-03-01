Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52B83280BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 15:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236197AbhCAOZ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 09:25:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:54176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233426AbhCAOZr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 09:25:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D6EF64DBA;
        Mon,  1 Mar 2021 14:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614608706;
        bh=2AyFT3heWDrYjZIporM3KVA1yPzZkMjN8fqrhXFySwQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZPfkRP43sq484RRM+wcWVfF5jTryvoZZSK29XOmIBWptTnqGA0j4aad+zoqEt9cbJ
         M0IvKPdX1h6+qaO/yVN1MY8+bhyuWhAEaDxtcdkvO2QpizLbRkSMyUMVatfyFoKKiv
         W3TkjmO8e1WlcGIndcjfRizGlXpQ1W5i9iWgoD0YiCsArHvqcShIHLOTmTmdhFckZe
         innJJVBiWGzBR8dgwTStyeV9jOrl+ZP02WPNW3gKgoZzdBGtx3jJvsUUT5ZIljPCks
         xFCAmHeewqv3yxZzt2WKmSc2F/7+gw9qMkjLPhfjgxTu6AALygYW99O71z69Mb9rFQ
         mrSHeZ7JTTopA==
Date:   Mon, 1 Mar 2021 14:23:59 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] qcom: spmi-regulator: Add support for ULT LV_P50 and ULT
 P300
Message-ID: <20210301142359.GA20302@sirena.org.uk>
References: <20210225213514.117031-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20210225213514.117031-1-konrad.dybcio@somainline.org>
X-Cookie: I will not forget you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 10:35:13PM +0100, Konrad Dybcio wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.or=
g>
>=20
> The ULT LV_P50 shares the same configuration as the other ULT LV_Pxxx
> and the ULT P300 shares the same as the other ULT Pxxx.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA8+P4ACgkQJNaLcl1U
h9D/awf9Es7wlrQZ4YCq1/go52seFRhb18M1iMcnmyVLxFtFyQYWuvKBkX8p8ugD
E3G2z6vK5oswpVnkZfhzldKvOHU9CLwGrry7R0SE6kLdZFq+6+Rq3rN03OEqnGTc
OsMiSyH3JOcCphbDUoPbs0wOKta/RF0H9s5uIa1Huub1lC/FRM0TW5fI66zb2+c6
bRClqz8wcVuWtfklG/qYeqA/CXcNjE1yk8rwa7Vwj8/s9h99x2jkOIozgNGSupy1
bgd5RhanlgWW1BUfMIoRlxncxDLA6BM/NJJu/8M2DQnNSXN/7R4ltcveUpUCcE2m
zQAF6pDlwjCEbt1wIgdUEVuj8uMvuw==
=X8Go
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
