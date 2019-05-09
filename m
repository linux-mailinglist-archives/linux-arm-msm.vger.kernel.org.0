Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACD4185D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 09:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfEIHMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 03:12:45 -0400
Received: from onstation.org ([52.200.56.107]:57424 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726192AbfEIHMp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 03:12:45 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 57C7A3E93E;
        Thu,  9 May 2019 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557385963;
        bh=Jb3P351PcNcvj6RN68GVuceqLFPSl29qLpr7PA9LBkI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T6AQPGcd6DudjY2velB/ZZ5XXAJ8cIHX9sjlYmzwHNrit2iKxINLDAugSQrGe+HHD
         qkHUXbu/zRWVy6kdw6TAJuJ2CFoOWcrVg251Dfo8Px+nsp+C48v6w4oP5+Jf3xuFcB
         IPJUj1RpNsNKuGEE2VzV59bh7KMGuIuk8yZI2dIs=
Date:   Thu, 9 May 2019 03:12:43 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
Message-ID: <20190509071243.GA27143@basecamp>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro>
 <20190509021616.GA26228@basecamp>
 <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
 <20190509030047.GE2085@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509030047.GE2085@tuxbook-pro>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 08, 2019 at 08:00:47PM -0700, Bjorn Andersson wrote:
> On Wed 08 May 19:25 PDT 2019, Rob Clark wrote:
> 
> > On Wed, May 8, 2019 at 7:16 PM Brian Masney <masneyb@onstation.org> wrote:
> > >
> > > On Mon, May 06, 2019 at 11:39:02PM -0700, Bjorn Andersson wrote:
> > > > On Sun 05 May 06:04 PDT 2019, Brian Masney wrote:
> > > > > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > > > [..]
> > > > > +                           clocks = <&mmcc MDSS_MDP_CLK>,
> > > > > +                                    <&mmcc MDSS_AHB_CLK>,
> > > > > +                                    <&mmcc MDSS_AXI_CLK>,
> > > > > +                                    <&mmcc MDSS_BYTE0_CLK>,
> > > > > +                                    <&mmcc MDSS_PCLK0_CLK>,
> > > > > +                                    <&mmcc MDSS_ESC0_CLK>,
> > > > > +                                    <&mmcc MMSS_MISC_AHB_CLK>;
> > > > > +                           clock-names = "mdp_core",
> > > > > +                                         "iface",
> > > > > +                                         "bus",
> > > > > +                                         "byte",
> > > > > +                                         "pixel",
> > > > > +                                         "core",
> > > > > +                                         "core_mmss";
> > > >
> > > > Unless I enable MMSS_MMSSNOC_AXI_CLK and MMSS_S0_AXI_CLK I get some
> > > > underrun error from DSI. You don't see anything like this?
> > > >
> > > > (These clocks are controlled by msm_bus downstream and should be driven
> > > > by interconnect upstream)
> > > >
> > > >
> > > > Apart from this, I think this looks nice. Happy to see the progress.
> > >
> > > No, I'm not seeing an underrun errors from the DSI. I think the clocks
> > > are fine since I'm able to get this working with 4.17 using these same
> > > clocks. I just sent out v2 and the cover letter has some details, along
> > > with the full dmesg.
> > 
> > since we don't have interconnect driver for 8974, I guess there is
> > some chance that things work or not based on how lk leaves things?
> > 
> 
> Right, I guess the bootloader on my device does not leave the busses
> ticking - perhaps there's a boot splash involved on Brian's device?
> 
> Regardless, this works on Nexus 5 and allows Brian to make further
> progress so I'm all for merging it.

There is a boot splash on the Nexus 5 and that may explain a behavior
that I observed. I attempted to add reset GPIO support to the simple
panel driver and the screen will clear but nothing will come on the
screen after a hard reset, even on 4.17. To be sure, I got the timing
information for how long to leave the GPIO high and low from the
downstream MSM 3.4 sources. That's when I had a script port all of the
~400 panel on commands in the downstream device tree to a new panel
driver.

With the latest kernel kernel having a delay showing the console text,
I observe a brief second where the boot splash is shown along with the
startup text from Linux. A full refresh is performed and the boot
splash goes away. I don't see this with the 4.17 kernel; perhaps maybe
the full refresh occurs quick enough that its not noticeable.

Can you point me to where the interconnect API is in the downstream
MSM 3.4 sources? https://github.com/AICP/kernel_lge_hammerhead
It looks like its in drivers/interconnect/ in the upstream sources.

Brian
