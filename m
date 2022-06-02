Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6BB53BA18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 15:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235093AbiFBNuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 09:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234021AbiFBNuH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 09:50:07 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFC511825
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 06:50:04 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id gd1so4994899pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OlapCjAlU4I5kLgfiiO4AZkc55Tmg0Yf5lSNYuvMqzg=;
        b=ptbvIB6+JaPo3WR4db1Nv6KzsbAEOFIjbVUIfmDs+jSX0+AfXNGdC1itM44ycfMJHZ
         CNQzoNd9S5rBzk3DnbkuwOx+dXflPgLjehwHSfwjfAObIEd71e3pib+lXcm5P/DeDGD9
         wwgEseJ5Tl96cZbmUDRx9bATBfQxXk6IkHXyT34uyxy95ZpltVm7hHjypl2ECO5veucT
         +wdg6K5yZ30oHKRBWYpIw+6aI5DnB8thkI0OO+3H4XneJjVf6/Kut41cZgMWggE5BjVn
         kj6LHRyoMdsLwAG3c9c27vPULUclgCEmsij6dW7cawQ1Y/R7JLp+Y+bfHcA4LNfi15bt
         7RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OlapCjAlU4I5kLgfiiO4AZkc55Tmg0Yf5lSNYuvMqzg=;
        b=XbVk1tdx//MQUnjIRxF1eeBJl2lOhQTV4gcFJSzp+sty6zpcxr8Mza6avwdDVQNVux
         Xy0pBmqgp0BosGTya3zKdL58N6l/qathSQkbeoyb4uhkbbd0oF7YfPao4yNyZm3V+h3F
         AE9QAZokoeD9rvzr/AZZqlMMMXyKRIR9pTs+QlsaEEzPK36oEgABJMMgCayjSzqpGsiB
         OAbkjKV9ThW8XReObhkYdj5F1rvQyJElpyepwykIbjVSSYC4QUPPJoTU0H1u91ndnwwz
         PKn3vdzwD1Fb7dAMzywRPBrYPT7FoIDJ1qsAFNgUpHAyuzYcXTeKvqat0W7fU03BL3gA
         ZyFA==
X-Gm-Message-State: AOAM530uTmwCq+Cn4TIwixXT2KyC9IeSMULQYBWmFCjKcT3hCb8Fa5DK
        +kE0Plf00jYXjynTnYdcWVEDQvk5jfQ6YogZgyXNb90BE04=
X-Google-Smtp-Source: ABdhPJzM1kj9cg29NOIJfw74O0YGhmVug9TcitNFTjserhPrC6AYPQKI/cOLDaVG69coDAsoLgiwgya9n+0ax5CQ9Eg=
X-Received: by 2002:a17:902:a583:b0:15d:197b:9259 with SMTP id
 az3-20020a170902a58300b0015d197b9259mr5102686plb.51.1654177803703; Thu, 02
 Jun 2022 06:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220602131528.2246339-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220602131528.2246339-1-vladimir.zapolskiy@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 2 Jun 2022 15:49:27 +0200
Message-ID: <CAMZdPi-iK0_OHdtdz9gakUoBqLJQyzjvntBQfvxObYPz-8e-DQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-cci: simplify access to bus data structure
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
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

On Thu, 2 Jun 2022 at 15:15, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Trivial non-functional change, which adds an alias to an extensively
> used data location.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 8d078bdb5c1b..c4a4a4b54131 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -541,6 +541,7 @@ static int cci_probe(struct platform_device *pdev)
>                 return -ENOENT;
>
>         for_each_available_child_of_node(dev->of_node, child) {
> +               struct cci_master *master;
>                 u32 idx;
>
>                 ret = of_property_read_u32(child, "reg", &idx);
> @@ -555,27 +556,28 @@ static int cci_probe(struct platform_device *pdev)
>                         continue;
>                 }
>
> -               cci->master[idx].adap.quirks = &cci->data->quirks;
> -               cci->master[idx].adap.algo = &cci_algo;
> -               cci->master[idx].adap.dev.parent = dev;
> -               cci->master[idx].adap.dev.of_node = of_node_get(child);
> -               cci->master[idx].master = idx;
> -               cci->master[idx].cci = cci;
> +               master = &cci->master[idx];
> +               master->adap.quirks = &cci->data->quirks;
> +               master->adap.algo = &cci_algo;
> +               master->adap.dev.parent = dev;
> +               master->adap.dev.of_node = of_node_get(child);
> +               master->master = idx;
> +               master->cci = cci;
>
> -               i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
> -               snprintf(cci->master[idx].adap.name,
> -                        sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
> +               i2c_set_adapdata(&master->adap, master);
> +               snprintf(master->adap.name, sizeof(master->adap.name),
> +                        "Qualcomm-CCI");

Let's use a single line for snprintf now.
