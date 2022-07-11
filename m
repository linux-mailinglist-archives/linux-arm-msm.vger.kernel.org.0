Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7256157035A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 14:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbiGKMwA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 08:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbiGKMwA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 08:52:00 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07BA3DF3C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 05:51:57 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id g6so6947476qtu.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u8OtjelF7t+utKcpWQRgvLKReyWFBIIpxXxzk1s+c20=;
        b=NWNi5bEMUftE1wUsn5ZbR6hTLrjYzyox3xg+feYsRlPcIADTCO6tTkzHZxr6H3b1ER
         JfgFbxnssgTs+nk0QqXo8SA5RXZoPAvEBJNNe7PKuOnt1BvokDgsJTgiRZs0Z6PArEBt
         69f9egMQJhs2dkPc8u5e+ZAIvz92IHDq7XoU+C5z2T8s2UXBMfo2Hj0YyOopCbM888xN
         5yCw/RAlkdDMsUCB+MQP0kzzirjKlxJz+gsNxvPIzemdW4qqN1VxLXr9XwgOjTlPFRfU
         xszL2AgieyyiwS0GJzw+7T0P3qQB5etawvupNGJkN85Z/pIaCUoIc1mAoC6K+775vS0k
         ThYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u8OtjelF7t+utKcpWQRgvLKReyWFBIIpxXxzk1s+c20=;
        b=GOEuKPwBU7gbtV6sdOk2U1pZpJGL9/CQVOoi5iYkwq/9cCYkvc2padezNic1j6Zyff
         98XQ1TjkERGTxjdy5gdfZ6g1AWCxJcQGm1IRrXXUpbWVjPsdK7KNK4z5QOyShhVM3WLJ
         Aoan/trygPtsEKI46mk3S3kKUHMFDeuSCMtSODo+vXEY7/RqVBg4Gj85xz9SjLexZE4i
         jEiucgtwzTvT48lWXbE89rErI/K64EuNzifWC2CYJjj8S+KQy2MfmVn1n1TEBKRI8kkS
         Kk6Y4cPNipS7DxTgbUIR5D4yts9SAlzDSAhEHhDLFgwFBaK9N46nApNe5PPQ4ASs8ShT
         GJlg==
X-Gm-Message-State: AJIora+n5vP+WqzXKMUKMqRK80F2SCtPBhYoBTxA2iTv5KrOS4hdvmJ4
        OiHzoWsLbNaMW+r44SgLc5mmm3AfwURaI0NfhPRpiA==
X-Google-Smtp-Source: AGRyM1tIm/tmfqPqAsoNbwEbKFPxKWXUCaShlqgv4UAE5RfY8ml7ruPLx65AAbWGpZWZPpThUL8vp+Of7tohwjCYnac=
X-Received: by 2002:ac8:4e56:0:b0:31d:38c0:b749 with SMTP id
 e22-20020ac84e56000000b0031d38c0b749mr13203099qtw.682.1657543916884; Mon, 11
 Jul 2022 05:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220711104719.40939-1-robimarko@gmail.com> <20220711104719.40939-6-robimarko@gmail.com>
In-Reply-To: <20220711104719.40939-6-robimarko@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Jul 2022 15:51:45 +0300
Message-ID: <CAA8EJppAdwuXQsvvy9+hT_-mzke5xOaDcTSM5ewjS_cPk3Q+oA@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: qcom: apss-ipq-pll: add support for IPQ8074
To:     Robert Marko <robimarko@gmail.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sivaprak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Jul 2022 at 14:22, Robert Marko <robimarko@gmail.com> wrote:
>
> Add support for IPQ8074 since it uses the same PLL setup, however it does
> not require the Alpha PLL to be reconfigured.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> index bef7899ad0d6..acfb3ec4f142 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
> @@ -55,6 +55,7 @@ static const struct regmap_config ipq_pll_regmap_config = {
>  static int apss_ipq_pll_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->of_node;
>         struct regmap *regmap;
>         void __iomem *base;
>         int ret;
> @@ -67,7 +68,8 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
>         if (IS_ERR(regmap))
>                 return PTR_ERR(regmap);
>
> -       clk_alpha_pll_configure(&ipq_pll, regmap, &ipq_pll_config);
> +       if (of_device_is_compatible(node, "qcom,ipq6018-a53pll"))
> +               clk_alpha_pll_configure(&ipq_pll, regmap, &ipq_pll_config);

I'd suggest having the 8074 config here too. It seems logical to me to
make sure that the pll is configured correctly.

>
>         ret = devm_clk_register_regmap(dev, &ipq_pll.clkr);
>         if (ret)
> @@ -79,6 +81,7 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
>
>  static const struct of_device_id apss_ipq_pll_match_table[] = {
>         { .compatible = "qcom,ipq6018-a53pll" },
> +       { .compatible = "qcom,ipq8074-a53pll" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, apss_ipq_pll_match_table);
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
