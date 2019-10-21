Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15CE4DE585
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 09:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbfJUHuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 03:50:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52696 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUHuy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 03:50:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id r19so12071539wmh.2;
        Mon, 21 Oct 2019 00:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lAch51dUhj4NuzLLw8/8w9QHfn4X/4BidztkzB9RvfQ=;
        b=M3KLxSok8AgAVfLEchFOsfRv+wuA0XZdvQG+6LHQ74itWTxD32ECYi2MubLeR05VOe
         82pgZCQND+alVXLmVAyUfPkDFHW7oITqbFs8NLR+BjxjbrC4IbYxS0iCp2RLS5GIlNjB
         O52mIcClJhojW5n2TEMZw/VleX58HI9GuiIs1fPJrmFJlGIptEwmFOmkhrEGJlOeBT9B
         2j8UwRXYooiokJjK36vzUFcvWAcI45B5wdkilEjvp90Z+gQIE1cC5kQqWwVzm30VLNfM
         kXFF0l1A2KnkSCnS/ObuG3c1UlKsqLHdiB8jPJwaJeW7yzyfaPXQzAS3Zpo4XcevG4WW
         m8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lAch51dUhj4NuzLLw8/8w9QHfn4X/4BidztkzB9RvfQ=;
        b=oYayn0yDzHBXMoCO7Vcpd00ZbONeXe7km4CA74bDOGBMrHhdFhiIt/4FTAKjiid/bp
         6IMNzTFJNCbFbwIvL0gNyMZEv0LD0nOGuLooR/lK01PrcMlRtfMdJ6jh9Fhvw3XM0lT3
         2u3iToNdKkmkJrmipbut+gW9Q00bDeBuMbq066x5ee87pJ56VQ/lTJ5pDhBFKmlaLjrt
         JWK384IdB8I4EVaD1GbEm6nDX2lQz5+sCBRrOJ8V852ONnWfmTeLrrC5Sadez9CmgHDK
         6rrkBskAv1yrYBcXIfPa1yPmsWV54Y23lYFg3CsZkcivQYUPes8eHYioksvXQeYTfx/p
         jwnA==
X-Gm-Message-State: APjAAAWGenavlLXQZ2EN8czYcbSjrMv1/+GE6KSSlzXCRHeHQW6ItAEi
        qtomnGH3KIpIcREIFba1KAp9l7pcRkRMy0ffzjo=
X-Google-Smtp-Source: APXvYqyHHiaGrYwtb7fLd+aNGzjSJ73p77CHEpRF07Iqth1hDCiTYqW1YQmFQ9v6qhJoxVWBOg9brhbBqFfefuR9ij0=
X-Received: by 2002:a7b:c4d4:: with SMTP id g20mr16489854wmk.123.1571644250026;
 Mon, 21 Oct 2019 00:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191020150746.64114-1-kholk11@gmail.com> <20191020150746.64114-5-kholk11@gmail.com>
 <20191021055207.GJ4500@tuxbook-pro>
In-Reply-To: <20191021055207.GJ4500@tuxbook-pro>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Mon, 21 Oct 2019 09:50:38 +0200
Message-ID: <CAK7fi1bTRWtMr6y+ugZ-jBKA5xTM=J+_ePL62AMqyJ19bYwMQw@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add MSM8976 SoC support dts files
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org,
        ccross@android.com, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, marijns95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno lun 21 ott 2019 alle ore 07:52 Bjorn Andersson
<bjorn.andersson@linaro.org> ha scritto:
>
> On Sun 20 Oct 08:07 PDT 2019, kholk11@gmail.com wrote:
> [..]
> > diff --git a/arch/arm64/boot/dts/qcom/msm8976-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8976-pins.dtsi
> > new file mode 100644
> > index 000000000000..1abeba8b8d18
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/msm8976-pins.dtsi
> > @@ -0,0 +1,2119 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2016-2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
> > + */
> > +
> > +&tlmm {
>
> Please inline this in msm8974.dtsi, it makes it easier to find nodes
> than when they are sprinkled in various *pins.dtsi files.
>
>
> Note also that a lot of these configs are specific to loire, rather than
> msm8976. So preferably they should be specified there instead of in the
> platform.
>

Well, no... the loire pin config is another story.... this
configuration comes in reality
from the Qualcomm's MSM8976 MTP initial standard configuration (which I've
"translated" from that 3.10 downstream "thing" to the new pinctrl
style some time
ago), so, if some of this configuration effectively does apply to the somc loire
platform, that's because the hardware engineers were kind to not
change everything
from the ground up....

I didn't append this thingy to the msm8976.dtsi because it's a veeeery
long list of
pins and, since I saw it done like that already for MSM8916/8992/8994/8996/8998,
I thought it was a good idea to follow that kind of style.. but I can
totally understand
your point of having to open a myriad of files here and there to find
what you want
being less comfortable than having what you need just immediately right there!

Shorter said: sure! I will move this stuff in msm8976.dtsi and I'll
delete any pin
configuration that is strictly tied to the MTP (or any other) platform
to keep it
clean and short.

