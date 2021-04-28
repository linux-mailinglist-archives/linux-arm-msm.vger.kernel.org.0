Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D288936DF10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 20:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243555AbhD1SmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 14:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243653AbhD1SmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 14:42:24 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0D6C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 11:41:38 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id a11so2465897plh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iWgNLmw8XtUSWX3nXJqs3Lo41Zd8P550K3mKVLVvnf8=;
        b=Uk1O0BgpnTa9THucVlNuUG2BFbxA/bUsmYfV78MZ2gAji7wuv0Maln71M/8n3/Poie
         l4ijDJL55PVr0jf3oaNpMKTJKe5FCpfeoNIm0iVaYOcusDLB7qEB0WnnMOpdaFxLXdA2
         VfdZEDwS78h/+cG/79kcQ3YxoT/NBXH5dgKUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iWgNLmw8XtUSWX3nXJqs3Lo41Zd8P550K3mKVLVvnf8=;
        b=pcdgh59mjGtUkJd1uIp3qdyo0b6XKNKtUqyppVBmmolp5x096YLF08v6dnpMDegqSW
         QRhoOl2ARpcclMu+COPDxczqwph1S14fVeoDhjEiOypqt4zFLi3Rhvn6SZA0MGt2tmZD
         PaI9+rhJESgivCf919kv3JZ4nStqKx07Rdktg7LJpdbRnw8RpqBE0iaM6/UMjwz7k7fP
         1B4cxJdWp+mDvhKtvGNz/4bZIDBtUgi6irIzFyvkZ0OoI4Q3R9LJoBEqj3HIxRLPFOdG
         4Ohf0+hYIdmu70iO8p3szdRCcYLNDdxULc+Zn3GSn2pgrgQQ/xBoERAeFeeEMGeHCdci
         ZCOw==
X-Gm-Message-State: AOAM533zW0XWpckqTCvYaVJI6bk1Wta7YeAR52oEgPAo629WVqDWkNDO
        rdiv21wxH097ii9hm3JF+dycLw==
X-Google-Smtp-Source: ABdhPJxKLMnoyUm0OBOXU0x+Ab6uzmJ1QVJbOzIE8+arEaVWVHLVS81tPukqeKbL1icp7BMJa0z5sA==
X-Received: by 2002:a17:902:aa98:b029:ec:a55f:f4bc with SMTP id d24-20020a170902aa98b02900eca55ff4bcmr31879072plr.82.1619635298324;
        Wed, 28 Apr 2021 11:41:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4c1a:a0a7:2b43:81b0])
        by smtp.gmail.com with UTF8SMTPSA id c13sm5257874pjv.21.2021.04.28.11.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 11:41:37 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v8 0/5] USB: misc: Add onboard_usb_hub driver
Date:   Wed, 28 Apr 2021 11:41:27 -0700
Message-Id: <20210428184132.2184997-1-mka@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
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

(no changes since v7)

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
 14 files changed, 599 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
 create mode 100644 drivers/usb/misc/onboard_usb_hub.c
 create mode 100644 include/linux/usb/onboard_hub.h

-- 
2.31.1.498.g6c1eba8ee3d-goog

