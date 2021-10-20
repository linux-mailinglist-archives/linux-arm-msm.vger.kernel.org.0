Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA1D434458
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 06:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhJTE30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 00:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhJTE30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 00:29:26 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA991C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 21:27:12 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id z126so8064111oiz.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 21:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KVKplhRxILI8I/oy0FMY8RP+d5gKK/Wsa1r6nqQ6o3U=;
        b=bAjp6vkLKBf5OVZt33zDaaAdJgfXccJSKnoVSKOf6Y2zM89m+ddRnlIcBfnBeiMAGB
         pqyZOh/VkiJZjeZ8VO/Fa1ov9vrCSBE3WgJhaWUCkWLwh4RGqEwlHjCuVN9N0SaTYwW+
         /KtiISyCJV5UScjlpTp4wCAKBOI3ddhOe0T2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KVKplhRxILI8I/oy0FMY8RP+d5gKK/Wsa1r6nqQ6o3U=;
        b=HvzjoSnZ+uozaxjT3eHYa1YXPpKfxTXN6Gg2Fc+7steFFUc32uKwVHe3tJUvw9IBY9
         YSSDpf2XvODUE+O7bKdWBomcByjTrF9jwW9ATPzrOvXns1Lb0M0vKzD3X/qoXcCUIdrZ
         7FDObxn3mvvLzdBwXSmc6fo7mMl6MWctxjw9jRCWFLNqQERF1flvk05Rq4i7b9k+fivx
         OIepE1jphlEyOw3HZOUdyWlmo+99NaQEpu/LhR7P3CkNYbDEhMI3wSOLYMn3Dph6xZn4
         hVRAP2Pw/AeDeSvCEjoVaGs9l0wpcMKOHC68SUEwvsfTxchEY+YH1aX79Out5URu8qgS
         ZrXw==
X-Gm-Message-State: AOAM530HeTJ/7in9tKuwxkqXlCMfm6C9n1SRrrd55sy7jnURnRz0TQ0Z
        Oz8e7SlnGqV/rrGmuHIf2f3OURNOXIoiTbU7ByJa1g==
X-Google-Smtp-Source: ABdhPJzh3ZOGe96IecK1OqqtQSExKI9kebMcVSUhZrUrhR6WDYqRhGnx1+pIa+JBaJw/ZtCtcC9iBYQ8L33OtBMjwMs=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr7418740oib.32.1634704032132;
 Tue, 19 Oct 2021 21:27:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Oct 2021 23:27:11 -0500
MIME-Version: 1.0
In-Reply-To: <1634640531-15813-4-git-send-email-skakit@codeaurora.org>
References: <1634640531-15813-1-git-send-email-skakit@codeaurora.org> <1634640531-15813-4-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 19 Oct 2021 23:27:11 -0500
Message-ID: <CAE-0n509=RqfzqBjzVDRphk3umbmZEuN8=A91FY8DPWyn0BH1g@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] arm64: dts: qcom: pm8350c: Add pwm support
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-10-19 03:48:51)
> From: satya priya <skakit@codeaurora.org>
>
> Add pwm support for PM8350C pmic.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - Dropped suffix '4' from pwm phandle and removed "status=ok".
>
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> index e1b75ae..08fc0a8 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -29,6 +29,12 @@
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
>                 };
> +
> +               pm8350c_pwm: pwm {
> +                       compatible = "qcom,pm8350c-pwm";

It should have a reg property. Every node should have a single cell for
the reg property because the parent has #address-cells = <1>

> +                       #pwm-cells = <2>;
> +                       status = "disabled";
> +               };
>         };
