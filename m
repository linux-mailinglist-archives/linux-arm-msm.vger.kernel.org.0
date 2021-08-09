Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644403E4933
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 17:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbhHIPuW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 11:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235851AbhHIPuP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 11:50:15 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD4FC0617B0
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 08:49:54 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so553794pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iypo2g0ksb3hPluHjo2K3HuanpxIhf/GrkPA0tdbfM4=;
        b=A/ObNU1jSuENPCBvXTFJQ0CAkMveWR7KjK0AqFrKxEkqDaQnvONeuIIl/kYK7m2Gyd
         5DTnTjL2lqgzBnFT5RQkzx9NKgaLXbTBeez9RE+JwI4clf6czQvVVkQNERZH2mMFhl9G
         pCu4p5LHWCUrATnTqb72m5WhE3hwVzPaALCkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iypo2g0ksb3hPluHjo2K3HuanpxIhf/GrkPA0tdbfM4=;
        b=lP1dSt68YhwW60c3WcBWih3Jgdi0DSKLQQtmWRWSM79FxJhz9Td9obkMr/huDjEjvL
         Vk744d9PXKa0cO5jlisXYXmU/fZ0h4sUuJs6N5th1AYayPq+aWiJy2lhb4jt/NTWaZ0A
         x2X8hHC3UExOAbthNX+trvYwo+bUqEREkkv9ImCTyaNnxdpzTFT/5iE7O4gYKf8rS4Qk
         o/lGOO64O0MOEzxzlSdqNAnU+Wad5p6ioEeEfwREtIZHj+6Ge6ttgatNBHaUly/CpLem
         Co5rJvXm8OHxBc1hfMn8npSH4FS3r1Pz0/v+BHp9/1Kbtshq/h6Yk57XBh2m15ykub7j
         SeDA==
X-Gm-Message-State: AOAM533VziTmpswjnmXOOhd5WRh9LDPXKkFEhYMaKfzrAFrRyVqD27+N
        NyneC5DBCKv45ZJ4KIawG6BXJg==
X-Google-Smtp-Source: ABdhPJzHGnienAihLc95zBhFzzpY3gXspxszzg17Vbsfm7mbo6WiEiHCqewBRh0uVCyFhqXtvcwHFg==
X-Received: by 2002:a17:90a:6c45:: with SMTP id x63mr36125760pjj.0.1628524194146;
        Mon, 09 Aug 2021 08:49:54 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6914:ad55:5b1:543c])
        by smtp.gmail.com with UTF8SMTPSA id j13sm23205367pgp.29.2021.08.09.08.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 08:49:53 -0700 (PDT)
Date:   Mon, 9 Aug 2021 08:49:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>, devicetree@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org,
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v15 0/6] usb: misc: Add onboard_usb_hub driver
Message-ID: <YRFOnhJkB2vi/zwD@google.com>
References: <20210727004118.2583774-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210727004118.2583774-1-mka@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Just wanted to check if this series is still on your radar. Is
there anything that blocks it from landing (further ACKs, ...)?

Thanks

Matthias

On Mon, Jul 26, 2021 at 05:41:12PM -0700, Matthias Kaehlcke wrote:
> This series adds:
> - the onboard_usb_hub_driver
> - glue in the xhci-plat driver to create and destroy the
>   onboard_usb_hub platform devices if needed
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
> 
> Besides performing the initialization the driver can be configured
> to power the hub off during system suspend. This can help to extend
> battery life on battery powered devices which have no requirements
> to keep the hub powered during suspend. The driver can also be
> configured to leave the hub powered when a wakeup capable USB device
> is connected when suspending, and power it off otherwise.
> 
> Changes in v15:
> - adjusted dependencies of USB_DWC3_CORE to make sure it can only
>   be enabled when at least one of USB_DWC3_HOST, USB_DWC3_GADGET
>   or USB_DWC3_DUAL_ROLE is selectable
> 
> Changes in v14:
> - rebased on top of v5.14-rc1
> - dropped DT binding patch which landed in v5.13
> 
> Changes in v13:
> - added patch "usb: Specify dependency on USB_XHCI_PLATFORM with
>   'depends on'" to the series to avoid Kconfig conflicts
> - added patch "arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM"
>   to the series to keep effective defconfig unchanged
> 
> Changes in v12:
> - onboard_hub driver: use IS_ENABLED(CONFIG_USB_ONBOARD_HUB_MODULE)
>   in onboard_hub.h to also check for the driver built as module
> - onboard_hub_driver: include onboard_hub.h again to make sure there
>   are prototype declarations for the public functions
> 
> Changes in v11:
> - support multiple onboard hubs connected to the same parent
> - don't include ‘onboard_hub.h’ from the onboard hub driver
> 
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
> Matthias Kaehlcke (6):
>   usb: misc: Add onboard_usb_hub driver
>   of/platform: Add stubs for of_platform_device_create/destroy()
>   arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM
>   usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
>   usb: host: xhci-plat: Create platform device for onboard hubs in
>     probe()
>   arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
> 
>  .../sysfs-bus-platform-onboard-usb-hub        |   8 +
>  MAINTAINERS                                   |   7 +
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  12 +-
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  19 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  19 +-
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/usb/cdns3/Kconfig                     |   2 +-
>  drivers/usb/dwc3/Kconfig                      |   5 +-
>  drivers/usb/host/Kconfig                      |   5 +-
>  drivers/usb/host/xhci-plat.c                  |   6 +
>  drivers/usb/host/xhci.h                       |   2 +
>  drivers/usb/misc/Kconfig                      |  17 +
>  drivers/usb/misc/Makefile                     |   1 +
>  drivers/usb/misc/onboard_usb_hub.c            | 497 ++++++++++++++++++
>  include/linux/of_platform.h                   |  22 +-
>  include/linux/usb/onboard_hub.h               |  18 +
>  17 files changed, 621 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
>  create mode 100644 drivers/usb/misc/onboard_usb_hub.c
>  create mode 100644 include/linux/usb/onboard_hub.h
> 
> -- 
> 2.32.0.432.gabb21c7263-goog
> 
