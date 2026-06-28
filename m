Return-Path: <linux-arm-msm+bounces-114778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id um7KGcAmQWp1lgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:50:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0346D3EEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:50:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WnItMHFJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114778-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114778-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DED6300D958
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 13:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2043A9D9B;
	Sun, 28 Jun 2026 13:50:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5E3A7F66;
	Sun, 28 Jun 2026 13:50:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782654642; cv=none; b=lsMjVrQ8CXUhQahK9gLq0hmFS6KJDPaBlnoXmUJO0k1sf2HKe5ahAVLdQx79c9rSyhP/FNWkbkWZvciS4d/FfhkvActwxe1C9hWReEl63bQo0E5Qjd7EDrJBsYsPAq1MjlFQ2ExkISNgFWfXbULiFJGV0jH3uU7fDnngVlTia5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782654642; c=relaxed/simple;
	bh=24czFDNexFqMTV9H7FJ9X6RRb8NwHRNjErZxoVFkYyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoiPJM+PnYdPpODkFkNDoFGcVfEmkCbmms3oMsOMVGNIp5UgwtdCHetd+JpsIPlWhS4LaAKD20ynxGqYD+cyWadNdX4Wfr/+QHmMbDrECox+8sHjmCEq0UG7Rc5Baz+rmciIWMiMbvuuiOgdLWaj0Dgkg6jKP9z+5tmHLPjVjKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnItMHFJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FCC1F000E9;
	Sun, 28 Jun 2026 13:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782654638;
	bh=xlQc4S5S+9+7oM3k3C085Mj7tgc995soVZru600tbR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WnItMHFJAHtjmWZhO48zXDsStZ3cBBFzCsGUaN+Y1rhBt+sz8K3qpjo1+gn45q29p
	 Bra7CK/JyNtor0zhjodF9pEofqvJz7gEoixlGZCMrYFpbKnKHOOoO+Hr/HaM2XqcNU
	 yyP5Jq4LMO0gHKSeTlu/NLN1NjXhQlX55NzL/7vp/DphM+gJ1lKIOLP+ulE4khTmvE
	 /0Dqt6ciI0bzixdTsiBHOJ0fL1Mf6qXOV2+v5KeEEL0cVKF7zn5nJ7nohhYRxtJfrb
	 V38GDp2vSbrO32TA3ktx5A711z2uSxPnNaPJ+UvrlBnoU1aisf3Jswuax9xey1HCFT
	 y4RGKp13Dq67Q==
Received: by venus (Postfix, from userid 1000)
	id 79AFD1806EB; Sun, 28 Jun 2026 15:50:36 +0200 (CEST)
