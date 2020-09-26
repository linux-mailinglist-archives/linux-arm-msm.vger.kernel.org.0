Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8228279ACB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 18:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbgIZQ2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 12:28:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:32780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729960AbgIZQ2h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 12:28:37 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30F2A21D95;
        Sat, 26 Sep 2020 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601137716;
        bh=tAOkEq+Uq4aZCc8Thn8EfXKEczi/Z4vaECBoh1u9kv4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qaz5ywQ6Hgxqf+uXzC3XNF6nj9FYDzAbGHyNvpeQvWd2eNC1NAlaypLjHNVJqREaE
         L33ILOOiXx0kpHxbs/ZRYU7HvW0vzSilxihTxrLGeYMrCe3YilvvfcFv3BtFSfS1yi
         leEBE7Co69IxK01rmx8LvfRwnEVLGumeoDhVvXKI=
Date:   Sat, 26 Sep 2020 17:28:31 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     kholk11@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iio: adc: qcom-spmi-vadc: Use right ratiometric
 range for 8998,660,845
Message-ID: <20200926172831.4774b444@archlinux>
In-Reply-To: <20200926131009.14483-1-kholk11@gmail.com>
References: <20200926131009.14483-1-kholk11@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 26 Sep 2020 15:10:08 +0200
kholk11@gmail.com wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>=20
> The ratiometric range for MSM8998, SDM630/636/660 and SDM845 is 1875mV
> instead of the standard 1800mV: address this by adding a new compatible
> "qcom,spmi-vadc-8998" and assigning the different range to the machines
> declaring this one.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>

Please resend series making sure to cc
linux-iio@vger.kernel.org=20

=46rom a quick glance, patch looks fine.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/qcom-spmi-vadc.c   | 10 +++++++++-
>  drivers/iio/adc/qcom-vadc-common.h |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/adc/qcom-spmi-vadc.c b/drivers/iio/adc/qcom-spmi=
-vadc.c
> index b0388f8a69f4..59a94ea7bf78 100644
> --- a/drivers/iio/adc/qcom-spmi-vadc.c
> +++ b/drivers/iio/adc/qcom-spmi-vadc.c
> @@ -101,6 +101,7 @@ struct vadc_channel_prop {
>   * @dev: pointer to struct device.
>   * @base: base address for the ADC peripheral.
>   * @nchannels: number of VADC channels.
> + * @ratio_range: ratiometric range for ref points.
>   * @chan_props: array of VADC channel properties.
>   * @iio_chans: array of IIO channels specification.
>   * @are_ref_measured: are reference points measured.
> @@ -114,6 +115,7 @@ struct vadc_priv {
>  	struct device		 *dev;
>  	u16			 base;
>  	unsigned int		 nchannels;
> +	unsigned int		 ratio_range;
>  	struct vadc_channel_prop *chan_props;
>  	struct iio_chan_spec	 *iio_chans;
>  	bool			 are_ref_measured;
> @@ -355,7 +357,7 @@ static int vadc_measure_ref_points(struct vadc_priv *=
vadc)
>  	u16 read_1, read_2;
>  	int ret;
> =20
> -	vadc->graph[VADC_CALIB_RATIOMETRIC].dx =3D VADC_RATIOMETRIC_RANGE;
> +	vadc->graph[VADC_CALIB_RATIOMETRIC].dx =3D vadc->ratio_range;
>  	vadc->graph[VADC_CALIB_ABSOLUTE].dx =3D VADC_ABSOLUTE_RANGE_UV;
> =20
>  	prop =3D vadc_get_channel(vadc, VADC_REF_1250MV);
> @@ -885,6 +887,11 @@ static int vadc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	if (of_device_is_compatible(node, "qcom,spmi-vadc-8998"))
> +		vadc->ratio_range =3D VADC_RATIOMETRIC_RANGE_8998;
> +	else
> +		vadc->ratio_range =3D VADC_RATIOMETRIC_RANGE;
> +
>  	irq_eoc =3D platform_get_irq(pdev, 0);
>  	if (irq_eoc < 0) {
>  		if (irq_eoc =3D=3D -EPROBE_DEFER || irq_eoc =3D=3D -EINVAL)
> @@ -918,6 +925,7 @@ static int vadc_probe(struct platform_device *pdev)
> =20
>  static const struct of_device_id vadc_match_table[] =3D {
>  	{ .compatible =3D "qcom,spmi-vadc" },
> +	{ .compatible =3D "qcom-spmi-vadc-8998" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, vadc_match_table);
> diff --git a/drivers/iio/adc/qcom-vadc-common.h b/drivers/iio/adc/qcom-va=
dc-common.h
> index 17b2fc4d8bf2..b10d5fd59034 100644
> --- a/drivers/iio/adc/qcom-vadc-common.h
> +++ b/drivers/iio/adc/qcom-vadc-common.h
> @@ -16,6 +16,7 @@
> =20
>  #define VADC_ABSOLUTE_RANGE_UV			625000
>  #define VADC_RATIOMETRIC_RANGE			1800
> +#define VADC_RATIOMETRIC_RANGE_8998		1875
> =20
>  #define VADC_DEF_PRESCALING			0 /* 1:1 */
>  #define VADC_DEF_DECIMATION			0 /* 512 */

