Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B60D32F323
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 19:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbhCEStA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 13:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhCESsb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 13:48:31 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30CBC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 10:48:30 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id x10so2983668qkm.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 10:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+lW0O727rhlk3/EmX1NxZE3NA/fIKhpZMCBiUvxp/JM=;
        b=X2eizvrPuMXNHR9aaeDDlQSEk/VqDe+9QFlhTPm1n5ug8099MCdnK57mRh2NWtZdel
         09GnXXoBZWzt4cvd/Iyb5bbh+AjX5LT0UGhtewuNMbdZAlfHKlwkGvytXnaFLaE9YxGV
         /jHqz4Q6Wb5c/BO1508xAEmJQik5n8tURj08A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+lW0O727rhlk3/EmX1NxZE3NA/fIKhpZMCBiUvxp/JM=;
        b=pMxxR5sMUwDWAgu9EJs5q/ObO52Yfyy1Uq2SwhVi5ZRYgs2hh12DHjaRWh3FTcbMPf
         /IsefSkSCGMKTNW/IAvfZs13i1ZAehwzVRL/7RM4NyLe9w5nJAq+zb6vWqF9KN/ksGOM
         KlMJZ2VGz4xlIeoP/OZHbv1zNskB5zvUanpHdPXtJJYPfNXSwHgGXqHz8Feb+HYhaAEZ
         FljIMLA6IVIk3Qsl9H8JEmgYwzjKh3RmxfmkrwRv0OayEow6fV12Wcn/H3yUrIUms1xx
         cGbV6L/W8RYODY5pd82hkPnpvLxnHk65OvvZ7IVM9mjUrmMSVzV2wcoA6XI/vMfvCuM8
         EdVQ==
X-Gm-Message-State: AOAM532TSXOvBZ77/SMUvNhIeqTcgzjbSw9uciHXaRMAo0D0Zb+YLjvd
        Nh2lsyPpXJWNJeqgX6QJIT4faao8QDqd+A==
X-Google-Smtp-Source: ABdhPJyyq0f3oy8FHe+q0Q5v/AmlZx90sPzQXSCtDLuy9luGo1jQc98MZeYbBe6UMxorZ9W86sOzvw==
X-Received: by 2002:a37:4743:: with SMTP id u64mr10605965qka.350.1614970109923;
        Fri, 05 Mar 2021 10:48:29 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id t188sm1730100qke.91.2021.03.05.10.48.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 10:48:28 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id u3so2993990ybk.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 10:48:28 -0800 (PST)
X-Received: by 2002:a25:d3c5:: with SMTP id e188mr16284311ybf.345.1614970108212;
 Fri, 05 Mar 2021 10:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20210304180415.1531430-1-mka@chromium.org> <20210304100341.2.I7fef1a0e82bd2f3c1bc35501f8652e027aae4fcc@changeid>
In-Reply-To: <20210304100341.2.I7fef1a0e82bd2f3c1bc35501f8652e027aae4fcc@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Mar 2021 10:48:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WwWPJNqZoUPU+opAPLgTAOT5RMJoWx0xg=FTyoaW3_Gg@mail.gmail.com>
Message-ID: <CAD=FV=WwWPJNqZoUPU+opAPLgTAOT5RMJoWx0xg=FTyoaW3_Gg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7180: Add pompom rev3
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 4, 2021 at 10:04 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The only kernel visible change with respect to rev2 is that pompom
> rev3 changed the charger thermistor from a 47k to a 100k NTC to use
> a thermistor which is supported by the PM6150 ADC driver.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  .../dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  4 +-
>  .../dts/qcom/sc7180-trogdor-pompom-r2.dts     |  4 +-
>  .../dts/qcom/sc7180-trogdor-pompom-r3-lte.dts | 14 ++++++
>  .../dts/qcom/sc7180-trogdor-pompom-r3.dts     | 46 +++++++++++++++++++
>  4 files changed, 64 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
> index 791d496ad046..00e187c08eb9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
> @@ -9,6 +9,6 @@
>  #include "sc7180-trogdor-lte-sku.dtsi"
>
>  / {
> -       model = "Google Pompom (rev2+) with LTE";
> -       compatible = "google,pompom-sku0", "qcom,sc7180";
> +       model = "Google Pompom (rev2) with LTE";
> +       compatible = "google,pompom-rev2-sku0", "qcom,sc7180";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
> index 984d7337da78..2b2bd906321d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
> @@ -10,8 +10,8 @@
>  #include "sc7180-trogdor-pompom.dtsi"
>
>  / {
> -       model = "Google Pompom (rev2+)";
> -       compatible = "google,pompom", "qcom,sc7180";
> +       model = "Google Pompom (rev2)";
> +       compatible = "google,pompom-rev2", "qcom,sc7180";
>  };
>
>  &keyboard_controller {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
> new file mode 100644
> index 000000000000..067cb75a011e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Pompom board device tree source
> + *
> + * Copyright 2020 Google LLC.
> + */
> +
> +#include "sc7180-trogdor-pompom-r3.dts"
> +#include "sc7180-trogdor-lte-sku.dtsi"
> +
> +/ {
> +       model = "Google Pompom (rev3+) with LTE";
> +       compatible = "google,pompom-sku0", "qcom,sc7180";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
> new file mode 100644
> index 000000000000..12d2d1e8e9e1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Pompom board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180-trogdor-pompom.dtsi"
> +
> +/ {
> +       model = "Google Pompom (rev3+)";
> +       compatible = "google,pompom", "qcom,sc7180";
> +};
> +
> +&keyboard_controller {
> +       function-row-physmap = <
> +               MATRIX_KEY(0x00, 0x02, 0)       /* T1 */
> +               MATRIX_KEY(0x03, 0x02, 0)       /* T2 */
> +               MATRIX_KEY(0x02, 0x02, 0)       /* T3 */
> +               MATRIX_KEY(0x01, 0x02, 0)       /* T4 */
> +               MATRIX_KEY(0x03, 0x04, 0)       /* T5 */
> +               MATRIX_KEY(0x02, 0x04, 0)       /* T6 */
> +               MATRIX_KEY(0x01, 0x04, 0)       /* T7 */
> +               MATRIX_KEY(0x02, 0x09, 0)       /* T8 */
> +               MATRIX_KEY(0x01, 0x09, 0)       /* T9 */
> +               MATRIX_KEY(0x00, 0x04, 0)       /* T10 */
> +       >;
> +       linux,keymap = <
> +               MATRIX_KEY(0x00, 0x02, KEY_BACK)
> +               MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
> +               MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
> +               MATRIX_KEY(0x01, 0x02, KEY_SCALE)
> +               MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
> +               MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
> +               MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
> +               MATRIX_KEY(0x02, 0x09, KEY_MUTE)
> +               MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
> +               MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
> +
> +               MATRIX_KEY(0x03, 0x09, KEY_SLEEP)       /* LOCK key */
> +
> +               CROS_STD_MAIN_KEYMAP
> +       >;
> +};

I don't love copying all this keymap stuff.  Options I can think of:

1. Just put it in "-rev3".  Have the "-rev2" dts just include the
"-rev3" dts and then override the model/compatible and disable the
charger_thermal.

2. Put the keyboard stuff in the "dtsi" file and then "-rev1" can have
something like:

/delete-node/ keyboard_controller;
#include <arm/cros-ec-keyboard.dtsi>

In general the preference is that the ugly device trees should get
pushed down to earlier revs since (eventually) they can just be
dropped.

I'll also mention that I don't see a huge benefit in this being a
separate patch from the next one--I'd just squash them together...

-Doug
