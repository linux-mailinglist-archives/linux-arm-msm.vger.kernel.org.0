Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E0B41BAE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 01:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhI1XQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 19:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhI1XQ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 19:16:56 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6043C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 16:15:16 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id r4so1214515ybp.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 16:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a8ee7WRS14R1O+BHcNU3Zd5XnKmvSTh6mYlENaJtsFs=;
        b=eWt9X/Jqh7u9qa8ilTksY05Vlq460clfXJSJwTGEMiyi9I3duuWFlnAe+zZebsBJZV
         15AJsLYBy6uXOdaTdkQqCcbxzXR5kc395Gms9aGkaq0Jy8mio8TIgs71TZcr4azxCqV1
         VnIkSSoDunlxZXjvMWmNUm/ftdAlcIMd8PObw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a8ee7WRS14R1O+BHcNU3Zd5XnKmvSTh6mYlENaJtsFs=;
        b=oFEz/vXdxi/LBAYNzeP6IhOZp9xphRbuKp6vb/5Acz5DnqoNHZK7ouTFWyjq4yx2KH
         sXfVzQMBXS0HVz5cUIy/z7mIZ+lEW9kWNvuRKhQl6CR6yNzyy0sEpMXN3P2Dv4T1JXMh
         d3csRPtwsFwFyjei7VvfKc4RjlE+rWb+4SIs02v/ElDIAW92FXhAYTDE5UhBLbJAcLYv
         L0XZnPrBVm1ujfpRHjACjY4TnwJ4IP0w8mCjmQbqLCI6kGgilrH6nQmmd59a/10LCtGG
         MD918oB6uM30v6vBV9A3UiLPZCvbXfsBVoQY6HRr8x4n6yQYtLWljHuovLp9tM5RKnXg
         H0kg==
X-Gm-Message-State: AOAM531ZySmb8+EWQcBeeQm5KKR2lAeR0OjVqNBwqBlh3WW/fqzU4AQL
        p9tggwOoULSlcCuE0zG13pRZaTpQrRVZHXCeyJJsaQ==
X-Google-Smtp-Source: ABdhPJxH6/p92YPgO/7HgmWzUCpzT3aC3l1Fe59UgZFVRHr2rRuYtxEtIzMzurOBOUFi8ko6ewEazBNVdxy/MJvI9A4=
X-Received: by 2002:a25:8885:: with SMTP id d5mr9334051ybl.14.1632870916255;
 Tue, 28 Sep 2021 16:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210927184858.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <20210927184858.2.I651eec59ce3cd1c4bdd64de31f9c3531f501b3a8@changeid> <CAE-0n51kTvv-UENH-jZPX-cJu-BCF8HGkCgVBUc3kkxrcUPy9Q@mail.gmail.com>
In-Reply-To: <CAE-0n51kTvv-UENH-jZPX-cJu-BCF8HGkCgVBUc3kkxrcUPy9Q@mail.gmail.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Tue, 28 Sep 2021 16:15:05 -0700
Message-ID: <CA+cxXh=BOsJKvCSFBof-PGC-aaXwyaxukVPKQv3okijnpnxXuQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: sc7180: Support Parade ps8640 edp bridge
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On Tue, Sep 28, 2021 at 1:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-09-27 18:49:40)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
> > new file mode 100644
> > index 000000000000..647afb3a7c6a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Trogdor dts fragment for the boards with Parade ps8640 edp bridge
> > + *
> > + * Copyright 2021 Google LLC.
> > + */
> > +
> > +/ {
> > +       pp3300_brij_ps8640: pp3300-brij-ps8640 {
> > +               compatible = "regulator-fixed";
> > +               status = "okay";
> > +               regulator-name = "pp3300_brij_ps8640";
> > +
> > +               regulator-min-microvolt = <3300000>;
> > +               regulator-max-microvolt = <3300000>;
> > +
> > +               gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;
> > +
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&en_pp3300_edp_brij_ps8640>;
> > +
> > +               vin-supply = <&pp3300_a>;
> > +       };
> > +};
> > +
> > +&dsi0_out {
> > +       remote-endpoint = <&ps8640_in>;
> > +};
> > +
> > +&i2c2 {
> > +       ps8640_bridge: edp-bridge@8 {
> > +               compatible = "parade,ps8640";
> > +               reg = <0x8>;
> > +
> > +               powerdown-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
> > +               reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
> > +
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&edp_brij_en>, <&edp_brij_ps8640_rst>;
>
> Ah here it is. Ignore my concern on patch #1.
>
> > +
> > +               vdd12-supply = <&pp1200_brij>;
> > +               vdd33-supply = <&pp3300_brij_ps8640>;
> > +
> > +               ports {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       port@0 {
> > +                               reg = <0>;
> > +                               ps8640_in: endpoint {
> > +                                       remote-endpoint = <&dsi0_out>;
> > +                               };
> > +                       };
> > +
> > +                       port@1 {
> > +                               reg = <1>;
> > +                               ps8640_out: endpoint {
> > +                                       remote-endpoint = <&panel_in_edp>;
> > +                               };
> > +                       };
> > +               };
> > +
> > +               aux_bus: aux-bus {
>
> The parade,ps8640 binding needs an update for aux-bus. Is that somewhere
> in linux-next or on the list?
Thanks for the reminder.
I'll upload a patch to fix the devicetree binding document.
But I'll wait until the support for ps8640 aux-bus is 100% verified by hardware.

>
> > +                       panel: panel {
> > +                               /* Compatible will be filled in per-board */
> > +                               power-supply = <&pp3300_dx_edp>;
> > +                               backlight = <&backlight>;
> > +
> > +                               port {
> > +                                       panel_in_edp: endpoint {
> > +                                               remote-endpoint = <&ps8640_out>;
> > +                                       };
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +};
