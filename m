Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF8C1EBB8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 14:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgFBMWJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 08:22:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:59218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726937AbgFBMWJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 08:22:09 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1D5B2053B;
        Tue,  2 Jun 2020 12:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591100528;
        bh=zoYzZzP112/newTQzfSumttw9583gdScBlj4fN9D0gQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0+7Z0cr/oGYllCuEhye3XCHQXlI/VQ0JGybEDtdLdxtR2FzpV4I4z38sODGWRWmo1
         GrfH/N1d4ttjvEsE/TA/lao9K21uOYKA8lDqftrCR5FfViPifMs9UPp0w85v+1wTMa
         jQCcEhdZQCBkE2ylbd974aI+Ds/GVCfVcDTNiCb0=
Date:   Tue, 2 Jun 2020 13:22:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH v4 5/5] regulator: qcom: labibb: Add SC interrupt handling
Message-ID: <20200602122205.GF5684@sirena.org.uk>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-6-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gdTfX7fkYsEEjebm"
Content-Disposition: inline
In-Reply-To: <20200602100924.26256-6-sumit.semwal@linaro.org>
X-Cookie: We are not a clone.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--gdTfX7fkYsEEjebm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 03:39:24PM +0530, Sumit Semwal wrote:

>  static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
>  {
> -	return regulator_enable_regmap(rdev);
> +	int ret;
> +	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
> +
> +	ret = regulator_enable_regmap(rdev);
> +	if (ret >= 0)
> +		reg->enabled = true;

Can we not read the register we just wrote to here?

> +	/*
> +	 * The SC(short circuit) fault would trigger PBS(Portable Batch
> +	 * System) to disable regulators for protection. This would
> +	 * cause the SC_DETECT status being cleared so that it's not
> +	 * able to get the SC fault status.
> +	 * Check if the regulator is enabled in the driver but
> +	 * disabled in hardware, this means a SC fault had happened
> +	 * and SCP handling is completed by PBS.
> +	 */
> +	if (!in_sc_err) {
> +
> +		reg = labibb_reg->base + REG_LABIBB_ENABLE_CTL;
> +
> +		ret = regmap_read_poll_timeout(labibb_reg->regmap,
> +					reg, val,
> +					!(val & LABIBB_CONTROL_ENABLE),
> +					POLLING_SCP_DONE_INTERVAL_US,
> +					POLLING_SCP_TIMEOUT);

Why do we need a timeout here?

> +						NULL);
> +		regulator_unlock(labibb_reg->rdev);
> +	}
> +	return IRQ_HANDLED;

This returns IRQ_HANDLED even if we didn't detect an interrupt source...
Especially given the need to check to see if the regulator was turned
off by the hardware it seems like there must be some false positives.

> +	} else {
> +		ret = devm_request_threaded_irq(reg->dev,
> +						sc_irq,
> +						NULL, labibb_sc_err_handler,
> +						IRQF_ONESHOT,
> +						"sc-err", reg);

This looks like we're requesting the interrupt before we register the
regulator which means the interrupt might fire without the regulator
being there.  The order of registration should be reversed.

--gdTfX7fkYsEEjebm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7WRGwACgkQJNaLcl1U
h9AQxAf8DfQwS+lpjrOoHgyYMGAdrelohDwZkiQnvYkAj/OfYQd3p5mkrBwbDamD
yShU2qO7B/HwJ7aTdKuvkh4C7I6+j2i2aLCKjaiaej3mkPuk+0UExjH6lApQNS0c
M7ENfxK05L3iAqKFvGx8DBNtr7BwJ12BV0jD/TZNxu9rXXEEXhRbnKNRx8pySXBz
Qw8dP84h7WQARO089CaJf1JrbQES4TAxd0n0nCeTkqT6ynF7UHYrnbwN78s0f4Ef
1ntUPHeyyFnmQjFlx3a+zAaOanSGIMbn25B0J+1msieGqjeXruhkf8n6YjNRHUDq
uLCyTwC1rkX4ricMwVqRGfjA03eE0Q==
=9Ynm
-----END PGP SIGNATURE-----

--gdTfX7fkYsEEjebm--
