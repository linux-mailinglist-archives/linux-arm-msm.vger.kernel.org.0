Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF74440FCBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 17:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243480AbhIQPk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 11:40:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:44160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242055AbhIQPkn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 11:40:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33E6761164;
        Fri, 17 Sep 2021 15:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631893159;
        bh=kSdq0hKExFv8TXBDsAqqcVjzosArwA4JtM7vQeOmyb0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l01PzpViwki9LA7T5gwPRzros5O03Fnq4JF1/rmEmPMtO4J2Yf6qcIa3IIQeJQNBf
         o7KN+YVWoGpllAa9JPybanl3gwpiaiMl9dnKvdY7Q3LjHUGgGLyh0/P/YHaizBQ0h8
         89xnTV/vt9ANhXKh884AS3PhWcyPFK9kRPloDZnefAupBgeWZbJbpCY7ivTmkhYq6w
         BCjSBab3TY9CHETuz2IrIdbJ9zCGoUYq/5+xiKkKZ2h6OXFimp9anSJz3YKt/yr0mU
         GT6F8BFi/XcRQW9WWC7yWDQVS5sZNrrjyLkyRvIeXJObrRKqSWGtpP+UV13r2fqu7I
         3DnNZZ2cCaf9A==
Date:   Fri, 17 Sep 2021 16:38:37 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Satya Priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, mka@chromium.org,
        swboyd@chromium.org, Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] regulator: Add a regulator driver for the PM8008 PMIC
Message-ID: <20210917153837.GB4700@sirena.org.uk>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
 <1631875538-22473-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
In-Reply-To: <1631875538-22473-4-git-send-email-skakit@codeaurora.org>
X-Cookie: A man's house is his hassle.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 17, 2021 at 04:15:37PM +0530, Satya Priya wrote:

> +static int pm8008_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +	int rc;
> +	u8 reg;
> +
> +	rc = pm8008_read(pm8008_reg->regmap,
> +			LDO_ENABLE_REG(pm8008_reg->base), &reg, 1);
> +	if (rc < 0) {
> +		pr_err("failed to read enable reg rc=%d\n", rc);
> +		return rc;
> +	}
> +
> +	return !!(reg & ENABLE_BIT);
> +}

This could just be regulator_is_enabled_regmap().  There's also a lot of
instances in the driver where it's using pr_err() not dev_err() (and
similarly for the debug prints).

> +
> +static int pm8008_regulator_enable(struct regulator_dev *rdev)
> +{
> +	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +	int rc, current_uv, delay_us, delay_ms, retry_count = 10;
> +	u8 reg;

This is the regmap helper.

> +	/*
> +	 * Wait for the VREG_READY status bit to be set using a timeout delay
> +	 * calculated from the current commanded voltage.
> +	 */
> +	delay_us = STARTUP_DELAY_USEC
> +			+ DIV_ROUND_UP(current_uv, pm8008_reg->step_rate);
> +	delay_ms = DIV_ROUND_UP(delay_us, 1000);

Set poll_enable_time and implement get_status() then this will be
handled by the core.

> +static int pm8008_regulator_disable(struct regulator_dev *rdev)
> +{

Use the regmap helper.

> +	rc = pm8008_write_voltage(pm8008_reg, min_uv, max_uv);
> +	if (rc < 0)
> +		return rc;

This is the only place where write_voltage() is called, may as well just
inline it.

> +	init_voltage = -EINVAL;
> +	of_property_read_u32(reg_node, "qcom,init-voltage", &init_voltage);

Why does this property exist and if it's needed why is it specific to
this device?  It looks like the device allows you to read the voltage on
startup from the regmap.

> +	init_data = of_get_regulator_init_data(dev, reg_node,
> +						&pm8008_reg->rdesc);
> +	if (init_data == NULL) {
> +		dev_err(dev, "%s: failed to get regulator data\n", name);
> +		return -ENODATA;
> +	}
> +	if (!init_data->constraints.name) {
> +		dev_err(dev, "%s: regulator name missing\n", name);
> +		return -EINVAL;
> +	}

Just let the core find the init data for you, there is no reason to
insist on a system provided name - that is an entirely optional property
for systems to use, there is no reason for a regulator driver to care.

> +	init_data->constraints.input_uV = init_data->constraints.max_uV;
> +	init_data->constraints.valid_ops_mask |= REGULATOR_CHANGE_STATUS
> +						| REGULATOR_CHANGE_VOLTAGE;

This is absolutely not something that a regulator driver should be
doing, the whole point with constraints is that they come from the
machine.

> +static int pm8008_parse_regulator(struct regmap *regmap, struct device *dev)
> +{
> +	int rc = 0;
> +	const char *name;
> +	struct device_node *child;
> +	struct pm8008_regulator *pm8008_reg;
> +
> +	/* parse each subnode and register regulator for regulator child */
> +	for_each_available_child_of_node(dev->of_node, child) {
> +		pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
> +		if (!pm8008_reg)

You shouldn't be doing this, just unconditionally register all the
regulators supported by the chip.  If they don't appear in the DT that's
totally fine - it gives read only access which can be useful for
diagnostics.

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFEtnwACgkQJNaLcl1U
h9CrJAf/TnpjaJxjPGDD/NDInzhqNZ3pu873PCgDW33FLzZrLDR9VA9y65y4D4V3
5QTDdaeFkrw6Z7JCVafXdZ+FpkNFs8gObqtdDgiaAascU9fbKEJY1Vwsc+GUdH6m
R07VKi0wvmn8Gjb12vUMkTBB+bZKlMBIRoFKSkavYSZmiKbeoLDRXZKq1V42rqv5
BQeCB/irm3UeeuqkT9Ek7365vaVP7pdnDQ7N9DF3pS0P7Tly/zCMfW401VbwkMia
jf2OR0Ke7h4C3NBUzLPlxW5JEbjZwVduiUJlNMvl/tW1CpcXNfnt7Fzq9/co+1/L
y7hwKMN3pFDpeSByl63kPgWPQ80slQ==
=HmpC
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
