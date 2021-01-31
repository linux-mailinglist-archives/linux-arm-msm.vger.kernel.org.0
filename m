Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAC63099B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbhAaBkF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:40:05 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:40003 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhAaBkF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:05 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 2805A1F689;
        Sun, 31 Jan 2021 02:39:07 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/18] 8992/4/Lumia 950/XL DTS updates
Date:   Sun, 31 Jan 2021 02:38:31 +0100
Message-Id: <20210131013853.55810-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series enabled already-supported hardware on Lumia 950/XL
and adds SMP2P configuration on 8992/4, as well as cleaning up
the DTs massively by transforming the 8992 dt into an overlay
on top of 8994 (they are *almost* the same silicon).

Gustave Monce (14):
  arm64: dts: qcom: msm8994: Fix remaining BLSP errors/mistakes
  arm64: dts: qcom: msm8992/4-lumia*: Create a common DTS
  arm64: dts: qcom: msm8994-octagon: Fix up the memory map
  arm64: dts: qcom: msm8994-octagon: Add gpio-keys and Hall sensor
  arm64: dts: qcom: msm8994-octagon: Configure regulators
  arm64: dts: qcom: msm8994-octagon: Add QCA6174 bluetooth
  arm64: dts: qcom: msm8994-octagon: Configure HD3SS460 Type-C mux pins
  arm64: dts: qcom: msm8994-octagon: Add uSD card and disable HS400 on
    eMMC
  arm64: dts: qcom: msm8994-octagon: Configure Lattice iCE40 FPGA
  arm64: dts: qcom: msm8994-octagon: Configure PON keys
  arm64: dts: qcom: msm8994-octagon: Add NXP NFC node
  arm64: dts: qcom: msm8994-octagon: Add sensors on blsp1_i2c5
  arm64: dts: qcom: msm8994-octagon: Add TAS2553 codec
  arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors

Konrad Dybcio (4):
  arm64: dts: qcom: msm8994: Add SMP2P nodes
  arm64: dts: qcom: msm8994: Sort hwlock properly
  arm64: dts: qcom: msm8992: Make the DT an overlay on top of 8994
  arm64: dts: qcom: msm8994-octagon: Add FM Radio and DDR regulator
    nodes

 arch/arm64/boot/dts/qcom/Makefile             |   4 +-
 .../dts/qcom/msm8992-bullhead-rev-101.dts     |   2 +-
 .../msm8992-msft-lumia-octagon-talkman.dts    |  15 +
 .../dts/qcom/msm8992-msft-lumia-talkman.dts   |  67 --
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    |  39 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi         | 772 +--------------
 .../dts/qcom/msm8994-msft-lumia-cityman.dts   |  73 --
 .../msm8994-msft-lumia-octagon-cityman.dts    |  15 +
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 909 ++++++++++++++++++
 .../msm8994-sony-xperia-kitakami-karin.dts    |   2 +-
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |  24 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi         | 230 ++++-
 arch/arm64/boot/dts/qcom/pm8994.dtsi          |   2 +-
 13 files changed, 1181 insertions(+), 973 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi

-- 
2.30.0

