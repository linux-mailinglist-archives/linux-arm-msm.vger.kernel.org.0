Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F6332F486
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 21:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCEUR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 15:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCEURd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 15:17:33 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD19C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 12:17:33 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id w34so1047819pga.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 12:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5Ww9KevX4ecFSEP5C1OtVbh68e4J22Jsb3/WA7Lbu6o=;
        b=QFgkXWD8gvYD0A0l41l0VZKkI2x9X2G98Q61A7KXlguppE2aCMh1BfRJEmgtcihmd0
         8f0KKbDjai78GE6vjayDXtBtY6MkIYGfjcVb23ZtcGqu45i/CLKFEiaQjuv8Dr0WXpCr
         RjcMRQBy77QZ7f7qYsgjMsEdNeMON9ALg3ZWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5Ww9KevX4ecFSEP5C1OtVbh68e4J22Jsb3/WA7Lbu6o=;
        b=gKRsr6goAvx2Y01iMt4bcPlD2nQtxU1j38t8npWc4PjgP4JOUmvmlyB0R/UdISlbHf
         Spd59azBsa7YBw+yjC8+zOKLonuqnUa/YKuyHSrYoJIFFQdTdMXLzggbkZmwh4IYDyYM
         KUg7CGx65A2FiB2/YJ7sizT9YjP9zIXa/z2ycIIRXEhUWliDBLTKTaOz8ktmI57Xiv64
         f4lciSNiaOxY1dfI7+wX/qCR1eHm2hL5MgttIyzrTDCt9TT4n5D2tgeqPTFqhf3DuEO6
         QycbLmnphpKNriWhBbhubxQhZV21Uww23uaz0yyOFZl+J0qmZnToLqQvFVYQ9xaRtFzx
         gLmQ==
X-Gm-Message-State: AOAM532zJcpa3djaaR1l8DjYx6oZvkwhvsI9uRpK81jlha2buzszqHcu
        tWKt9qgqRiNk5JlDiiu98bW7Lw==
X-Google-Smtp-Source: ABdhPJzZUzJg4okZiTDkGXQKxjD0TxOKB5Sy6XF4xGLU25JvsLkPjWfe6wIqBxKzngAt/JiM7t/kOA==
X-Received: by 2002:a63:fb11:: with SMTP id o17mr10162608pgh.282.1614975452774;
        Fri, 05 Mar 2021 12:17:32 -0800 (PST)
Received: from localhost ([2620:15c:202:1:2878:25d1:94cb:a547])
        by smtp.gmail.com with UTF8SMTPSA id h23sm3223060pfn.118.2021.03.05.12.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 12:17:32 -0800 (PST)
Date:   Fri, 5 Mar 2021 12:17:30 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7180: Add pompom rev3
Message-ID: <YEKR2hsp6J90vuUt@google.com>
References: <20210304180415.1531430-1-mka@chromium.org>
 <20210304100341.2.I7fef1a0e82bd2f3c1bc35501f8652e027aae4fcc@changeid>
 <CAD=FV=WwWPJNqZoUPU+opAPLgTAOT5RMJoWx0xg=FTyoaW3_Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=WwWPJNqZoUPU+opAPLgTAOT5RMJoWx0xg=FTyoaW3_Gg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 10:48:16AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Thu, Mar 4, 2021 at 10:04 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > The only kernel visible change with respect to rev2 is that pompom
