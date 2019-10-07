Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78035CDB3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 07:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfJGFMP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 01:12:15 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:36158 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfJGFMP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 01:12:15 -0400
Received: by mail-ua1-f68.google.com with SMTP id r25so3650094uam.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2019 22:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eR2o09jzOX3Z3gDtgyumeyC4LEZUkcoqXDZvAwhhjR4=;
        b=ASFRrY4RlLRVzlC3q1xgoDDU2PoD7MjngJpjBbm6t5qBXGArj7ok9U7E4kF4KCDt7g
         10jG8kHZk+itcp+vr76bTyq0PiQQds1bwisVpFo/pNXUVNV/tH56eSIlYbhDhWYQvezm
         9DN26VRKxzbMTWfPEbblLSK6fvot9ftkaNKAXxuwGOA5kI3bfReQWJ83VHJMWz0GqH+j
         wZl9kATO+HX8qy0Jin7jDXsFAoUUQPoOgj0PS1R9Mrc2ubP2V8MlGebyvA8fq2sZxQak
         zvLGJldjv7Bu+HFsFgweepEOspwNMUtqVJ1HkfcNA2o5yMsUrbs66bu7Q6j9yv1niGoE
         ysZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eR2o09jzOX3Z3gDtgyumeyC4LEZUkcoqXDZvAwhhjR4=;
        b=TGeoCspx5Ygoe6e++2kmEHbdrrTaW4+w8qnL6raqVbuz+8wjbI3UC5naPWFgAc+83E
         05okhUgDozdp6mUNIFva27Y64oRCkRm/8mhYXd9HoUbhE/NoRQKyyGt5JC1g5c3643mD
         EJAgx7e4Q1KLbxuN41ivh+qhYwD5rwvCemsRFEo8Cq6a4FOOsP0Zb1Z7W0SijyZ79R7w
         tWF3tUzG/fRVoerZR8O7HsGb94Nl5vDOCo3hSZLRWTt18Seq/H0tJ3BrUC65wM4A9HgA
         ZUF2RjHykBLleACKht4SVOIMFc3zuVQmvoOfpv02xPoTxCXpBHfbOYj43X+zPISNshLW
         g/QA==
X-Gm-Message-State: APjAAAWuL+zQf07yNbxzCcZDKB4bst65Mb4bSb69TwhHCwDllQV/UWK3
        pvf4iGrAGYHZdV3GZHjwVvOHpeqIgMEJPAV07fausw==
X-Google-Smtp-Source: APXvYqxGZFSzzcHM95P34MN4OoqOKe/IYrkWZq08QW+rU4+TyoR8kBUlMrAteCK0QhuLfw/eLwi6bhgYMy9KS1Lp6so=
X-Received: by 2002:ab0:7718:: with SMTP id z24mr9545959uaq.94.1570425133695;
 Sun, 06 Oct 2019 22:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191005104133.30297-1-kholk11@gmail.com> <20191005104133.30297-2-kholk11@gmail.com>
In-Reply-To: <20191005104133.30297-2-kholk11@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 7 Oct 2019 10:42:01 +0530
Message-ID: <CAHLCerOhuO6CzRjsGHm4KuqVXiXULG8irTDwuMdrezozLbL9Fg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] thermal: qcom: tsens-v1: Add support for MSM8956
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

On Sat, Oct 5, 2019 at 4:11 PM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add support for reading calibrated value from thermistors in
> MSM8956, MSM8976 and their APQ variants.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/qcom/tsens-v1.c | 171 +++++++++++++++++++++++++++++++-
>  drivers/thermal/qcom/tsens.c    |   3 +
>  drivers/thermal/qcom/tsens.h    |   2 +-
>  3 files changed, 174 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index 10b595d4f619..3c85a698123a 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -6,6 +6,7 @@
>  #include <linux/bitops.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> +#include <linux/slab.h>
>  #include "tsens.h"
>
>  /* ----- SROT ------ */
> @@ -18,6 +19,68 @@
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
> @@ -77,6 +140,30 @@
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
> @@ -142,7 +229,74 @@ static int calibrate_v1(struct tsens_priv *priv)
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
> +       if (IS_ERR(qfprom_cdata)) {
> +               kfree(qfprom_cdata);
> +               return PTR_ERR(qfprom_cdata);
> +       }
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
> +       kfree(qfprom_cdata);
> +
> +       return 0;
> +}
> +
> +/* v1.x: msm8956,8976,qcs404,405 */
>
>  static const struct tsens_features tsens_v1_feat = {
>         .ver_major      = VER_1_X,
> @@ -191,3 +345,18 @@ const struct tsens_plat_data data_tsens_v1 = {
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
