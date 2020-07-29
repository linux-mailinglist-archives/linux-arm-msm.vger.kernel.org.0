Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C15523170E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 03:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgG2BIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 21:08:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:39474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726004AbgG2BIa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 21:08:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B97CD2078E;
        Wed, 29 Jul 2020 01:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595984909;
        bh=rP+oO1f0p0hdp8RPZkaMACRVsB3v3tvsofudy+tPeBY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cbCUbrOFqA4hWGHPsMtApqYG3zf+PL9Mr0CE/1pyVkrn5OSU8kKFcPBRPWXcW9uX/
         dJHWvWH2gQDMDVTvPQBeycqDCXJEjtxFxFLSQ5KVJT18TuM7i6ORzKBwa/sxyAh2B8
         ggteVBj0Wk73UxJWsAmBAva5ucSSHpKhXooW0SH8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f22bb151d836f924b09cf80ffd6e58eb286be5d6.1595612650.git.gurus@codeaurora.org>
References: <f22bb151d836f924b09cf80ffd6e58eb286be5d6.1595612650.git.gurus@codeaurora.org>
Subject: Re: [RESEND PATCH v1 1/2] thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 1 PMIC peripherals
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Tue, 28 Jul 2020 18:08:28 -0700
Message-ID: <159598490848.1360974.3638464473515157786@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Guru Das Srinagesh (2020-07-24 10:46:10)
> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/therma=
l/qcom/qcom-spmi-temp-alarm.c
> index bf7bae4..05a9601 100644
> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> @@ -38,26 +39,30 @@
> =20
>  #define ALARM_CTRL_FORCE_ENABLE                BIT(7)
> =20
> -/*
> - * Trip point values based on threshold control
> - * 0 =3D {105 C, 125 C, 145 C}
> - * 1 =3D {110 C, 130 C, 150 C}
> - * 2 =3D {115 C, 135 C, 155 C}
> - * 3 =3D {120 C, 140 C, 160 C}
> -*/
> -#define TEMP_STAGE_STEP                        20000   /* Stage step: 20=
.000 C */
> -#define TEMP_STAGE_HYSTERESIS          2000
> +#define THRESH_COUNT                   4
> +#define STAGE_COUNT                    3
> +
> +/* Over-temperature trip point values in mC */
> +static const long temp_map_gen1[THRESH_COUNT][STAGE_COUNT] =3D {
> +       {105000, 125000, 145000},

Please add a space after { and before }

> +       {110000, 130000, 150000},
> +       {115000, 135000, 155000},
> +       {120000, 140000, 160000},
> +};
> +
> +static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] =3D {
> +       { 90000, 110000, 140000},

Almost.

> +       { 95000, 115000, 145000},
> +       {100000, 120000, 150000},
> +       {105000, 125000, 155000},
> +};
> =20
> -#define TEMP_THRESH_MIN                        105000  /* Threshold Min:=
 105 C */
> -#define TEMP_THRESH_STEP               5000    /* Threshold step: 5 C */
> +#define TEMP_THRESH_STEP               5000 /* Threshold step: 5 C */
> =20
>  #define THRESH_MIN                     0
>  #define THRESH_MAX                     3
> =20
> -/* Stage 2 Threshold Min: 125 C */
> -#define STAGE2_THRESHOLD_MIN           125000
> -/* Stage 2 Threshold Max: 140 C */
> -#define STAGE2_THRESHOLD_MAX           140000
> +#define TEMP_STAGE_HYSTERESIS          2000
> =20
>  /* Temperature in Milli Celsius reported during stage 0 if no ADC is pre=
sent */
>  #define DEFAULT_TEMP                   37000
> @@ -77,6 +82,7 @@ struct qpnp_tm_chip {
>         bool                            initialized;
> =20
>         struct iio_channel              *adc;
> +       const long                      (*temp_map)[THRESH_COUNT][STAGE_C=
OUNT];

It can be negative Celsius?

>  };
> =20
>  /* This array maps from GEN2 alarm state to GEN1 alarm stage */
> @@ -101,6 +107,23 @@ static int qpnp_tm_write(struct qpnp_tm_chip *chip, =
u16 addr, u8 data)
>  }
> =20
>  /**
> + * qpnp_tm_decode_temp() - return temperature in mC corresponding to the
> + *             specified over-temperature stage
> + * @chip:              Pointer to the qpnp_tm chip
> + * @stage:             Over-temperature stage
> + *
> + * Return: temperature in mC
> + */
> +static long qpnp_tm_decode_temp(struct qpnp_tm_chip *chip, unsigned int =
stage)
> +{
> +       if (!chip->temp_map || chip->thresh >=3D THRESH_COUNT || stage =
=3D=3D 0
> +           || stage > STAGE_COUNT)

Nitpick: The || goes on the line above.

> +               return 0;
> +
> +       return (*chip->temp_map)[chip->thresh][stage - 1];
> +}
> +
> +/**
>   * qpnp_tm_get_temp_stage() - return over-temperature stage
>   * @chip:              Pointer to the qpnp_tm chip
>   *