> > rev3 changed the charger thermistor from a 47k to a 100k NTC to use
> > a thermistor which is supported by the PM6150 ADC driver.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> >  .../dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  4 +-
> >  .../dts/qcom/sc7180-trogdor-pompom-r2.dts     |  4 +-
> >  .../dts/qcom/sc7180-trogdor-pompom-r3-lte.dts | 14 ++++++
> >  .../dts/qcom/sc7180-trogdor-pompom-r3.dts     | 46 +++++++++++++++++++
> >  4 files changed, 64 insertions(+), 4 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
> > index 791d496ad046..00e187c08eb9 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
> > @@ -9,6 +9,6 @@
> >  #include "sc7180-trogdor-lte-sku.dtsi"
> >
> >  / {
> > -       model = "Google Pompom (rev2+) with LTE";
> > -       compatible = "google,pompom-sku0", "qcom,sc7180";
> > +       model = "Google Pompom (rev2) with LTE";
> > +       compatible = "google,pompom-rev2-sku0", "qcom,sc7180";
> >  };
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
> > index 984d7337da78..2b2bd906321d 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
> > @@ -10,8 +10,8 @@
> >  #include "sc7180-trogdor-pompom.dtsi"
> >
> >  / {
> > -       model = "Google Pompom (rev2+)";
> > -       compatible = "google,pompom", "qcom,sc7180";
> > +       model = "Google Pompom (rev2)";
> > +       compatible = "google,pompom-rev2", "qcom,sc7180";
> >  };
> >
> >  &keyboard_controller {
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
> > new file mode 100644
> > index 000000000000..067cb75a011e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
> > @@ -0,0 +1,14 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Pompom board device tree source
> > + *
> > + * Copyright 2020 Google LLC.
> > + */
> > +
> > +#include "sc7180-trogdor-pompom-r3.dts"
> > +#include "sc7180-trogdor-lte-sku.dtsi"
> > +
> > +/ {
> > +       model = "Google Pompom (rev3+) with LTE";
> > +       compatible = "google,pompom-sku0", "qcom,sc7180";
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
> > new file mode 100644
> > index 000000000000..12d2d1e8e9e1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
> > @@ -0,0 +1,46 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Pompom board device tree source
> > + *
> > + * Copyright 2021 Google LLC.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sc7180-trogdor-pompom.dtsi"
> > +
> > +/ {
> > +       model = "Google Pompom (rev3+)";
> > +       compatible = "google,pompom", "qcom,sc7180";
> > +};
> > +
> > +&keyboard_controller {
> > +       function-row-physmap = <
> > +               MATRIX_KEY(0x00, 0x02, 0)       /* T1 */
> > +               MATRIX_KEY(0x03, 0x02, 0)       /* T2 */
> > +               MATRIX_KEY(0x02, 0x02, 0)       /* T3 */
> > +               MATRIX_KEY(0x01, 0x02, 0)       /* T4 */
> > +               MATRIX_KEY(0x03, 0x04, 0)       /* T5 */
> > +               MATRIX_KEY(0x02, 0x04, 0)       /* T6 */
> > +               MATRIX_KEY(0x01, 0x04, 0)       /* T7 */
> > +               MATRIX_KEY(0x02, 0x09, 0)       /* T8 */
> > +               MATRIX_KEY(0x01, 0x09, 0)       /* T9 */
> > +               MATRIX_KEY(0x00, 0x04, 0)       /* T10 */
> > +       >;
> > +       linux,keymap = <
> > +               MATRIX_KEY(0x00, 0x02, KEY_BACK)
> > +               MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
> > +               MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
> > +               MATRIX_KEY(0x01, 0x02, KEY_SCALE)
> > +               MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
> > +               MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
> > +               MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
> > +               MATRIX_KEY(0x02, 0x09, KEY_MUTE)
> > +               MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
> > +               MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
> > +
> > +               MATRIX_KEY(0x03, 0x09, KEY_SLEEP)       /* LOCK key */
> > +
> > +               CROS_STD_MAIN_KEYMAP
> > +       >;
> > +};
> 
> I don't love copying all this keymap stuff.  Options I can think of:

agreed

> 1. Just put it in "-rev3".  Have the "-rev2" dts just include the
> "-rev3" dts and then override the model/compatible and disable the
> charger_thermal.
> 
> 2. Put the keyboard stuff in the "dtsi" file and then "-rev1" can have
> something like:
> 
> /delete-node/ keyboard_controller;
> #include <arm/cros-ec-keyboard.dtsi>
> 
> In general the preference is that the ugly device trees should get
> pushed down to earlier revs since (eventually) they can just be
> dropped.

Thanks, I'll evaluate the options you suggested.

> I'll also mention that I don't see a huge benefit in this being a
> separate patch from the next one--I'd just squash them together...

It keeps the individual patches simpler by doing one thing at a time,
but you can certainly go either way.
