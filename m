Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E8138D78B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 23:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhEVVhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 May 2021 17:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbhEVVhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 May 2021 17:37:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D24C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 14:35:37 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lkZHK-0007ik-LP; Sat, 22 May 2021 23:35:26 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lkZHI-0002vl-F4; Sat, 22 May 2021 23:35:24 +0200
Date:   Sat, 22 May 2021 23:35:24 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robert.marko@sartura.hr>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] pwm: driver for qualcomm ipq6018 pwm block
Message-ID: <20210522213524.lnb5bds5hvv2f2zi@pengutronix.de>
References: <70ced827689b7ab35d8f3b07db8d9ccd1489e3e2.1621410526.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x5ruvoykr2iiy6l3"
Content-Disposition: inline
In-Reply-To: <70ced827689b7ab35d8f3b07db8d9ccd1489e3e2.1621410526.git.baruch@tkos.co.il>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--x5ruvoykr2iiy6l3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Baruch,

On Wed, May 19, 2021 at 10:48:44AM +0300, Baruch Siach wrote:
> Driver for the PWM block in Qualcomm IPQ6018 line of SoCs. Based on
> driver from downstream Codeaurora kernel tree. Removed support for older
> (V1) variants because I have no access to that hardware.
>=20
> Tested on IPQ6010 based hardware.
>=20
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/pwm/Kconfig   |  12 ++
>  drivers/pwm/Makefile  |   1 +
>  drivers/pwm/pwm-ipq.c | 263 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/pwm/pwm-ipq.c
>=20
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 9a4f66ae8070..54ef62a27bdc 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -260,6 +260,18 @@ config PWM_INTEL_LGM
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-intel-lgm.
> =20
> +config PWM_IPQ
> +	tristate "IPQ PWM support"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on HAVE_CLK && HAS_IOMEM
> +	help
> +	  Generic PWM framework driver for IPQ PWM block which supports
> +	  4 pwm channels. Each of the these channels can be configured
> +	  independent of each other.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm-ipq.
> +
>  config PWM_IQS620A
>  	tristate "Azoteq IQS620A PWM support"
>  	depends on MFD_IQS62X || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 6374d3b1d6f3..73eb955dea1d 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_PWM_IMX1)		+=3D pwm-imx1.o
>  obj-$(CONFIG_PWM_IMX27)		+=3D pwm-imx27.o
>  obj-$(CONFIG_PWM_IMX_TPM)	+=3D pwm-imx-tpm.o
>  obj-$(CONFIG_PWM_INTEL_LGM)	+=3D pwm-intel-lgm.o
> +obj-$(CONFIG_PWM_IPQ)		+=3D pwm-ipq.o
>  obj-$(CONFIG_PWM_IQS620A)	+=3D pwm-iqs620a.o
>  obj-$(CONFIG_PWM_JZ4740)	+=3D pwm-jz4740.o
>  obj-$(CONFIG_PWM_KEEMBAY)	+=3D pwm-keembay.o
> diff --git a/drivers/pwm/pwm-ipq.c b/drivers/pwm/pwm-ipq.c
> new file mode 100644
> index 000000000000..885cf885fcf6
> --- /dev/null
> +++ b/drivers/pwm/pwm-ipq.c
> @@ -0,0 +1,263 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
> +/*
> + * Copyright (c) 2016-2017, 2020 The Linux Foundation. All rights reserv=
ed.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <asm/div64.h>
> +#include <linux/of_device.h>
> +
> +#define CLK_SRC_FREQ		(100*1000*1000)
> +#define MAX_PWM_DEVICES		4
> +
> +/* The default period and duty cycle values to be configured. */
> +#define DEFAULT_PERIOD_NS	10
> +#define DEFAULT_DUTY_CYCLE_NS	5

These define's names are too generic. Please prefix them with your
driver's name.

