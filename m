Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B493443B37B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 15:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbhJZOBV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 10:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232956AbhJZOBU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 10:01:20 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7A3C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 06:58:57 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id n63so20687124oif.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kWZgU+JuFT3e4VWZdwEk4RH2Do7tIF1ny74QqfwM6aU=;
        b=KAwpsckzrPqR2p3Fay61wYUUmQLZeij2KfPAzODLuvDQ2eI7ngke2Dop47vPxBgvjd
         1Dsn3Xs/RD50SVa8USAffsz6kEJrf8AgKbSlrMnW3usb7ZAfU3IgxMW0MPb3rUZ0o+30
         /5U+WMnuiB5ZcuBe2dGv44HpcRC6OR+4EI4YP8mOwi/XUWXetoPTAF3RgL9KPOIZMgcE
         zYRO60E2Nrrd3Zvbzpe2pdNieS6x0TJ5B9KTOX3SfOmK0F+7tycdXPhBZGAVKYivCLth
         HcUC2+waDM6UtS7AqM2RDxm6SM+6I3AwLHBa9qrjfr3duc50gzslbuXS6Hkhp5fMKJoi
         Y7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kWZgU+JuFT3e4VWZdwEk4RH2Do7tIF1ny74QqfwM6aU=;
        b=pbUzQO9G+2gpwk8q0CCS6/HijemoIbTTd4fbuOn2/+I/yf7U0hc9RJ5fCV2D++sY8f
         zBFlJKAjIUqFk1XmpmaSj3TngHtmU9XVLxjvs4/hZaE4E2dVwFk43m0NyjcLClkA39Sk
         TdAypXiyOnSOY/dbEyNFGUFIhM34u0xQv4dmDDqPgj7FZ/G8g7HteOWP2hqpfb+R/Fjb
         g0a/Smy0/wEnU02Sxe5UhhNUeGcMbT7qYNYNWW3JY6/4Oq7XU3oazMa6k4Q3WtY/tvPC
         Cjln4VdTT97wbrbjPkn/fCzCAK3XiPmMebVhtLMCHQabFSfKlDdshm4gUAUTUcl1zjD0
         nfFQ==
X-Gm-Message-State: AOAM533ITp/MJZmEgXZMYx7E9KPONNqJ83KHF0ZpUp2+5PWE7Ew8UTXV
        DMaiw7aMv7E4yZhQfTX1xaJ/ZA==
X-Google-Smtp-Source: ABdhPJy3FKvJLwrDzsDU+3QarCP0LjFyaQTBLcEwMBLFMZsd4/60SkIbgQorpAXlob7bcwwS51/Lvg==
X-Received: by 2002:a54:4f8f:: with SMTP id g15mr17378805oiy.169.1635256736390;
        Tue, 26 Oct 2021 06:58:56 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id t5sm4607363oic.4.2021.10.26.06.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 06:58:55 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Heidelberg <david@ixit.cz>, Luca Weiss <luca@z3ntu.xyz>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [GIT PULL] Qualcomm DTS more changes for v5.16
Date:   Tue, 26 Oct 2021 08:58:54 -0500
Message-Id: <20211026135855.1205262-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 9304af37d07b63244e4b3c80e5a245c978beb015:

  dt-bindings: arm: qcom, add missing devices (2021-09-19 23:33:06 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.16-2

for you to fetch changes up to 036e6c9f0336f50532ad6bedfaebf01856168a1d:

  ARM: dts: qcom: fix typo in IPQ8064 thermal-sensor node (2021-10-24 18:45:29 -0500)

----------------------------------------------------------------
Qualcomm DTS more changes for v5.16

The multi-purpose-pin (MPP) driver is finally migrated to use
hierarchical IRQ domains, so this bring the associated changes.

The remainder of the changes are correcting binding issues, primarily
found through DT validation.

----------------------------------------------------------------
David Heidelberg (9):
      ARM: dts: qcom: mdm9615: fix memory node for Sierra Wireless WP8548
      dt-bindings: arm: qcom-ipq4019: add missing device compatible
      ARM: dts: ipq4019-ap.dk01.1-c1: add device compatible in the dts
      dt-bindings: arm: qcom: Fix Nexus 4 vendor prefix
      ARM: dts: qcom: fix memory and mdio nodes naming for RB3011
      ARM: dts: qcom: correct mmc node naming
      ARM: dts: qcom: fix flash node naming for RB3011
      ARM: dts: qcom: fix thermal zones naming
      ARM: dts: qcom: fix typo in IPQ8064 thermal-sensor node

Dmitry Baryshkov (14):
      ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
      ARM: dts: qcom-apq8064: add gpio-ranges to mpps nodes
      ARM: dts: qcom-msm8660: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pm8841: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pm8941: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pma8084: add gpio-ranges to mpps nodes
      ARM: dts: qcom-mdm9615: add gpio-ranges to mpps node, fix its name
      ARM: dts: qcom-apq8060-dragonboard: fix mpps state names
      ARM: dts: qcom-apq8064: add interrupt controller properties
      ARM: dts: qcom-mdm9615: add interrupt controller properties
      ARM: dts: qcom-msm8660: add interrupt controller properties
      ARM: dts: qcom-pm8841: add interrupt controller properties
      ARM: dts: qcom-pm8941: add interrupt controller properties
      ARM: dts: qcom-pma8084: add interrupt controller properties

Luca Weiss (2):
      dt-bindings: arm: qcom: rename vendor of apq8026-lenok
      ARM: dts: qcom: apq8026-lg-lenok: rename board vendor

Shawn Guo (1):
      ARM: dts: qcom: sdx55: Drop '#clock-cells' from QMP PHY node

 Documentation/devicetree/bindings/arm/qcom.yaml    |  5 ++-
 arch/arm/boot/dts/Makefile                         |  2 +-
 ...026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts} |  2 +-
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     | 10 ++---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |  2 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |  6 +--
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |  6 +--
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |  4 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 45 ++++++++--------------
 arch/arm/boot/dts/qcom-apq8084.dtsi                |  8 ++--
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dts    |  2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi      |  1 -
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts          |  8 ++--
 arch/arm/boot/dts/qcom-ipq8064.dtsi                | 26 ++++++-------
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi         |  2 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                | 16 +++-----
 arch/arm/boot/dts/qcom-msm8660-surf.dts            |  4 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi                | 27 ++++---------
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             |  4 +-
 arch/arm/boot/dts/qcom-msm8960.dtsi                |  4 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 12 +++---
 arch/arm/boot/dts/qcom-pm8841.dtsi                 |  7 ++--
 arch/arm/boot/dts/qcom-pm8941.dtsi                 | 11 ++----
 arch/arm/boot/dts/qcom-pma8084.dtsi                | 11 ++----
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  1 -
 25 files changed, 94 insertions(+), 132 deletions(-)
 rename arch/arm/boot/dts/{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts} (99%)
