Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53032C1F54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2019 12:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbfI3KmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Sep 2019 06:42:24 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39119 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbfI3KmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Sep 2019 06:42:24 -0400
Received: by mail-qt1-f195.google.com with SMTP id n7so16338122qtb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2019 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CQnRgqy00KJcjIhGBUYDWGlTzlJgYKUdQBB2o6AoBWs=;
        b=qC87DP2efcHnSH/xHd/hh8v9eByY9gS2sCFc54IUay0nNYwFfsbntDy8/ZtE0fnulT
         Y6tEYVKpR3SO084UTin4+3ZmKSSLLx3k3Bf7qFY3j7wlvs7wBr+CB2FAhZnggv6nFhtv
         zadgLzpdfgVRNyKkhb0r4CIhXqm11iGwE7e9SPkpqpD3qwZONwvrKzc0zW5HOheQvivq
         lgulBmUyGL67W6wU4Tl1X++QRJAW855xyAPVNmpiQfCuUa7xkHWYY5+aABxZDCvWu2fA
         sFfyRGPv9n/lopHlyrAPG8s6wPtVHzH16XkRg30LMyTw5Eb3FAOjJ9P/pZdx5h+KrbPw
         s7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CQnRgqy00KJcjIhGBUYDWGlTzlJgYKUdQBB2o6AoBWs=;
        b=UrEdkBGTnnt+KyTGKWjkQmLzfGXYkQhEkhP1ArIi9SrgCfdauN+MPlIOGLgLapG4uf
         GxFV1oZ6wgj1PFKL7Dcy5u+zgWy3VVxbWze9/8fQ1xvWUTXuT/YlyOhYeXPV5/BqRpyj
         /x60RlOWcHlrPbSDRQ7k+74Sl8hyPmwB21wFk0UKGEaDRRmT4bY7/U5H2Tra1s2+MWB7
         00xnmaeX7Vxy/SMI7JisbWsoKYITu/3Z0QkkBqubPtqYyEWIuWUHDa+/8uWRyYacdgAU
         +osXBjzThL9k2kb6ANPxZRddsis+yiujK/CSYItCdiBlLEeTNSGD76rKPa4mSKYhLS2J
         QtpA==
X-Gm-Message-State: APjAAAXhZxsMJZ6yPU2JecFpv4cndMd+QzVuLzrSxGF+Vr6OcpLthURp
        3d7+MUM8EnWuuZut1BR6nlhdekBdNdojzBrMB4hpeg==
X-Google-Smtp-Source: APXvYqxi8TsBv1hBIUUAm9vrk7s0Y31tDBjr+mFVmN1WK5N6p+iV8vg0rcRUtPOW3+Ucr++p2Vvu8YZ0Wqq0j2UVHsg=
X-Received: by 2002:aed:2a3b:: with SMTP id c56mr24760669qtd.343.1569840141394;
 Mon, 30 Sep 2019 03:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190921101740.430-1-kholk11@gmail.com> <20190921101740.430-2-kholk11@gmail.com>
In-Reply-To: <20190921101740.430-2-kholk11@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 30 Sep 2019 16:12:10 +0530
Message-ID: <CAP245DXjqo1VEo0xzxmaf=Z9790s04Qf7=Mi=U9KDnRV1MzGEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976
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

