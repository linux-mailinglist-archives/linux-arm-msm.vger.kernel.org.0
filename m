Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FC53D3DC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 18:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhGWQD2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 12:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGWQD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 12:03:27 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DC2C061575
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 09:44:00 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id l16so1650058qvw.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oc8CK0AsdZszsESWwjfIrhAjbLc742tCwBqHvOldIcY=;
        b=IRarJsCDT60AoiiLdZaWY9Pa53CuNALBm89bNCTf1K9FWkoWh6vFzafpzU6XniduLG
         K5+jk+ECPltATP2sQMwwxwAOgRWv97d+wXenryGCyyQX5533M5MdwD4sjcj1M+MZf+1b
         ba5fA9gkLqmdHNJtf7/hPBseKbHcrQfDb8nAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oc8CK0AsdZszsESWwjfIrhAjbLc742tCwBqHvOldIcY=;
        b=fVvSDbBIBbyvGwycfs0hvESt+x5dF3itmH1exHtPL3HBzQUpTJpVw2ElKGvCHXZHp6
         LMVIhhz/wtoSyOUE8tF8xm7ruGD41AMQRCpja4gih+Hg/eZNW8klzs8ZPd4kJ4Pcix0J
         pvnmlq5rTRsPLU9opYShWiil3PY4G+RpZVIONdX7UUHZCVLs5dTOiiEtqp4BAihChWoS
         WHkx0Aj5e2zuCevBpwnk2GE/TRKuzpuWu3FDjAMkO7qJCq/WBpcAjWMQ7GsbvWgK90Jc
         R80jsP6xtHm8N1zhd6b3VYjczbPYst0sLTqshMJg4IcQuEZhC7WGnrd3wsdfOCW9V0Qv
         /RvQ==
X-Gm-Message-State: AOAM531qdDoWRnn+Ijktov4e7DD7TMEyXGESEjrxPxdP+h8e0X5vhf3z
        XZGKrGhdQxGQuDmzXZVQ2HRv11u/nySkLQ==
X-Google-Smtp-Source: ABdhPJyfEsulznFojpQp+irX9mCWIdyhWaNzpWOdBieh5M10/yCuXK8HPvq4DDGWA1ckEeFaD/6Fvg==
X-Received: by 2002:a0c:ebcf:: with SMTP id k15mr2182992qvq.39.1627058639446;
        Fri, 23 Jul 2021 09:43:59 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id n5sm12959233qkp.116.2021.07.23.09.43.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 09:43:58 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id g76so3281549ybf.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 09:43:58 -0700 (PDT)
X-Received: by 2002:a05:6902:521:: with SMTP id y1mr7959636ybs.32.1627058638294;
 Fri, 23 Jul 2021 09:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <1626931716-10591-1-git-send-email-rnayak@codeaurora.org> <1626931716-10591-3-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1626931716-10591-3-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Jul 2021 09:43:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHP9GbyueqrM1pJ-ZjgndYWj9Q6883pDHnZmK2mMYN2Q@mail.gmail.com>
Message-ID: <CAD=FV=VHP9GbyueqrM1pJ-ZjgndYWj9Q6883pDHnZmK2mMYN2Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: qfprom: sc7280: Handle the additional
 power-domains vote
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 21, 2021 at 10:29 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> On sc7280, to reliably blow fuses, we need an additional vote
> on max performance state of 'MX' power-domain.
> Add support for power-domain performance state voting in the
> driver.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/nvmem/qfprom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 81fbad5..4d0a576 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -12,6 +12,8 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/nvmem-provider.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>
> @@ -149,6 +151,11 @@ static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
>         if (ret)
>                 dev_warn(priv->dev, "Failed to set 0 voltage (ignoring)\n");
>
> +       if (priv->dev->pm_domain) {
> +               dev_pm_genpd_set_performance_state(priv->dev, 0);
> +               pm_runtime_put(priv->dev);
> +       }
> +
>         ret = regulator_disable(priv->vcc);
>         if (ret)
>                 dev_warn(priv->dev, "Failed to disable regulator (ignoring)\n");
> @@ -212,6 +219,16 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>                 goto err_clk_rate_set;
>         }
>
> +       if (priv->dev->pm_domain) {
> +               ret = pm_runtime_get_sync(priv->dev);
> +               if (ret < 0) {
> +                       pm_runtime_put_noidle(priv->dev);
> +                       dev_err(priv->dev, "Failed to enable power-domain\n");
> +                       goto err_reg_enable;
> +               }
> +               dev_pm_genpd_set_performance_state(priv->dev, INT_MAX);
> +       }
> +
>         old->timer_val = readl(priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
>         old->accel_val = readl(priv->qfpconf + QFPROM_ACCEL_OFFSET);
>         writel(priv->soc_data->qfprom_blow_timer_value,
> @@ -221,6 +238,8 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>
>         return 0;
>
> +err_reg_enable:
> +       regulator_disable(priv->vcc);
>  err_clk_rate_set:
>         clk_set_rate(priv->secclk, old->clk_rate);
>  err_clk_prepared:
> @@ -420,6 +439,9 @@ static int qfprom_probe(struct platform_device *pdev)
>                         econfig.reg_write = qfprom_reg_write;
>         }
>
> +       if (dev->pm_domain)
> +               pm_runtime_enable(dev);
> +

Where is the matching pm_runtime_disable()? Should be one in
.remove(), or use devm_add_action_or_reset() to wrap a call to it.

Also: do you really need to test for dev->pm_domain in your patch?
Seems like it should always be fine to call pm_runtime_enable() and
then always fine to call the get/put. ...and presumably always fine to
even set the performance state?

-Doug
