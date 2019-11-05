Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8873AEFD97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 13:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388368AbfKEMry (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 07:47:54 -0500
Received: from onstation.org ([52.200.56.107]:46596 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388222AbfKEMry (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 07:47:54 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 6DDB03E89E;
        Tue,  5 Nov 2019 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1572958073;
        bh=qjZCOsS9AdXrQ3Hz6ZuytYLl+kJO+LC8F46kX2vKJc4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=da+Rgg+v2Vzav6Zr/2pab6n3dPGPPB8PlzP7xI/tAVdhNWdLFi605neYEq9cEqq4U
         ljC/RgFKxldyCxXD3FK1jIG09arij3oH9BqaPVQ+YkJyAofqet3ETDYurVJLUS1sXK
         91bw58EiRO2BtjOHlfp45pp7yZPD2TLMxcBrbaQ0=
Date:   Tue, 5 Nov 2019 07:47:52 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org,
        ccross@android.com, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        marijns95@gmail.com, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add configuration for PM8950
 and PMI8950 peripherals
Message-ID: <20191105124752.GA10725@onstation.org>
References: <20191031111645.34777-1-kholk11@gmail.com>
 <20191031111645.34777-4-kholk11@gmail.com>
 <20191031195816.GA1462@onstation.org>
 <CAK7fi1ZZq6=J_5E5QUSqecVXRdMztNDE57zGECf1dE8ZvrWaqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7fi1ZZq6=J_5E5QUSqecVXRdMztNDE57zGECf1dE8ZvrWaqQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 05, 2019 at 12:18:45PM +0100, AngeloGioacchino Del Regno wrote:
> Il giorno gio 31 ott 2019 alle ore 20:58 Brian Masney
> <masneyb@onstation.org> ha scritto:
> >
> > Thanks for the patches. Good to see the progress!
> >
> > On Thu, Oct 31, 2019 at 12:16:43PM +0100, kholk11@gmail.com wrote:
> > > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > >
> > > The PM(I)8950 feature integrated peripherals like ADC, GPIO
> > > controller, MPPs, PON keys and others.
> > > Add them to DT files that will be imported on boards having
> > > this PMIC combo (or one of them, anyways).
> > >
> > > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/pm8950.dtsi  | 187 ++++++++++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/pmi8950.dtsi |  98 ++++++++++++++
> > >  2 files changed, 285 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/pm8950.dtsi
> > >  create mode 100644 arch/arm64/boot/dts/qcom/pmi8950.dtsi
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/pm8950.dtsi b/arch/arm64/boot/dts/qcom/pm8950.dtsi
> > > new file mode 100644
> > > index 000000000000..a349a8dd867e
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/pm8950.dtsi
> > > @@ -0,0 +1,187 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// Copyright (c) 2019, AngeloGioacchino Del Regno <kholk11@gmail.com>
> > > +
> > > +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> > > +#include <dt-bindings/input/linux-event-codes.h>
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > +#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
> > > +#include <dt-bindings/spmi/spmi.h>
> > > +
> > > +&spmi_bus {
> > > +     pm8950_lsid0: pm8950@0 {
> > > +             compatible = "qcom,pm8950", "qcom,spmi-pmic";
> > > +             reg = <0x0 SPMI_USID>;
> > > +             #address-cells = <1>;
> > > +             #size-cells = <0>;
> > > +
> > > +             pon@800 {
> > > +                     compatible = "qcom,pm8916-pon";
> > > +                     reg = <0x0800>;
> > > +                     mode-bootloader = <0x2>;
> > > +                     mode-recovery = <0x1>;
> > > +
> > > +                     pwrkey {
> > > +                             compatible = "qcom,pm8941-pwrkey";
> > > +                             interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> > > +                             debounce = <15625>;
> > > +                             bias-pull-up;
> > > +                             linux,code = <KEY_POWER>;
> > > +                     };
> > > +             };
> > > +
> > > +             pm8950_mpps: mpps@a000 {
> > > +                     compatible = "qcom,pm8950-mpp", "qcom,spmi-mpp";
> > > +                     reg = <0xa000>;
> > > +                     gpio-controller;
> > > +                     #gpio-cells = <2>;
> > > +                     interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
> > > +                                  <0 0xa1 0 IRQ_TYPE_NONE>,
> > > +                                  <0 0xa2 0 IRQ_TYPE_NONE>,
> > > +                                  <0 0xa3 0 IRQ_TYPE_NONE>;
> > > +
> > > +                     /* MPP_2: PA_THERM1 */
> > > +                     pa_therm {
> > > +                             pm8950_mpp2_def: pa_therm1_default {
> > > +                                     pins = "mpp2";
> > > +                                     function = "analog";
> > > +                                     input-enable;
> > > +                                     qcom,amux-route =
> > > +                                             <PMIC_MPP_AMUX_ROUTE_CH6>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     /* MPP_4: QUIET_THERM */
> > > +                     case_therm {
> > > +                             pm8950_mpp4_def: case_therm_default {
> > > +                                     pins = "mpp4";
> > > +                                     function = "analog";
> > > +                                     input-enable;
> > > +                                     qcom,amux-route =
> > > +                                             <PMIC_MPP_AMUX_ROUTE_CH8>;
> > > +                             };
> > > +                     };
> > > +             };
> > > +
> > > +             pm8950_gpios: gpio@c000 {
> > > +                     compatible = "qcom,pm8950-gpio", "qcom,spmi-gpio";
> > > +                     reg = <0xc000>;
> > > +                     gpio-controller;
> > > +                     #gpio-cells = <2>;
> > > +                     interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
> > > +                             <0 0xc1 0 IRQ_TYPE_NONE>,
> > > +                             <0 0xc3 0 IRQ_TYPE_NONE>,
> > > +                             <0 0xc4 0 IRQ_TYPE_NONE>,
> > > +                             <0 0xc5 0 IRQ_TYPE_NONE>,
> > > +                             <0 0xc6 0 IRQ_TYPE_NONE>,
> > > +                             <0 0xc7 0 IRQ_TYPE_NONE>;
> > > +             };
> >
> > Please add gpio-ranges so that gpio-hogging will work properly. See
> > commits for pm8941 and spmi-gpio that describes the problem and how
> > to fix it:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=149a96047237574b756d872007c006acd0cc6687
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cdd3d64d843a2a4c658a182b744bfefbd021d542
> >
> > Please drop the interrupts property and configure this to be a
> > hierarchical IRQ chip. See these two commits for more details:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ca69e2d165eb3d060cc9ad70a745e27a2cf4310b
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5f540fb4821a5444350ab3311fff60013d755d8f
> >
> > There is some kind of mask that you'll need to add to omit 0xc2 that
> > Linus Walleij told me about before. I don't have the property handy
> > right now, but can look it up later if needed.
> >
> > Brian
> 
> That looks cleaner! Didn't know about it... Anyway, the only way that I know
> to exclude the 0xc2 is something like
> 
> gpio-ranges = <&pm8950_gpios 0 0 8>;
> gpio-reserved-ranges = <2 1>;
> 
> ...but you're talking about a mask? Is there a different way of doing it, or
> were you referring to the gpio-reserved-ranges property?

Yes, it looks like gpio-reserved-ranges property is what you need.

Brian
