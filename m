Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75BC65123D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 22:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235531AbiD0U0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 16:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiD0U0X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 16:26:23 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885562C139
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 13:23:10 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id p4so3293699edx.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hg004OiQxeLIUVwy4+6A7P6pwqtnS8in36qCM7KQGZE=;
        b=ZyxTvlX26aITt6cEZXyGAGjtpRJK1eG5MnwMmW334zpNL6PLDgSbAhqCa333NRw+Wt
         Fwce2HVjuSvtblIVtw1I9rbeg4QTXi7ZBRiLWfRq342RXQr0CEYOgdHguSGtk1FtDrwW
         Y2pAMWi8hcdLwjAUaO2qgtmVZLtpdLkAcJgic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hg004OiQxeLIUVwy4+6A7P6pwqtnS8in36qCM7KQGZE=;
        b=TbHUwdvGp3LJwrMSfq1nSFTswqS2OGDOycj8xILMRNtReJTyc3MUZJ0fi3ppJAg4s2
         yVtctD0qKBiz0sYcTZOPw8X5iiAPI0xBivkzxfs/oFXx5ySXHFMdD53U7Af7cM2OU70p
         x1dtTKyNBIUj2KOVcAbQtFRmM0Zd96gJ20+0AuhYiEP1+cAQzWIwZ98HuedJ7ptXBfEI
         iYQCJH6chvq2Y/slXR/pKSXeKNqrQkaYf1IcacZ9o6H3LtV7hHHBBLgQ9BFkzzqc4huo
         GdA1Mr44CiL3QKsruPvQ8LJQIQTyL4rH6lN5NDTFHRQkYJSU1UPlF5YyYLuVbaS4EjVi
         gGAA==
X-Gm-Message-State: AOAM532R5CEN1DSK6b8Ac9f8tnZWJo2KHtN7DrZiJYGZ0+YZ6RhQX3de
        3OdPjUrgVlVuFFQKQCqPenWFLvf1wJbrcJSgpRA=
X-Google-Smtp-Source: ABdhPJzYkskiZ0V9aM/JKkGq1hAS/NljoUtVepfQv35yqVLYFuX9iGmuffLxqrvbmElOEl4OdfhLVA==
X-Received: by 2002:a05:6402:17c7:b0:425:d52c:8907 with SMTP id s7-20020a05640217c700b00425d52c8907mr23990233edy.15.1651090988732;
        Wed, 27 Apr 2022 13:23:08 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id cw27-20020a056402229b00b0042617ba6387sm150040edb.17.2022.04.27.13.23.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 13:23:07 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id b19so4008311wrh.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 13:23:06 -0700 (PDT)
X-Received: by 2002:a05:6000:1acb:b0:20a:a4b0:dbc8 with SMTP id
 i11-20020a0560001acb00b0020aa4b0dbc8mr23246499wry.513.1651090986260; Wed, 27
 Apr 2022 13:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220427125423.1.Id2821de5fde55ebe928e8fc87a71c8d535edb383@changeid>
In-Reply-To: <20220427125423.1.Id2821de5fde55ebe928e8fc87a71c8d535edb383@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 27 Apr 2022 13:22:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbQ7LhnxGAavLL3XDpPigwtCz0CF3YcZ=ywrXwu=uiMQ@mail.gmail.com>
Message-ID: <CAD=FV=XbQ7LhnxGAavLL3XDpPigwtCz0CF3YcZ=ywrXwu=uiMQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: wormdingler: Add wormdingler
 dts files.
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 27, 2022 at 12:54 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Wormdingler is a trogdor-based board, shipping to customers as the
> Lenovo IdeaPad Chromebook Duet 3. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with the camera
> (sc7180-trogdor-mipi-camera.dtsi) #include removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---

So this is the second version of the patch so it should be marked as
such. You're using patman, which means you should have something like:

Series-version: 2
Series-changes: 2
- Word wrapped patch description.
- Removed "Author" from patch description.
- Fixed whitespace around "en_pp3300_dx_edp"

Then patman will translate that in the right thing. In the next
version of the patch you'd _update_ "Series-version" to 3. Then you'd
leave the Series-changes: 2 stuff and add a new Series-changes: 3
section talking about the changes from 2 to 3. Running `patman
--full-help` should talk about all this stuff.

As a nit, I'll also mention that your subject line for the patch
shouldn't end with a period.


>  arch/arm64/boot/dts/qcom/Makefile             |   6 +
>  .../sc7180-trogdor-wormdingler-rev0-boe.dts   |  22 +
>  .../sc7180-trogdor-wormdingler-rev0-inx.dts   |  22 +
>  .../qcom/sc7180-trogdor-wormdingler-rev0.dtsi |  53 +++
>  ...0-trogdor-wormdingler-rev1-boe-rt5682s.dts |  39 ++
>  .../sc7180-trogdor-wormdingler-rev1-boe.dts   |  28 ++
>  ...0-trogdor-wormdingler-rev1-inx-rt5682s.dts |  33 ++
>  .../sc7180-trogdor-wormdingler-rev1-inx.dts   |  22 +
>  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 417 ++++++++++++++++++
>  9 files changed, 642 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f9e6343acd03..5f51452e3dc1 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -81,6 +81,12 @@ dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-pompom-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r2-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r3-lte.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-wormdingler-rev0-boe.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-wormdingler-rev0-inx.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-wormdingler-rev1-boe.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-wormdingler-rev1-inx.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-r1-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-herobrine-r0.dtb

sc7280-herobrine-herobrine-r0.dtb has been removed from the Qualcomm
tree. This makes your patch not apply unless I do "git am -3". Can you
update the Qualcomm branch, rebase, and send a v3?


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
> new file mode 100644
> index 000000000000..1a921a540075
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Wormdingler board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + *
> + * SKU: 0x401 => 1025
> + *  - bits 11..8: Panel ID: 0x4 (BOE)
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180-trogdor-wormdingler.dtsi"

Hrm, looking at these rt5682s.dts files it feels like it could be done
a little better. It would probably be slightly better/shorter to base
on the non-rt5682s version, AKA:

#include "sc7180-trogdor-wormdingler-rev1-boe.dts"

/ {
  model = "Google Wormdingler rev1+ (BOE, rt5682s)";
  compatible = "google,wormdingler-sku1025", "qcom,sc7180";
};

&alc5682 {
  compatible = "realtek,rt5682s";
  realtek,dmic1-clk-pin = <2>;
  realtek,dmic-clk-rate-hz = <2048000>;
};

&sound {
  compatible = "google,sc7180-trogdor";
  model = "sc7180-rt5682s-max98357a-1mic";
};

...similar for the other -rt5682s file...

Not sure why I didn't suggest that originally when reviewing
downstream at <https://crrev.com/c/3305627>. I guess I was younger
then.

It'd be nice if you could do this in a v3, though I suppose we could
always do it as a future cleanup.

It would also be handy if you could delete the keypad num-rows /
num-columns in wormdingler.dts in a v3 like Stephen did for
coachz/homestar. That'll save us from having to do a separate patch
for it. Buttons/switches won't work until we get the input fix in
linux-next, but that shouldn't be a huge deal, especially since
wormdinger wasn't even supported upstream at all until this patch.

[1] https://lore.kernel.org/r/20220426225748.324759-1-swboyd@chromium.org

-Doug
