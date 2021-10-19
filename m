Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C51E4341B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 00:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhJSW4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 18:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhJSW4f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 18:56:35 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0991FC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 15:54:22 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id o133so1256755pfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 15:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cU3HJbTF7v8oN4m9QpyNLUi7Z2VsnXCEZXyNBnXavMs=;
        b=cuhVndCamK8/716BHL8VV3m6G8gcGkThTiSVQ6WCdR23cmkvS8BAdf5MUWNZ3+xdJh
         SXNvDs9u/lEzXmzt2H4VqFJR13EW1nC9xTyUpNjgvdyajBpGbxaWkVSkwru2zDmzhJL5
         9+BvigGJweB1Imcox7fO16zbnV5IFg9bzbcUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cU3HJbTF7v8oN4m9QpyNLUi7Z2VsnXCEZXyNBnXavMs=;
        b=Egj66kmIWRzZQ6i1XYALcxsz6c4SZSuB1CaYKeYTP6kHesTI4He2m1PT5vrHMgJnG5
         f1hcFbT5vXDl44lVwoQ9w8zCaY35S7IR9jtzchwOhL2AtSgV/i7R/3yvYJZUXV8u+yqY
         9zDbioWlDQ0GtOQcUhpBbZqxoa46cvnaCM3l0rIM5EUFzWefjmvu540DQdCjoDqquu40
         cew69vEMuyChmyyh0fgfHFEXS5UHZcMhVznQGFaN79dNj5kxcwqbT0+dfbBQzTZjE6tS
         WoG4mtfn44PW8UJPWsRKmW4nGNL6H+AdfHuhDLZgotFOwd6UW3CK6Sd25t24JKDjUHy7
         ImEA==
X-Gm-Message-State: AOAM532w3UiO9ikhRBMk1brgPbMl+m1Q3L7GDImbe5jEugQGCOudaV2u
        mjHysgxGfzO/0nYv8I4UNuOr/Q==
X-Google-Smtp-Source: ABdhPJwhFFyHmKUMVfxbdbUIRSGmuKpqlVMRtb5XW/S/r0SYWKyVbrnMtwygjRKH7m1CQn1PDJPYsw==
X-Received: by 2002:a62:5804:0:b0:44b:b75b:ec8f with SMTP id m4-20020a625804000000b0044bb75bec8fmr2499812pfb.63.1634684061497;
        Tue, 19 Oct 2021 15:54:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6c1f:a561:f56:7d16])
        by smtp.gmail.com with UTF8SMTPSA id q6sm245804pgc.1.2021.10.19.15.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 15:54:21 -0700 (PDT)
Date:   Tue, 19 Oct 2021 15:54:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        open list <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Andy Gross <agross@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nishanth Menon <nm@ti.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v15 0/6] usb: misc: Add onboard_usb_hub driver
Message-ID: <YW9MmoSTouEDdpxa@google.com>
References: <20210727004118.2583774-1-mka@chromium.org>
 <CAA8EJpq55e+fk9oDi8+JXDWiPcXDXK5oz1DL5eqfx+FkT-xhnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpq55e+fk9oDi8+JXDWiPcXDXK5oz1DL5eqfx+FkT-xhnw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Tue, Oct 19, 2021 at 07:24:41PM +0300, Dmitry Baryshkov wrote:
> On Tue, 27 Jul 2021 at 03:41, Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > This series adds:
> > - the onboard_usb_hub_driver
> > - glue in the xhci-plat driver to create and destroy the
> >   onboard_usb_hub platform devices if needed
> > - a device tree binding for the Realtek RTS5411 USB hub controller
> > - device tree changes that add RTS5411 entries for the QCA SC7180
> >   based boards trogdor and lazor
> > - a couple of stubs for platform device functions to avoid
> >   unresolved symbols with certain kernel configs
> >
> > The main issue the driver addresses is that a USB hub needs to be
> > powered before it can be discovered. For discrete onboard hubs (an
> > example for such a hub is the Realtek RTS5411) this is often solved
> > by supplying the hub with an 'always-on' regulator, which is kind
> > of a hack. Some onboard hubs may require further initialization
> > steps, like changing the state of a GPIO or enabling a clock, which
> > requires even more hacks. This driver creates a platform device
> > representing the hub which performs the necessary initialization.
> > Currently it only supports switching on a single regulator, support
> > for multiple regulators or other actions can be added as needed.
> > Different initialization sequences can be supported based on the
> > compatible string.
> 
> I have the feeling that you might want to check if you can use pwrseq
> subsystem being proposed at
> https://lore.kernel.org/linux-arm-msm/20211006035407.1147909-1-dmitry.baryshkov@linaro.org/.
> It has been created for exactly the same reason of handling complex
> power up/down requirements in a bus-neutral way. So instead of
> creating an onboard-usb-hub, you might want to populate the hub node
> with the reference to pwrseq device and make usb core call into
> pwrseq. How does that sound to you?

Thanks for the pointer, it's good to see another attempt to sort out
power sequencing.

The pwrseq framework could potentially be used by the onboard_usb_hub
driver, but it probably can't replace it completely. Besides powering
the USB hub on before enumeration the driver also can optionally power
it off during system suspend when no wakeup capable USB devices are
connected, which can result in signifcant power savings on battery
powered devices. For this the driver needs knowledge about the USB
(hub) devices that are provided by a hub chip. That part is probably
best implemented by a driver under drivers/usb/.

It might be an option to have the USB core and the onboard_usb_hub
driver use the pwrseq framework, though we'd have to ensure that it
isn't a problem that the USB core turns power on (before
enumeration) and the onboard_usb_hub driver turns it off during
system suspend (and on again on resume).
