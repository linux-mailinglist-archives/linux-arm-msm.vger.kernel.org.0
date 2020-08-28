Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122AE2556BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 10:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgH1IpF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 04:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728707AbgH1Ion (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 04:44:43 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35A8C061264
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 01:44:42 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id v20so145685ual.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 01:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7lAWD6TQfNDSdNYPEmyMSG7pnhu8lt92hgM43kOsomI=;
        b=LOer1m9yauU/QuGkOJQ8YveIhHP+0Zrtgxnrx+OGFSqR7wMZr2JIbhDhlMQfHqDI0l
         Eo+FJGve05tHGCcXv3i3xyHs136HtTJNGMOFNNVfRYD2EbpzpnlAtvyXSgvS+5zCRy+p
         nb1NOOUz/XzZGSb7D/IiYRLFVgboA9bzMRIFjb+DHJDzICTJaCeXpEpLd1eh8S6V8sw6
         et7sIu6Oy+dYbh/x4XIDULqag3DSvLszdnF5V61Vh0YtpDwkrAjUP6zLzjkrweYcaWEq
         3xplg2ZFP2L6dgwvcE9DMivQslslJWrF9yrLk2iV1MT33mUe7aowd/Ceye3v681SZJEn
         B9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7lAWD6TQfNDSdNYPEmyMSG7pnhu8lt92hgM43kOsomI=;
        b=sTeaBQx9tUcCV6IoZQVlnXVfGtGnG6aVJyjup2zt4A4hfoQ/3N8H7uGjs/CimBpEfA
         7ocePk4Blawm4Gq5v8AkXclM9P80aRJS22LI1agLQfuxMNzGzV/XxwkvbusFtz/279Df
         fEGB0aLqL4gatYABTHzjKi/SuIJtH6PTmThlJRbEHazJObG5+738ofQuoMxGFPPeyEBY
         +6yglf6pHRE6Dc34feF1KG6AhSEaYXlKiNsVDR56VDkO9ZWqxUdVS5TiOZMBGt1BJpRj
         RJs2iqff/jU2jZAkzdt4WSvxXJe4cfy3rPCjfSQ0XEtmSs92uEmYYZuKplpB8ai+syYx
         gpyw==
X-Gm-Message-State: AOAM531G6nDS70ys2qzw6U1XK+BSS9D2j8NzmTDgGYL4lLBrHTcnZQ7m
        a6zMR4vy/CtYidUAPKFIt004THF4bh8fdouQpBT+mg==
X-Google-Smtp-Source: ABdhPJyey/cFwzGHoCV6mglyXWxHNMbQDC+rWq9YJ6/iADYQnA4MvGX/TEiudf2Du0KrDfmjiOQkU0RdgfeRKCON3xc=
X-Received: by 2002:a9f:2190:: with SMTP id 16mr284027uac.19.1598604282247;
 Fri, 28 Aug 2020 01:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200824171854.406157-1-alex.dewar90@gmail.com>
In-Reply-To: <20200824171854.406157-1-alex.dewar90@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 28 Aug 2020 10:44:05 +0200
Message-ID: <CAPDyKFrTtDo1PfKhN2h_WjUmnsWPKQtD0_Gd34ysHtkd5UkVVQ@mail.gmail.com>
Subject: Re: [PATCH RFC] mmc: sdhci-msm: enable compile-testing on !ARM
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Jeffery <andrew@aj.id.au>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        Takao Orito <orito.takao@socionext.com>,
        Guo Ren <guoren@linux.alibaba.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 24 Aug 2020 at 19:20, Alex Dewar <alex.dewar90@gmail.com> wrote:
>
> There seems to be no particular reason to only test for ARM, so allow
> for build-testing on other platforms to increase coverage.

Agree.

>
> Build-tested on x86 with allyesconfig.
>
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>

I have applied this for next, let's see what the build bots reports, thanks!

Kind regards
Uffe


> ---
> Let me know if there is some extra dependency needed for COMPILE_TEST! I
> don't want to break anything.
> ---
>  drivers/mmc/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index f6c6eed5227a..7707f7385b5b 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -525,7 +525,7 @@ config MMC_ATMELMCI
>
>  config MMC_SDHCI_MSM
>         tristate "Qualcomm SDHCI Controller Support"
> -       depends on ARCH_QCOM || (ARM && COMPILE_TEST)
> +       depends on ARCH_QCOM || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_CQHCI
> --
> 2.28.0
>
