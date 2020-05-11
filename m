Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235E81CD6B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 12:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbgEKKjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 06:39:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:38980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728341AbgEKKjl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 06:39:41 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E27C5206F5;
        Mon, 11 May 2020 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589193580;
        bh=0kBiZ9ajnEJCfDeIgMip/lzW0VTKmfKqszkyrFEudlw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VNhXHHWLlZbrbWPRUR8cPnVYu4tq603FHzx2Oo5MQd1ZjmE6mvv8QiXL4bofg5uK4
         ZXZyqxuSwOikfLlGcQZ5gBDpD2iezdrFiEE4OL08Wsbb+BPe5bByWP29erRg0RAa4A
         mNdJ0chqp0SfRz2Wy+sGUZkmHgMC8cH+TnV3dRt4=
Date:   Mon, 11 May 2020 11:39:37 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [v2 3/4] regulator: qcom: Add labibb driver
Message-ID: <20200511103937.GC8216@sirena.org.uk>
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-4-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline
In-Reply-To: <20200508204200.13481-4-sumit.semwal@linaro.org>
X-Cookie: TANSTAAFL
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 09, 2020 at 02:11:59AM +0530, Sumit Semwal wrote:

> +	ret = regmap_bulk_read(reg->regmap, reg->base +
> +			       REG_LABIBB_STATUS1, &val, 1);
> +	if (ret < 0) {
> +		dev_err(reg->dev, "Read register failed ret = %d\n", ret);
> +		return ret;
> +	}

Why a bulk read of a single register?

> +static int _check_enabled_with_retries(struct regulator_dev *rdev,
> +			int retries, int enabled)
> +{

This is not retrying, this is polling to see if the regulator actually
enabled.

> +static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
> +{

> +	ret = _check_enabled_with_retries(rdev, retries, 1);
> +	if (ret < 0) {
> +		dev_err(reg->dev, "retries exhausted: enable %s regulator\n",
> +			reg->desc.name);
> +		return ret;
> +	}

If this is useful factor it out into a helper or the core, other devices
also have status bits saying if the regulator is enabled.  It looks like
this may be mainly trying to open code something like enable_time, with
possibly some issues where the time taken to enable varies a lot.

> +	if (ret)
> +		return 0;
> +
> +
> +	dev_err(reg->dev, "Can't enable %s\n", reg->desc.name);
> +	return -EINVAL;

Return the actual error code (the logic here is quite convoluted).

> +	ret = regulator_disable_regmap(rdev);
> +
> +	if (ret < 0) {

You have lots of blank lines between operations and checking their
return codes?

> +	ret = _check_enabled_with_retries(rdev, retries, 0);
> +	if (ret < 0) {
> +		dev_err(reg->dev, "retries exhausted: disable %s regulator\n",
> +			reg->desc.name);
> +		return ret;
> +	}

Similarly to the enable path, but is this one about off_on_delay rather
than enable_time?

> +	if (reg_data->type == QCOM_LAB_TYPE) {
> +		reg = &labibb->lab;
> +		reg->desc.enable_mask = LAB_ENABLE_CTL_MASK;
> +	} else {
> +		reg = &labibb->ibb;
> +		reg->desc.enable_mask = IBB_ENABLE_CTL_MASK;
> +	}

Write a switch statement so this is extensible.

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl65K2kACgkQJNaLcl1U
h9BQSAf7BULCV+zM0j5z4zCoc5itj+1AiFF33DehWEq7FUG1g36yL3J9UQVA4fUu
byEy8fI4m8tkIpj/j6f7HPfu/rOIbpLdAYMgc+IqX8zwQ9zvwTHwB7TkK1zIdZvq
/3RWqZ25ey+ZASi5/h2ZN75cG8no64xb+BmaRLhQADAo6mmCH5+xXZacknMGzkR+
b9IjaEsP2+iWhiWbBpetZok2oCi2RXLCdBUJJ+wwmrWVnIuSD7NkAm8lpXOSZVDY
XooOfd62M8G92WT3WFMripbwOzcJQ4uew034U8B9bbaL1H/3Qo2d4WO6+5kX1URw
5qNRNFuW09j1PPMSsT76pSJHANHflg==
=KeE7
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
