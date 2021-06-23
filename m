Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AF13B2061
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 20:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhFWSns (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 14:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWSnr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 14:43:47 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EC9C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 11:41:29 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id e22so2505323pgv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 11:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CmSxjVifvEvCqk0+9pO7z5s7Ge6oi3hKkOZK5hFSWaY=;
        b=LluFmH6faSDsy5zNPOC5XgyCUGC49cppIjUOhBK4h233TCJkZWz8/u5xK1rXIwOYCo
         yVLlUiH5GK0vEd/wmbZNVQMgsmh2HhDr8g9afDiLFHfbW9tVgc12KVqsowWpu7GKLodA
         bWvCkzmbQyGs8TGr/1M28YzaLi4LdwQFGH24A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CmSxjVifvEvCqk0+9pO7z5s7Ge6oi3hKkOZK5hFSWaY=;
        b=PPntHYGr3G5sJDAR8kfZOcOzuKi6xIGSJMftLO1gkNQVAaeD7FiZd9XQKy28K4VO7E
         9bYpJRNOAnX0TGu9k76u9avD/GPM+Yzcjb4vpKh8xFnvyldf4OWstPYNp1a0pP0bXrsK
         mfhn8odDlbvVcBzhneP3XkQPCxf4gXqOlE7HJlNnvG4GB4JwSb83esicSG8o6hkIRR3+
         XPJj0n2p3rNqJpRnlBagwvlNgCSsmdrDPvnRs4z6wHFp3kV+4qHAhIU9LAjjLWtfsRpB
         EG27Oj6IHpjVYlUope+9SGe/Qx88DRdkQ9PrKEVAMCNJnIOSVArdwdk7Ua6RmffDUiUw
         4u/Q==
X-Gm-Message-State: AOAM532pvH84EDgcHchqkLlXnSd8fYdcJRXJItjLEyTKy2yDplX31url
        kpUKqy24cnMc9//ivvpuK49MAw==
X-Google-Smtp-Source: ABdhPJwoZ9MJ9mzv9yFsoY9HMcrNs70l8450M7S+Sm3N1iyk6cCgVPMpRYCShxwgBwdfEoJcwVikWQ==
X-Received: by 2002:a63:31cc:: with SMTP id x195mr792039pgx.99.1624473689165;
        Wed, 23 Jun 2021 11:41:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d440:232:5e25:41f4])
        by smtp.gmail.com with UTF8SMTPSA id v13sm978597pja.44.2021.06.23.11.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 11:41:28 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v13 0/7] usb: misc: Add onboard_usb_hub driver
Date:   Wed, 23 Jun 2021 11:41:16 -0700
Message-Id: <20210623184124.3504047-1-mka@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds:
- the onboard_usb_hub_driver
- glue in the xhci-plat driver to create and destroy the
  onboard_usb_hub platform devices if needed
- a device tree binding for the Realtek RTS5411 USB hub controller
- device tree changes that add RTS5411 entries for the QCA SC7180
  based boards trogdor and lazor
- a couple of stubs for platform device functions to avoid
  unresolved symbols with certain kernel configs

The main issue the driver addresses is that a USB hub needs to be
powered before it can be discovered. For discrete onboard hubs (an
example for such a hub is the Realtek RTS5411) this is often solved
by supplying the hub with an 'always-on' regulator, which is kind
of a hack. Some onboard hubs may require further initialization
steps, like changing the state of a GPIO or enabling a clock, which
requires even more hacks. This driver creates a platform device
representing the hub which performs the necessary initialization.
Currently it only supports switching on a single regulator, support
for multiple regulators or other actions can be added as needed.
Different initialization sequences can be supported based on the
compatible string.

Besides performing the initialization the driver can be configured
to power the hub off during system suspend. This can help to extend
battery life on battery powered devices which have no requirements
to keep the hub powered during suspend. The driver can also be
configured to leave the hub powered when a wakeup capable USB device
is connected when suspending, and power it off otherwise.

Changes in v13:
- added patch "usb: Specify dependency on USB_XHCI_PLATFORM with
  'depends on'" to the series to avoid Kconfig conflicts
- added patch "arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM"
  to the series to keep effective defconfig unchanged

Changes in v12:
- onboard_hub driver: use IS_ENABLED(CONFIG_USB_ONBOARD_HUB_MODULE)
  in onboard_hub.h to also check for the driver built as module
- onboard_hub_driver: include onboard_hub.h again to make sure there
  are prototype declarations for the public functions

Changes in v11:
- support multiple onboard hubs connected to the same parent
- don't include ‘onboard_hub.h’ from the onboard hub driver

Changes in v10:
- always use of_is_onboard_usb_hub() stub unless ONBOARD_USB_HUB=y/m
- keep 'regulator-boot-on' property for pp3300_hub

Changes in v9:
- added dependency on ONBOARD_USB_HUB (or !!ONBOARD_USB_HUB) to
  USB_PLATFORM_XHCI

Changes in v7:
- updated DT binding
- series rebased on qcom/arm64-for-5.13

Changes in v6:
- updated summary

Changes in v5:
- cover letter added

Matthias Kaehlcke (7):
  dt-bindings: usb: Add binding for Realtek RTS5411 hub controller
  usb: misc: Add onboard_usb_hub driver
  of/platform: Add stubs for of_platform_device_create/destroy()
  arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM
  usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
  usb: host: xhci-plat: Create platform device for onboard hubs in
    probe()
  arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub

 .../sysfs-bus-platform-onboard-usb-hub        |   8 +
 .../bindings/usb/realtek,rts5411.yaml         |  62 +++
 MAINTAINERS                                   |   7 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  12 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  19 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  19 +-
 arch/arm64/configs/defconfig                  |   1 +
 drivers/usb/cdns3/Kconfig                     |   2 +-
 drivers/usb/dwc3/Kconfig                      |   3 +-
 drivers/usb/host/Kconfig                      |   5 +-
 drivers/usb/host/xhci-plat.c                  |   6 +
 drivers/usb/host/xhci.h                       |   2 +
 drivers/usb/misc/Kconfig                      |  17 +
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/onboard_usb_hub.c            | 497 ++++++++++++++++++
 include/linux/of_platform.h                   |  22 +-
 include/linux/usb/onboard_hub.h               |  18 +
 18 files changed, 682 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
 create mode 100644 drivers/usb/misc/onboard_usb_hub.c
 create mode 100644 include/linux/usb/onboard_hub.h

-- 
2.32.0.288.g62a8d224e6-goog

