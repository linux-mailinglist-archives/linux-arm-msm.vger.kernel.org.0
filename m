Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD284354789
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 22:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240779AbhDEUWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 16:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbhDEUWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 16:22:45 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F9EC061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 13:22:38 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id v8so6221068plz.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B5obkrFLYx+0aH/s+FuNLaF5WWutNw3wmJyEfHXrNTo=;
        b=Dz1R38zeXda0R96wffR/yYYt3zYyxi+Sz2qq0KhUjm9AE+KvCSg+cH1pA2biRTyuNX
         UkxMX5rVM4CugL75QdaNtdTZhBXQ1ksr/Tv7wDP5ZJxA5PjDESnws3lBidDp+tX3CbBB
         DmDw7iYiII9YCgWTVo62HHorE//xEfyCU94ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B5obkrFLYx+0aH/s+FuNLaF5WWutNw3wmJyEfHXrNTo=;
        b=YX0Ykjv6ssYGOQ7+aaU7JE0N+9fRcXQAXVUBRd4B+S/H5OuXhKdn5JPLXbkYJz5arA
         IgvZ4+TtzqqmbvDYxeXWeqsKrsTMok+ckFlXlw5IRFAnkNZAS7A1z8UZwGLCqxBooDzl
         dDw9N8j3RQccb6xjP9hiNENrXKS5cfJeU2HRh6t1cgtx52YdrrvrlRsbpJQbGvNTwkf/
         wkdUwoELa7xKPPNVQaK7kOJ+mEQIvv3ASNRHes6OHLvT7adhR9vR1cc+YGMLyqcToMia
         uuW0xetiiMbj83rC/Ff2kdgXnStQMU2hNO+eVvSm0pZNJA0hqdMmd7y8KvRyB+j33S1F
         kWbA==
X-Gm-Message-State: AOAM530SzBZsRU+bsKnfpau7P+2fIZQ8T67mT6m1WfFmROgR1cQE/FgQ
        PHZHy1ISr51xXOXins9/OkuQ7w==
X-Google-Smtp-Source: ABdhPJzD3O4u2IkgUVX+KFcIcxgtRAUkqgLdyvujnFjbwIZdqfKnqvLrHlf7sI0xq5neSLulveWAxA==
X-Received: by 2002:a17:90b:3cd:: with SMTP id go13mr866569pjb.148.1617654157581;
        Mon, 05 Apr 2021 13:22:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:455e:b8cf:5939:67da])
        by smtp.gmail.com with UTF8SMTPSA id e14sm9371544pga.14.2021.04.05.13.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 13:22:37 -0700 (PDT)
Date:   Mon, 5 Apr 2021 13:22:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Peter Chen <peter.chen@nxp.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 0/5] USB: misc: Add onboard_usb_hub driver
Message-ID: <YGtxjBMe3YCnCYK4@google.com>
References: <20210405201817.3977893-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210405201817.3977893-1-mka@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Subject: [PATCH v6 0/5] USB: misc: Add onboard_usb_hub driver

Argh, that should have been v7 :/ Not sure if it's worth/required to
resend.

On Mon, Apr 05, 2021 at 01:18:12PM -0700, Matthias Kaehlcke wrote:
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
> 
> Besides performing the initialization the driver can be configured
> to power the hub off during system suspend. This can help to extend
> battery life on battery powered devices which have no requirements
> to keep the hub powered during suspend. The driver can also be
> configured to leave the hub powered when a wakeup capable USB device
> is connected when suspending, and power it off otherwise.
> 
> Changes in v7:
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
>  .../bindings/usb/realtek,rts5411.yaml         |  59 +++
>  MAINTAINERS                                   |   7 +
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  11 +-
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  19 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  21 +-
>  drivers/usb/host/xhci-plat.c                  |  16 +
>  drivers/usb/misc/Kconfig                      |  17 +
>  drivers/usb/misc/Makefile                     |   1 +
>  drivers/usb/misc/onboard_usb_hub.c            | 415 ++++++++++++++++++
>  include/linux/of_platform.h                   |  22 +-
>  include/linux/usb/hcd.h                       |   2 +
>  include/linux/usb/onboard_hub.h               |  15 +
>  14 files changed, 596 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
>  create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
>  create mode 100644 drivers/usb/misc/onboard_usb_hub.c
>  create mode 100644 include/linux/usb/onboard_hub.h
> 
> -- 
> 2.31.0.208.g409f899ff0-goog
> 
