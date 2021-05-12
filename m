Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7DA937B6C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 May 2021 09:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhELHV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 03:21:27 -0400
Received: from mail.thorsis.com ([92.198.35.195]:60660 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230166AbhELHV1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 03:21:27 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 15FABF6A;
        Wed, 12 May 2021 09:20:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AYe52KTAIS14; Wed, 12 May 2021 09:20:17 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id E8D32119D; Wed, 12 May 2021 09:20:16 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: microchip.com]
        * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
        * -0.0 NO_RECEIVED Informational: message has no Received headers
Date:   Wed, 12 May 2021 09:19:54 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Matthias Kaehlcke <mka@chromium.org>
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
Message-ID: <YJuBmlPSaJlyVuzW@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>, linux-usb@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bastien Nocera <hadess@hadess.net>, Al Cooper <alcooperx@gmail.com>,
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
References: <20210511225223.550762-1-mka@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511225223.550762-1-mka@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Matthias,

just a curious informal question, see below.

Am Tue, May 11, 2021 at 03:52:18PM -0700 schrieb Matthias Kaehlcke:
> This series adds:
> - the onboard_usb_hub_driver
> - glue in the xhci-plat driver to create the onboard_usb_hub
>   platform device if needed
> - a device tree binding for the Realtek RTS5411 USB hub controller
> - device tree changes that add RTS5411 entries for the QCA SC7180
>   based boards trogdor and lazor
> - a couple of stubs for platform device functions to avoid
>   unresolved symbols with certain kernel configs
> 
> The main issue the driver addresses is that a USB hub needs to be
> powered before it can be discovered. For discrete onboard hubs (an
> example for such a hub is the Realtek RTS5411) this is often solved
> by supplying the hub with an 'always-on' regulator, which is kind
> of a hack. Some onboard hubs may require further initialization
> steps, like changing the state of a GPIO or enabling a clock, which
> requires even more hacks. This driver creates a platform device
> representing the hub which performs the necessary initialization.
> Currently it only supports switching on a single regulator, support
> for multiple regulators or other actions can be added as needed.
> Different initialization sequences can be supported based on the
> compatible string.

This sounds like it would be useful for other hub controllers as well?
For example, would the Microchip USB3503 (former SMSC,
drivers/usb/misc/usb3503.c, [1]) fall into this category? That chip is
used on the "Cubietech Cubietruck Plus" for example.

> Besides performing the initialization the driver can be configured
> to power the hub off during system suspend. This can help to extend
> battery life on battery powered devices which have no requirements
> to keep the hub powered during suspend. The driver can also be
> configured to leave the hub powered when a wakeup capable USB device
> is connected when suspending, and power it off otherwise.

Sounds interesting.

Greets
Alex

[1] https://www.microchip.com/wwwproducts/en/USB3503

> Changes in v10:
> - always use of_is_onboard_usb_hub() stub unless ONBOARD_USB_HUB=y/m
> - keep 'regulator-boot-on' property for pp3300_hub
> 
> Changes in v9:
> - added dependency on ONBOARD_USB_HUB (or !!ONBOARD_USB_HUB) to
>   USB_PLATFORM_XHCI
> 
> Changes in v7:
> - updated DT binding
> - series rebased on qcom/arm64-for-5.13
> 
> Changes in v6:
> - updated summary
> 
> Changes in v5:
> - cover letter added
> 
> Matthias Kaehlcke (5):
>   dt-bindings: usb: Add binding for Realtek RTS5411 hub controller
>   USB: misc: Add onboard_usb_hub driver
>   of/platform: Add stubs for of_platform_device_create/destroy()
>   usb: host: xhci-plat: Create platform device for onboard hubs in
>     probe()
>   arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
> 
>  .../sysfs-bus-platform-onboard-usb-hub        |   8 +
>  .../bindings/usb/realtek,rts5411.yaml         |  62 +++
>  MAINTAINERS                                   |   7 +
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  11 +-
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  19 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  19 +-
>  drivers/usb/host/Kconfig                      |   1 +
>  drivers/usb/host/xhci-plat.c                  |  16 +
>  drivers/usb/misc/Kconfig                      |  17 +
>  drivers/usb/misc/Makefile                     |   1 +
>  drivers/usb/misc/onboard_usb_hub.c            | 415 ++++++++++++++++++
>  include/linux/of_platform.h                   |  22 +-
>  include/linux/usb/hcd.h                       |   2 +
>  include/linux/usb/onboard_hub.h               |  15 +
>  15 files changed, 600 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
>  create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
>  create mode 100644 drivers/usb/misc/onboard_usb_hub.c
>  create mode 100644 include/linux/usb/onboard_hub.h
> 
> -- 
> 2.31.1.607.g51e8a6a459-goog
> 