> +/*
> + * Enable bit is set to enable output toggling in pwm device.
> + * Update bit is set to reflect the changed divider and high duration
> + * values in register.
> + */
> +#define PWM_ENABLE		0x80000000
> +#define PWM_UPDATE		0x40000000
> +
> +/* The frequency range supported is 1Hz to 100MHz */
> +#define MIN_PERIOD_NS	10
> +#define MAX_PERIOD_NS	1000000000
> +
> +/*
> + * The max value specified for each field is based on the number of bits
> + * in the pwm control register for that field
> + */
> +#define MAX_PWM_CFG		0xFFFF
> +
> +#define PWM_CTRL_HI_SHIFT	16
> +
> +#define PWM_CFG_REG0 0 /*PWM_DIV PWM_HI*/
> +#define PWM_CFG_REG1 1 /*ENABLE UPDATE PWM_PRE_DIV*/
> +
> +struct ipq_pwm_chip {
> +	struct pwm_chip chip;
> +	struct clk *clk;
> +	void __iomem *mem;
> +};
> +
> +static struct ipq_pwm_chip *to_ipq_pwm_chip(struct pwm_chip *chip)
> +{
> +	return container_of(chip, struct ipq_pwm_chip, chip);
> +}
> +
> +static unsigned ipq_pwm_reg_offset(struct pwm_device *pwm, unsigned reg)
> +{
> +	return ((pwm->hwpwm * 2) + reg) * 4;
> +}
> +
> +static void config_div_and_duty(struct pwm_device *pwm, int pre_div,
> +			unsigned long long pwm_div, unsigned long period_ns,
> +			unsigned long long duty_ns)
> +{
> +	unsigned long hi_dur;
> +	unsigned long long quotient;
> +	unsigned long val =3D 0;
> +	struct ipq_pwm_chip *ipq_chip =3D to_ipq_pwm_chip(pwm->chip);
> +
> +	/*
> +	 * high duration =3D pwm duty * ( pwm div + 1)

s/( /(/

> +	 * pwm duty =3D duty_ns / period_ns
> +	 */
> +	quotient =3D (pwm_div + 1) * duty_ns;
> +	do_div(quotient, period_ns);
> +	hi_dur =3D quotient;
> +
> +	val |=3D ((hi_dur & MAX_PWM_CFG) << PWM_CTRL_HI_SHIFT);
> +	val |=3D (pwm_div & MAX_PWM_CFG);
> +	writel(val, ipq_chip->mem + ipq_pwm_reg_offset(pwm, PWM_CFG_REG0));
> +	val =3D pre_div & MAX_PWM_CFG;
> +	writel(val, ipq_chip->mem + ipq_pwm_reg_offset(pwm, PWM_CFG_REG1));
> +}
> +
> +static int ipq_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct ipq_pwm_chip *ipq_chip =3D to_ipq_pwm_chip(pwm->chip);
> +	unsigned offset =3D ipq_pwm_reg_offset(pwm, PWM_CFG_REG1);
> +	unsigned long val;
> +
> +	val =3D readl(ipq_chip->mem + offset);
> +	val |=3D (PWM_ENABLE | PWM_UPDATE);

The parenthesis are not needed here.

