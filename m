Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC3D433FE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 22:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhJSUqZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 16:46:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230147AbhJSUqZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 16:46:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D12FB61373;
        Tue, 19 Oct 2021 20:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634676251;
        bh=T8mHmJya+ILFpd3CCIxQDtDOrlirWq4tUXYlbvgnPik=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e7h8XCbiWISq39ZW24xItKFZT0ZZM66Qo387xD8ygYxNkxcSxsfdjuBE0nODgV8nd
         xZe8RNARDPbJ10V89jhBLGD/SQQlTqwZVlUpPSzaSA4eNhGYQc8Mj/AOvdFu5SEqVW
         dw02rsY/6JSH7v4H1I6ZhZS3DdLhgor/rkqINNayJEUEIZ6itjoJRmJJfgvyv9eUGG
         ukjlfLdvgrLU2WQBuc4A3wgrjkMCuXCBMxTkcjHJnLLFReHg3uMZBiPjwpJms/HQ+L
         HZqEvFConnQ4LlCRP/ETOkoGh4rmD7tWANXoa19SyiwgnyfYXbfehmK9IXbvjqzNrC
         4Trf0AOlel7Eg==
Received: by mail-wm1-f41.google.com with SMTP id z77-20020a1c7e50000000b0030db7b70b6bso5453807wmc.1;
        Tue, 19 Oct 2021 13:44:11 -0700 (PDT)
X-Gm-Message-State: AOAM531CrHDCYgXjy1G71lwXu5DboTMkL/SU3qiWm9T4T8gNFzoxr5WG
        ohMelj61pVJTJqrijTL96zAYLC5Z4hvB1Ycv8n4=
X-Google-Smtp-Source: ABdhPJyJhNq13/SKtqK5Qj+ZXoJCuLOxLsA8F5PoL249ralobTTeSAlxk94fzTdhFycLrA5AaDtEaiCfGufMtVS9Ei4=
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr8317592wmi.173.1634676250240;
 Tue, 19 Oct 2021 13:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org> <1632399378-12229-9-git-send-email-rajpat@codeaurora.org>
In-Reply-To: <1632399378-12229-9-git-send-email-rajpat@codeaurora.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 19 Oct 2021 22:43:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3KuTEAXbSTU+n3D_fryquo8B-eXSF2+HrikiNVn6kSSg@mail.gmail.com>
Message-ID: <CAK8P3a3KuTEAXbSTU+n3D_fryquo8B-eXSF2+HrikiNVn6kSSg@mail.gmail.com>
Subject: Re: [PATCH V10 8/8] arm64: dts: sc7280: Add aliases for I2C and SPI
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 23, 2021 at 2:18 PM Rajesh Patil <rajpat@codeaurora.org> wrote:
>
> Add aliases for i2c and spi for sc7280 soc.
>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

I saw this in the pull request, can this please be reverted?

Putting the aliases into the .dtsi file is really silly, as there are
likely boards that
don't connect every single one of those, and then will have to
override and renumber
them.

Please only list the aliases that are actually connected on a particular
board.

        Arnd

> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index c26647a..e5fefd1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -26,8 +26,40 @@
>         chosen { };
>
>         aliases {
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &i2c7;
> +               i2c8 = &i2c8;
> +               i2c9 = &i2c9;
> +               i2c10 = &i2c10;
> +               i2c11 = &i2c11;
> +               i2c12 = &i2c12;
> +               i2c13 = &i2c13;
> +               i2c14 = &i2c14;
> +               i2c15 = &i2c15;
>                 mmc1 = &sdhc_1;
>                 mmc2 = &sdhc_2;

The mmc ones should probably go away as well.

> +               spi0 = &spi0;
> +               spi1 = &spi1;
> +               spi2 = &spi2;
> +               spi3 = &spi3;
> +               spi4 = &spi4;
> +               spi5 = &spi5;
> +               spi6 = &spi6;
> +               spi7 = &spi7;
> +               spi8 = &spi8;
> +               spi9 = &spi9;
> +               spi10 = &spi10;
> +               spi11 = &spi11;
> +               spi12 = &spi12;
> +               spi13 = &spi13;
> +               spi14 = &spi14;
> +               spi15 = &spi15;
>         };
>
