Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC2643F41B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 02:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhJ2As4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 20:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbhJ2As4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 20:48:56 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D281FC061714
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:46:27 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id y80so19788458ybe.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l6Z3hT+hoYUW7qrKxZESd0pukUxNUCHLDPZeenOW/D0=;
        b=khFVs2e+ZwZHQITeBI3M2rwpL93M5POCAArAMwpxaIVBJEEOn7qjKFSTPvphPYZ7c7
         OsPcTAY2POG+no9hjyixS2PRWzogYb2Z3wfFLctLSoUT8pyN5D6QvzFG1qpp7giH66dU
         9B7T8l0Jt777BH7yXZF6fRVO0betB6QU/3kiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l6Z3hT+hoYUW7qrKxZESd0pukUxNUCHLDPZeenOW/D0=;
        b=ki50KLYH9NwfcUdLXUDccUDVA6yU2N/GnKmfkciUTDELWwNI0PrVUFQlhgzFmWaT/O
         iwW9jG5E7YO2+35AR4+7XVr59rKUMLPybn8tmXR6q6cwsoM0Eje25eOpBnrqCE5olFm0
         FhNRtwwhJIQKZvgSIKoa/qCiytIbN1I/I9yM8lftfbMBkqG1n9U5DJi/d+4dGOaSDc/N
         suQRyRjPYXbH/a8UhiYuO9VS6wktAMVoZr140XI3FCRToOVap1Xxi3D7irubm3dXRM2E
         SkKA/pf8N+VsCPIOzugELqlBCWWCtE5Lm7XFzNexmUyw5u499zohqIhp8zbjLCHyvpcy
         lMQQ==
X-Gm-Message-State: AOAM531ryzppRZwswmyyF6Wu190+SV4uz5XwP2OW6kc+MzwVV4acfx3/
        IS+9j0YW8g3ByyOdT78j2zkXKoR1mSeQ9cOagbT9hbNH7SBADg==
X-Google-Smtp-Source: ABdhPJxPwky/F6s2t1I6WNK1/lBij5lmyyuYaFgfio7iVRgTCxUufysCtNj7mCoV8QnCQu2o4r3sM8n4bulAKE9b9ts=
X-Received: by 2002:a25:aa32:: with SMTP id s47mr7287894ybi.57.1635468387075;
 Thu, 28 Oct 2021 17:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211028151022.1.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
 <CAD=FV=U+rzQcZaihDCZuNd54nmRHTgr7TMThESECZRfxaBNkrg@mail.gmail.com>
In-Reply-To: <CAD=FV=U+rzQcZaihDCZuNd54nmRHTgr7TMThESECZRfxaBNkrg@mail.gmail.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Thu, 28 Oct 2021 17:46:16 -0700
Message-ID: <CA+cxXh=HxM4c-OJw8zwjUAVV3AbVggD3Kx8kHwXREmNmE83=TA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Support Lazor/Limozeen rev9
To:     Doug Anderson <dianders@chromium.org>
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

On Thu, Oct 28, 2021 at 3:53 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Oct 28, 2021 at 3:11 PM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Support Lazor/Limozeen rev9 board where Parade ps8640 is added as the
> > second source edp bridge.
>
> It probably wouldn't hurt to at least mention in the commit message
> why the include of "sc7180.dtsi" was moved out of
> "sc7180-trogdor-lazor.dtsi" so that people reviewing the change aren't
> confused. Otherwise it just looks arbitrary.
Sure, I updated the commit message in v2.

