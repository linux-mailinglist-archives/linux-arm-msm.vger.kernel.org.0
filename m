Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098AC6361FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 15:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237411AbiKWOjz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 09:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237853AbiKWOjy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 09:39:54 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213D4429AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:39:53 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id p184so13250904iof.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w+iYV6kI8Gk9CIv4+Wp5wKD5Vy+egVw6+4bqcYnHaKI=;
        b=d8tw10g4jtqLpofZTzhmT1a8hePY93ZndD3gt6AV59K25N6voZ5T1SnKpVpeRsvnAI
         DmVe3PsPkvlbaWsGELyJZ8sgzqmkFrcidEruudubyMKbZz7q7hy6LRfr4iLRgksIg1vv
         xTynzXdHshGggqHQatqo8SUBPDsXbwp1e3b0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+iYV6kI8Gk9CIv4+Wp5wKD5Vy+egVw6+4bqcYnHaKI=;
        b=TD8zYOjhU1OoJHIg2lPpt7yYV0oBDK98/bCHvJHXVa5IX2rI4dx7QTivRrPaEEV4uE
         03IYf2yOJQjLWzvNA58aWNqTs+G0/ksN+qMJdZU8TJ3bHMyjtevYxFZh2a2yOa1Q7/TE
         Leyh1p8gq1a4s33kVpLBpSHmseFkwHflGaKoo56VA3ngvNBlvBEgtNRvfqsTkMsO4hx9
         TfBfcVjq/w+BEzyrSu0OTbLW86AyShhMoB94g1HC5NuaHpjr+PfCp2tZKHf79EVe1nFE
         1o5ca9ENgbp3cfCbUfcGd92rdFFNbHgvcsxRU4F4CAn3g/TEMd8HtI5cXlHsfP5acFSG
         bf/Q==
X-Gm-Message-State: ANoB5pnbSoVo7OZ2qgQucv3i01DipNR9gm+QyqpsPDs6vRMFG2lM+B3w
        yAoHo/aBVyxOg0RMDRVyQjd5UA==
X-Google-Smtp-Source: AA0mqf7iPTcWLEFnYgztOLb+FkD7e3oqdAY4QDsam+H748gK8+kwtFePlhri9cdquk/ZyyGh5+eOeQ==
X-Received: by 2002:a02:334d:0:b0:376:22fe:5e7c with SMTP id k13-20020a02334d000000b0037622fe5e7cmr13067604jak.126.1669214392381;
        Wed, 23 Nov 2022 06:39:52 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id e1-20020a028601000000b003636c5dcf29sm6242823jai.176.2022.11.23.06.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 06:39:52 -0800 (PST)
Date:   Wed, 23 Nov 2022 14:39:51 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, Harvey <hunge@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7280: Add DT for
 sc7280-herobrine-zombie
Message-ID: <Y34wtwSlqc0y4Msz@google.com>
References: <20221123181043.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <20221123181043.2.Ie435b31225d2dc284a34ac8e52fb84fffb39488c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221123181043.2.Ie435b31225d2dc284a34ac8e52fb84fffb39488c@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 23, 2022 at 06:11:13PM +0800, Owen Yang wrote:

> Subject: [2/2] arm64: dts: qcom: sc7280: Add DT for sc7280-herobrine-zombie

Please in include a version number for versions >1. If my accounting is correct
this is v3, so the next iteration should be v4.

You mentioned earlier that you are using patman. Add the following tag to
one of the patches in the series to get the version included in the subject:

Series-version: 4

> Add DT for sc7280-herobrine-zombie
> 
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
> ---

Where is the change log that I requested for v2? A change log helps reviewers to
focus their attention and can save them time by allowing them to skip parts they
already have reviewed.

Again patman can come to your help:

Commit-changes: 2
- <change 1>
- <change 2>

Commit-changes: 3
- none (<= example)

>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../dts/qcom/sc7280-herobrine-zombie-lte.dts  |  15 +
>  .../boot/dts/qcom/sc7280-herobrine-zombie.dts |  15 +
>  .../dts/qcom/sc7280-herobrine-zombie.dtsi     | 310 ++++++++++++++++++
>  4 files changed, 342 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index afe496a93f94..7b0644a39062 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -114,6 +114,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-herobrine-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-villager-r0.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-villager-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-villager-r1-lte.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-zombie.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-zombie-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd-r3.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dts
> new file mode 100644
> index 000000000000..2f1da87e5005
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Zombie board device tree source
> + *
> + * Copyright 2022 Google LLC.
> + */

nit: add an empty line here

> +/dts-v1/;
> +
> +#include "sc7280-herobrine-zombie.dtsi"
> +#include "sc7280-herobrine-lte-sku.dtsi"
> +
> +/ {
> +	model = "Google Zombie with LTE";
> +	compatible = "google,zombie-sku512", "qcom,sc7280";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dts
> new file mode 100644
> index 000000000000..3fa3d441991e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Zombie board device tree source
> + *
> + * Copyright 2022 Google LLC.
> + */

You deleted an empty line here, instead of removing the unnecessary '/dts-v1/;'
entry from the .dtsi as requested.

> +/dts-v1/;
> +
> +#include "sc7280-herobrine-zombie.dtsi"
> +#include "sc7280-herobrine-wifi-sku.dtsi"
> +
> +/ {
> +	model = "Google Zombie";
> +	compatible = "google,zombie", "qcom,sc7280";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
> new file mode 100644
> index 000000000000..15832620ff5d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Zombie board device tree source
> + *
> + * Copyright 2022 Google LLC.
> + */
> +/dts-v1/;

Please drop the above line as requested in the review of v2.
