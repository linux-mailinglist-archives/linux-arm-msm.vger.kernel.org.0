Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B55018BF9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 16:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfEIOjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 10:39:03 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34379 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfEIOjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 10:39:03 -0400
Received: by mail-ed1-f65.google.com with SMTP id p27so2278839eda.1;
        Thu, 09 May 2019 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9t7aEDiITTttHmEroagFkepeymOccLvzdNzl0sxtB0Y=;
        b=kc3H9lA0fD/2BVU7pcpJ8aO/xF8B9diKeKq1Np9zrH9xRCpslbFIyx6PeduDjYOIUa
         +kaYfKZojmbRHptRHdfkFGYPdla5sjvWUMDqNiH7CbhUyL/hE9shgIxXVEbIiT7i7Tac
         LNMbuvGLzUgqGCOxnH7xMLzKsGtjL0jKdp3zrYZ3LD7Rxq5gTyeiezQbRMHE8bYNihMn
         f8cMd4qiCByXQYT4FjtGrmRrdHWc+AD1e32/VAkx6cIfbSCsg49LL0BpQJ0erjzqag4x
         QxWy63YFHapBUTbGs5Y1EwN7H0KwTSIavAGHEsb0tcYpLs70BusdRUH5i+9XAIjAj/eM
         K0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9t7aEDiITTttHmEroagFkepeymOccLvzdNzl0sxtB0Y=;
        b=iov6ubRf/VpFhiCP1BN9uYu8uwD/gejue4N2heHnpCIA9xWGOPWoHutc7za/OlxEfz
         WpwmLq8R/QR6d8Pj3GKXIHw04uMKEiMFauaH6QoN/iHUc4OH3rHSh3TRgS9WEDTiAgnn
         IfUtSYgOF3/7VUqH3xFOMisdqyiwRv6b3fvu4ygWIPin2mOtEVTpWcHoVp3kWythbQTL
         AoOLAyzyDQ9GXK9TFs3Zsx2FhW8lmhfR/ijApjZvH7AV4q6AqqmVUk0imcM5OK6NaAht
         1EknYW1PXw1Acu3IwBwMBG3EKEkDhTHpmMB8l8RzhUU+mVDPe2DMedH+mAuLmANa+IFv
         XORw==
X-Gm-Message-State: APjAAAV9b60Nw9i1HOF5gyHHCKrol6TJTNDTmbHgFD666FSrWZh35PQl
        iEzqjRwt5oSNiepm3vQPUqP0yiK5X1S+WGRJr8A=
X-Google-Smtp-Source: APXvYqyc5GrUMyW2UgdZHxlpNMrGzEye6QrDZqbGzBMUgpBeXmJ7pwyZ119oHVGaZx1mmB5PCGRWYFTm65kRgjbet2c=
X-Received: by 2002:a17:906:7695:: with SMTP id o21mr3604110ejm.165.1557412741041;
 Thu, 09 May 2019 07:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org> <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro> <20190509021616.GA26228@basecamp>
 <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
 <20190509030047.GE2085@tuxbook-pro> <20190509071243.GA27143@basecamp>
In-Reply-To: <20190509071243.GA27143@basecamp>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 May 2019 07:38:51 -0700
Message-ID: <CAF6AEGvRQoVq-P8tXupDCauxuW9K0vVsOv5HMivRxDrXPdHERA@mail.gmail.com>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
To:     Brian Masney <masneyb@onstation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 9, 2019 at 12:12 AM Brian Masney <masneyb@onstation.org> wrote:
>
> On Wed, May 08, 2019 at 08:00:47PM -0700, Bjorn Andersson wrote:
> > On Wed 08 May 19:25 PDT 2019, Rob Clark wrote:
> >
> > > On Wed, May 8, 2019 at 7:16 PM Brian Masney <masneyb@onstation.org> wrote:
> > > >
> > > > On Mon, May 06, 2019 at 11:39:02PM -0700, Bjorn Andersson wrote:
> > > > > On Sun 05 May 06:04 PDT 2019, Brian Masney wrote:
> > > > > > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > > > > [..]
> > > > > > +                           clocks = <&mmcc MDSS_MDP_CLK>,
> > > > > > +                                    <&mmcc MDSS_AHB_CLK>,
> > > > > > +                                    <&mmcc MDSS_AXI_CLK>,
> > > > > > +                                    <&mmcc MDSS_BYTE0_CLK>,
> > > > > > +                                    <&mmcc MDSS_PCLK0_CLK>,
> > > > > > +                                    <&mmcc MDSS_ESC0_CLK>,
> > > > > > +                                    <&mmcc MMSS_MISC_AHB_CLK>;
> > > > > > +                           clock-names = "mdp_core",
> > > > > > +                                         "iface",
> > > > > > +                                         "bus",
> > > > > > +                                         "byte",
> > > > > > +                                         "pixel",
> > > > > > +                                         "core",
> > > > > > +                                         "core_mmss";
> > > > >
> > > > > Unless I enable MMSS_MMSSNOC_AXI_CLK and MMSS_S0_AXI_CLK I get some
> > > > > underrun error from DSI. You don't see anything like this?
> > > > >
> > > > > (These clocks are controlled by msm_bus downstream and should be driven
> > > > > by interconnect upstream)
> > > > >
> > > > >
> > > > > Apart from this, I think this looks nice. Happy to see the progress.
> > > >
> > > > No, I'm not seeing an underrun errors from the DSI. I think the clocks
> > > > are fine since I'm able to get this working with 4.17 using these same
> > > > clocks. I just sent out v2 and the cover letter has some details, along
> > > > with the full dmesg.
> > >
> > > since we don't have interconnect driver for 8974, I guess there is
> > > some chance that things work or not based on how lk leaves things?
> > >
> >
> > Right, I guess the bootloader on my device does not leave the busses
> > ticking - perhaps there's a boot splash involved on Brian's device?
> >
> > Regardless, this works on Nexus 5 and allows Brian to make further
> > progress so I'm all for merging it.
>
> There is a boot splash on the Nexus 5 and that may explain a behavior
> that I observed. I attempted to add reset GPIO support to the simple
> panel driver and the screen will clear but nothing will come on the
> screen after a hard reset, even on 4.17. To be sure, I got the timing
> information for how long to leave the GPIO high and low from the
> downstream MSM 3.4 sources. That's when I had a script port all of the
> ~400 panel on commands in the downstream device tree to a new panel
> driver.
>
> With the latest kernel kernel having a delay showing the console text,
> I observe a brief second where the boot splash is shown along with the
> startup text from Linux. A full refresh is performed and the boot
> splash goes away. I don't see this with the 4.17 kernel; perhaps maybe
> the full refresh occurs quick enough that its not noticeable.
>
> Can you point me to where the interconnect API is in the downstream
> MSM 3.4 sources? https://github.com/AICP/kernel_lge_hammerhead
> It looks like its in drivers/interconnect/ in the upstream sources.
>

Looks like this is the thing:

https://github.com/AICP/kernel_lge_hammerhead/tree/n7.1/arch/arm/mach-msm/msm_bus

(ahh, mach-msm... blast from the past..)

BR,
-R
