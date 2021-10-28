Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D9443F337
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 01:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhJ1Wzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 18:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhJ1Wzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 18:55:40 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF364C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:53:12 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id p8so3737231iod.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uc2Km6o7F/1IiYiUqD9pq3Uh8R2x/7AtlU2jpfGbFzM=;
        b=mZKOo4BgTVkimqsp+8kAPxj3GzzNr8vtABHndXDrHO5yxVo7aD2+Wd0DfW0P9OWrbx
         l7aNQ6p1LDkPGKqrHSAsPDTeAmSjONC6oBE8Qt09YYSS9+Tnk1VDytG5dmuXw2Ch/pcB
         3yfg1XDaYOMkGZrtxXwsxHe/NTSHRFynIo4Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uc2Km6o7F/1IiYiUqD9pq3Uh8R2x/7AtlU2jpfGbFzM=;
        b=Imu6BRGBFPWCWzplx5HWRcm7/D/MvZGFJIJB6kNeyvc3wPBGdU5oQuMlc9Ksz4fj6b
         3e+FkqoIaQOoALHVtYTaDTbhdr2uVr7eqM3PcTpsBcq+QL8isFvU32LikNYHmGxYI+x9
         /pQwn1jJYPLZO8n27WSiw9e1N5Alr7aN0KvQ7kMOIEpNNK7SzJXk6wOCn1M8CGM5hg5a
         5olc9eqapUR5h77m0r/n3lPJpUfqVM3CF9j2No55CyUZrYjdU2d1cUExBsqnH7HQxhSf
         CXuM7UKCj58CDlieDN1V8PBAHVC5m5mGw1Apa7vVezzbdR2kdkVgUrBCULHYQdGVunRa
         arow==
X-Gm-Message-State: AOAM530BVxjJDcOpq49Tk78Ira2rpcG2G1euGrqZG3VqOKihmjLoi+Z7
        yVfT965dcKM6kPD5gL1INnlPPm4yHWm9ew==
X-Google-Smtp-Source: ABdhPJyENOd3Ia5eVBgsoGwHynCm/nK9eavSFqRMOXmQXvIBtRLLteJQ5Y72Krh0bAEJswLyIiSlCg==
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr5172955iof.64.1635461591499;
        Thu, 28 Oct 2021 15:53:11 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id o4sm2136491ilf.62.2021.10.28.15.53.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 15:53:10 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id j28so2250737ila.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:53:10 -0700 (PDT)
X-Received: by 2002:a05:6e02:2169:: with SMTP id s9mr5263266ilv.27.1635461590288;
 Thu, 28 Oct 2021 15:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211028151022.1.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
In-Reply-To: <20211028151022.1.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Oct 2021 15:52:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+rzQcZaihDCZuNd54nmRHTgr7TMThESECZRfxaBNkrg@mail.gmail.com>
Message-ID: <CAD=FV=U+rzQcZaihDCZuNd54nmRHTgr7TMThESECZRfxaBNkrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Support Lazor/Limozeen rev9
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Oct 28, 2021 at 3:11 PM Philip Chen <philipchen@chromium.org> wrote:
>
> Support Lazor/Limozeen rev9 board where Parade ps8640 is added as the
> second source edp bridge.

It probably wouldn't hurt to at least mention in the commit message
why the include of "sc7180.dtsi" was moved out of
"sc7180-trogdor-lazor.dtsi" so that people reviewing the change aren't
confused. Otherwise it just looks arbitrary.


> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ...
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
> new file mode 100644
> index 000000000000..a2a6e2515ee6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Lazor Limozeen board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"
> +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> +#include "sc7180-trogdor-lazor.dtsi"
> +#include "sc7180-trogdor-lte-sku.dtsi"
> +
> +/ {
> +       model = "Google Lazor Limozeen without Touchscreen (rev5 - rev8)";
> +       /* No sku5 post-rev5 */
> +       compatible = "google,lazor-rev5-sku6", "google,lazor-rev6-sku6",
> +               "google,lazor-rev7-sku6", "google,lazor-rev8-sku6",
> +               "google,rev5-sku5", "qcom,sc7180";

Two issues.

1. "google,rev5-sku5" should probably be "google,lazor-rev5-sku5"

2. rev5-sku5 should sort to the start of the list, not to the end.


> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
> @@ -2,16 +2,18 @@
>  /*
>   * Google Lazor Limozeen board device tree source
>   *
> - * Copyright 2020 Google LLC.
> + * Copyright 2021 Google LLC.
>   */
>
>  /dts-v1/;
>
> +#include "sc7180.dtsi"
> +#include "sc7180-trogdor-parade-ps8640.dtsi"
>  #include "sc7180-trogdor-lazor.dtsi"
>  #include "sc7180-trogdor-lte-sku.dtsi"
>
>  / {
> -       model = "Google Lazor Limozeen without Touchscreen";
> +       model = "Google Lazor Limozeen without Touchscreen (rev9+)";
>         compatible = "google,lazor-sku6", "google,lazor-sku5", "qcom,sc7180";

Earlier you said "sku5" doesn't exist past -rev5. So it doesn't need
to be here, right?


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
> new file mode 100644
> index 000000000000..10f48f4b429a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Lazor Limozeen board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"
> +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> +#include "sc7180-trogdor-lazor.dtsi"
> +#include "sc7180-trogdor-lte-sku.dtsi"
> +
> +/ {
> +       model = "Google Lazor Limozeen (rev4 - rev8)";
> +       compatible = "google,lazor-rev4-sku4", "google,lazor-rev5-sku4",
> +               "google,lazor-rev6-sku4", "google,lazor-rev6-sku4",

-rev6 is listed twice and -rev7 is missing.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
> new file mode 100644
> index 000000000000..326ba9f88394
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Lazor board device tree source
> + *
> + * Copyright 2020 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"
> +#include "sc7180-trogdor-parade-ps8640.dtsi"
> +#include "sc7180-trogdor-lazor.dtsi"
> +#include "sc7180-lite.dtsi"
> +
> +/ {
> +       model = "Google Lazor (rev9+) with KB Backlight";
> +       compatible = "google,lazor-sku2", "qcom,sc7180";
> +};
> +
> +&keyboard_backlight {
> +       status = "okay";
> +};
> +
> +&panel {
> +       compatible = "boe,nv133fhm-n62";
> +};

Why do you need the "panel" here?


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
> new file mode 100644
> index 000000000000..a705c956f62b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Lazor board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"
> +#include "sc7180-trogdor-parade-ps8640.dtsi"
> +#include "sc7180-trogdor-lazor.dtsi"
> +#include "sc7180-trogdor-lte-sku.dtsi"
> +
> +/ {
> +       model = "Google Lazor (rev9+) with LTE";
> +       compatible = "google,lazor-sku0", "qcom,sc7180";
> +};
> +
> +&ap_sar_sensor {
> +       status = "okay";
> +};
> +
> +&ap_sar_sensor_i2c {
> +       status = "okay";
> +};
> +
> +&keyboard_backlight {
> +       status = "okay";
> +};
> +
> +&panel {
> +       compatible = "boe,nv133fhm-n62";
> +};

Why do you need the "panel" hre?


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts
> new file mode 100644
> index 000000000000..13ff9a851613
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Lazor board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"
> +#include "sc7180-trogdor-parade-ps8640.dtsi"
> +#include "sc7180-trogdor-lazor.dtsi"
> +#include "sc7180-lite.dtsi"
> +
> +/ {
> +       model = "Google Lazor (rev9+)";
> +       compatible = "google,lazor", "qcom,sc7180";
> +};
> +
> +&panel {
> +       compatible = "boe,nv133fhm-n62";
> +};

Why do you need the "panel" here?


> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index faf8b807d0ff..286d3594b6ae 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,videocc-sc7180.h>
> +#include <dt-bindings/gpio/gpio.h>

I don't think you should be adding this to sc7180.dtsi. If you need it
in the bridge chip "fragments" you should add the includes to those.

-Doug
