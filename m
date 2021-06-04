Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E9839C2AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhFDVmz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhFDVmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:42:55 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B591C061787
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jun 2021 14:41:08 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id 11so5316340plk.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4uLiCqQeie+puVICQ+LNUiCvUzNktMjBDpvrpDAQ+o=;
        b=Y44FhCSnKYKAip1EZZkBY2VVSVXeoQMjf1OtPSeIcTMx6bxzJQ706E9H0/OGNsUGnB
         InP+kS7RBNrTyjBG15MM2J06qlKl2wTgiG4ySAHzYH3cpiRjEY5IjRyRtk15ozs45RDa
         AcI29BcwBWH68WZlKvXpPzOD2fNkiooroA9S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4uLiCqQeie+puVICQ+LNUiCvUzNktMjBDpvrpDAQ+o=;
        b=VWSbzx1kzyZN+zavHVZVlfN8p8D5FOww7xEmHxmHOM7HfxmnbVsYziSIrjYAAkLWo6
         558wdaAnwhHUnQmau1Nf+FYiOXmotBEcNj7IBg7hWv8EJQZSzp2EW9wNvgrh40EmOKn8
         C8YNd+s6ee1g6SYiPvcmPKZm29ThpwlP+IN62SsNKICeh+UAdvbFI0t3q1wvKe/C/qLT
         xQ6vSU1IfOuVVPsVkQ0fab19u6aTiSUrfjO/EJVJU17TSapwGmpUZuZzCG8otOvm+sO7
         oOyyLeol+MNs34ZLAkDTH0Vx7xhuBIwWDkQVPru2EwUuIPc6a1ynjGmfbwdkgBzPvEeQ
         XW0Q==
X-Gm-Message-State: AOAM531rpMSKiAZFvJqmV5Vo/rbr9noXk1tRSbojKdZuguolW6bMuX3Z
        eRh5P5/gMNr1f+Jkr1yPBuEjKQ==
X-Google-Smtp-Source: ABdhPJyOXK/ctlvPnx2UNmkOsnU8AXIZFI8KhFytx8kW3nE7dvU2dbxBBlp62wFbJe81CHKNOnh8hw==
X-Received: by 2002:a17:90a:a502:: with SMTP id a2mr18898468pjq.62.1622842867783;
        Fri, 04 Jun 2021 14:41:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:1cfa:4a0b:c513:8c09])
        by smtp.gmail.com with UTF8SMTPSA id o7sm2957444pgs.45.2021.06.04.14.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:41:07 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-usb@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v11 0/5] USB: misc: Add onboard_usb_hub driver
Date:   Fri,  4 Jun 2021 14:40:56 -0700
Message-Id: <20210604214101.3363525-1-mka@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
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

Matthias Kaehlcke (5):
  dt-bindings: usb: Add binding for Realtek RTS5411 hub controller
  USB: misc: Add onboard_usb_hub driver
  of/platform: Add stubs for of_platform_device_create/destroy()
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
 drivers/usb/host/Kconfig                      |   1 +
 drivers/usb/host/xhci-plat.c                  |   6 +
 drivers/usb/host/xhci.h                       |   2 +
 drivers/usb/misc/Kconfig                      |  17 +
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/onboard_usb_hub.c            | 496 ++++++++++++++++++
 include/linux/of_platform.h                   |  22 +-
 include/linux/usb/onboard_hub.h               |  18 +
 15 files changed, 675 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
 create mode 100644 drivers/usb/misc/onboard_usb_hub.c
 create mode 100644 include/linux/usb/onboard_hub.h

-- 
2.32.0.rc1.229.g3e70b5a671-goog

