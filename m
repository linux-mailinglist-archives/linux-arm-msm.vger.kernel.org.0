Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8099538C689
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbhEUMcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:32:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:56962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhEUMcG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:32:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8704D613CB;
        Fri, 21 May 2021 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621600242;
        bh=WB+fBlPHBnhxEgANiqKZDpv4r2qZ1G7A7Ilm+g9XvYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NkSYof96n1ni9YaXtJy1dsy3I6eShNepbRidbdb48dgtsc1dJGUnEcgjs+KRX4fyB
         em5zTqTnwwGiyKjylT3F8q3B4qWsxlR51M2OA/o0WIO1q5x/IzqGLsiVmxH5g6u17w
         LQp9FVG7oXJkAh7gQyLgz59BrGhOcu1PsUbb23lU=
Date:   Fri, 21 May 2021 14:30:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
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
Message-ID: <YKen70owPqdjy5+a@kroah.com>
References: <20210511225223.550762-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210511225223.550762-1-mka@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 11, 2021 at 03:52:18PM -0700, Matthias Kaehlcke wrote:
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

I get a build error when I apply this series to my tree:

drivers/usb/misc/onboard_usb_hub.c:273:6: error: redefinition of ‘of_is_onboard_usb_hub’
  273 | bool of_is_onboard_usb_hub(const struct device_node *np)
      |      ^~~~~~~~~~~~~~~~~~~~~
In file included from drivers/usb/misc/onboard_usb_hub.c:21:
./include/linux/usb/onboard_hub.h:9:20: note: previous definition of ‘of_is_onboard_usb_hub’ with type ‘bool(const struct device_node *)’ {aka ‘_Bool(const struct device_node *)’}
    9 | static inline bool of_is_onboard_usb_hub(const struct device_node *np)
      |                    ^~~~~~~~~~~~~~~~~~~~~

Any thoughts?

greg k-h
