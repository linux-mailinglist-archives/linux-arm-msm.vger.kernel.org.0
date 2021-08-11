Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC233E9200
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 14:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhHKM4s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 08:56:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:51224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229737AbhHKM4r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 08:56:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC4A8600CD;
        Wed, 11 Aug 2021 12:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628686583;
        bh=/GWIy8bZjikjFh61+p2oRyqLKNbiIBVj4RvDyz8yXSM=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=MP755uTb6T3Odb+IQnnvTomyWmFH0USI4nWHdud3kKIHDNJs5EMb1p6Xd+SbrAL9b
         peTVhCxrA9ajKrietkrtoNwaikyxiLznnarlLMEjP5+A/u2yfn3iUAPC8E9iFhiHfA
         ijlzeBAD+e8aqpAsxtmitJDnRHKd5sFhoPBPl2JmeDttXFhx5L3RfEn9BHsvT0h77d
         /E3iF3IBzVIPZbNEHZM+CozLxx7wb5m8IO8dg3sWM8sWWAxx7LqMYpr3T/WjEJx80i
         EoZf0xFRO89g8vzlH3LXP2KGHotzL8xZrMbsHUnrU8NjnlTE05QD2Fub5bm7QGzx9W
         QrfJiT5X6gr5A==
Subject: Re: [PATCH v15 0/6] usb: misc: Add onboard_usb_hub driver
From:   Roger Quadros <rogerq@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nishanth Menon <nm@ti.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20210727004118.2583774-1-mka@chromium.org>
 <YRFOnhJkB2vi/zwD@google.com>
 <8a8cae28-6617-76d3-1742-3f151a149069@kernel.org>
