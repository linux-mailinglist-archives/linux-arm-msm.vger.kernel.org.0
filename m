Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4C1625F68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 10:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbfEVIXu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 04:23:50 -0400
Received: from onstation.org ([52.200.56.107]:34656 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728653AbfEVIXu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 04:23:50 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 48C913E85B;
        Wed, 22 May 2019 08:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1558513429;
        bh=VwsPQeEkjtUDvFbRrWrenVq9dKv37ynzaHzSyE0Crp8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o5D9rWiTzK5SazUOVnMsNJa++g8OkgtQ5DIDryBZ7KXXnYVT9vrfRceZP2zDDGW21
         O6Gces4yVyJjU4jmKWkJmx41XaPtqkHntbQHrZF069Zms4VeCuYL4PbLJ5EaqUlgaQ
         R4EvKMF5gGwjBfOaR7VsB6DUgxuUDhHOvOigeVRs=
Date:   Wed, 22 May 2019 04:23:48 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
Message-ID: <20190522082348.GA15793@basecamp>
References: <20190516085018.2207-1-masneyb@onstation.org>
 <20190520142149.D56DA214AE@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520142149.D56DA214AE@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On Mon, May 20, 2019 at 07:21:49AM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2019-05-16 01:50:18)
> > @@ -306,6 +307,36 @@
> >                                 input-enable;
> >                         };
> >                 };
> > +
> > +               vibrator_pin: vibrator {
> > +                       pwm {
> > +                               pins = "gpio27";
> > +                               function = "gp1_clk";
> > +
> > +                               drive-strength = <6>;
> > +                               bias-disable;
> > +                       };
> > +
> > +                       enable {
> > +                               pins = "gpio60";
> > +                               function = "gpio";
> > +                       };
> > +               };
> > +       };
> > +
> > +       vibrator@fd8c3450 {
> > +               compatible = "qcom,msm8974-vibrator";
> > +               reg = <0xfd8c3450 0x400>;
> 
> This is inside the multimedia clk controller. The resource reservation
> mechanism should be complaining loudly here. Is the driver writing
> directly into clk controller registers to adjust a duty cycle of the
> camera's general purpose clk?
> 
> Can you add support for duty cycle to the qcom clk driver's RCGs and
> then write a generic clk duty cycle vibrator driver that adjusts the
> duty cycle of the clk? That would be better than reaching into the clk
> controller registers to do this.

I don't see any complaints in dmesg about this, however I'll work on a
new clk duty cycle vibrator driver.

Brian
