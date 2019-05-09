Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 167E318C86
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 16:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfEIO66 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 10:58:58 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34304 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfEIO66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 10:58:58 -0400
Received: by mail-pf1-f196.google.com with SMTP id n19so1474399pfa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2019 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O2GVNaaLG3l4A7SJYHvhzrnNiIlglRkSlpfGLRzuylM=;
        b=owM2FhNdQD3/AZ1QZczHAcumqaO62cKOzbcn0wo0srjYi0aJmUbBO5bCn3V5VdxSW0
         74bIGkNFPqUHT5SLQKJGibcflH3UxMzbGuy/ZLbtw3AWBpjuTmllygACfswKRryWDjEE
         7FcJwiuwkwdH1xJVyPDY4c7MOjCMsvjM4VqFrUofJd5m4BugNQLB0TGzkcZTS0NxFG5W
         gUx85r8q9Gaagdgm41Zl2bDJt0YcjeOL130nHdSgAww8zP5BX5jpgAA4uU9e3Gm3G3zz
         eozMavbAcKt3BHMsIdWIzk9olc+36VygZOIVr2T4PcDWEbeEIGlQGCM9CfctVEo1LPIp
         Y8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O2GVNaaLG3l4A7SJYHvhzrnNiIlglRkSlpfGLRzuylM=;
        b=EltbkxG8g0KIbMtApiut4jUsUKdPv/8psbzax5R+/WiMbkmNoCEERNFrlRH+xcqq/r
         ciwMwOcCnOUn9I3eWks4jqrRuNByIz/3CR8s6NvMMmzfevYaDlKtS5k2Nojlo8SJEoXl
         +H+wBt4MJ6WXMd/Kwz5+78pDh0yEGADX58UVQhZzfK0il0l4GwfNlzSA5wlSL4wYCFs8
         38Nhsy+gGFhynop8Cz49YDyklsw7tGi+/FcgrWD12/L9b7h7x6Lb4yKwm4yAFnzuh5GK
         GiMss8yttyGK0ShD6dxjN7vB4je8f4FfXZK+RzZUti5uLmc8lgHxE+7IWF1Mxkf/Zbm8
         wyng==
X-Gm-Message-State: APjAAAXZ1fgI7r04VC3B9+j82uQIVEVtPY4FrfkZqPYpWhsKwNKcGYvK
        jcGraNNHivXWU8HEsv1sqVIzQw==
X-Google-Smtp-Source: APXvYqzB08jbRTCZn/COGHwU59Jhcv8+bRZwlqaOwdUaHe25RZJvtDJY+ALgBmzW3A/k0UdMggom9w==
X-Received: by 2002:a62:1b8a:: with SMTP id b132mr5780183pfb.19.1557413936856;
        Thu, 09 May 2019 07:58:56 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g10sm6438908pfg.153.2019.05.09.07.58.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 07:58:55 -0700 (PDT)
Date:   Thu, 9 May 2019 07:59:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
Message-ID: <20190509145912.GG2085@tuxbook-pro>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro>
 <20190509021616.GA26228@basecamp>
 <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
 <20190509030047.GE2085@tuxbook-pro>
 <20190509071243.GA27143@basecamp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509071243.GA27143@basecamp>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 May 00:12 PDT 2019, Brian Masney wrote:

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

The data will be 8974 specific, but the plumbing should be reusable from
8916 or 404. Hopefully we can get those landed shortly.

You can find the latest incarnation here:
https://lore.kernel.org/lkml/20190415104357.5305-1-georgi.djakov@linaro.org/

Regards,
Bjorn
