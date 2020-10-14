Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCFC328D82D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbgJNB7O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:59:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:55400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgJNB7N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:59:13 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAA8F221FC;
        Wed, 14 Oct 2020 01:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602640752;
        bh=wCc5SuWifTRvzQyLqk95QDnpolBC2xo+OhEuwe/klj0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=1Y9BzN6quC7xAAKEBeTamqujt4BIsNY97lbcDYxmGt4Ca+LEXvONVPPJ6mh+S3ieb
         ILpqfzBZVSffvEVuh1mzssunmpcgo4YC3165hY49R9U9q1MJgNP8EVP4MUYllUMyM6
         sVXPZ8IoccBqY43IXguri5ilGi1NFtR1QwoHpWwo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602609110-11504-4-git-send-email-tdas@codeaurora.org>
References: <1602609110-11504-1-git-send-email-tdas@codeaurora.org> <1602609110-11504-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 3/3] clk: qcom: camcc: Add camera clock controller driver for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 13 Oct 2020 18:59:11 -0700
Message-ID: <160264075146.310579.8765964662995263828@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-10-13 10:11:50)
> diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7=
180.c
> new file mode 100644
> index 0000000..e954d21
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-sc7180.c
> @@ -0,0 +1,1737 @@
[...]
> +
> +enum {
> +       P_BI_TCXO,
> +       P_CAM_CC_PLL0_OUT_EVEN,
> +       P_CAM_CC_PLL1_OUT_EVEN,
> +       P_CAM_CC_PLL2_OUT_AUX,
> +       P_CAM_CC_PLL2_OUT_EARLY,
> +       P_CAM_CC_PLL3_OUT_MAIN,
> +       P_CORE_BI_PLL_TEST_SE,
> +};
> +
> +static struct pll_vco agera_vco[] =3D {

Can this be const?

> +       { 600000000, 3300000000, 0 },
> +};
> +
> +static struct pll_vco fabia_vco[] =3D {

Can this be const?

> +       { 249600000, 2000000000, 0 },
> +};
> +
[...]
> +
> +static int cam_cc_sc7180_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       int ret;
> +
> +       pm_runtime_enable(&pdev->dev);
> +       ret =3D pm_clk_create(&pdev->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D pm_clk_add(&pdev->dev, "xo");
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "Failed to acquire XO clock\n");
> +               goto disable_pm_runtime;
> +       }
> +
> +       ret =3D pm_clk_add(&pdev->dev, "iface");
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "Failed to acquire iface clock\n");
> +               goto disable_pm_runtime;
> +       }
> +
> +       ret =3D pm_clk_runtime_resume(&pdev->dev);
> +       if (ret) {
> +               dev_err(&pdev->dev, "pm runtime resume failed\n");
> +               goto destroy_pm_clk;
> +       }
> +
> +       regmap =3D qcom_cc_map(pdev, &cam_cc_sc7180_desc);
> +       if (IS_ERR(regmap)) {
> +               ret =3D PTR_ERR(regmap);
> +               goto destroy_pm_clk;
> +       }
> +
> +       clk_fabia_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config=
);
> +       clk_fabia_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config=
);
> +       clk_agera_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config=
);
> +       clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config=
);
> +
> +       ret =3D qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
> +               goto suspend_pm_runtime;

ret is non-zero here

> +       }
> +
> +suspend_pm_runtime:
> +       ret =3D pm_clk_runtime_suspend(&pdev->dev);

But then it is overwritten here.

> +       if (ret)
> +               dev_err(&pdev->dev, "pm runtime suspend failed\n");
> +
> +       return 0;

And we return 0 when there was a failure to probe the clks?

> +
> +destroy_pm_clk:
> +       pm_clk_destroy(&pdev->dev);
> +
> +disable_pm_runtime:
> +       pm_runtime_disable(&pdev->dev);
> +
> +       return ret;
> +}
