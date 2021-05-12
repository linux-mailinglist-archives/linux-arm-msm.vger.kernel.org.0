Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE2437D11D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 May 2021 19:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348192AbhELRsK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 13:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245510AbhELQwv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 12:52:51 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F54C061261
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 09:37:14 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 10so19068573pfl.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ikw1DMHOUmP/SzfSES6R5kSb98F6N2mCjodmrWpWN6g=;
        b=KkirfHVZjMS1zmEGPy+VBdrsNAY3rYK47T7nfXjC/YUQmC+25+MTJ2logrgzW2xmh3
         SyuoF/bjsuo3xvgfrwUuh+X/x26hJjWPNvn2AroKt5qEAHT+6d+2ASwA0HqZYOGDZGbS
         xF+TK4/mW6qpoIPthsAjzv7yWTzaKVjzIyKU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ikw1DMHOUmP/SzfSES6R5kSb98F6N2mCjodmrWpWN6g=;
        b=rRSDRajfAv5dkqZDQFQiyg4iHVaNSNxl++m7HmHGcMVubxBdGBEBqYpXay5DBeLq8Z
         2ZS+BKB7Z9Ahxc3iPhLmo9BMrvqTcawg6dk/qxg02Id3UiuIthjtZOumtxFns20V8sd0
         2WzkJMwJT+8o+4NXB/G1bzshO7y2asKTlHHTQowMornWgB0OuwZzT5YdOLgRPpWRh/ZJ
         gUlX0zYvzAxspyZEmAVZZ4fd2fX5wUV7+6NjywhX5861oRgMIrS9s/zBi2nMo+ozFRWO
         yDklQ5gUk63vYZcUBpLR2LNd3CixDnrynMxH32lIyx2OWPkUANzUgcx/+I0ZOTi+cisQ
         IRnQ==
X-Gm-Message-State: AOAM530WflpcOA08VISYup6lJJN3AEBvfBjBf8NhwdP0VDlfwKxpkDFj
        aBZ+AYrxjH+lKymG6be7RT3OAg==
X-Google-Smtp-Source: ABdhPJxuT0+Mg/Bi0bMwJjnB+ZHQoIjaWs7TkrW6+woTv3Rv+Ea+lhcjKrnW/Na/ptsbEe9SkHZ+GA==
X-Received: by 2002:a62:84d2:0:b029:27c:bbd5:6c0d with SMTP id k201-20020a6284d20000b029027cbbd56c0dmr35865705pfd.32.1620837433857;
        Wed, 12 May 2021 09:37:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:a89e:5bb2:e8e0:4428])
        by smtp.gmail.com with UTF8SMTPSA id e3sm243298pjd.18.2021.05.12.09.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 09:37:13 -0700 (PDT)
Date:   Wed, 12 May 2021 09:37:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v10 0/5] USB: misc: Add onboard_usb_hub driver
Message-ID: <YJwENo/DmcyMR8bw@google.com>
References: <20210511225223.550762-1-mka@chromium.org>
 <YJuBmlPSaJlyVuzW@ada-deb-carambola.ifak-system.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YJuBmlPSaJlyVuzW@ada-deb-carambola.ifak-system.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Alexander,

On Wed, May 12, 2021 at 09:19:54AM +0200, Alexander Dahl wrote:
> Hello Matthias,
> 
> just a curious informal question, see below.
> 
> Am Tue, May 11, 2021 at 03:52:18PM -0700 schrieb Matthias Kaehlcke:
> > This series adds:
> > - the onboard_usb_hub_driver
> > - glue in the xhci-plat driver to create the onboard_usb_hub
> >   platform device if needed
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
> This sounds like it would be useful for other hub controllers as well?
> For example, would the Microchip USB3503 (former SMSC,
> drivers/usb/misc/usb3503.c, [1]) fall into this category? That chip is
> used on the "Cubietech Cubietruck Plus" for example.

usb3503.c provides two 'separate' USB3503 drivers (which share some
code), a i2c client driver and a platform driver. IIUC on a system with
an USB3503 only one of these drivers is used. Theoretically it should be
feasible to extend the onboard_usb_hub driver to cover the functionality
of the platform driver in usb3503.c (essentially to control GPIOs and
clocks at initialization time and suspend/resume). Another question is
whether that would be desirable, since the i2c and the platform driver
share code, which then would be duplicated in the i2c and onboard_usb_hub
driver, unless a way is found to keep sharing that code.

The i2c driver can't be completely replaced by the onboard_usb_hub
driver, due to the i2c communications. It might be possible to have the
i2c driver and the onboard_usb_hub collaborate, however I expect it
would take a certain effort to design and implement a solid solution.

Thanks

Matthias
