Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F07A23BCA5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 16:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgHDOtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 10:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728478AbgHDOtC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 10:49:02 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D025C06174A;
        Tue,  4 Aug 2020 07:49:01 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id c10so367736edk.6;
        Tue, 04 Aug 2020 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g4HmwOYH2FipfU55YwXNgn+/KWI9nU6qQar00eEKnTI=;
        b=jARuo43f4imeZbHxuoML4wNyRPTOwuEdSxdGaGmmEjiQMf0k+ARZ+35S8UliQueShq
         eP0wC8Ag/bCp+Zrr1kaAC9ZuZGyh2J/cqvk1OBx0WpDyelZgZdAiRCd0WFo8tZmYqo0Y
         7PiuhEGNILTeXGo46kKTLVePah8v3wCgRDJum0EXMPbocMpUleVTqO0Y272GXbjUyPH5
         lYGAdiePK9a28RHry1cVndmlMfgRO4RvoJjBqJJDQK0K4ygPlXwB8/yGPyFFCbWItV6u
         UQ9oavX098EpyXsAOA9V3NiotNgRWXOY0NuVucJnh4q/wfX2aBpvyy4qCt4UMFYOlEUY
         KpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4HmwOYH2FipfU55YwXNgn+/KWI9nU6qQar00eEKnTI=;
        b=uR4s7fc9k2GygDjZrzGQfdgslSJPqYUsMsgudBI6P6JrHsSCjsqa3ghYclKZsbviIs
         maHrjwbUOu+MX6+bfmZxTyCKwnUKgYrV5Q0HQUfHXm67e7VVaV9TswcPioa5SnVLzJmI
         +Mha3XjMjfIeOcTXUs1du3EV0h10LJjy2wej36TiqFAf4wpG0ICs0ofpCE98ootnAyce
         ZQQHB05KaLvAXixjn4RmJt2PQ2Pi7zZ7jgYv5WcjMKM0xDYkgJBNu+duwgWIDEHGuunH
         ViEfzHSZGoPE5yOduI3fOC9g9n0q4Mixzn2/fwMG0zEx/KD3LSfW1gplJfxBsGmhQDdt
         d9hw==
X-Gm-Message-State: AOAM530/c0gq4NONL6YrIlnQtKdGFPv+LIHPB0KgPRrAUsjwlPWOSH8Q
        IEjjoyONn2j0TZCGH2XC+Txd05ALmpuSVHq7BI0=
X-Google-Smtp-Source: ABdhPJzvDZkA05JzMe/6DGwbz7nTKib7xTiBIdtvgBQrjNjFlefh8ZT9iPjGtuAI7EG71+3trm7KlYtgLwGlIRjAHP0=
X-Received: by 2002:aa7:da46:: with SMTP id w6mr17536741eds.7.1596552540239;
 Tue, 04 Aug 2020 07:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com> <20200726111215.22361-5-konradybcio@gmail.com>
 <20200803110016.GL12965@vkoul-mobl> <CAF6AEGtW29BtJPq1xDEtvtkPHFVWEd_QJk5FpJEQPbmofnS64Q@mail.gmail.com>
 <20200804120946.GQ12965@vkoul-mobl>
In-Reply-To: <20200804120946.GQ12965@vkoul-mobl>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 4 Aug 2020 07:49:44 -0700
Message-ID: <CAF6AEGttPJSy+PcspPgxj2OELEyh2Xj-Gm2Uiv7Pcv6JMDE-tg@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/msm/dsi: Add phy configuration for SDM630/636/660
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        martin.botka1@gmail.com, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 4, 2020 at 5:09 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 03-08-20, 09:06, Rob Clark wrote:
> > On Mon, Aug 3, 2020 at 4:00 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > On 26-07-20, 13:12, Konrad Dybcio wrote:
> > > > These SoCs make use of the 14nm phy, but at different
> > > > addresses than other 14nm units.
> > > >
> > > > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> > > > ---
> > > >  .../devicetree/bindings/display/msm/dsi.txt    |  1 +
> > > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
> > > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
> > > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 18 ++++++++++++++++++
> > >
> > > Is there a reason why dsi phy needs to be here and not in phy subsystem
> > > drivers/phy/ ?
> >
> > *maybe* it would be possible to split out all of the dsi (and hdmi)
> > phy to drivers/phy.  But splitting out just the new ones wouldn't be
> > practical (it would duplicate a lot of code, and make the rest of the
> > dsi code have to deal with both cases).  And unlike dp/usb-c I'm not
> > really sure I see an advantage to justify the churn.
>
> So the question would be if it helps in reuse if we do that and does it
> result in a better solution than dsi code managing the phy. The
> advantage of framework (like phy) is that different subsystems can use
> a (phy) driver and common framework helps reduce duplicates.

I'm not aware of any re-use that would be possible by splitting it
out.. if there were, it would be a more compelling argument.

It does increase the complexity and possibilities for getting kernel
config wrong.  There are devices like the aarch64 laptops which do not
have a debug serial port, where debugging issues like that can be a
pain when you get no display.  OTOH that might be balanced out a bit
by using a common framework/api that others are familiar with.

Overall, nowhere near high enough on my priority list to spend time
on.. there are bigger fires.  If someone was really motivated about
this and wanted to send (tested) patches, then I'd take a look and see
how it turned out.

BR,
-R

> Yes sure the question was not for a new phy but about the whole
> msm/dsi/phy code and future for it.
>
> --
> ~Vinod