On Sat, Sep 21, 2019 at 3:47 PM <kholk11@gmail.com> wrote:
>
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
>
> Add support for reading calibrated value from thermistors in
> MSM8956, MSM8976 and their APQ variants.
>
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  drivers/thermal/qcom/tsens-v1.c | 188 ++++++++++++++++++++++++++++++++
>  drivers/thermal/qcom/tsens.c    |   3 +
>  drivers/thermal/qcom/tsens.h    |   2 +-
>  3 files changed, 192 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index 10b595d4f619..42729bc4ad43 100644
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
> @@ -142,6 +228,94 @@ static int calibrate_v1(struct tsens_priv *priv)
>         return 0;
>  }
>
> +static int calibrate_8976(struct tsens_priv *priv)
> +{
> +       int base0 = 0, base1 = 0, i;
> +       u32 p1[11], p2[11];
> +       int mode = 0, tmp = 0;
> +       u32 *qfprom_cdata;
> +
> +       qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
> +       if (IS_ERR(qfprom_cdata))
> +               return PTR_ERR(qfprom_cdata);
> +
> +       mode = (qfprom_cdata[4] & MSM8976_CAL_SEL_MASK);
> +       dev_dbg(priv->dev, "calibration mode is %d\n", mode);
> +
> +       switch (mode) {
> +       case TWO_PT_CALIB:
> +               base1 = qfprom_cdata[2] & MSM8976_BASE1_MASK;
> +               base1 = base1 >> MSM8976_BASE1_SHIFT;

Please use the following form here and everywhere else below.

base1 = (qfprom_cdata[2] & MSM8976_BASE1_MASK) >> MSM8976_BASE1_SHIFT;

> +               p2[0] = qfprom_cdata[0] & MSM8976_S0_P2_MASK;
> +               p2[0] = p2[0] >> MSM8976_S0_P2_SHIFT;
> +               p2[1] = qfprom_cdata[0] & MSM8976_S1_P2_MASK;
> +               p2[1] = p2[1] >> MSM8976_S1_P2_SHIFT;
> +               p2[2] = qfprom_cdata[1] & MSM8976_S2_P2_MASK;
> +               p2[2] = p2[2] >> MSM8976_S2_P2_SHIFT;
> +               p2[3] = qfprom_cdata[1] & MSM8976_S3_P2_MASK;
> +               p2[3] = p2[3] >> MSM8976_S3_P2_SHIFT;
> +               p2[4] = qfprom_cdata[2] & MSM8976_S4_P2_MASK;
> +               p2[4] = p2[4] >> MSM8976_S4_P2_SHIFT;
> +               p2[5] = qfprom_cdata[2] & MSM8976_S5_P2_MASK;
> +               p2[5] = p2[5] >> MSM8976_S5_P2_SHIFT;
> +               p2[6] = qfprom_cdata[3] & MSM8976_S6_P2_MASK;
> +               p2[6] = p2[6] >> MSM8976_S6_P2_SHIFT;
> +               p2[7] = qfprom_cdata[3] & MSM8976_S7_P2_MASK;
> +               p2[7] = p2[7] >> MSM8976_S7_P2_SHIFT;
> +               p2[8] = qfprom_cdata[4] & MSM8976_S8_P2_MASK;
> +               p2[8] = p2[8] >> MSM8976_S8_P2_SHIFT;
> +               p2[9] = qfprom_cdata[4] & MSM8976_S9_P2_MASK;
> +               p2[9] = p2[9] >> MSM8976_S9_P2_SHIFT;
> +               p2[10] = qfprom_cdata[5] & MSM8976_S10_P2_MASK;
> +               p2[10] = p2[10] >> MSM8976_S10_P2_SHIFT;
> +
> +               for (i = 0; i < priv->num_sensors; i++)
> +                       p2[i] = ((base1 + p2[i]) << 2);
> +               /* Fall through */
> +       case ONE_PT_CALIB2:
> +               base0 = qfprom_cdata[0] & MSM8976_BASE0_MASK;
> +               p1[0] = qfprom_cdata[0] & MSM8976_S0_P1_MASK;
> +               p1[0] = p1[0] >> MSM8976_S0_P1_SHIFT;
> +               p1[1] = qfprom_cdata[0] & MSM8976_S1_P1_MASK;
> +               p1[1] = p1[1] >> MSM8976_S1_P1_SHIFT;
> +               p1[2] = qfprom_cdata[1] & MSM8976_S2_P1_MASK;
> +               p1[2] = p1[2] >> MSM8976_S2_P1_SHIFT;
> +               p1[3] = qfprom_cdata[1] & MSM8976_S3_P1_MASK;
> +               p1[3] = p1[3] >> MSM8976_S3_P1_SHIFT;
> +               p1[4] = qfprom_cdata[2] & MSM8976_S4_P1_MASK;
> +               p1[4] = p1[4] >> MSM8976_S4_P1_SHIFT;
> +               p1[5] = qfprom_cdata[2] & MSM8976_S5_P1_MASK;
> +               p1[5] = p1[5] >> MSM8976_S5_P1_SHIFT;
> +               p1[6] = qfprom_cdata[3] & MSM8976_S6_P1_MASK;
> +               p1[6] = p1[6] >> MSM8976_S6_P1_SHIFT;
> +               p1[7] = qfprom_cdata[3] & MSM8976_S7_P1_MASK;
> +               p1[7] = p1[7] >> MSM8976_S7_P1_SHIFT;
> +               p1[8] = qfprom_cdata[4] & MSM8976_S8_P1_MASK;
> +               p1[8] = p1[8] >> MSM8976_S8_P1_SHIFT;
> +               p1[9] = qfprom_cdata[4] & MSM8976_S9_P1_MASK;
> +               p1[9] = p1[9] >> MSM8976_S9_P1_SHIFT;
> +               p1[10] = qfprom_cdata[4] & MSM8976_S10_P1_MASK;
> +               p1[10] = p1[10] >> MSM8976_S10_P1_SHIFT;
> +               tmp = qfprom_cdata[5] & MSM8976_S10_P1_MASK_1;
> +               tmp = tmp << MSM8976_S10_P1_SHIFT_1;
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
> +       return 0;
> +}
> +
>  /* v1.x: qcs404,405 */

Add msm8976 to list above

>  static const struct tsens_features tsens_v1_feat = {
> @@ -191,3 +365,17 @@ const struct tsens_plat_data data_tsens_v1 = {
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
> +const struct tsens_plat_data data_8976 = {
> +       .num_sensors    = 11,
> +       .ops            = &ops_8976,
> +       .hw_ids         = (unsigned int[]){0, 1, 2, 4, 5, 6, 7, 8, 9, 10},

Add a comment that sensor id 3 is unused above the struct definition.
I should do it for 8916 too.

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
