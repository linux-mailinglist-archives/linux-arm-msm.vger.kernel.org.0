Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4891A566
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2019 00:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbfEJWkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 18:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:47894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbfEJWkd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 18:40:33 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A45FB217D6;
        Fri, 10 May 2019 22:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557528031;
        bh=sjg797I3Ege8CH2yMEKO3LN7YMxSK0+Tf/Ul0+K1ZmU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2BQZd867VQk7T/6xVDuphNMg8PT5izoOPVjRH879mo5UuHee3+ME5We5UOp8oRApd
         iNSg0CMTjRLx+00A9EkpzztyQHHRMInm04SGcjFY0N6Ai1ssRwJbeHEvYjgtLq3o/8
         Wx03509gNXFgIf1KQaGDcBNEhhyg+soHiT3IF6pM=
Received: by mail-qk1-f175.google.com with SMTP id c1so3365531qkk.4;
        Fri, 10 May 2019 15:40:31 -0700 (PDT)
X-Gm-Message-State: APjAAAW4lI9YZcdBQOHTUO12vKApasFtUEa37qKOlUhFHw63XY3DrNho
        Z4MY0Q3mcIdVCFavI5lHXsb3A24Yv0TtGLIEow==
X-Google-Smtp-Source: APXvYqzfUsXjKG+F9pb5KnYx61JOP50q/a8ljf0lZ3E6IZXXHNgJGxcJf1n0r9rKoC1VBQNTKS7hmCXklLDer5hjE7Q=
X-Received: by 2002:a37:c42:: with SMTP id 63mr10276099qkm.326.1557528030863;
 Fri, 10 May 2019 15:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190507203749.3384-1-ilina@codeaurora.org> <20190507203749.3384-5-ilina@codeaurora.org>
In-Reply-To: <20190507203749.3384-5-ilina@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 10 May 2019 17:40:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKXN2ye49HGEf+vLD0xaysp6kDqsZfFXX9BssK+TUh5SA@mail.gmail.com>
Message-ID: <CAL_JsqKXN2ye49HGEf+vLD0xaysp6kDqsZfFXX9BssK+TUh5SA@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] of: irq: document properties for wakeup
 interrupt parent
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 7, 2019 at 3:41 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> Some interrupt controllers in a SoC, are always powered on and have a
> select interrupts routed to them, so that they can wakeup the SoC from
> suspend. Add wakeup-parent DT property to refer to these interrupt
> controllers.
>
> If the interrupts routed to the wakeup parent are not sequential, than a
> map needs to exist to associate the same interrupt line on multiple
> interrupt controllers. Providing this map in every driver is cumbersome.
> Let's add this in the device tree and document the properties to map the
> interrupt specifiers
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
> Changes in v5:
>         - Update documentation to describe masks in the example
> Changes in v4:
>         - Added this documentation
> ---
>  .../interrupt-controller/interrupts.txt       | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> index 8a3c40829899..e3e43f5d5566 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> @@ -108,3 +108,57 @@ commonly used:
>                         sensitivity = <7>;
>                 };
>         };
> +
> +3) Interrupt wakeup parent
> +--------------------------
> +
> +Some interrupt controllers in a SoC, are always powered on and have a select
> +interrupts routed to them, so that they can wakeup the SoC from suspend. These
> +interrupt controllers do not fall into the category of a parent interrupt
> +controller and can be specified by the "wakeup-parent" property and contain a
> +single phandle referring to the wakeup capable interrupt controller.
> +
> +   Example:
> +       wakeup-parent = <&pdc_intc>;
> +
> +
> +4) Interrupt mapping
> +--------------------
> +
> +Sometimes interrupts may be detected by more than one interrupt controller
> +(depending on which controller is active). The interrupt controllers may not
> +be in hierarchy and therefore the interrupt controller driver is required to
> +establish the relationship between the same interrupt at different interrupt
> +controllers. If these interrupts are not sequential then a map needs to be
> +specified to help identify these interrupts.
> +
> +Mapping the interrupt specifiers in the device tree can be done using the
> +"irqdomain-map" property. The property contains interrupt specifier at the
> +current interrupt controller followed by the interrupt specifier at the mapped
> +interrupt controller.
> +
> +   irqdomain-map = <incoming-interrupt-specifier mapped-interrupt-specifier>

I'm wondering why we need a new map property rather than just using
interrupt-map? Contrary to what Linus said, it is not PCI only.

It would be an extension of the current behavior. It's generally used
to map each interrupt to different parents or swizzle the routing (in
the PCI case). Generally, a node would be either an
'interrupt-controller' or an 'interrupt-map' node. The interrupt
parsing code (for the kernel at least) prioritizes
'interrupt-controller' path, so adding 'interrupt-map' could be done
without changing behavior.

Another concern I have with this is it only solves the problem of an
IRQ routed to multiple parents for the case of 2 parents. What happens
when we have an IRQ routed to 3 different parents? Maybe the solution
is the incoming-interrupt-specifier can be listed more than once. Marc
already expressed concerns with the scalability of interrupt-map
property, so that's maybe not an ideal solution.

> +
> +The optional properties "irqdomain-map-mask" and "irqdomain-map-pass-thru" may
> +be provided to help interpret the valid bits of the incoming and mapped
> +interrupt specifiers respectively.
> +
> +   Example:
> +       intc: interrupt-controller@17a00000 {
> +               #interrupt-cells = <3>;

The phandle doesn't count as a cell, so this should be 2.

> +       };
> +
> +       pinctrl@3400000 {
> +               #interrupt-cells = <2>;
> +               irqdomain-map = <22 0 &intc 36 0>, <24 0 &intc 37 0>;
> +               irqdomain-map-mask = <0xff 0>;
> +               irqdomain-map-pass-thru = <0 0xff>;
> +       };
> +
> +In the above example, the input interrupt specifier map-mask <0xff 0> applied
> +on the incoming interrupt specifier of the map <22 0>, <24 0>, returns the
> +input interrupt 22, 24 etc. The second argument being irq type is immaterial
> +from the map and is used from the incoming request instead. The pass-thru
> +specifier parses the output interrupt specifier from the rest of the unparsed
> +argments from the map <&intc 36 0>, <&intc 37 0> etc to return the output
> +interrupt 36, 37 etc.
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