> +	writel(val, ipq_chip->mem + offset);
> +
> +	return 0;
> +}
> +
> +static void ipq_pwm_disable(struct pwm_chip *chip, struct pwm_device *pw=
m)
> +{
> +	struct ipq_pwm_chip *ipq_chip =3D to_ipq_pwm_chip(pwm->chip);
> +	unsigned offset =3D ipq_pwm_reg_offset(pwm, PWM_CFG_REG1);
> +	unsigned long val;
> +
> +	val =3D readl(ipq_chip->mem + offset);
> +	val |=3D PWM_UPDATE;

What is the effect of this register bit?

Does the output become inactive or does it freeze at state that happens
to be emitted when the ENABLE bit is removed?

> +	val &=3D ~PWM_ENABLE;
> +	writel(val, ipq_chip->mem + offset);
> +}
> +
> +static int ipq_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> +						int duty_ns, int period_ns)
> +{
> +	struct ipq_pwm_chip *ipq_chip =3D to_ipq_pwm_chip(chip);
> +	unsigned long freq;
> +	int pre_div, close_pre_div, close_pwm_div;
> +	int pwm_div;
> +	long long diff;
> +	unsigned long rate =3D clk_get_rate(ipq_chip->clk);
> +	unsigned long min_diff =3D rate;
> +	uint64_t fin_ps;
> +
> +	if (period_ns > MAX_PERIOD_NS || period_ns < MIN_PERIOD_NS) {
> +		pr_err("PWM Frequency range supported is %dHz to %dHz\n"
> +			"Switching to default configuration values\n",
> +		       (int)NSEC_PER_SEC / MAX_PERIOD_NS,
> +		       (int)NSEC_PER_SEC / MIN_PERIOD_NS);
> +		period_ns =3D DEFAULT_PERIOD_NS;
> +		duty_ns =3D DEFAULT_DUTY_CYCLE_NS;
> +		pwm->state.period =3D period_ns;
> +		pwm->state.duty_cycle =3D duty_ns;
> +	}

Please implement the biggest period not bigger than the requested
period. That is do something like:

	if (period_ns < MIN_PERIOD_NS)
		return -ERANGE;

	if (period_ns > MAX_PERIOD_NS)
		period_ns =3D MAX_PERIOD_NS;

> +
> +	/* freq in Hz for period in nano second*/
> +	freq =3D NSEC_PER_SEC / period_ns;
> +	fin_ps =3D (uint64_t)NSEC_PER_SEC * 1000;
> +	do_div(fin_ps, rate);
> +	close_pre_div =3D MAX_PWM_CFG;
> +	close_pwm_div =3D MAX_PWM_CFG;
> +
> +	ipq_pwm_disable(chip, pwm);

This is necessary?

> +	for (pre_div =3D 0; pre_div <=3D MAX_PWM_CFG; pre_div++) {
> +		pwm_div =3D DIV_ROUND_CLOSEST_ULL((uint64_t)period_ns * 1000,
> +							fin_ps * (pre_div + 1));
> +		pwm_div--;

What if pwm_div was 0 before? (Didn't check if this can happen, maybe it
doesn't with period_ns >=3D MIN_PERIOD_NS?)

> +		if (pwm_div <=3D MAX_PWM_CFG) {
> +			diff =3D (uint64_t)rate - ((uint64_t)freq * (pre_div + 1) * (pwm_div =
+ 1));
> +
> +			if (diff < 0)
> +				diff =3D -diff;
> +			if (!diff) {
> +				close_pre_div =3D pre_div;
> +				close_pwm_div =3D pwm_div;
> +				break;
> +			}
> +			if (diff < min_diff) {
> +				min_diff =3D diff;
> +				close_pre_div =3D pre_div;
> +				close_pwm_div =3D pwm_div;
> +			}

As written above: Never pick a period bigger than the requested period.

> +		}
> +	}
> +
> +	/* config divider values for the closest possible frequency */
> +	config_div_and_duty(pwm, close_pre_div, close_pwm_div,
> +					period_ns, duty_ns);

Please align follow up lines to the opening (.

> +	if (pwm->state.enabled)
> +		ipq_pwm_enable(chip, pwm);
> +
> +	return 0;
> +}
> +
> +static int ipq_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	pwm->state.period =3D DEFAULT_PERIOD_NS;
> +	pwm->state.duty_cycle =3D DEFAULT_DUTY_CYCLE_NS;
> +
> +	ipq_pwm_config(chip, pwm, pwm->state.duty_cycle, pwm->state.period);

=2Erequest is not supposed to modify the emitted wave form.

> +
> +	return 0;
> +}
> +
> +static void ipq_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	ipq_pwm_disable(chip, pwm);

neither is .free.

> +}
> +
> +static struct pwm_ops ipq_pwm_ops =3D {
> +	.request =3D ipq_pwm_request,
> +	.free =3D ipq_pwm_free,
> +	.config =3D ipq_pwm_config,
> +	.enable =3D ipq_pwm_enable,
> +	.disable =3D ipq_pwm_disable,

Please implement .apply instead of .config/.enable/.disable.

If you had enabled PWM_DEBUG during your tests you would have noticed
yourself ...

> +	.owner =3D THIS_MODULE,
> +};
> +
> +static int ipq_pwm_probe(struct platform_device *pdev)
> +{
> +	struct ipq_pwm_chip *pwm;
> +	struct device *dev;
> +	int ret;
> +
> +	dev =3D &pdev->dev;
> +	pwm =3D devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
> +	if (!pwm) {
> +		dev_err(dev, "failed to allocate memory\n");

You're not supposed to emit a message for -ENOMEM type errors. This is
already loud enough.

> +		return -ENOMEM;
> +	}
> +
> +	platform_set_drvdata(pdev, pwm);
> +
> +	pwm->mem =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pwm->mem))
> +		return PTR_ERR(pwm->mem);
> +
> +	pwm->clk =3D devm_clk_get(dev, "core");
> +	if (!IS_ERR(pwm->clk)) {

If devm_clk_get() returns an error you should return an error, too.
You might want to use devm_clk_get_optional().

> +		ret =3D clk_set_rate(pwm->clk, CLK_SRC_FREQ);
> +		if (ret)
> +			return ret;
> +		ret =3D clk_prepare_enable(pwm->clk);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	pwm->chip.dev =3D dev;
> +	pwm->chip.ops =3D &ipq_pwm_ops;
> +	pwm->chip.npwm =3D MAX_PWM_DEVICES;
> +
> +	ret =3D pwmchip_add(&pwm->chip);
> +	if (ret < 0) {
> +		dev_err(dev, "pwmchip_add() failed: %d\n", ret);
> +		return ret;

	return dev_err_probe(dev, ret, "...")

please. And you have to disable the clock again.

> +	}
> +
> +	return 0;
> +}
> +
> +static int ipq_pwm_remove(struct platform_device *pdev)
> +{
> +	struct ipq_pwm_chip *pwm =3D platform_get_drvdata(pdev);
> +
> +	return pwmchip_remove(&pwm->chip);

Please ignore the return value of pwmchip_remove(). This is eventually
changed to return void.

> +}
> +
> +static const struct of_device_id pwm_ipq_dt_match[] =3D {
> +	{ .compatible =3D "qcom,pwm-ipq6018", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, pwm_ipq_dt_match);
> +
> +static struct platform_driver ipq_pwm_driver =3D {
> +	.driver =3D {
> +		.name =3D "ipq-pwm",
> +		.owner =3D THIS_MODULE,
> +		.of_match_table =3D pwm_ipq_dt_match,
> +	},
> +	.probe =3D ipq_pwm_probe,
> +	.remove =3D ipq_pwm_remove,
> +};
> +
> +module_platform_driver(ipq_pwm_driver);
> +
> +MODULE_LICENSE("Dual BSD/GPL");

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--x5ruvoykr2iiy6l3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCpeRcACgkQwfwUeK3K
7AkTOAgAkRtz7rA0+t4kUXIp/1GBcpf7PQwI2Dexau55OLafk77uOYR5zQ2JwlJG
cv6cCRWO4rBfanooHR3hSIOmLZcuJ2PJH5zAUiotrTCxdBur+KT1dtHE5wcXxrbr
w43NunARwz5eqgrlnSQPnO0Z4s6NdohNTURatx1Kkrx441zN4+JGjbNNIFFF7UdL
7lF+oo2Maaip3iuOBPoHhvxKV43YtrdHZH9mDfTvQdOBF422FvG14EJoetemb6s1
Jt3Jq7pijnBEqBsUp/I4pLG1HcmN+wEYVqxZI4cEIQJnFOkA1LRuAixuW6lM3zRo
SSskrh+8a74qvx22/CffbYZ8BcQxxA==
=Pdmk
-----END PGP SIGNATURE-----

--x5ruvoykr2iiy6l3--
