Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCBC476934
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 05:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbhLPEnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 23:43:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233525AbhLPEnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 23:43:22 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514DFC06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 20:43:22 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso27593113ota.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 20:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=3RzaaearIYbFOPasrtZL1Qn4CGShYarsAAtoS7FS/Og=;
        b=Q7z6pT0v4hCeNK/JGdecfC+0v3mIIP71W56G1Cmgtw13ONjyj5+7R9dleoPXl+kO6h
         1ZCyiZOsr2W3+Jh6O2Xn4LFVmwEn3rIZS/FW5/A6AhhCoxmS9iX6kLKr1vvmHhTkfN5/
         jpMg1ISamVNsoqnLytvY9mb9PUrVUJVExTbmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=3RzaaearIYbFOPasrtZL1Qn4CGShYarsAAtoS7FS/Og=;
        b=qXKL5JO8uEjAgrF+HAFcmkMjtT4T7FHnuikuFFWSvhntR+vGQch+IGme9YgAWPNxNU
         8LDeWiGTqPC19LLN0KTnDADi3bc1Q7HjTcLWlAsBEsnI2RLl4UkTvF9JRu+XQPljYbTd
         Ixfk4hyK+nJ/kR+IcWbjzhrQNhZ802rVzSBxJ7Bw7pUcd7sB1WQY8blcUiTLyh2knKFf
         7HNg1pnNXyCR2KnUv8RerZ8mLrS5ML/QbIG29DO6W6fVRyg9R0wmkf4SgaB/Qdxl68oj
         ApbGaiwO7XPZacGYnvb8bRteIjIImu0emTG9XvSN8K5glefyhOgQhNfj8++qkZh/FbEe
         KrFg==
X-Gm-Message-State: AOAM531WK0fgxcOsFdM0tAjTSHVPxK6Zc6s54+RvXMrYg6JmObuQm0QL
        baOQRd+vfxx32ARyS+y93M2iycI9xsjtR/7EshqEpw==
X-Google-Smtp-Source: ABdhPJw7dtlv5FG/2hQWJ7GKk0B3PVmNniDqy4RqxdhspboPfH7npUG2cFrqS7aBKnFZFSKqIA/OGtC13xtvHmaNuGs=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr11377458ota.126.1639629801696;
 Wed, 15 Dec 2021 20:43:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 20:43:21 -0800
MIME-Version: 1.0
In-Reply-To: <YbqlDQogwdi52FpK@google.com>
References: <20211215003639.386460-1-swboyd@chromium.org> <YbqlDQogwdi52FpK@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Dec 2021 20:43:21 -0800
Message-ID: <CAE-0n53z=CVMx=zmh6Up57E-yVG7iU3oMiM7cLPfsQwriM=+=w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sc7180: Add board regulators for MIPI camera
 trogdor boards
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2021-12-15 18:31:41)
> On Tue, Dec 14, 2021 at 04:36:38PM -0800, Stephen Boyd wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index d4f4441179fc..1dd8e35093a8 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -113,6 +113,40 @@ src_vph_pwr: src-vph-pwr-regulator {
> >               vin-supply = <&ppvar_sys>;
> >       };
> >
> > +     pp1800_uf_cam: pp1800-uf-cam-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "pp1800_uf_cam";
> > +             status = "disabled";
> > +
> > +             regulator-min-microvolt = <1800000>;
> > +             regulator-max-microvolt = <1800000>;
> > +
> > +             gpio = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&uf_cam_en>;
> > +
> > +             vin-supply = <&pp1800_ldo>;
> > +             regulator-enable-ramp-delay = <1000>;
> > +     };
> > +
> > +     pp1800_wf_cam: pp1800-wf-cam-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "pp1800_wf_cam";
> > +             status = "disabled";
> > +
> > +             regulator-min-microvolt = <1800000>;
> > +             regulator-max-microvolt = <1800000>;
> > +
> > +             gpio = <&tlmm 7 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&wf_cam_en>;
> > +
> > +             vin-supply = <&pp1800_ldo>;
> > +             regulator-enable-ramp-delay = <1000>;
> > +     };
> > +
>
> Shouldn't 'pp1800_ldo' be defined before these ("FIXED REGULATORS
> - parents above children")?

Good catch! Fixed it.

>
> I suggest to move these two below the top level regulators, i.e.
> somwhere after pp3300_a (probably pp3300_a and pp5000_a should be
> swapped, but that's beyond the scope of this patch).
>
> >       pp5000_a: pp5000-a-regulator {
> >               compatible = "regulator-fixed";
> >               regulator-name = "pp5000_a";
> > @@ -1517,4 +1611,32 @@ pinconf-sd-cd {
> >                       drive-strength = <2>;
> >               };
> >       };
> > +
> > +     uf_cam_en: uf-cam-en {
> > +             pinmux {
> > +                     pins = "gpio6";
> > +                     function = "gpio";
> > +             };
> > +
> > +             pinconf {
> > +                     pins = "gpio6";
> > +                     drive-strength = <2>;
> > +                     /* External pull down */
>
> Is there actually an external pull down?

My understanding is that there's an internal pull down in the LDO so
while it isn't exactly "external" in the sense there's a pull down on
the net via a resistor, there's still a pull down that you can't see in
the schematic in the IC.
