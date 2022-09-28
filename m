Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C24835EE805
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 23:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234776AbiI1VKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 17:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbiI1VJ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 17:09:59 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0351459BD
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:05:25 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id sb3so29598662ejb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wa0REHy0sMvcVZ3nwJ6x69LtQCKssD3A2trva4mBvJQ=;
        b=UgY8KqUmmli6kU1Yh7SkE5qYJfnt69uOTZkUU41i4QcG6rShDq2Vzj8UVslJAeHZyH
         LgyZgCtLpb+rmzBxDOTBqa2r9tVVR64W6byDzV2d+yCOVHfFnOklMzE6K6p7EhhqyjTc
         5XgmXxj8iD2wr8RA9uwjDYb4R8bsMmnIXFTUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wa0REHy0sMvcVZ3nwJ6x69LtQCKssD3A2trva4mBvJQ=;
        b=vvt8vP2AQr2ViH+cvwVVK0SDT18TiF8aXTiZr+WYzxtEJ68bhXrI32fq907BbXMXLn
         HcZ9CVXCtfuWn5tPsHT5fHjHce99Nw4zz8qs3bupSWM5qv2wvXclKMUJC0O/woSHoH9T
         B+gFpmpEWFCq5hLVP7eenWulXPhLvhV/DFKFiklwPHYZl+Ipmfu8l7ZCD3Q/MXjj/48j
         ZoimxdKsfaHv/8KhBJarCk3ksO9z/MyCB9uNDpQ6N5s89dEqEYe9cUaybAbZKP5zDj0b
         ZGZ+GDr8BsrRlCi/HJgFallyQAAOQ5d8DjdV3XhOYuJE9g/HBPHOyTIHMJlxGGVzOw/6
         rvNw==
X-Gm-Message-State: ACrzQf165SzBVIc807zqcC9bUEdlmn75s9gO04QzlL4kiXQFUOQucBRT
        +7rGuhxBr87Mb2Q1EXp4WI/0e1q86K16OOTL
X-Google-Smtp-Source: AMsMyM4tA1hiyTK/tOH4FBfJR+svhXPupXNFH6DVlpEvl+ETPJa8GFht7jMex97WOkgP4U41InTtrw==
X-Received: by 2002:a17:907:968f:b0:782:6a9d:33fb with SMTP id hd15-20020a170907968f00b007826a9d33fbmr27413758ejc.754.1664399066236;
        Wed, 28 Sep 2022 14:04:26 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id qb24-20020a1709077e9800b007807e4f6b30sm2886825ejc.103.2022.09.28.14.04.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 14:04:25 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id s14so21701862wro.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:04:25 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr21873427wrr.583.1664399065164; Wed, 28
 Sep 2022 14:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220927112343.2700216-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220927192234.v4.2.I1454364ac3d8ecc64677884d6b7d2f3e334e4b4a@changeid>
In-Reply-To: <20220927192234.v4.2.I1454364ac3d8ecc64677884d6b7d2f3e334e4b4a@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 28 Sep 2022 14:04:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vu-bZFeZVER+dP4pTD6UTTLFhpJX=ZxurBbkep=8uHyg@mail.gmail.com>
Message-ID: <CAD=FV=Vu-bZFeZVER+dP4pTD6UTTLFhpJX=ZxurBbkep=8uHyg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add LTE SKU for sc7280-evoker family
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 27, 2022 at 4:25 AM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> evoker have wifi/lte sku, add different dts for each sku.
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
>
> Changes in v4:
> - remove change for trackpad and touchscreen
>
>  arch/arm64/boot/dts/qcom/Makefile                 |  3 ++-
>  .../boot/dts/qcom/sc7280-herobrine-evoker-lte.dts | 14 ++++++++++++++
>  .../boot/dts/qcom/sc7280-herobrine-evoker.dts     | 15 +++++++++++++++
>  ...evoker-r0.dts => sc7280-herobrine-evoker.dtsi} |  8 --------
>  4 files changed, 31 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
>  rename arch/arm64/boot/dts/qcom/{sc7280-herobrine-evoker-r0.dts => sc7280-herobrine-evoker.dtsi} (98%)
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d7669a7cee9f7..76390301a76c0 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -104,7 +104,8 @@ dtb-$(CONFIG_ARCH_QCOM)     += sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-r1-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-crd.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-evoker-r0.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-evoker.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-evoker-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-herobrine-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-villager-r0.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-villager-r1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
> new file mode 100644
> index 0000000000000..3af9224a7492e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Evoker board device tree source
> + *
> + * Copyright 2022 Google LLC.
> + */
> +
> +#include "sc7280-herobrine-evoker.dts"
> +#include "sc7280-herobrine-lte-sku.dtsi"
> +
> +/ {
> +       model = "Google Evoker with LTE";
> +       compatible = "google,evoker-sku512", "qcom,sc7280";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
> new file mode 100644
> index 0000000000000..dcdd4eecfe670
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Evoker board device tree source
> + *
> + * Copyright 2022 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7280-herobrine-evoker.dtsi"
> +
> +/ {
> +       model = "Google Evoker";
> +       compatible = "google,evoker", "qcom,sc7280";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
> similarity index 98%
> rename from arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
> rename to arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
> index ccbe50b6249ab..1b2ec95a289e9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
> @@ -5,15 +5,8 @@
>   * Copyright 2022 Google LLC.
>   */
>
> -/dts-v1/;
> -
>  #include "sc7280-herobrine.dtsi"
>
> -/ {
> -       model = "Google Evoker";
> -       compatible = "google,evoker", "qcom,sc7280";
> -};
> -
>  /*
>   * ADDITIONS TO FIXED REGULATORS DEFINED IN PARENT DEVICE TREE FILES
>   *
> @@ -60,7 +53,6 @@ ap_ts: touchscreen@10 {
>                 interrupts = <55 IRQ_TYPE_LEVEL_LOW>;
>
>                 reset-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
> -
>                 vcc33-supply = <&ts_avdd>;

The above is an unrelated whitespace change and doesn't belong in this
patch. Ideally you'd send a v5 where you didn't have that.

In any case, it's not a huge deal to me, so with or without that fix:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If you do decide to send a v5, please make sure you carry my and
Krzysztof's Reviewed-by tags on the bindings and my Reviewed-by tag on
this patch. Thanks!
