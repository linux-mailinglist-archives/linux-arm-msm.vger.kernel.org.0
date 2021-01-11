Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FDB2F16E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 14:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388139AbhAKN67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 08:58:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:55962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387908AbhAKN66 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 08:58:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCB2D223E8;
        Mon, 11 Jan 2021 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610373497;
        bh=W82HKcWU3D5Ryo3ShBlAvfn9wpslSYr5mBG/7GxjaAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WlLfwHBpSpB4mRqjRwzR1ZZJ6UjYn92nALj2E2l4ufIyxobFQHpKfebEL5RVPgxxF
         0okCBq6a6vNghxuWenmsE5aoIQzw+y7KYsiTTti553FUIkOASme2Weg4XKOP+bzCp+
         MSe9WjqLVrAwS4ViIXSPwIabSJKNLf+YLiU5JNyoXrXgSg2ucRTbmi+8hU+HAdWT8j
         pW97PMcNChh+IF7MflkvgipRpFiGvsZsfZ8f7wbH9I6MZJ2WothkT3TJJKi94QmU5/
         Nyhk36sQrn3l1Z3RrE9C5LphK8+PS2dw3iPaMkakMLp4/vhTCYxdsi/B7ZOkTi2mGW
         qSXfwR0sdH4SQ==
Date:   Mon, 11 Jan 2021 13:57:45 +0000
From:   Mark Brown <broonie@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH 5/7] regulator: qcom-labibb: Implement short-circuit and
 over-current IRQs
Message-ID: <20210111135745.GC4728@sirena.org.uk>
References: <20210109132921.140932-1-angelogioacchino.delregno@somainline.org>
 <20210109132921.140932-6-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline
In-Reply-To: <20210109132921.140932-6-angelogioacchino.delregno@somainline.org>
X-Cookie: Too much is not enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 09, 2021 at 02:29:19PM +0100, AngeloGioacchino Del Regno wrote:

> +	/* If the regulator is not enabled, this is a fake event */
> +	if (!ops->is_enabled(vreg->rdev))
> +		return 0;

Or handling the interrupt raced with a disable initiated from elsewhere.
Does the hardware actually have a problem with reporting spurious errors?

> +	return ret ? IRQ_NONE : IRQ_HANDLED;

Here and elsewhere please write normal conditional statements to improve
legibility.

> +	/* This function should be called only once, anyway. */
> +	if (unlikely(vreg->ocp_irq_requested))
> +		return 0;

If this is not a fast path it doesn't need an unlikely() annotation;
indeed it sounds more like there should be a warning printed if this
isn't supposed to be called multiple times.

> +	/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
> +	if (vreg->type == QCOM_LAB_TYPE) {
> +		irq_flags |= IRQF_TRIGGER_LOW;
> +		irq_trig_low = 1;
> +	} else {
> +		irq_flags |= IRQF_TRIGGER_HIGH;
> +		irq_trig_low = 0;
> +	}

This would be more clearly written as a switch statement.

> +	return devm_request_threaded_irq(vreg->dev, vreg->ocp_irq, NULL,
> +					 qcom_labibb_ocp_isr, irq_flags,
> +					 ocp_irq_name, vreg);

Are you *sure* that devm_ is appropriate here and the interrupt handler
won't attempt to use things that will be deallocated before devm gets
round to freeing the interrupt?

> +		if (!!(val & LABIBB_CONTROL_ENABLE)) {

The !! is redundant here and makes things less clear.

> @@ -166,8 +560,37 @@ static int qcom_labibb_of_parse_cb(struct device_node *np,
>  				   struct regulator_config *config)
>  {
>  	struct labibb_regulator *vreg = config->driver_data;
> +	char *sc_irq_name;

I really, really wouldn't expect to see interrupts being requested in
the DT parsing callback - apart from anything else the device is going
to have the physical interrupts with or without DT binding information.
These callbacks are for regulator specific properties, not basic probing.
Just request the interrupts in the main probe function, this also means
you can avoid using all the DT specific APIs which are generally a
warning sign.

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/8WVgACgkQJNaLcl1U
h9BUYAf/TRPb+bKAijDciE8hEa+oPUUE1PWOxG2ZLTi57IfR8ggOxbhy4sbegUBQ
PRK1JWlxq+cGBBOqjnUxknfHdNVrooqk2X0nm0X7r10qxrbK2gdNr1JKEcUnskAo
hv4H1yMVLwj49CBUxRckZXELgCg3szojgvbRChICSlZR+/4kXukrdId8DtPWwP0V
UJoMRVhUqJ84mRDzpKfdaNSSWavsNGJRpSDpJzjAMOrthb9n/2viTi7J7rzEi3zS
3E7RkEueq8xfVfmlPDFHQijeAVsd5KropNTrl5GJtppnYTOGGgLIreUyepAfLLN6
8R4Xka5ROuNUm3qKNlIOwzPb9iLgcA==
=bBx5
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
