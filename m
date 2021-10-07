Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330D6425A07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 19:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241738AbhJGR4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 13:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243063AbhJGR4J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 13:56:09 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FC2C061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 10:54:15 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id a3so10094853oid.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 10:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ZApifAfSd7xSshpr/sUxHr3xYp1pLLomLCFKliEgdTo=;
        b=fibgMhQWg4plwc/oDBxVmsaY1sPz+UMaaOhVHoXLGf2ho/fjdq1nvo3RWq++NfQXnv
         Y7zbCLFEcxnAzjx7+vkDxaBpF03k/95kwakILe3IgsLoKfuVCue756wC5YYPLMe37cOk
         jinpdxwYMDiRFh7Vn7zu/1/mqfU8Ck5J770UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ZApifAfSd7xSshpr/sUxHr3xYp1pLLomLCFKliEgdTo=;
        b=UXU+Yu86NTYT3EXk7YGLxBgNDP6hN/BOhzk4IGkVN+BjB4M5OpzZvMxLmlkSDdh4CP
         ISiRGiYbnOJXP9uq9XjwP8pPIGdqN6jM4h40KJLmU5CZpNfuC01BONcKUrK5Np995nFo
         Abkd0tm63tF14LzfBhY3mRI4qOGazK7yVvurXqUWzADnXwB847k/1XPtF5t20/+vgQKA
         OQ7ty25NAQrfPWG1CbzadZwHLesWg9lCVpiEeQB2cv6CJ2yPEe1eZUwiyglbnYFz7jc4
         k+0jbMqP/KhyqtQhtU7Ft6Br+B7vJD5o9j+d2Kfoj4iRziPF/IDNTWxxpKtH9rHXxp4k
         MZSw==
X-Gm-Message-State: AOAM530bKHIljh5CPdKb0EgN9cr100Yq8jFsmOLUik79nMHT4xuMqHt8
        eL9GUKOspJGnfiZLaEwIOochox7nY3TSR1YCp+puAQ==
X-Google-Smtp-Source: ABdhPJzer7jLB28aIBeMpuO+LH9S7TJN5mH1yWD95x/J+s29nDUp/kNabPWn+JQVCK2eQyOyGVJML/1np5GW9StH6v4=
X-Received: by 2002:aca:f02:: with SMTP id 2mr4323517oip.64.1633629255319;
 Thu, 07 Oct 2021 10:54:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 13:54:14 -0400
MIME-Version: 1.0
In-Reply-To: <1633614519-26680-4-git-send-email-srivasam@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org> <1633614519-26680-4-git-send-email-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 7 Oct 2021 13:54:14 -0400
Message-ID: <CAE-0n53SqOHKDpMQicrFNmZ1YxAPesTAk4j6kJVi3xMV8re4-w@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add SC7280 lpass pin configuration
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

Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:39)
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index c0117c5..0b68065 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -237,6 +264,15 @@ static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
>         .nfunctions = ARRAY_SIZE(lpass_functions),
>  };
>
> +static struct lpi_pinctrl_variant_data sc7280_lpi_data = {

Can this variant data be const?

> +       .pins = lpass_lpi_pins,
> +       .npins = ARRAY_SIZE(lpass_lpi_pins),
> +       .groups = sc7280_groups,
> +       .ngroups = ARRAY_SIZE(sc7280_groups),
> +       .functions = lpass_functions,
> +       .nfunctions = ARRAY_SIZE(lpass_functions),
> +};
> +
>  static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>                          unsigned int addr)
>  {
