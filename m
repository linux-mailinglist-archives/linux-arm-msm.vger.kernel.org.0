Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2E72420C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 22:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgHKUEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 16:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgHKUEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 16:04:38 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DEEC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:04:37 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id p8so6634286vsm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vF7UMROFE+dAJKvt4jRLzJ1y/Thu+BCzQUX/As3ZgXM=;
        b=gjXSyPyXZoPTlyrC5XR/K9JyfeE+I1aFx5WTng1nCFxKNi2DXwnibyuUdLyRZ/bzRz
         yNxYdmLEWKclEDlwLKm+mxedlq9DiWpV4FxLYj19eUGHv9Z7PWwO+cbkPuMA8qjPxdYp
         uZSF/mQuyDOMl+8Wy70Tl5CxdDML5f8yRR3GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vF7UMROFE+dAJKvt4jRLzJ1y/Thu+BCzQUX/As3ZgXM=;
        b=Sk6M/6jMP24DkX9/+vbB1rxg4MuyOcVQ/kDjez3V5W0YtacHdrU171Z3wY4w7SDFJ9
         ZYfSfmGrfOmKjLRCagcNF0qcACL9KmOFvrWBSTX/4q5c5UR2i00VzB+juGVTVX/+BT5n
         /dLARuRMs4w4inFVQQ3mORgwdiw9TKQKnInaZTfit7bSN5tfSt48F2/4dP9Iph9rR60U
         vyhONbC0avP5J4zjuT6ow1rk2IqYXaUv1muSQfLheNzbYzViP+HuZahoPAu/GrxU8Epn
         RPeI/chEcQdITi2Yyrtwsmp5ypZcoV97Xnux1iOIYBoUG+OarRg/C6MqQRJPrSxTYqmE
         oiRg==
X-Gm-Message-State: AOAM531LE6MA+Y6KxcJsIySi+qJodoRKW/CrTgR/8Uuk6EWATSuK3lcF
        2HRtVqpc9+i1+OBy08FyCBQIAy3TJOQ=
X-Google-Smtp-Source: ABdhPJxitr4JDP7qQuP/0dVgDwNew09NsnlEoFV9uqvjs373WPM/4Way/EuYnhCIS2Kkp0qNY0dEWA==
X-Received: by 2002:a67:6305:: with SMTP id x5mr25327475vsb.35.1597176276675;
        Tue, 11 Aug 2020 13:04:36 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id s5sm7279140vsk.10.2020.08.11.13.04.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 13:04:35 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id q200so7161vke.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:04:34 -0700 (PDT)
X-Received: by 2002:a1f:2fc1:: with SMTP id v184mr26376890vkv.42.1597176274522;
 Tue, 11 Aug 2020 13:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1597058460-16211-2-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 11 Aug 2020 13:04:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4YVAqQXoJ47KY78kEsdoK33ic0P0rADkFWe=yU1x1nQ@mail.gmail.com>
Message-ID: <CAD=FV=U4YVAqQXoJ47KY78kEsdoK33ic0P0rADkFWe=yU1x1nQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] pinctrl: qcom: Add msmgpio irqchip flags
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Aug 10, 2020 at 4:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs
> during suspend and mask before setting irq type.
>
> Masking before changing type should make sure any spurious interrupt
> is not detected during this operation.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index a2567e7..90edf61 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1243,6 +1243,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>         pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>         pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
>         pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
> +       pctrl->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND
> +                               | IRQCHIP_SET_TYPE_MASKED;
>
>         np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
>         if (np) {

After taking Stephen's suggestion of improving the subject:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
