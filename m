Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC6223C71E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 09:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgHEHoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 03:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgHEHof (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 03:44:35 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC34FC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 00:44:34 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id s190so8569460ooa.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2XB0gKQyc9CsSKqZ7GgGJ8tPycXtrwiQ0rJYnNLbYnE=;
        b=O7KCWZiyayJrpPKe4Qo2MFaMV++l507OxnySpg4nllQ/4WIyMRp2lmiAvGqQ++lZ/i
         vurTpoVPRWh2eWqVPdl+snBzEx6FwPldWsWqTBgZM4xOyUZWUxAZjdRAQgCtgP67MK04
         ee7GreNHGoW00bOF3cl/JYbZUFiin8xF3OX6uD5776b0ZZdreRjtCydX/Uhays9SI/tB
         axIiLXzrWS9a6MiU3AOIocYrZgEHqZi5bWdtWeWMCkuKFVa95uev5y5FAL8m4mBOG7+s
         LFMYnNqvJyhxpqiIzSINRZJQdQ1ASAJHx/N/N+MNsK+WGBTlWFQJ9NeScR/DbhGCCnT0
         6c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2XB0gKQyc9CsSKqZ7GgGJ8tPycXtrwiQ0rJYnNLbYnE=;
        b=sTSdNDDz6hy6cOqdsgDdrjSjmixX6jd6qC879agrzEwY2XXVot0xep3HmZN6DFNcEk
         PdUSN/8KlvtYQ71FhE8IiUD1vVB9UkjCEqZhs22a/96VVpcMuEaVITB66ngXzLDtajbs
         P6h1ddlkrFYIGzLkM87WAQnq9Cwt+az+3sYq/iPVlyQeETghYI4yuxbIrC6WaUOhnK8/
         Ml78pgyJBmhD2SRf5mN5YxFRBRZ2aceq/U3jqxxWmAswOXHPKzKPEoYsj0LKKjXefSXZ
         p7dTDCFcbKoonS7FPX7EF0VQs8Vq68IupzU9TGwWicvvuTZPDfbrdAoOgXmM4qcfenHR
         1ZzA==
X-Gm-Message-State: AOAM530S41GFum55Icc7VVFd6acvR+GinNJIN5Pbq4pO/1FaFZa0l86/
        Akuh5PtKBYNjH9RUuY/eyP3Jt1+x47lMUWAz7mAj8A==
X-Google-Smtp-Source: ABdhPJyTnc5GAirwQ3qZDK4WN0lqH19fI2aSlix6R6R+dyBypcI5OYPshiJlUl3SHM0DH8s2OgrXhfwvSl++QvmT16w=
X-Received: by 2002:a4a:a648:: with SMTP id j8mr1634862oom.36.1596613472779;
 Wed, 05 Aug 2020 00:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com> <20200718000637.3632841-3-saravanak@google.com>
In-Reply-To: <20200718000637.3632841-3-saravanak@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 5 Aug 2020 00:44:21 -0700
Message-ID: <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To:     Saravana Kannan <saravanak@google.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Switch the driver to use the helper macros. In addition to reducing the
> number of lines, this also adds module unload protection (if the driver
> is compiled as a module) by switching from module_platform_driver to
> builtin_platform_driver.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 5b624e3295e4..c1c5dfad57cc 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>         return ret;
>  }
>
> -static int qcom_pdc_probe(struct platform_device *pdev)
> -{
> -       struct device_node *np = pdev->dev.of_node;
> -       struct device_node *parent = of_irq_find_parent(np);
> -
> -       return qcom_pdc_init(np, parent);
> -}
> -
> -static const struct of_device_id qcom_pdc_match_table[] = {
> -       { .compatible = "qcom,pdc" },
> -       {}
> -};
> -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> -
> -static struct platform_driver qcom_pdc_driver = {
> -       .probe = qcom_pdc_probe,
> -       .driver = {
> -               .name = "qcom-pdc",
> -               .of_match_table = qcom_pdc_match_table,
> -               .suppress_bind_attrs = true,
> -       },
> -};
> -module_platform_driver(qcom_pdc_driver);
> +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
> +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
> +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
>  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
>  MODULE_LICENSE("GPL v2");

<sigh>
So this is where I bashfully admit I didn't get a chance to try this
patch series out, as I had success with a much older version of
Saravana's macro magic.

But unfortunately, now that this has landed in mainline, I'm seeing
boot regressions on db845c. :( This is in the non-modular case,
building the driver in.

I managed to bisect it down to this patch, and reverting it avoids the
issue. I don't see what is wrong right off, but I really need to get
to bed, so I'll dig further tomorrow.

Saravana: Apologies for not getting around to testing this beforehand!

thanks
-john
