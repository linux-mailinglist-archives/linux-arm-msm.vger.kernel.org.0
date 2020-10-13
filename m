Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F97528DD86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730532AbgJNJZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730509AbgJNJTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:19:42 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C2AC0613BF
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 15:27:09 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id p5so304158vkm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 15:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nEh8aWSBzrx6UT31IWc0LsTnrFS8ZDfHAx42jaS0Cjs=;
        b=jvDdn/lroKNiUWKl5bN/qT1jMxMbc7sZcDAu3vbzKBJYEOQM00+YdWsySveShwX1qr
         LTiDPBQG5xOZ/wML9iM6nzFQgC76cHZwJpg9OoaMQN3FhlVSj/quqpW7HMh0VMVa8ILu
         VS8aq2hPsvuME+fGU5NMgPErb9Z5OJzMtD+Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nEh8aWSBzrx6UT31IWc0LsTnrFS8ZDfHAx42jaS0Cjs=;
        b=LWVrwUqhGnD2QuFErrDdoHhP9quRG8WfTtky1p/K3RS6Bj0skqJWtxdKS8oFBERfb7
         9+SK5gcsllh6fGum/J7fMCo/Lpl/qKu2+gJ2p6H3GPyMfgQ9SaEthZF3RB5hu49jTXnm
         sk6H6bM/alTzaVwxbJt8/8yAg5n3UVCYQQIc2AfyqFS6ICtyrudC6c/g/NddrAb7QYy6
         r5z52cs/wCzpgfYT/Md4IWYu9A678XSRWU2akWLG5H7THUtlD/UnrKEDT/JPr7OaZ6yI
         BjukPaIlNhSO4A1Qrpp3xyZseU3Tf+xxwHUM4fVmcqJUOxXK/oF8nB4o2KNWp7yWSRB0
         ae7A==
X-Gm-Message-State: AOAM530QrVKaDclZqAvELAGy7z76mFrg1VS3NUMYSrfwzACqUNtF7JmT
        2YONKWUrAgu56GTCIATTwVUBuS6OmxrVuQ==
X-Google-Smtp-Source: ABdhPJwLLC57v4CBPTlBbZVkI77DHp8TS+pHqvI2/hNLO6mX1Ginu4ikwGlXkSDrlKRCVh4Og4yKXg==
X-Received: by 2002:a1f:3245:: with SMTP id y66mr1826783vky.11.1602628027773;
        Tue, 13 Oct 2020 15:27:07 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id q23sm208212vkq.18.2020.10.13.15.27.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 15:27:06 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id q20so488262uar.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 15:27:06 -0700 (PDT)
X-Received: by 2002:a9f:31ce:: with SMTP id w14mr1804071uad.104.1602628026293;
 Tue, 13 Oct 2020 15:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <1602614008-2421-1-git-send-email-tdas@codeaurora.org> <1602614008-2421-2-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1602614008-2421-2-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Oct 2020 15:26:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XOj-Vg36v8GtE1sjay0jCdCLgRMJtyN9ZYyZhsNkdVfg@mail.gmail.com>
Message-ID: <CAD=FV=XOj-Vg36v8GtE1sjay0jCdCLgRMJtyN9ZYyZhsNkdVfg@mail.gmail.com>
Subject: Re: [PATCH v0] clk: qcom: lpasscc: Re-configure the PLL in case lost
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 13, 2020 at 11:33 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> In the case where the PLL configuration is lost, then the pm runtime
> resume will reconfigure before usage.
>
> Fixes: edab812d802d ("clk: qcom: lpass: Add support for LPASS clock controller for SC7180")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/lpasscorecc-sc7180.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> index 228d08f..5804a93 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -356,6 +356,25 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
>         .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
>  };
>
> +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> +{
> +       struct regmap *regmap = dev_get_drvdata(dev);
> +       int l_val;

nit: technically "unsigned int" to match what regmap_read takes.

> +
> +       pm_clk_resume(dev);

Even though pm_clk_resume() doesn't currently return any errors, it
would be good form to check.  AKA:

ret = pm_clk_resume(dev);
if (ret)
  return ret;


> +       /* Read PLL_L_VAL */
> +       regmap_read(regmap, 0x1004, &l_val);
> +       if (!l_val)
> +               clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
> +                               &lpass_lpaaudio_dig_pll_config);
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops lpass_core_pm_ops = {
> +       SET_RUNTIME_PM_OPS(pm_clk_suspend, lpass_core_cc_pm_clk_resume, NULL)
> +};
> +
>  static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>  {
>         const struct qcom_cc_desc *desc;
> @@ -386,6 +405,9 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>         clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
>                                 &lpass_lpaaudio_dig_pll_config);
>
> +       pdev->dev.driver->pm = &lpass_core_pm_ops;
> +       dev_set_drvdata(&pdev->dev, regmap);

I'm kinda confused.  Why not just change "lpass_core_cc_pm_ops"?  Then
you can get rid of the above two lines of code and get rid of the
whole "lpass_core_pm_ops" structure?


-Doug