Message-ID: <ddd60682-c957-2897-768e-96c9d25c148a@kernel.org>
Date:   Wed, 11 Aug 2021 15:56:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8a8cae28-6617-76d3-1742-3f151a149069@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/08/2021 15:38, Roger Quadros wrote:
> Hi Matthias,
> 
> On 09/08/2021 18:49, Matthias Kaehlcke wrote:
>> Hi Greg,
>>
>> Just wanted to check if this series is still on your radar. Is
>> there anything that blocks it from landing (further ACKs, ...)?
>>
>> Thanks
>>
>> Matthias
>>
>> On Mon, Jul 26, 2021 at 05:41:12PM -0700, Matthias Kaehlcke wrote:
>>> This series adds:
>>> - the onboard_usb_hub_driver
>>> - glue in the xhci-plat driver to create and destroy the
>>>   onboard_usb_hub platform devices if needed
>>> - a device tree binding for the Realtek RTS5411 USB hub controller
>>> - device tree changes that add RTS5411 entries for the QCA SC7180
>>>   based boards trogdor and lazor
>>> - a couple of stubs for platform device functions to avoid
>>>   unresolved symbols with certain kernel configs
>>>
>>> The main issue the driver addresses is that a USB hub needs to be
>>> powered before it can be discovered. For discrete onboard hubs (an
>>> example for such a hub is the Realtek RTS5411) this is often solved
>>> by supplying the hub with an 'always-on' regulator, which is kind
>>> of a hack. Some onboard hubs may require further initialization
>>> steps, like changing the state of a GPIO or enabling a clock, which
>>> requires even more hacks. This driver creates a platform device
>>> representing the hub which performs the necessary initialization.
>>> Currently it only supports switching on a single regulator, support
>>> for multiple regulators or other actions can be added as needed.
>>> Different initialization sequences can be supported based on the
>>> compatible string.
>>>
>>> Besides performing the initialization the driver can be configured
>>> to power the hub off during system suspend. This can help to extend
>>> battery life on battery powered devices which have no requirements
>>> to keep the hub powered during suspend. The driver can also be
>>> configured to leave the hub powered when a wakeup capable USB device
>>> is connected when suspending, and power it off otherwise.
>>>
>>> Changes in v15:
>>> - adjusted dependencies of USB_DWC3_CORE to make sure it can only
>>>   be enabled when at least one of USB_DWC3_HOST, USB_DWC3_GADGET
>>>   or USB_DWC3_DUAL_ROLE is selectable
>>>
>>> Changes in v14:
>>> - rebased on top of v5.14-rc1
>>> - dropped DT binding patch which landed in v5.13
>>>
>>> Changes in v13:
>>> - added patch "usb: Specify dependency on USB_XHCI_PLATFORM with
>>>   'depends on'" to the series to avoid Kconfig conflicts
>>> - added patch "arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM"
>>>   to the series to keep effective defconfig unchanged
>>>
>>> Changes in v12:
>>> - onboard_hub driver: use IS_ENABLED(CONFIG_USB_ONBOARD_HUB_MODULE)
>>>   in onboard_hub.h to also check for the driver built as module
>>> - onboard_hub_driver: include onboard_hub.h again to make sure there
>>>   are prototype declarations for the public functions
>>>
>>> Changes in v11:
>>> - support multiple onboard hubs connected to the same parent
>>> - don't include ‘onboard_hub.h’ from the onboard hub driver
>>>
>>> Changes in v10:
>>> - always use of_is_onboard_usb_hub() stub unless ONBOARD_USB_HUB=y/m
>>> - keep 'regulator-boot-on' property for pp3300_hub
>>>
>>> Changes in v9:
>>> - added dependency on ONBOARD_USB_HUB (or !!ONBOARD_USB_HUB) to
>>>   USB_PLATFORM_XHCI
>>>
>>> Changes in v7:
>>> - updated DT binding
>>> - series rebased on qcom/arm64-for-5.13
>>>
>>> Changes in v6:
>>> - updated summary
>>>
>>> Changes in v5:
>>> - cover letter added
>>>
>>> Matthias Kaehlcke (6):
>>>   usb: misc: Add onboard_usb_hub driver
>>>   of/platform: Add stubs for of_platform_device_create/destroy()
>>>   arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM
>>>   usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
>>>   usb: host: xhci-plat: Create platform device for onboard hubs in
>>>     probe()
>>>   arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
>>>
>>>  .../sysfs-bus-platform-onboard-usb-hub        |   8 +
>>>  MAINTAINERS                                   |   7 +
>>>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
>>>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  12 +-
>>>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  19 +-
>>>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  19 +-
>>>  arch/arm64/configs/defconfig                  |   1 +
>>>  drivers/usb/cdns3/Kconfig                     |   2 +-
>>>  drivers/usb/dwc3/Kconfig                      |   5 +-
>>>  drivers/usb/host/Kconfig                      |   5 +-
> 
> These Kconfig changes are causing the resulting .config to be different.
> For example, if I start with omap2plus_defconfig, the resulting .config
> before and after your series is different as shown below
> 
> :/work/linux$ diff /tmp/.config .config
> 1902d1901
> < # CONFIG_HISI_HIKEY_USB is not set
> 4992c4991
> < CONFIG_USB_XHCI_PLATFORM=m
> ---
>> # CONFIG_USB_XHCI_PLATFORM is not set
> 5073,5075c5072
> < # CONFIG_USB_DWC3_HOST is not set
> < # CONFIG_USB_DWC3_GADGET is not set
> < CONFIG_USB_DWC3_DUAL_ROLE=y
> ---
>> CONFIG_USB_DWC3_GADGET=y
> 5173a5171
>> # CONFIG_USB_ONBOARD_HUB is not set
> 5285c5283
> < CONFIG_USB_ROLE_SWITCH=m
> ---
>> # CONFIG_USB_ROLE_SWITCH is not set
> 
> I would expect the same issues for multi_v7_defconfig and multi_v8_defconfig as well.

Sorry I meant defconfig for arm64, not multi_v8_defconfig.

I checked that for arm64 defconfig it is ok.

> I'm ok to update the relevant defconfigs files so that the resulting .config is identical to
> before your series. Thanks!

With the below patch you can fix it for omap2plus_defconfig and multi_v7_defconfig.

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d9abaae118dd..8c175ab37377 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -787,6 +787,7 @@ CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_XHCI_MVEBU=y
 CONFIG_USB_XHCI_TEGRA=m
 CONFIG_USB_EHCI_HCD=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 2ac2418084ab..a015fb04fa25 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -562,6 +562,7 @@ CONFIG_USB=m
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_MON=m
 CONFIG_USB_XHCI_HCD=m
+CONFIG_USB_XHCI_PLATFORM=m
 CONFIG_USB_EHCI_HCD=m
 CONFIG_USB_OHCI_HCD=m
 CONFIG_USB_ACM=m

--
cheers,
-roger
