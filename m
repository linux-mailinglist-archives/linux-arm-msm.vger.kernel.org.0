Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64605C4413
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 01:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbfJAXAy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 19:00:54 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41309 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbfJAXAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 19:00:54 -0400
Received: by mail-qt1-f193.google.com with SMTP id d16so3254225qtq.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 16:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fCHqS8IQE+2Wp1e4gbSf3pznMVS0GQOPGzcJqzHzmt8=;
        b=zG9kgwvN3AVFLJJV/gPTDKsMjaUGUbEZg037LFSYHAcgqmtfAke+IYFTUqsd2uEmJ/
         PD4JUu0yoPeAjNIikwqaEcF7ZsqSRbx5tQEY0JdcswKvNKAFvLM9Cfn+GX1V/EVmC46W
         6trsf9zhHAQDOVmklYH3UMscHw3H7I1wDRdcjgP+fA9McSS6/63W0/eEDJdOF+P9qGpO
         n+doOoRBVqi3qUXjAQw8bj48mJJLLRZvB27bArXrIYgfxixJj/CTEOZb4RVt8wdCiwfw
         a3bJrDgnTQp2Z/hRJlT0jHmHcpMdQ7kJHpd6UavWnh2sBpnXK6Fk2BSWM2jlHjI1z71i
         l+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fCHqS8IQE+2Wp1e4gbSf3pznMVS0GQOPGzcJqzHzmt8=;
        b=GjkEN+510MT1n+hyZvGJdwrn/e5vL64D19YgLBG9B9v3baYhAZsF5MbSeY6+/Xh3bR
         iZVErcSScI+y4RB9yAjuhKuCa18knAf1pscEtXe4l8rlE7uxgUhb00kUVQbjT2TYrPwQ
         e7bH9oKN8L6mxlOL82eiuKM4M9gaDEGDTIhaU5xy8XtR6lvLC4d2+VtSk6LoscBcNago
         kidt6VNaPJUfKZTNoSOVuOZ0e7/mYfNiNjqOOFIvj45y7UK0GmjDVUd/ylaw8VALyj6i
         gZfAp6vPjo9UVYHPcTzsBqRgjJ63TZilNgLCpAUT/xO29T4a1GZr5fu/QfnMBCA/rHwL
         Y7dQ==
X-Gm-Message-State: APjAAAV7n74GAruRoDRi7qLkFa+15EmnQfjM5guXXJKPvBsCLfGTP2os
        Pv81t/dLjxqDQdjcE9BLola+OPUwb6EpGCr/oiO6/A==
X-Google-Smtp-Source: APXvYqzZgA8m2FfqC4dlWxijjkMJidFcUhsoTF63zELjU4txL5dlchpket4Hv8OT2LmqULqzeD8Y3oGiCgqjYBBkBso=
X-Received: by 2002:ac8:4597:: with SMTP id l23mr948566qtn.284.1569970852636;
 Tue, 01 Oct 2019 16:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191001085707.8424-1-kholk11@gmail.com> <20191001085707.8424-2-kholk11@gmail.com>
In-Reply-To: <20191001085707.8424-2-kholk11@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Wed, 2 Oct 2019 04:30:41 +0530
Message-ID: <CAP245DXyPraU_cL6PezSLL8sHP7-JQ6J-qtjqfV6eOxmhOb9pg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] thermal: qcom: tsens-v1: Add support for MSM8956
 and MSM8976
