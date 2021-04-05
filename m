Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C4D35476F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 22:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240639AbhDEUS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 16:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234602AbhDEUS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 16:18:28 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADD0C061788
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 13:18:22 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id b17so5167776pgh.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 13:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SzrATsd1l9iJ+1jsAg78YWOp1Uycls09AoxwwnTVB0A=;
        b=cStO9sTfmivqiIsV8Qp4UfOSoFmcFgIkbfywRSltUsIJ4YxU8IySZexr/4fUvjfTol
         YZ3nkdl9vO4T18y1DMIyR0rIUn2ZerL7H8kht1d7ljOJDhS9UbqqVz4tv9iycp+sP4Rx
         15MC+yEIeazbFqlrW1o88SgNWPXwsL/3VXfnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SzrATsd1l9iJ+1jsAg78YWOp1Uycls09AoxwwnTVB0A=;
        b=JR9tdsGGmG5aUz4p3J62DLxxvo4h98C7giLJ17ygcka3Hfha2hIn5w2iZ/sT4xqZCa
         XfuVZQWURNZiJA5lPSO3CTczVYq351gh9A8nRUQUVvfgMwqGPQYViklTECx0/hvEPYMf
         dDpkW2G2nNC0nu/w9Ftcxk68jqmAqrYvGmzqKcS8jM6tp3ElhxdeC0Y17m667ZGKngex
         h9Xw49nzOIZLb59FgUIP1NOCKSBczqwNOUah+8WijnMMJ3BlUAMO4Ifss/MjNZ9vVXYq
         ECxYeVBZn9qOaUtIZkXWKe7f72Up3hS1C08psyxCSS09V8UKqE6ZbW0DcYMhxk+PeqcO
         Dl/A==
X-Gm-Message-State: AOAM532aLrUt/hncPDjfVg7n8noPjCoGyYKqzWNmW81dev5YFYRMPfvo
        jbLe7sfyBdJqZpCPHIGr85mKXQ==
X-Google-Smtp-Source: ABdhPJzIGqAKrxzPOvps82jXYzrKweSAvuxLkVluJX5klP+J3JDb3KVgihZcPP9Xit3jNjHcaDBMCw==
X-Received: by 2002:aa7:8a19:0:b029:1f6:6839:7211 with SMTP id m25-20020aa78a190000b02901f668397211mr24475341pfa.40.1617653901576;
        Mon, 05 Apr 2021 13:18:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:455e:b8cf:5939:67da])
        by smtp.gmail.com with UTF8SMTPSA id x125sm16240244pfd.124.2021.04.05.13.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 13:18:21 -0700 (PDT)
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
        Matthias Kaehlcke <mka@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 0/5] USB: misc: Add onboard_usb_hub driver
Date:   Mon,  5 Apr 2021 13:18:12 -0700
Message-Id: <20210405201817.3977893-1-mka@chromium.org>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds:
- the onboard_usb_hub_driver
- glue in the xhci-plat driver to create the onboard_usb_hub
  platform device if needed
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

Changes in v7:
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
 .../bindings/usb/realtek,rts5411.yaml         |  59 +++
 MAINTAINERS                                   |   7 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  11 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  19 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  21 +-
 drivers/usb/host/xhci-plat.c                  |  16 +
 drivers/usb/misc/Kconfig                      |  17 +
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/onboard_usb_hub.c            | 415 ++++++++++++++++++
 include/linux/of_platform.h                   |  22 +-
 include/linux/usb/hcd.h                       |   2 +
 include/linux/usb/onboard_hub.h               |  15 +
 14 files changed, 596 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
 create mode 100644 drivers/usb/misc/onboard_usb_hub.c
 create mode 100644 include/linux/usb/onboard_hub.h

-- 
2.31.0.208.g409f899ff0-goog

