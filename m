Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFE83B02C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 13:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhFVLbW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 07:31:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:48042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229668AbhFVLbV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 07:31:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3E7161369;
        Tue, 22 Jun 2021 11:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624361346;
        bh=O63HMcCcWtEueNvIeLFcow7esesD5gVu8wMOrXI9q2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WIUt193jhMx+MlBXaUMUutP8+/nyDaP4lOVTDH+hC3sgHeuiPDoFpd8sybKkOqLtj
         sU7P3yytonzfgctuwuezAa0+jmQqlyTK9NwW2xwcM21xiJiyXXIQncSV611/5kjodP
         O5mEyv36RZVJ1W+tiBzL6OM2EenuvwtWYyirkq5p6MNaqjoRLlTiTeYB92WQLYDgfC
         HGJdrukzxKyBpWO+bCVTesyi0C78q5gU9k6Z2I/jOdXgD+esb8kBDKH3vXI8yYDTEk
         UiUYsKnCt0KFncqdsRG2IPsUWQV5x8wbi4xvEiVbF19M5mefcq9nTC1WICUo+F5ILt
         AFuUro0BQeNeg==
Date:   Tue, 22 Jun 2021 12:28:43 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
Message-ID: <20210622112843.GB4574@sirena.org.uk>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
In-Reply-To: <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
X-Cookie: fortune: not found
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 22, 2021 at 01:31:36AM +0300, Dmitry Baryshkov wrote:

> Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> being controlled through the UART and WiFi being present on PCIe
> bus. Both blocks share common power sources. Add device driver handling
> power sequencing of QCA6390/1.

Are you sure this is a regulator and not a MFD?  It appears to be a
consumer driver that turns on and off a bunch of regulators en masse
which for some reason exposes that on/off control as a single supply.
This looks like it'd be much more appropriate to implement as a MFD or
possibly power domain with the subdevices using runtime PM, it's clearly
not a regulator.

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, Linaro Limited
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static int qca6390_enable(struct regulator_dev *rdev)
> +{
> +	struct qca6390_data *data = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(data->num_vregs, data->regulators);
> +	if (ret) {
> +		dev_err(data->dev, "Failed to enable regulators");
> +		return ret;
> +	}

The regulator API is *not* recursive, I am astonished this works.

> +	/* Wait for 1ms before toggling enable pins. */
> +	usleep_range(1000, 2000);

There's core support for delays after power on, better to use it.

> +	data->enable_counter++;

You shouldn't assume that enable and disable calls are matched.

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDRyWoACgkQJNaLcl1U
h9Avhgf8DH8yAQTnnRzSSpHRKE5XpuOSXrGEKhggWkn6wpBkg/LNUERaMFDf2LRM
ws7VUbElGDdECoiy18JOCdgYpZkIx5I13OUS3PyroAnRpmzp5bPa9lwneI/icl3n
wT16PP28Ta2VaOb66njp/4ESWY+UuAvHH0JXwo8v0jPc61GpYOXketQCX0xk4j4G
Ps8HahDYAJ3wT3UrVi6EbXvLRLvj3i1CU9kkvfxt9mj5/bj4WS4VO+4cJmIqMXZc
FhkdtDBOfhtfetDO1jhxBz8Wg8Ww88udy6HqiQuzkeON094p4qtU/LU3/IEcgJAH
w1PXR5PlM4oV3w/nDGtGZ1EWe+Bqfg==
=7i/2
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
