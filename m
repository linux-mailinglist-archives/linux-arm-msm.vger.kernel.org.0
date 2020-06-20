Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02D1202443
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgFTOrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbgFTOry (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:47:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6472C06174E;
        Sat, 20 Jun 2020 07:47:53 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l26so10910902wme.3;
        Sat, 20 Jun 2020 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8jOrTg8zSJgPYru4awajjukDIxGwnSXepcjCCU9jaM=;
        b=oTMFaBITUl8uK7XiinTEfCZiUEmv59lJt6w/qFpLtESVedXgoMFZ20cUtZ/tpnXrEx
         mtF/VoHdorOsNfzCoU71HRijBVZiOlzIROT0rEB2RnIi6I4MTzxIThU/GDL9KMELFg3n
         wtQ0/ziQ4/UmdaRrrN5JOcTvWGlUcTh+zIVQvwMFaxZ5Kx/r/AvXDob7QimXG0DMTm0C
         PeUxzax0CMd8+Hwspe2d2WKZmL3JXtwsNesJneZLgMXav3zbO9j71BZ3Rbxsg1m9rbHP
         zLl9V4dc+XQvJasuuNsoFsJeLxzFE9UXoZtondymPdrP9hqHxDESQnL0qsJtgCu1xr4Y
         Ukyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8jOrTg8zSJgPYru4awajjukDIxGwnSXepcjCCU9jaM=;
        b=pXJqhx4Svbu0FGBYLnHiSxeJs3cvwmKYusfM5iYvu22RMzWasqXcWmOyvEw9roXPG+
         Z8fTyiEe3oYUBOxSuhC0K/wad1JonDKmY+V4+sN/jUrwctuNCZs7S2UlWu2KZ0P6/kID
         feJP03qmQhfzCthOzkAMp8p7/lwFEH7m53zvD5PS2sjJvacJ7HJSyLBQCuoyB0aYHQ+q
         XhxblkTDCrESvXlexRDyX5H3ZLTka7R2dIFYZJctElLRFyNegxNX29DG0gifujEaygf9
         ZEn9RXzl1t0zAy2/sxF7keNoWNuZBozGMk0AJ8/qnpPzYNTP10h7wNmaJX3uGt0r5a7m
         ndEw==
X-Gm-Message-State: AOAM530jzEi8t4tcDIGfPiGoyfDrfuIEqNdqsolQOCRaVTS+wxWAMVzJ
        IWeM05SCUEhnpo9seOLdvGU89q3FMxo=
X-Google-Smtp-Source: ABdhPJyQttuLJ44l2HnKLjW9EtfdwFUtakh67NqEPJf7fqTUga2JSt9SCwbKgbLpm1F71HuXztMNtw==
X-Received: by 2002:a05:600c:2116:: with SMTP id u22mr8747799wml.97.1592664471198;
        Sat, 20 Jun 2020 07:47:51 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:47:50 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/21] MSM8994 peripheral enablement, DTS updates
Date:   Sat, 20 Jun 2020 16:46:16 +0200
Message-Id: <20200620144639.335093-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!

In this series I added support for various buses and peripherals
such as I2C or SMD RPM. I also did some housekeeping when it comes
to the DTS. This series also includes a new board (SoMC Kitakami
Sumire / Xperia Z5).

I have a MMCC driver coming along with GCC updates/completion
(almost ready, need to polish a few things) and I sincerely 
hope somebody is going to write a 20nm DSI PLL driver (for 8992/4)
as I have no clue how that works.

Also, some Lumia (yes, Lumia!) device trees are coming soon(tm).

The patchet depends on:
- https://patchwork.kernel.org/patch/11584267/ (even though bullhead used
that for a few years and the property never existed but nobody noticed)

- https://patchwork.kernel.org/patch/11580845/ (no point duplicating it for 8994)


Konrad Dybcio (21):
  clk: qcom: smd: Add support for MSM8992/4 rpm clocks
  arm64: dts: qcom: msm8994: Add SPMI PMIC arbiter device
  arm64: dts: qcom: msm8994: Add a proper CPU map
  arm64: dts: qcom: msm8994: Wrap clock nodes into clocks {}
  arm64: dts: qcom: msm8994: Rename the smem node and remove its unit
    address
  arm64: dts: qcom: msm8994: Rename clock_gcc label to gcc
  arm64: dts: qcom: msm8994: Add apcs node
  arm64: dts: qcom: msm8994: Add pmu node
  arm64: dts: qcom: msm8994: Add PSCI node
  arm64: dts: qcom: msm8994: Add support for SMD RPM
  arm64: dts: qcom: msm8994: Add SDHCI1 node
  arm64: dts: qcom: msm8994: Remove qcom,msm-id and qcom-pmic-id
    properties
  arm64: dts: qcom: msm8994: Make comments C style
  arm64: dts: qcom: msm8994: Add SCM node
  arm64: dts: qcom: msm8994: Add BLSP2 UART2 node
  arm64: dts: qcom: msm8994: Add I2C, SPI and BLSP DMA nodes
  arm64: dts: qcom: Update msm8994 pin configuration
  regulator: qcom_smd: Fix pmi8994 label
  arm64: dts: qcom: angler: Add qcom,msm-id and pmic-id
  arm64: dts: qcom: Add support for Sony Xperia Z5 (SoMC Sumire-RoW)
  arm64: dts: qcom: Move msm8994-smd-rpm contents to lg-bullhead.

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/msm8992-bullhead-rev-101.dts     | 264 +++++++++-
 .../boot/dts/qcom/msm8994-angler-rev-101.dts  |   2 +
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi    | 272 +++++++++++
 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi | 268 -----------
 .../msm8994-sony-xperia-kitakami-sumire.dts   | 410 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8994.dtsi         | 452 +++++++++++++++++-
 drivers/clk/qcom/clk-smd-rpm.c                | 172 +++++++
 drivers/regulator/qcom_smd-regulator.c        |   2 +-
 include/dt-bindings/clock/qcom,rpmcc.h        |   4 +
 11 files changed, 1556 insertions(+), 293 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts

-- 
2.27.0

