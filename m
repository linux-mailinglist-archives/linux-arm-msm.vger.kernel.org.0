Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07B428E507
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 19:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731436AbgJNRGf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 13:06:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:44880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730842AbgJNRGf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 13:06:35 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3754A2173E;
        Wed, 14 Oct 2020 17:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602695194;
        bh=EOLvIIS5kKhHFW4VcTfYvDqptNryAzaq156DAo+BnuY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=1hYWF6kBUdFzglQACJT48SpGzLx/Mpj+JeL3OwFrWg4gYrW4hMSH3sG13CfOqBajj
         1poFJyxsft8JTx3ISu3CKXrs8RBobleGnGQUPhCWsndy7T1+rQJSbHKoczBF6CiUvz
         nOpOZuwr7rlYIYtH63boQ4Dnt04g4/3a8BwLO288=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201014085758.v2.1.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
References: <20201014085758.v2.1.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
Subject: Re: [PATCH v2] clk: qcom: lpasscc: Re-configure the PLL in case lost
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-soc@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 10:06:32 -0700
Message-ID: <160269519265.884498.6320532206038624483@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-10-14 08:58:24)
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpa=
sscorecc-sc7180.c
> index 228d08f5d26f..ee23eb5b9bf2 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -356,6 +356,25 @@ static const struct qcom_cc_desc lpass_audio_hm_sc71=
80_desc =3D {
>         .num_gdscs =3D ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
>  };
> =20
> +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> +{
> +       struct regmap *regmap =3D dev_get_drvdata(dev);

Can we use dev_get_remap(dev, NULL) instead?

> +       unsigned int l_val;
> +       int ret;
> +
> +       ret =3D pm_clk_resume(dev);
> +       if (ret)
> +               return ret;
> +
> +       /* Read PLL_L_VAL */

Please drop this useless comment. Replace it with something like this
(if at all):

	/* Reconfigure PLL if PLL was reset across suspend */

> +       regmap_read(regmap, 0x1004, &l_val);
> +       if (!l_val)
> +               clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
> +                               &lpass_lpaaudio_dig_pll_config);
> +
> +       return 0;
> +}
> +
>  static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>  {
>         const struct qcom_cc_desc *desc;
> @@ -373,6 +392,8 @@ static int lpass_core_cc_sc7180_probe(struct platform=
_device *pdev)
>         if (IS_ERR(regmap))
>                 return PTR_ERR(regmap);
> =20
> +       dev_set_drvdata(&pdev->dev, regmap);
> +

And then this isn't needed.

>         /*
>          * Keep the CLK always-ON
>          * LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK
