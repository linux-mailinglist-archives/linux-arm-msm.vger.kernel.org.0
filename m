Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFB3625F74A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 12:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbgIGKIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 06:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728473AbgIGKID (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 06:08:03 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3AD4C061757
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 03:07:59 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id v20so4012299ual.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QuNLltsEiIW4LCbpFyTWl1p44IkTT3QJmbdClg97dn0=;
        b=GdR9hDKN5L9o4E+D9klMf226TdSBiyQrmIJFqTy1wvu7JgUOP5hnq9D/dbGUt34nVN
         XTE9ZkkMZYDWJkEj8/LXyenZz3T0Irx/WXSUQIYDB4F7XGGOjeU/eP0cHxgH70gtpxoS
         593wZnUVUiqgZqhmNZJBvdbDOEAjelVZNg7W3uJxmMeE2W2+4ryrLED4uLWr5d2on/1Y
         V+k0+LPGbknr9eHhBtS9n9cOKc/o9fFLWU4T/+6C9EhAuV3OtNNgAG8pjet6UXydTeg8
         /OlJ55P8StYowRupDWz7iqCrO55GZV8SHF0Qf78K+dPX1qyWPG1Pi5uUN5Re3N+8QgpF
         Opsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QuNLltsEiIW4LCbpFyTWl1p44IkTT3QJmbdClg97dn0=;
        b=cmOPoeDixvAluxfTZnU9qw2eCWmWadvfe/cyvgRSbSxkleYGJ+EUYvSwt+H5G+jmH+
         qFP5LL6z1xXiuk9Uz008kFwd15drcUmY1JV3N5noM824o0uqzZ6mgSX8Q/tIyEhsiQle
         rnu6MQvXhGDzfhpKfyPJVJytw/7MGEExV2jXCb1hQM/eHz4qPNkRLG+2RbFbHsK6qYjM
         9GuRfmyxTBhJ1VD46XeoOv1AH4EQtq2QnCVdYpSz9dNbG2bIbYqf7JZTek0UArVKHmp9
         MLpXCqG2J2nppHd9hrPXksi+EQ1sVB4stYH5c9pYko/JlfNcGxxAedjPYKSghIcfMkdG
         DLzw==
X-Gm-Message-State: AOAM532wD8Hkd/N+tzdBpOF+VDlVdZ6x+k3zm1Sl3ftac8qtLUVq5kj5
        PH+p8DoLcB7c2S+XsZV/HE0x3VsiMlx8P6V3qtLjKw==
X-Google-Smtp-Source: ABdhPJylvGTfdGwP02Q+D0hgvcDauwlOQni6HAn5s7aLot2eLwS2w0Wmn0FgXWKx98K2aaDsiVxs7F4QHZfQitRnsZs=
X-Received: by 2002:ab0:130a:: with SMTP id g10mr1522518uae.100.1599473277782;
 Mon, 07 Sep 2020 03:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200904164315.24618-1-krzk@kernel.org>
In-Reply-To: <20200904164315.24618-1-krzk@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 7 Sep 2020 12:07:21 +0200
Message-ID: <CAPDyKFrzDeNqvM4cc69iCdVW7QnF=O9C=v13+o5bGBSCSzZfWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: host: Drop unneeded MMC dependency in Kconfig
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Prabu Thangamuthu <prabu.t@synopsys.com>,
        Manjunath M B <manjumb@synopsys.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-arm-kernel@axis.com,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 4 Sep 2020 at 18:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> All entries in Kconfig are already part of "if MMC", so there is no need
> for additional dependency on MMC.
>
> Suggested-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
>
> Changes since v1:
> 1. New patch
> ---
>  drivers/mmc/host/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index b95f79f53395..eea01fde0591 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -422,7 +422,7 @@ config MMC_SDHCI_IPROC
>
>  config MMC_MESON_GX
>         tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
> -       depends on ARCH_MESON && MMC
> +       depends on ARCH_MESON
>         help
>           This selects support for the Amlogic SD/MMC Host Controller
>           found on the S905/GX*/AXG family of SoCs.  This controller is
> @@ -458,7 +458,7 @@ config MMC_MESON_MX_SDIO
>
>  config MMC_MOXART
>         tristate "MOXART SD/MMC Host Controller support"
> -       depends on ARCH_MOXART && MMC
> +       depends on ARCH_MOXART
>         help
>           This selects support for the MOXART SD/MMC Host Controller.
>           MOXA provides one multi-functional card reader which can
> --
> 2.17.1
>
