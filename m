Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2AD12DA24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 12:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfE2KMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 06:12:33 -0400
Received: from onstation.org ([52.200.56.107]:42368 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbfE2KMd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 06:12:33 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 3CDA83E80A;
        Wed, 29 May 2019 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559124752;
        bh=4f19VAckNJfX9TZ6MOat/i/BEBdC6p0OSO/afJQBVF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ccPZ5sy5pY5zLGdFYRTWuuBz49Ah+c+f2MJGvkleNHuoL6qOuw+6CXmzpcnJH0HIx
         Zik+vWJX+BJXDZuQlb8UjbIGxp2F6Bt7NYF0KZpKlzkOLlC4Qe/sJL9LI75UTn0xkZ
         8I9hMA+RGcQBdtS5vo8AChj8paQSSBJhJ8FQTpU8=
Date:   Wed, 29 May 2019 06:12:31 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
Message-ID: <20190529101231.GA14540@basecamp>
References: <20190516085018.2207-1-masneyb@onstation.org>
 <20190520142149.D56DA214AE@mail.kernel.org>
 <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 29, 2019 at 11:13:15AM +0200, Linus Walleij wrote:
> On Mon, May 20, 2019 at 4:21 PM Stephen Boyd <sboyd@kernel.org> wrote:
> 
> > > +       vibrator@fd8c3450 {
> > > +               compatible = "qcom,msm8974-vibrator";
> > > +               reg = <0xfd8c3450 0x400>;
> >
> > This is inside the multimedia clk controller. The resource reservation
> > mechanism should be complaining loudly here. Is the driver writing
> > directly into clk controller registers to adjust a duty cycle of the
> > camera's general purpose clk?
> >
> > Can you add support for duty cycle to the qcom clk driver's RCGs and
> > then write a generic clk duty cycle vibrator driver that adjusts the
> > duty cycle of the clk? That would be better than reaching into the clk
> > controller registers to do this.
> 
> There is something ontological about this.
> 
> A clock with variable duty cycle, isn't that by definition a PWM?
> I don't suppose it is normal for qcom clocks to be able to control
> their duty cycle, but rather default to 50/50 as we could expect?
> 
> I would rather say that maybe the qcom drivers/clk/qcom/* file
> should be exporting a PWM from the linux side of things
> rather than a clock for this thingie, and adding #pwm-cells
> in the DT node for the clock controller, making it possible
> to obtain PWMs right out of it, if it is a single device node for
> the whole thing.
> 
> Analogous to how we have GPIOs that are ortogonally interrupt
> providers I don't see any big problem in a clock controller
> being clock and PWM provider at the same time.
> 
> There is code in drivers/clk/clk-pwm to use a pwm as a clock
> but that is kind of the reverse use case, if we implement PWMs
> directly in a clock controller driver then these can be turned into
> clocks using clk-pwm.c should it be needed, right?
> 
> Part of me start to question whether clk and pwm should even
> be separate subsystems :/ they seem to solve an overlapping
> problem space.

My first revision of this vibrator driver used the Linux PWM framework
due to the variable duty cycle:

https://lore.kernel.org/lkml/20180926235112.25710-1-masneyb@onstation.org/

I used the pwm-vibra driver on the input side.

Brian
