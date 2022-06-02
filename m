Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D11F053B655
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 11:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbiFBJsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 05:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbiFBJsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 05:48:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE73294210
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 02:48:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id s6so6926642lfo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 02:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b855lgf2K6RWNMdrbTy9OBrZkDrExaS8QreLgdDtVNY=;
        b=J934V0sBP7B2jRhhvRfMsWF+ARZxNCY6OR9E2sMWyGUOibgGzczEaUO0Na+4aCDiNI
         SVLo8Kmxp+gjWtvXVZZZ6CbXW0iVC6TDbVRhJMO8jkqGjOzW9r7cOB62POhwADrxaWO8
         TeLmwFqw+K2Olbgpa37KvF15D7GCOY++ijcOynS4CY9PqrQeAJTpyeVCcEIWmHQSlHJ/
         Y29SdsN9iAwDU/Q+TbrZwHcpFQ0ffgZV8e1g257BaWebYmEMiEsqakQkH/6CtV7QrRDa
         ucft2WTFX6N0H7I2HKGREkZOcnRf16XhOfUxqsYFitrUmrcBNDCCo++UuQb7Gqhrj6BO
         MGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b855lgf2K6RWNMdrbTy9OBrZkDrExaS8QreLgdDtVNY=;
        b=Cm8RDsQZNuOHPnBk2M+4j1RauciskN6oTdDuS4eNSaKaRpXJV8xcmmmmqIdl+N+tAG
         I6dRbFpp7YLoWUWwOA2zJ4FtNAMu93/4R1/HsucRdm07PImm+N4hw3J36iS3Gg1eWfzB
         wQtPxBb8xxgBMRU/oEMD00sOs0+bJ1IoZIRab5qUwNolf6Z7iM32rVnKa65qrnFQyPc5
         KruhKZ/bQ/IO001CI77DFJ8q3RFx6xxtqoffpFAosU863YZQ5Eg480PVbjlbUTiv+O1t
         kMbgj6Tdmy5iNyrMVQn1qpa+q7QK7C4bJVmrrXpv4jv+CngVgYm2+AEEXgOZcCItDPW6
         im+Q==
X-Gm-Message-State: AOAM530tTSYCR9O1He/OChOOigoe+wIX6yy74S6i/dieMJyYRftCNSrs
        QtqbMpz3AqunzEblbfwUZJzw4UwJZp3dxDMVmd3AUw==
X-Google-Smtp-Source: ABdhPJzvIhjnVlgMR8NiroYOlU2q9b//vsIpURDubx6WxAEF3GHnIY+ZUlGElYuNx2D6tZCg0wjBwcUmt1jm8ds4nE4=
X-Received: by 2002:a19:ac42:0:b0:478:593c:e6fe with SMTP id
 r2-20020a19ac42000000b00478593ce6femr2904805lfc.254.1654163311389; Thu, 02
 Jun 2022 02:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653564321.git.viresh.kumar@linaro.org> <80314068d96eb53e0d9838736415b96015803844.1653564321.git.viresh.kumar@linaro.org>
In-Reply-To: <80314068d96eb53e0d9838736415b96015803844.1653564321.git.viresh.kumar@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 2 Jun 2022 11:47:54 +0200
Message-ID: <CAPDyKFpB2ei325vemXcmEY6Xou7Wt+WtV8gu6nqAK9tSRAy-aQ@mail.gmail.com>
Subject: Re: [PATCH 19/31] mmc: sdhci-msm: Migrate to dev_pm_opp_set_config()
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 26 May 2022 at 13:44, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> The OPP core now provides a unified API for setting all configuration
> types, i.e. dev_pm_opp_set_config().
>
> Lets start using it.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 50c71e0ba5e4..994f3f0231f7 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2496,6 +2496,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         const struct sdhci_msm_offset *msm_offset;
>         const struct sdhci_msm_variant_info *var_info;
>         struct device_node *node = pdev->dev.of_node;
> +       struct dev_pm_opp_config opp_config = {
> +               .clk_name = "core",
> +       };
>
>         host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
>         if (IS_ERR(host))
> @@ -2564,7 +2567,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         if (ret)
>                 goto bus_clk_disable;
>
> -       ret = devm_pm_opp_set_clkname(&pdev->dev, "core");
> +       ret = devm_pm_opp_set_config(&pdev->dev, &opp_config);
>         if (ret)
>                 goto bus_clk_disable;
>
> --
> 2.31.1.272.g89b43f80a514
>