To:     kholk11@gmail.com
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 1, 2019 at 2:27 PM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add support for reading calibrated value from thermistors in
> MSM8956, MSM8976 and their APQ variants.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/thermal/qcom/tsens-v1.c | 167 +++++++++++++++++++++++++++++++-
>  drivers/thermal/qcom/tsens.c    |   3 +
>  drivers/thermal/qcom/tsens.h    |   2 +-
>  3 files changed, 170 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index 10b595d4f619..04af13085eb5 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -18,6 +18,68 @@
>  #define TM_Sn_STATUS_OFF                       0x0044
>  #define TM_TRDY_OFF                            0x0084
>
> +/* eeprom layout data for msm8956/76 (v1) */
> +#define MSM8976_BASE0_MASK     0xff
> +#define MSM8976_BASE1_MASK     0xff
> +#define MSM8976_BASE1_SHIFT    8
> +
> +#define MSM8976_S0_P1_MASK     0x3f00
> +#define MSM8976_S1_P1_MASK     0x3f00000
> +#define MSM8976_S2_P1_MASK     0x3f
> +#define MSM8976_S3_P1_MASK     0x3f000
> +#define MSM8976_S4_P1_MASK     0x3f00
> +#define MSM8976_S5_P1_MASK     0x3f00000
> +#define MSM8976_S6_P1_MASK     0x3f
> +#define MSM8976_S7_P1_MASK     0x3f000
> +#define MSM8976_S8_P1_MASK     0x1f8
> +#define MSM8976_S9_P1_MASK     0x1f8000
> +#define MSM8976_S10_P1_MASK    0xf8000000
> +#define MSM8976_S10_P1_MASK_1  0x1
> +
> +#define MSM8976_S0_P2_MASK     0xfc000
> +#define MSM8976_S1_P2_MASK     0xfc000000
> +#define MSM8976_S2_P2_MASK     0xfc0
> +#define MSM8976_S3_P2_MASK     0xfc0000
> +#define MSM8976_S4_P2_MASK     0xfc000
> +#define MSM8976_S5_P2_MASK     0xfc000000
> +#define MSM8976_S6_P2_MASK     0xfc0
> +#define MSM8976_S7_P2_MASK     0xfc0000
> +#define MSM8976_S8_P2_MASK     0x7e00
> +#define MSM8976_S9_P2_MASK     0x7e00000
> +#define MSM8976_S10_P2_MASK    0x7e
> +
> +#define MSM8976_S0_P1_SHIFT    8
> +#define MSM8976_S1_P1_SHIFT    20
> +#define MSM8976_S2_P1_SHIFT    0
> +#define MSM8976_S3_P1_SHIFT    12
> +#define MSM8976_S4_P1_SHIFT    8
> +#define MSM8976_S5_P1_SHIFT    20
> +#define MSM8976_S6_P1_SHIFT    0
> +#define MSM8976_S7_P1_SHIFT    12
> +#define MSM8976_S8_P1_SHIFT    3
> +#define MSM8976_S9_P1_SHIFT    15
> +#define MSM8976_S10_P1_SHIFT   27
> +#define MSM8976_S10_P1_SHIFT_1 0
> +
> +#define MSM8976_S0_P2_SHIFT    14
> +#define MSM8976_S1_P2_SHIFT    26
> +#define MSM8976_S2_P2_SHIFT    6
> +#define MSM8976_S3_P2_SHIFT    18
> +#define MSM8976_S4_P2_SHIFT    14
> +#define MSM8976_S5_P2_SHIFT    26
> +#define MSM8976_S6_P2_SHIFT    6
> +#define MSM8976_S7_P2_SHIFT    18
> +#define MSM8976_S8_P2_SHIFT    9
> +#define MSM8976_S9_P2_SHIFT    21
> +#define MSM8976_S10_P2_SHIFT   1
> +
> +#define MSM8976_CAL_SEL_MASK   0x3
> +
> +#define MSM8976_CAL_DEGC_PT1   30
> +#define MSM8976_CAL_DEGC_PT2   120
> +#define MSM8976_SLOPE_FACTOR   1000
> +#define MSM8976_SLOPE_DEFAULT  3200
> +
>  /* eeprom layout data for qcs404/405 (v1) */
>  #define BASE0_MASK     0x000007f8
>  #define BASE1_MASK     0x0007f800
> @@ -77,6 +139,30 @@
>  #define CAL_SEL_MASK   7
>  #define CAL_SEL_SHIFT  0
>
> +static void compute_intercept_slope_8976(struct tsens_priv *priv,
> +                             u32 *p1, u32 *p2, u32 mode)
> +{
> +       int i;
> +
> +       priv->sensor[0].slope = 3313;
> +       priv->sensor[1].slope = 3275;
> +       priv->sensor[2].slope = 3320;
> +       priv->sensor[3].slope = 3246;
> +       priv->sensor[4].slope = 3279;
> +       priv->sensor[5].slope = 3257;
> +       priv->sensor[6].slope = 3234;
> +       priv->sensor[7].slope = 3269;
> +       priv->sensor[8].slope = 3255;
> +       priv->sensor[9].slope = 3239;
> +       priv->sensor[10].slope = 3286;
> +
> +       for (i = 0; i < priv->num_sensors; i++) {
> +               priv->sensor[i].offset = (p1[i] * MSM8976_SLOPE_FACTOR) -
> +                               (MSM8976_CAL_DEGC_PT1 *
> +                               priv->sensor[i].slope);
> +       }
> +}
> +
>  static int calibrate_v1(struct tsens_priv *priv)
>  {
>         u32 base0 = 0, base1 = 0;
> @@ -142,7 +228,71 @@ static int calibrate_v1(struct tsens_priv *priv)
>         return 0;
>  }
>
> -/* v1.x: qcs404,405 */
> +static int calibrate_8976(struct tsens_priv *priv)
> +{
> +       int base0 = 0, base1 = 0, i;
> +       u32 p1[11], p2[11];
> +       int mode = 0, tmp = 0;
> +       u32 *qfprom_cdata;
> +
> +       qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
> +       if (IS_ERR(qfprom_cdata))

kfree(qfprom_data) here

> +               return PTR_ERR(qfprom_cdata);
> +
> +       mode = (qfprom_cdata[4] & MSM8976_CAL_SEL_MASK);
> +       dev_dbg(priv->dev, "calibration mode is %d\n", mode);
> +
> +       switch (mode) {
> +       case TWO_PT_CALIB:
> +               base1 = (qfprom_cdata[2] & MSM8976_BASE1_MASK) >> MSM8976_BASE1_SHIFT;
> +               p2[0] = (qfprom_cdata[0] & MSM8976_S0_P2_MASK) >> MSM8976_S0_P2_SHIFT;
> +               p2[1] = (qfprom_cdata[0] & MSM8976_S1_P2_MASK) >> MSM8976_S1_P2_SHIFT;
> +               p2[2] = (qfprom_cdata[1] & MSM8976_S2_P2_MASK) >> MSM8976_S2_P2_SHIFT;
> +               p2[3] = (qfprom_cdata[1] & MSM8976_S3_P2_MASK) >> MSM8976_S3_P2_SHIFT;
> +               p2[4] = (qfprom_cdata[2] & MSM8976_S4_P2_MASK) >> MSM8976_S4_P2_SHIFT;
> +               p2[5] = (qfprom_cdata[2] & MSM8976_S5_P2_MASK) >> MSM8976_S5_P2_SHIFT;
> +               p2[6] = (qfprom_cdata[3] & MSM8976_S6_P2_MASK) >> MSM8976_S6_P2_SHIFT;
> +               p2[7] = (qfprom_cdata[3] & MSM8976_S7_P2_MASK) >> MSM8976_S7_P2_SHIFT;
> +               p2[8] = (qfprom_cdata[4] & MSM8976_S8_P2_MASK) >> MSM8976_S8_P2_SHIFT;
> +               p2[9] = (qfprom_cdata[4] & MSM8976_S9_P2_MASK) >> MSM8976_S9_P2_SHIFT;
> +               p2[10] = (qfprom_cdata[5] & MSM8976_S10_P2_MASK) >> MSM8976_S10_P2_SHIFT;
> +
> +               for (i = 0; i < priv->num_sensors; i++)
> +                       p2[i] = ((base1 + p2[i]) << 2);
> +               /* Fall through */
> +       case ONE_PT_CALIB2:
> +               base0 = qfprom_cdata[0] & MSM8976_BASE0_MASK;
> +               p1[0] = (qfprom_cdata[0] & MSM8976_S0_P1_MASK) >> MSM8976_S0_P1_SHIFT;
> +               p1[1] = (qfprom_cdata[0] & MSM8976_S1_P1_MASK) >> MSM8976_S1_P1_SHIFT;
> +               p1[2] = (qfprom_cdata[1] & MSM8976_S2_P1_MASK) >> MSM8976_S2_P1_SHIFT;
> +               p1[3] = (qfprom_cdata[1] & MSM8976_S3_P1_MASK) >> MSM8976_S3_P1_SHIFT;
> +               p1[4] = (qfprom_cdata[2] & MSM8976_S4_P1_MASK) >> MSM8976_S4_P1_SHIFT;
> +               p1[5] = (qfprom_cdata[2] & MSM8976_S5_P1_MASK) >> MSM8976_S5_P1_SHIFT;
> +               p1[6] = (qfprom_cdata[3] & MSM8976_S6_P1_MASK) >> MSM8976_S6_P1_SHIFT;
> +               p1[7] = (qfprom_cdata[3] & MSM8976_S7_P1_MASK) >> MSM8976_S7_P1_SHIFT;
> +               p1[8] = (qfprom_cdata[4] & MSM8976_S8_P1_MASK) >> MSM8976_S8_P1_SHIFT;
> +               p1[9] = (qfprom_cdata[4] & MSM8976_S9_P1_MASK) >> MSM8976_S9_P1_SHIFT;
> +               p1[10] = (qfprom_cdata[4] & MSM8976_S10_P1_MASK) >> MSM8976_S10_P1_SHIFT;
> +               tmp = (qfprom_cdata[5] & MSM8976_S10_P1_MASK_1) << MSM8976_S10_P1_SHIFT_1;
> +               p1[10] |= tmp;
> +
> +               for (i = 0; i < priv->num_sensors; i++)
> +                       p1[i] = (((base0) + p1[i]) << 2);
> +               break;
> +       default:
> +               for (i = 0; i < priv->num_sensors; i++) {
> +                       p1[i] = 500;
> +                       p2[i] = 780;
> +               }
> +               break;
> +       }
> +
> +       compute_intercept_slope_8976(priv, p1, p2, mode);
> +

kfree(qfprom_data) here

> +       return 0;
> +}
> +
> +/* v1.x: msm8956,8976,qcs404,405 */
>
>  static const struct tsens_features tsens_v1_feat = {
>         .ver_major      = VER_1_X,
> @@ -191,3 +341,18 @@ const struct tsens_plat_data data_tsens_v1 = {
>         .feat           = &tsens_v1_feat,
>         .fields = tsens_v1_regfields,
>  };
> +
> +static const struct tsens_ops ops_8976 = {
> +       .init           = init_common,
> +       .calibrate      = calibrate_8976,
> +       .get_temp       = get_temp_tsens_valid,
> +};
> +
> +/* Valid for both MSM8956 and MSM8976. Sensor ID 3 is unused. */
> +const struct tsens_plat_data data_8976 = {
> +       .num_sensors    = 11,
> +       .ops            = &ops_8976,
> +       .hw_ids         = (unsigned int[]){0, 1, 2, 4, 5, 6, 7, 8, 9, 10},
> +       .feat           = &tsens_v1_feat,
> +       .fields         = tsens_v1_regfields,
> +};
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index 0627d8615c30..24bb05e0eaf8 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -60,6 +60,9 @@ static const struct of_device_id tsens_table[] = {
>         }, {
>                 .compatible = "qcom,msm8974-tsens",
>                 .data = &data_8974,
> +       }, {
> +               .compatible = "qcom,msm8976-tsens",
> +               .data = &data_8976,
>         }, {
>                 .compatible = "qcom,msm8996-tsens",
>                 .data = &data_8996,
> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index 2fd94997245b..8efec747bfcb 100644
> --- a/drivers/thermal/qcom/tsens.h
> +++ b/drivers/thermal/qcom/tsens.h
> @@ -323,7 +323,7 @@ extern const struct tsens_plat_data data_8960;
>  extern const struct tsens_plat_data data_8916, data_8974;
>
>  /* TSENS v1 targets */
> -extern const struct tsens_plat_data data_tsens_v1;
> +extern const struct tsens_plat_data data_tsens_v1, data_8976;
>
>  /* TSENS v2 targets */
>  extern const struct tsens_plat_data data_8996, data_tsens_v2;
> --
> 2.21.0
>