>
>
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > ...
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
> > new file mode 100644
> > index 000000000000..a2a6e2515ee6
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
> > @@ -0,0 +1,31 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Lazor Limozeen board device tree source
> > + *
> > + * Copyright 2021 Google LLC.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sc7180.dtsi"
> > +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> > +#include "sc7180-trogdor-lazor.dtsi"
> > +#include "sc7180-trogdor-lte-sku.dtsi"
> > +
> > +/ {
> > +       model = "Google Lazor Limozeen without Touchscreen (rev5 - rev8)";
> > +       /* No sku5 post-rev5 */
> > +       compatible = "google,lazor-rev5-sku6", "google,lazor-rev6-sku6",
> > +               "google,lazor-rev7-sku6", "google,lazor-rev8-sku6",
> > +               "google,rev5-sku5", "qcom,sc7180";
>
> Two issues.
>
> 1. "google,rev5-sku5" should probably be "google,lazor-rev5-sku5"
Thanks for the catch. I fixed it in v2.
>
> 2. rev5-sku5 should sort to the start of the list, not to the end.
Thanks. I fixed it in v2.
>
>
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
> > @@ -2,16 +2,18 @@
> >  /*
> >   * Google Lazor Limozeen board device tree source
> >   *
> > - * Copyright 2020 Google LLC.
> > + * Copyright 2021 Google LLC.
> >   */
> >
> >  /dts-v1/;
> >
> > +#include "sc7180.dtsi"
> > +#include "sc7180-trogdor-parade-ps8640.dtsi"
> >  #include "sc7180-trogdor-lazor.dtsi"
> >  #include "sc7180-trogdor-lte-sku.dtsi"
> >
> >  / {
> > -       model = "Google Lazor Limozeen without Touchscreen";
> > +       model = "Google Lazor Limozeen without Touchscreen (rev9+)";
> >         compatible = "google,lazor-sku6", "google,lazor-sku5", "qcom,sc7180";
>
> Earlier you said "sku5" doesn't exist past -rev5. So it doesn't need
> to be here, right?
Correct. I removed "sku5" support here in v2.

>
>
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
> > new file mode 100644
> > index 000000000000..10f48f4b429a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
> > @@ -0,0 +1,46 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Lazor Limozeen board device tree source
> > + *
> > + * Copyright 2021 Google LLC.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sc7180.dtsi"
> > +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> > +#include "sc7180-trogdor-lazor.dtsi"
> > +#include "sc7180-trogdor-lte-sku.dtsi"
> > +
> > +/ {
> > +       model = "Google Lazor Limozeen (rev4 - rev8)";
> > +       compatible = "google,lazor-rev4-sku4", "google,lazor-rev5-sku4",
> > +               "google,lazor-rev6-sku4", "google,lazor-rev6-sku4",
>
> -rev6 is listed twice and -rev7 is missing.
Thanks for the catch.
I fixed it in v2.

>
>
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
> > new file mode 100644
> > index 000000000000..326ba9f88394
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Lazor board device tree source
> > + *
> > + * Copyright 2020 Google LLC.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sc7180.dtsi"
> > +#include "sc7180-trogdor-parade-ps8640.dtsi"
> > +#include "sc7180-trogdor-lazor.dtsi"
> > +#include "sc7180-lite.dtsi"
> > +
> > +/ {
> > +       model = "Google Lazor (rev9+) with KB Backlight";
> > +       compatible = "google,lazor-sku2", "qcom,sc7180";
> > +};
> > +
> > +&keyboard_backlight {
> > +       status = "okay";
> > +};
> > +
> > +&panel {
> > +       compatible = "boe,nv133fhm-n62";
> > +};
>
> Why do you need the "panel" here?
Oops, I forgot it's been added in the lazor dtsi file.
I removed it in v2.

>
>
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
> > new file mode 100644
> > index 000000000000..a705c956f62b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Lazor board device tree source
> > + *
> > + * Copyright 2021 Google LLC.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sc7180.dtsi"
> > +#include "sc7180-trogdor-parade-ps8640.dtsi"
> > +#include "sc7180-trogdor-lazor.dtsi"
> > +#include "sc7180-trogdor-lte-sku.dtsi"
> > +
> > +/ {
> > +       model = "Google Lazor (rev9+) with LTE";
> > +       compatible = "google,lazor-sku0", "qcom,sc7180";
> > +};
> > +
> > +&ap_sar_sensor {
> > +       status = "okay";
> > +};
> > +
> > +&ap_sar_sensor_i2c {
> > +       status = "okay";
> > +};
> > +
> > +&keyboard_backlight {
> > +       status = "okay";
> > +};
> > +
> > +&panel {
> > +       compatible = "boe,nv133fhm-n62";
> > +};
>
> Why do you need the "panel" hre?
Oops, I removed it in v2.

>
>
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts
> > new file mode 100644
> > index 000000000000..13ff9a851613
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts
> > @@ -0,0 +1,22 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Lazor board device tree source
> > + *
> > + * Copyright 2021 Google LLC.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sc7180.dtsi"
> > +#include "sc7180-trogdor-parade-ps8640.dtsi"
> > +#include "sc7180-trogdor-lazor.dtsi"
> > +#include "sc7180-lite.dtsi"
> > +
> > +/ {
> > +       model = "Google Lazor (rev9+)";
> > +       compatible = "google,lazor", "qcom,sc7180";
> > +};
> > +
> > +&panel {
> > +       compatible = "boe,nv133fhm-n62";
> > +};
>
> Why do you need the "panel" here?
Oops, I removed it in v2.
>
>
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index faf8b807d0ff..286d3594b6ae 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -11,6 +11,7 @@
> >  #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
> >  #include <dt-bindings/clock/qcom,rpmh.h>
> >  #include <dt-bindings/clock/qcom,videocc-sc7180.h>
> > +#include <dt-bindings/gpio/gpio.h>
>
> I don't think you should be adding this to sc7180.dtsi. If you need it
> in the bridge chip "fragments" you should add the includes to those.
>
> -Doug
