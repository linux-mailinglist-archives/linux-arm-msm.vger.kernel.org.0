Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB163EDF42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 23:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhHPVUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 17:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbhHPVUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 17:20:31 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9A4C061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:19:59 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id e13-20020a9d63cd0000b02904fa42f9d275so22649179otl.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C721tErGQuAbfzenrLJRyttmTyU2USTMFi+mtLeCzg8=;
        b=P9ctwR/5USxYoa5ZdUlRIRy8w5XeIyouOpmQjDRmGXMipxn4vajIvaatoCVCKGWQAa
         kxJoZRGXXuQ/5YxWtLbbxt06Qh4PbRUW+4hkOaSryzwmrZRUtnREJI6DB2pxTwCoBZXI
         p1O3BsDT/1D/B+i/xTPt4QZSJH6pA/U4lSgxkrZyemCp6J0sn1pkN7mmBNGLwTk0lhy2
         D/8MvaKmqix6h0QOdfe9d0m5izFrCEV8pthKmMeOTRpELoi5AZomI19qm/fU//b8CM0v
         y+5YGucu9C//J3HyTPeafP8qJFCJ1LJD1IwnCAOSL0MJemlz9SRtbclLtxkluJ6R/sgH
         Xa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C721tErGQuAbfzenrLJRyttmTyU2USTMFi+mtLeCzg8=;
        b=bU3LrMTXXUzIchslWgxenw1IJlQ+OqmAgANOdt/U4nYM21xdOEi42pswwWg2Z2kyO9
         sfu4Gr2J+2j/gSml6M8iqtfyi7ENldvGEXw/Jf9/TWglQuW3ibyGOFnh1kr2zkf8K7Uy
         NKgbY3Ew7pDQVqi6IVz6BWR+TZ/jdZqZSNhU5yZnLaEipmimzjL0e8Z8h+h3jszjtKDv
         YBLITXlb0A7/MIlgwJNxotnsk80kJcByWCx6rNBoo761aRdybifzgVnwIMTSXLdj4PSd
         oHMJ1t9A7pIVKN+6+fAxhy9w0hgO3joVH2mnLHiepYLKfpWkcHUtzvRHp/F3RNrYNHkf
         ZTQA==
X-Gm-Message-State: AOAM53276v8J5qu8eMahGopxf0lPsZfHofYiQyLNsItAEJgvIvvdoPUU
        vAmiAR8E3eDbO6SMQ12WnAlTNw==
X-Google-Smtp-Source: ABdhPJyFAdst6Ew1Kftpxp0TswRwmSGM7cx4k4WVEKFYtcV4zYaRakJRfx3VtFcWUn8glpceDlaPAA==
X-Received: by 2002:a05:6830:91b:: with SMTP id v27mr134649ott.328.1629148798699;
        Mon, 16 Aug 2021 14:19:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s184sm26535oif.20.2021.08.16.14.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:19:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthew Hagan <mnhagan88@gmail.com>
Subject: [GIT PULL] Qualcomm dts updates for v5.15
Date:   Mon, 16 Aug 2021 16:19:57 -0500
Message-Id: <20210816211957.579365-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.15

for you to fetch changes up to f95c4c56d65225a537a2d88735fde7ec4d37641d:

  ARM: dts: qcom: add ahb reset to ipq806x-gmac (2021-08-05 09:24:37 -0500)

----------------------------------------------------------------
Qualcomm dts updates for v5.15

This introduces the MSM8226 platform and an initial dts for the Samsung
Galaxy S III Neo phone.

MSM8974 gains another UART and this is used to enable Bluetooth on the
Sony Xperia Z2 Tablet. Samsung Galaxy S5 gains regulator definitions for
audio and modem remoteprocs, effectively enabling these.

DSI clocks on APQ8064 are updates as the old legacy clock names are no
longer supported by the driver. And IPQ806x GMAC nodes gains AHB resets
wired up.

Lastly APQ8060 is converted to a SPDX header and the ethernet node is
updates in accordance with the binding.

----------------------------------------------------------------
Alexey Minnekhanov (1):
      ARM: dts: qcom: msm8974-klte: Enable remote processors

Bartosz Dudziak (3):
      ARM: dts: qcom: Add support for MSM8226 SoC
      dt-bindings: arm: qcom: Document MSM8226 SoC binding
      ARM: dts: qcom: Add initial DTS file for Samsung Galaxy S III Neo phone

Bjorn Andersson (1):
      ARM: dts: qcom: msm8974: castor: Add Bluetooth-related nodes

Craig Tatlor (1):
      ARM: dts: qcom: msm8974: Add blsp2_uart7 for bluetooth on sirius

David Heidelberg (1):
      ARM: dts: qcom: apq8064: correct clock names

Geert Uytterhoeven (1):
      ARM: dts: qcom: apq8060: Correct Ethernet node name and drop bogus irq property

Linus Walleij (1):
      ARM: dts: qcom: Fix up APQ8060 DragonBoard license

Matthew Hagan (1):
      ARM: dts: qcom: add ahb reset to ipq806x-gmac

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |  27 +---
 arch/arm/boot/dts/qcom-apq8064.dtsi                |   6 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  20 +--
 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts  |  25 ++++
 arch/arm/boot/dts/qcom-msm8226.dtsi                | 147 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    |  11 ++
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |  81 ++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                |   9 ++
 10 files changed, 297 insertions(+), 36 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8226.dtsi
