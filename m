Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03DA928E93D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 01:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731982AbgJNXjj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 19:39:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730418AbgJNXjj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 19:39:39 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25A35208D5;
        Wed, 14 Oct 2020 23:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602718778;
        bh=dNeE6gr+JoZQrofZcAVNVCcDQBotemPsa+eCPdyJAmE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AT5mE3m1lrhwKTXaUuPUZRpS7L96ieP3eGzcta6oAE+chSCVK4mQFPkYZESueJEjj
         Kf0Aa/QALIQeqdqFh6ioiASc3VQ9LnXrL0XH0Fda6HArbva138TlTDB3J5ifDe5pH5
         arbRL5LOov6KYZg1L0YOnbdutHQHdN/3YB0+CdNQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201014140507.v3.3.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid> <20201014140507.v3.3.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
Subject: Re: [PATCH v3 3/3] clk: qcom: lpasscc-sc7180: Re-configure the PLL in case lost
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, linux-soc@vger.kernel.org,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 16:39:36 -0700
Message-ID: <160271877655.884498.7099344361539095621@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-10-14 14:05:23)
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpa=
sscorecc-sc7180.c
> index 48d370e2108e..e12d4c2b1b70 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -388,6 +388,25 @@ static int lpass_create_pm_clks(struct platform_devi=
ce *pdev)
>         return ret;
>  }
> =20
> +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> +{
> +       struct regmap *regmap =3D dev_get_regmap(dev, "lpass_core_cc");

Please make "lpass_core_cc" a static const pointer in this driver so
that it can be used here and when the regmap is made so that we're
certain they match.

> +       unsigned int l_val;
> +       int ret;
> +
> +       ret =3D pm_clk_resume(dev);
> +       if (ret)
> +               return ret;
> +
> +       /* If PLL_L_VAL was cleared then we should re-init the whole PLL =
*/
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