Date: Sun, 28 Jun 2026 15:50:36 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net, 
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
Message-ID: <akEj6XEByCOkuJaY@venus>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eicngpqne546liam"
Content-Disposition: inline
In-Reply-To: <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114778-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[sre@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sre@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,venus:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA0346D3EEC


--eicngpqne546liam
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
MIME-Version: 1.0

Hi,

On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
>=20
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
>=20
> Additionally, expose the system fan speed by reading the fan RPM
> registers from the embedded controller.
>=20
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures and fan speed.
>=20
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---

I gave this a try and for me the fan data is always 65535 (i.e. -1):

$ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
t14s_ec
65535

This is with the fan running:

$ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
fan-controller
2564

The thermal data looks good.

Greetings,

-- Sebastian

>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>=20
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-t14s.c
> index 5590302a5694..142464623f0e 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> +#include <linux/hwmon.h>
>  #include <linux/i2c.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> @@ -67,6 +68,16 @@
>  #define T14S_EC_EVT_KEY_FN_F11			0x7a
>  #define T14S_EC_EVT_KEY_FN_G			0x7e
> =20
> +#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
> +#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
> +#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
> +#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
> +#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
> +#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
> +
> +#define T14S_EC_FAN_RPM_LSB 0x84
> +#define T14S_EC_FAN_RPM_MSB 0x85
> +
>  /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
>  #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
> =20
> @@ -93,9 +104,19 @@ struct t14s_ec_led_classdev {
>  	struct t14s_ec *ec;
>  };
> =20
> +struct t14s_ec_hwmon_sys_thermx {
> +	const char *label;
> +	int reg;
> +};
> +
> +struct t14s_ec_hwmon {
> +	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
> +};
> +
>  struct t14s_ec {
>  	struct regmap *regmap;
>  	struct device *dev;
> +	struct t14s_ec_hwmon ec_hwmon;
>  	struct t14s_ec_led_classdev led_pwr_btn;
>  	struct t14s_ec_led_classdev led_chrg_orange;
>  	struct t14s_ec_led_classdev led_chrg_white;
> @@ -555,6 +576,128 @@ static irqreturn_t t14s_ec_irq_handler(int irq, voi=
d *data)
>  	return IRQ_HANDLED;
>  }
> =20
> +static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
> +					enum hwmon_sensor_types type,
> +					u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		return 0444;
> +	case hwmon_fan:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sens=
or_types type,
> +				     u32 attr, int channel, const char **str)
> +{
> +	struct t14s_ec *ec =3D dev_get_drvdata(dev);
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr =3D=3D hwmon_temp_label) {
> +			*str =3D ec->ec_hwmon.sys_thermx[channel].label;
> +			return 0;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct t14s_ec *ec =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr =3D=3D hwmon_temp_input) {
> +			ret =3D t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, &value=
);
> +			if (ret)
> +				return ret;
> +			*val =3D value * 1000;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	case hwmon_fan:
> +		if (attr =3D=3D hwmon_fan_input) {
> +			int lsb, msb;
> +			ret =3D t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
> +			if (ret)
> +				return ret;
> +
> +			ret =3D t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
> +			if (ret)
> +				return ret;
> +
> +			*val =3D 0;
> +			*val =3D lsb + (msb << 8);
> +
> +			return 0;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct hwmon_ops t14s_ec_hwmon_ops =3D {
> +	.is_visible =3D t14s_ec_hwmon_is_visible,
> +	.read =3D t14s_ec_hwmon_read,
> +	.read_string =3D t14s_ec_hwmon_read_string,
> +};
> +
> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] =3D {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info t14s_ec_chip_info =3D {
> +	.ops =3D &t14s_ec_hwmon_ops,
> +	.info =3D t14s_ec_hwmon_info,
> +};
> +
> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> +{
> +	struct device *dev;
> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] =3D {
> +		{ T14S_EC_SYS_THERM0, "soc" },
> +		{ T14S_EC_SYS_THERM1, "keyboard" },
> +		{ T14S_EC_SYS_THERM2, "base" },
> +		{ T14S_EC_SYS_THERM3, "pmbm" },
> +		{ T14S_EC_SYS_THERM6, "qtm" },
> +		{ T14S_EC_SYS_THERM7, "ssd" },
> +	};
> +
> +	ec->ec_hwmon.sys_thermx =3D devm_kmemdup_array(ec->dev, sys_thermx,
> +						     ARRAY_SIZE(sys_thermx),
> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
> +	if (!ec->ec_hwmon.sys_thermx)
> +		return -ENOMEM;
> +
> +	dev =3D devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
> +						   &t14s_ec_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(dev);
> +}
> +
>  static int t14s_ec_probe(struct i2c_client *client)
>  {
>  	struct device *dev =3D &client->dev;
> @@ -590,6 +733,10 @@ static int t14s_ec_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
> =20
> +	ret =3D t14s_ec_hwmon_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
>  					t14s_ec_irq_handler,
>  					IRQF_ONESHOT, dev_name(dev), ec);
> --=20
> 2.53.0
>=20

--eicngpqne546liam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpBJqUACgkQ2O7X88g7
+ppHLw/+KxjxxxXrhvZJHN8tV3E92FRDa4fXs+Rvpp5uHpbmxHLBIZ0Pc2PuX1JD
2DHnkJstJl0kfKJdZ+A6Vel/GDni1sJgWSLl7XnZOzF/RBznz2wUZL9DwJBnyeNl
RzgOOrPPB7NPDeMH6tiTt09SNOfI2971nxMLItx4RKozkbJM41yVt8H13mnSIRgY
F8xpa1Zcv6DZ6u7q8DkHT4+238QsH2iToNxf16qI6QsbzAyMVfE8RSNDgLrCwe3M
ez+lm1uJl4nOHMUlUsyBGJEnwOGJt6S7e6A3UlWJaWWVyOnXGm1Cf862GT0VyNgd
BAMnABwn1VLzoMjWhzbQ/ZPGNkMoAYxERy0QLqRsaa/cvO1enWKySm7HQii5Z063
djpjU7YJ9sjojdingAML7dbeARuqPH7a4Oa6JiugsAUf3l3o7w+HllfnlAdOOrR3
Wh+vXB24ZlSvoqIeSuzCotOGrTfnmcD84CyIfXFSLnckoEJ48wv6I6vmFlgyQ2SS
Y4bSiQh8+y8XQnX/jDtO8YbXW1oQ2B4J0L2v7okQFYkMfKZH/vP2T4qOVSYLstdw
YBDpCjWSYr+nWEqSg1fvHOThTGlDmWFadtpa4OTOW4ScXAnU6Qfl2MXiDsrwu4xt
k4NeTt3t7ESVQc/Wp9RO3HSUqGu1WCpMvvzXwvWFV7sdZ4R3lt0=
=gklp
-----END PGP SIGNATURE-----

--eicngpqne546liam--

