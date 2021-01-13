Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDBA02F5264
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 19:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbhAMSjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 13:39:17 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:36127 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728488AbhAMSjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 13:39:17 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3368620072;
        Wed, 13 Jan 2021 19:38:19 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 0/9] SDM630/660 GCC/MMCC/GPUCC clock controllers
Date:   Wed, 13 Jan 2021 19:38:08 +0100
Message-Id: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series brings up the MultiMedia Clock Controller (MMCC)
and the GPU Clock Controller (GPUCC), plus includes some fixes for
the SDM660 GCC, which are necessary for correct functionality of
the clocks from the two new drivers, without causing lockups.

There is also a change in the RCG2 GFX3D, which generalizes the
gfx3d pingpong handling functions, in order to be able to reuse
them for more than just one specific SoC (MSM8996), bringing no
functional changes to the aforementioned SoC, which got a MMCC
driver gfx3d clock fix for the generalization... obviously.

This patch series has been tested against the following devices:
 - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

AngeloGioacchino Del Regno (8):
  clk: qcom: gcc-sdm660: Mark MMSS NoC CFG AHB clock as critical
  clk: qcom: gcc-sdm660: Mark GPU CFG AHB clock as critical
  dt-bindings: clock: Add support for the SDM630 and SDM660 mmcc
  clk: qcom: rcg2: Stop hardcoding gfx3d pingpong parent numbers
  clk: qcom: mmcc-msm8996: Migrate gfx3d clock to clk_rcg2_gfx3d
  clk: qcom: gdsc: Implement NO_RET_PERIPH flag
  clk: qcom: Add SDM660 GPU Clock Controller (GPUCC) driver
  dt-bindings: clock: Add QCOM SDM630 and SDM660 graphics clock bindings

Martin Botka (1):
  clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver

 .../bindings/clock/qcom,gpucc-sdm660.yaml     |   76 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |    2 +
 drivers/clk/qcom/Kconfig                      |   18 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/clk-rcg.h                    |    9 +
 drivers/clk/qcom/clk-rcg2.c                   |   56 +-
 drivers/clk/qcom/gcc-sdm660.c                 |    7 +
 drivers/clk/qcom/gdsc.c                       |   10 +-
 drivers/clk/qcom/gdsc.h                       |    3 +-
 drivers/clk/qcom/gpucc-sdm660.c               |  349 ++
 drivers/clk/qcom/mmcc-msm8996.c               |   29 +-
 drivers/clk/qcom/mmcc-sdm660.c                | 2864 +++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sdm660.h |   28 +
 include/dt-bindings/clock/qcom,mmcc-sdm660.h  |  162 +
 14 files changed, 3581 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sdm660.c
 create mode 100644 drivers/clk/qcom/mmcc-sdm660.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sdm660.h
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-sdm660.h

-- 
2.29.2

