Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E03425A1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 19:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243202AbhJGR7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 13:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbhJGR7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 13:59:21 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECF0C061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 10:57:28 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so8469176ota.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 10:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=tNffkl0Q4XYFcl/VueyyIpHh5QtOfORzbwnyFe2lGUk=;
        b=b+B3rRcrnNNlpsNamNM5v+Dg5DxzaCynl+SWNFYgRP4C1AnU07jrfTNLTW3dVfQRNr
         m16M6gVxXz3tLCf9fGZXHnleEiyRdUWguUWmryHmIQ82olFUq30yn7iNGN3fm3PbT7gq
         iuVijXL/lXLB2gsZHyuvZ/TeV4YTcLK+kzvu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=tNffkl0Q4XYFcl/VueyyIpHh5QtOfORzbwnyFe2lGUk=;
        b=AXRByU+zNdL314GBTrZI5HVcRYxY5R4gZ82Ny+aRv3HuwiGyChGOfJvqMMRC4/HMBH
         RxiNgZeViS146VpxCrGSp++NnDBoLzgho61EXPqfXb8d+mNS9Cslj20JzScwhcFtMl85
         wGgi0Rz1pc9ZYCWhK3DgfyrsY76KI2VPtc/glCgMOiRbTcf5knTNO2l7EKnwA1RcYuJb
         QvUE0uCxAN+5sTLWCvgu0o33hLc2cbdvK1lpeebxhOJGXhyNxCQ1vq2qD7zFAI3Ll3Kg
         3s24oQ23+ncRWOqi0rtaVF6+TaWBlJsZO53ZUhzmZE7Sqf38+W8oYcIlztED5Cfw05HM
         3IsQ==
X-Gm-Message-State: AOAM531cWrYr0yTYFeGdC2zLim2gEvuI/L4OEQS3OxGQvC5yEzEzX/oI
        c2WrHYtguQCC+cSK9kgBye07PuyMW9xo9iVl9TUjylUgJYQ=
X-Google-Smtp-Source: ABdhPJwAvWX1ls2QReA8P64elG2Woqp0Lk3ZSmYVtjCSdDEAjMULvzOhTxb4cSKxDFAzNCrZ2d6cimg76yLQk+aAvUE=
X-Received: by 2002:a9d:12f4:: with SMTP id g107mr908111otg.77.1633629447464;
 Thu, 07 Oct 2021 10:57:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 13:57:27 -0400
MIME-Version: 1.0
In-Reply-To: <1633614519-26680-2-git-send-email-srivasam@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org> <1633614519-26680-2-git-send-email-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 7 Oct 2021 13:57:27 -0400
Message-ID: <CAE-0n52Ge_XZr914Ksmq5Myk3FRp7+Sc5P-9jj8wuspKkjXnYw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: qcom: Update lpass variant independent
 functions as generic
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:37)
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 2f19ab4..c0117c5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -124,7 +124,8 @@ static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
>         PINCTRL_PIN(13, "gpio13"),
>  };
>
> -enum sm8250_lpi_functions {
> +

Please drop this extra newline so the diff makes sense.

> +enum lpass_lpi_functions {
>         LPI_MUX_dmic1_clk,
>         LPI_MUX_dmic1_data,
>         LPI_MUX_dmic2_clk,
> @@ -203,7 +204,7 @@ static const struct lpi_pingroup sm8250_groups[] = {
>         LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>  };
>
> -static const struct lpi_function sm8250_functions[] = {
> +static const struct lpi_function lpass_functions[] = {

Why not follow the approach of other qcom pinctrl drivers and make a
core driver that each SoC uses as a library?

>         LPI_FUNCTION(dmic1_clk),
>         LPI_FUNCTION(dmic1_data),
>         LPI_FUNCTION(dmic2_clk),
> @@ -615,7 +616,7 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>                 return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>                                      "Slew resource not provided\n");
>
> -       ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +       ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);

Please mention in the commit text why this is now optional.

>         if (ret)
>                 return dev_err_probe(dev, ret, "Can't get clocks\n");
>