> > +     cdc_reset_ctrl {
> > +             cdc_reset_line_sus: cdc_reset_sleep {
> > +                     mux {
>
> You don't have to split mux and config into subnodes (you don't even
> need the last level subnode anymore)...
>

Sorry for that, there's some confusion around looking at other *-pins files
and I thought it was fine to keep it like that.

Will change it!

> > +                             pins = "gpio133";
> > +                             function = "gpio";
> > +                     };
> > +                     config {
> > +                             pins = "gpio133";
> > +                             drive-strength = <16>;
> > +                             bias-disable;
> > +                             output-low;
> > +                     };
> > +             };
> [..]
> > diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> [..]
> > +     firmware {
> > +             scm: scm {
> > +                     compatible = "qcom,scm";
>
> Please add a more specific compatible as well.
>

Oops! Yeah, adding it.

> > +                     clocks = <&gcc GCC_CRYPTO_CLK>,
> > +                              <&gcc GCC_CRYPTO_AXI_CLK>,
> > +                              <&gcc GCC_CRYPTO_AHB_CLK>;
> > +                     clock-names = "core", "bus", "iface";
> > +                     #reset-cells = <1>;
> > +
> > +                     qcom,dload-mode = <&tcsr 0x6100>;
> > +             };
> > +     };
> [..]
> > +     smd {
> > +             compatible = "qcom,smd";
> > +
> > +             rpm {
> > +                     interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> > +                     qcom,ipc = <&apcs 8 0>;
> > +                     qcom,smd-edge = <15>;
> > +
> > +                     rpm_requests {
> > +                             compatible = "qcom,rpm-msm8976";
> > +                             qcom,smd-channels = "rpm_requests";
> > +
> > +                             rpmcc: qcom,rpmcc {
> > +                                     compatible = "qcom,rpmcc-msm8976";
> > +                                     #clock-cells = <1>;
> > +                             };
> > +
> > +                             rpmpd: power-controller {
> > +                                     compatible = "qcom,msm8976-rpmpd";
> > +                                     #power-domain-cells = <1>;
> > +                                     operating-points-v2 = <&rpmpd_opp_table>;
> > +                             };
> > +
> > +                             smd_rpm_regulators: pm8950-regulators {
>
> We've seen several times before where devices of a specific platform
> comes with different set of pmics, so please omit the pmic configuration
> from msm8976.dtsi, give rpm_requests a label and add these regulators in
> the loire.dtsi
>

I would never have any objections on that. I even knew it already, but
sometimes my brain plays bad jokes on me, apparently.

Consider it done!

> > +                                     compatible = "qcom,rpm-pm8950-regulators";
> > +
> > +                                     pm8950_s1: s1 {};
> > +                                     pm8950_s2: s2 {};
> > +                                     pm8950_s3: s3 {};
> > +                                     pm8950_s4: s4 {};
> > +                                     pm8950_s5: s5 {};
> > +                                     pm8950_s6: s6 {};
> > +
> > +                                     pm8950_l1: l1 {};
> > +                                     pm8950_l2: l2 {};
> > +                                     pm8950_l3: l3 {};
> > +                                     pm8950_l4: l4 {};
> > +                                     pm8950_l5: l5 {};
> > +                                     pm8950_l6: l6 {};
> > +                                     pm8950_l7: l7 {};
> > +                                     pm8950_l8: l8 {};
> > +                                     pm8950_l9: l9 {};
> > +                                     pm8950_l10: l10 {};
> > +                                     pm8950_l11: l11 {};
> > +                                     pm8950_l12: l12 {};
> > +                                     pm8950_l13: l13 {};
> > +                                     pm8950_l14: l14 {};
> > +                                     pm8950_l15: l15 {};
> > +                                     pm8950_l16: l16 {};
> > +                                     pm8950_l17: l17 {};
> > +                                     pm8950_l18: l18 {};
> > +                                     pm8950_l19: l19 {};
> > +                                     pm8950_l20: l20 {};
> > +                                     pm8950_l21: l21 {};
> > +                                     pm8950_l22: l22 {};
> > +                                     pm8950_l23: l23 {};
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     soc: soc {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             ranges = <0 0 0 0xffffffff>;
> > +             compatible = "simple-bus";
> > +
> > +             tcsr_mutex_regs: syscon@1905000 {
> > +                     compatible = "syscon";
> > +                     reg = <0x1905000 0x20000>;
>
> Please pad the address to 8 digits (to make it easier for me to see if
> things are sorted) and please sort all nodes based on address and then
> by name.
>
> > +             };
> [..]
> > +             smsm {
>
> Non-mmio nodes should not live under /soc, please move them to /.
>
> > +                     compatible = "qcom,smsm";
> > +
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     qcom,ipc-1 = <&apcs 8 12>;
> > +                     qcom,ipc-2 = <&apcs 8 9>;
> > +                     qcom,ipc-3 = <&apcs 8 18>;
> > +
> > +                     apps_smsm: apps@0 {
> > +                             reg = <0>;
> > +                             #qcom,smem-state-cells = <1>;
> > +                     };
> > +
> > +                     hexagon_smsm: hexagon@1 {
> > +                             reg = <1>;
> > +                             interrupts = <0 290 IRQ_TYPE_EDGE_RISING>;
> > +
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                     };
> > +
> > +                     wcnss_smsm: wcnss@6 {
> > +                             reg = <6>;
> > +                             interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
> > +
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                     };
> > +             };
> [..]
> > +
> > +             hexagon@4080000 {
>
> remoteproc@4080000
>
> > +                     compatible = "qcom,q6v5-pil";
> > +                     reg = <0x04080000 0x100>,
> > +                           <0x04020000 0x040>;
> > +
> > +                     reg-names = "qdsp6", "rmb";
> > +
> > +                     interrupts-extended = <&intc 0 293 1>,
> > +                                           <&adsp_smp2p_in 0 0>,
>
> The compatible indicates that this is the modem, but this says "adsp".
> Can you please confirm the Hexagon configuration on this platform?
>
> > +                                           <&adsp_smp2p_in 2 0>,
> > +                                           <&adsp_smp2p_in 1 0>,
> > +                                           <&adsp_smp2p_in 3 0>;
> > +                     interrupt-names = "wdog", "fatal", "ready",
> > +                                       "handover", "stop-ack";
> > +
>
> Regards,
> Bjorn

And about the rest, yep, I'll check, recheck and fix :)))

Thanks for the review!
Angelo
