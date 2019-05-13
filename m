Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98BD61BF9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 00:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbfEMWsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 18:48:15 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43052 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbfEMWsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 18:48:15 -0400
Received: by mail-vs1-f68.google.com with SMTP id d128so9077029vsc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 15:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sl2bxQBq0FJaX8PNLC2L4yPk06CuTs7eUmIudjrlzPg=;
        b=duILl6oEa8zPOaL3tH582Wk2zOTSP2K+lRjcJ3QFF4RO0uGqG00j8IsqcOamqaKf2i
         LikEzhkdigtroTh3Vv5JNZ744burXNZGbVor6wSMq1aKIbJAnJustWh+xQXHcam1J3mM
         fP6TcWCa23z0uubMm5hQk6x7sNt4BsaT7Jpw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sl2bxQBq0FJaX8PNLC2L4yPk06CuTs7eUmIudjrlzPg=;
        b=S21TG4btqtcfonYJ5JMzo528I3IjKGbgWs9YX8qZg/KJdd8w8AjQ1VTFn/EssFR3Ra
         4S6qKzrtYcdEcn3raoLVcOWq9ezodLIxahEeX8NerD/k7wk5SDVpdvXgI4B+zOfFVkA8
         KDtwcqw67P+rrbznCMb3NzxZJBYiII0162jC87h+5TL8x9b90VuGzx0eoWR1jxuNmqbB
         dzZW4YODiP6V/NUQJNZEP4thtIJnDwtLBrnMPM59zBpq7Ls/MOrK/QXR8dByoTr5XqWo
         +3RjIso3VPcZPVXsqQ2xV/pqL+k94zyNmr/CnLjbuUemw+/GzzMcyX4H7Du4WY/wwfCL
         TY+w==
X-Gm-Message-State: APjAAAXNdwQ3M4hThJs1vNmmLPUZh5twLqRE4SijMd3rHfLiPnFa7MpB
        frUwaUe0r5B3jjbPFCXP3foWfJYqJ+s=
X-Google-Smtp-Source: APXvYqyIz5qHoxUpFcS65PrzdIQ51B4+xuNb3O64NEH8/oPvwH+WQEJPW3EhNy8q7YM3qz8rZcKkNw==
X-Received: by 2002:a67:fa99:: with SMTP id f25mr14345253vsq.212.1557787693418;
        Mon, 13 May 2019 15:48:13 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id h203sm9535390vke.30.2019.05.13.15.48.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 15:48:11 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id e9so4986729uar.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 15:48:10 -0700 (PDT)
X-Received: by 2002:ab0:2692:: with SMTP id t18mr8606464uao.106.1557787690493;
 Mon, 13 May 2019 15:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190509184415.11592-1-robdclark@gmail.com> <20190509184415.11592-2-robdclark@gmail.com>
In-Reply-To: <20190509184415.11592-2-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 May 2019 15:47:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UcLs+FkPUeDUC2c=zg8e_MTFHB7=yiz-=W6L6y2+H4+A@mail.gmail.com>
Message-ID: <CAD=FV=UcLs+FkPUeDUC2c=zg8e_MTFHB7=yiz-=W6L6y2+H4+A@mail.gmail.com>
Subject: Re: [RFC 1/3] arm64: dts: qcom: sdm845-cheza: add initial cheza dt
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Brian Norris <briannorris@chromium.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 9, 2019 at 11:44 AM Rob Clark <robdclark@gmail.com>wrote:

> From: Rob Clark <robdclark@chromium.org>
>
> This is essentialy a squash of a bunch of history of cheza dt updates
> from chromium kernel, some of which were themselves squashes of history
> from older chromium kernels.
>
> I don't claim any credit other than wanting to more easily boot upstream
> kernel on cheza to have an easier way to test upstream driver work ;-)
>
> I've added below in Cc tags all the original actual authors (apologies
> if I missed any).
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Brian Norris <briannorris@chromium.org>
> Cc: Venkat Gopalakrishnan <venkatg@codeaurora.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |    3 +
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts |  238 ++++
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts |  238 ++++
>  arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts |  180 +++
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi   | 1317 ++++++++++++++++++
>  5 files changed, 1976 insertions(+)

In general I am supportive of getting cheza dts landed upstream.

One question is how much cleanup we want to do while landing upstream.
We have a few TODO / HACK comments currently.  Do we want to land what
we have and clean these up in separate commits, or should we try to do
cleanup beforehand.  Bjron / Andy: do you have any opinions?  I've
commented on a few below.


> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index b3fe72ff2955..7a038cf81543 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -8,6 +8,9 @@ dtb-$(CONFIG_ARCH_QCOM) += msm8994-angler-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += msm8996-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += msm8998-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sdm845-cheza-r1.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sdm845-cheza-r2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-4000.dtb

Something about the above makes "git am" unhappy and "patch -p1" think
this is a malformed patch.  When I delete the part touching the
Makefile then I can apply OK.


> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts b/arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts
> new file mode 100644
> index 000000000000..35bb4629edd4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Cheza board device tree source
> + *
> + * Copyright 2018 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-cheza.dtsi"
> +
> +/ {
> +       model = "Google Cheza (rev1)";
> +       compatible = "google,cheza-rev1", "google,cheza", "qcom,sdm845";

See below for rev 3, but I think this might be better as:

compatible = "google,cheza-rev1", "qcom,sdm845";


> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts b/arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts
> new file mode 100644
> index 000000000000..4359a82d4bb4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Cheza board device tree source
> + *
> + * Copyright 2018 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-cheza.dtsi"
> +
> +/ {
> +       model = "Google Cheza (rev2)";
> +       compatible = "google,cheza-rev2", "google,cheza", "qcom,sdm845";

See above and below, but probably:

compatible = "google,cheza-rev2", "qcom,sdm845";


> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts b/arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts
> new file mode 100644
> index 000000000000..2c3f815b90c1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Cheza board device tree source
> + *
> + * Copyright 2018 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-cheza.dtsi"
> +
> +/ {
> +       model = "Google Cheza (rev3+)";
> +       compatible = "google,cheza-rev15", "google,cheza-rev14",
> +                    "google,cheza-rev13", "google,cheza-rev12",
> +                    "google,cheza-rev11", "google,cheza-rev10",
> +                    "google,cheza-rev9", "google,cheza-rev8",
> +                    "google,cheza-rev7", "google,cheza-rev6",
> +                    "google,cheza-rev5", "google,cheza-rev4",
> +                    "google,cheza-rev3", "google,cheza", "qcom,sdm845";

Julius Werner suggested that a better solution is that the newest dts
should specify no revision.  Thus this should be just:

compatible = "google,cheza", "qcom,sdm845";


> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> new file mode 100644
> index 000000000000..338c92ddd1c3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -0,0 +1,1317 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Cheza device tree source (common between revisions)
> + *
> + * Copyright 2018 Google LLC.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sdm845.dtsi"
> +
> +/* PMICs depend on spmi_bus label and so must come after SoC */
> +#include "pm8005.dtsi"
> +#include "pm8998.dtsi"
> +
> +/ {
> +       aliases {
> +               bluetooth0 = &bluetooth;
> +               hsuart0 = &uart6;
> +               serial0 = &uart9;
> +               wifi0 = &wifi;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       backlight: backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&cros_ec_pwm 0>;
> +               enable-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +               power-supply = <&ppvar_sys>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&ap_edp_bklten>;
> +       };
> +
> +       reserved-memory {
> +               rmtfs@88f00000 {
> +                       compatible = "qcom,rmtfs-mem";
> +                       reg = <0x0 0x88f00000 0x0 0x800000>;
> +                       no-map;
> +
> +                       qcom,client-id = <1>;
> +               };
> +       };

You missed part of:

https://crrev.com/c/1588964 - CHROMIUM: arm64: dts: qcom:
sdm845-cheza: Temporarily delete reserved-mem changes

...that should make the above "reserved-memory" section go away.


> +&spi0 {
> +       status = "okay";
> +       spi-max-frequency = <3000000>;  /* TODO: Drop this? */

Drop "spi-max-frequency".  That was part of original bindings but
shouldn't be there anymore.


> +};
> +
> +&spi5 {
> +       status = "okay";
> +       spi-max-frequency = <800000>; /* TODO: Drop this */
> +       cr50@0 {
> +               compatible = "google,cr50";
> +               reg = <0>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&h1_ap_int_odl>;
> +               spi-max-frequency = <800000>;
> +               interrupt-parent = <&tlmm>;
> +               interrupts = <129 IRQ_TYPE_EDGE_RISING>;
> +       };
> +};

Presumably the above needs to be dropped since "google,cr50" isn't
actually upstream.


> +&spi10 {
> +       status = "okay";
> +       spi-max-frequency = <3000000>;  /* TODO: Drop this? */

Drop "spi-max-frequency".  That was part of original bindings but
shouldn't be there anymore.


-Doug
