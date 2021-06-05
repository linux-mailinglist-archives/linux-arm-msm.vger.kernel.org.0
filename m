Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108F339C670
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jun 2021 09:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFEHDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 03:03:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:41774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229755AbhFEHDo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 03:03:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78742611C2;
        Sat,  5 Jun 2021 07:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622876516;
        bh=dEiBulyfS+hMHcmHZ8xaKJ4n7scp65NNdvgcbC5kTlc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H+xS41ydzSMKlnd1KB2h+FGrtR2lzufDp611S21ieZB6DYdfn7JeG63DwNdRTmJYi
         U0MGBzeYjxRCahICKTC5C1X2ZWev1X2+h1+vuZr4ZTK/kjbSJVZwhc3ZGWsgiRtdbS
         dXndobf8GEAqyYRJ9AHvDN9UV3voagztELi68mrI=
Date:   Sat, 5 Jun 2021 09:01:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-usb@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v11 0/5] USB: misc: Add onboard_usb_hub driver
Message-ID: <YLshYLa8dh6Fme4P@kroah.com>
References: <20210604214101.3363525-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210604214101.3363525-1-mka@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 04, 2021 at 02:40:56PM -0700, Matthias Kaehlcke wrote:
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
> Changes in v11:
> - support multiple onboard hubs connected to the same parent
> - don't include ‘onboard_hub.h’ from the onboard hub driver

There's still build warnings found by 0-day :(
