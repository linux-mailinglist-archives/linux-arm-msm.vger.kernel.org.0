Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A304131CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 12:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbhIUKlN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 06:41:13 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33886 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbhIUKlK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 06:41:10 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 21 Sep 2021 03:39:42 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Sep 2021 03:39:41 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg01-blr.qualcomm.com with ESMTP; 21 Sep 2021 16:09:16 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id C20E2215EE; Tue, 21 Sep 2021 16:09:15 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, mka@chromium.org,
        dianders@chromium.org, Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V9 0/8] Add QSPI and QUPv3 DT nodes for SC7280 SoC
Date:   Tue, 21 Sep 2021 16:08:58 +0530
Message-Id: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in V9:
 - As per Stephen's comments, 
   1. Moved back qup_opp_table from /soc@0/geniqup@9c0000 to /
   2. changed node names to "qup_spi0_cs_gpio: qup-spi0-cs-gpio" because
      node names should have dashes instead of underscores.

Changes in V8:
 - As per Matthias comments
   Added back qup_spiN_cs_gpio nodes in all spi ports

 - As per Doug comments, Added "qcom,sc7280-qspi" compatible in qspi node

Changes in V7:
 - As per Stephen's comments
   1. Moved qup_opp_table under /soc@0/geniqup@9c0000
   2. Removed qupv3_id_1 in sc7280-idp board file
   3. Sorted alias names for i2c and spi as per alphabet order

 - As per Matthias comment
   Configuring cs pin with gpio (qup_spiN_cs_gpio) definitions are removed

Changes in V6:
 - As per Matthias' comments,
   1. Squashed "Update QUPv3 UART5 DT node" and "Configure debug
      uart for sc7280-idp"
   2. Moved qup_opp_table from /soc to /
   3. Changed convention "clocks" followed by "clock-names"

 - As per Doug comments, added aliases for i2c and spi

Changes in V5:
 - As per Matthias' comments, I've split the patches as below:
   1. Add QSPI node
   2. Configure SPI-NOR FLASH for sc7280-idp
   3. Add QUPv3 wrapper_0 nodes
   4. Update QUPv3 UART5 DT node
   5. Configure debug uart for sc7280-idp
   6. Configure uart7 to support bluetooth on sc7280-idp
   7. Add QUPv3 wrapper_1 nodes

Changes in V4:
 - As per Stephen's comment updated spi-max-frequency to 37.5MHz, moved
   qspi_opp_table from /soc to / (root).
 - As per Bjorn's comment, added QUP Wrapper_0 nodes
   as separate patch and debug-uart node as separate patch.
 - Dropped interconnect votes for wrapper_0 and wrapper_1 node
 - Corrected QUP Wrapper_1 SE node's pin control functions like below
        QUP Wrapper_0: SE0-SE7 uses qup00 - qup07 pin-cntrl functions.
        QUP Wrapper_1: SE0-SE7 uses qup10 - qup17 pin-cntrl functions.

Changes in V3:
 - Broken the huge V2 patch into 3 smaller patches.
   1. QSPI DT nodes
   2. QUP wrapper_0 DT nodes
   3. QUP wrapper_1 DT nodes

Changes in V2:
 - As per Doug's comments removed pinmux/pinconf subnodes.
 - As per Doug's comments split of SPI, UART nodes has been done.
 - Moved QSPI node before aps_smmu as per the order.


Rajesh Patil (4):
  dt-bindings: spi: Add sc7280 support
  arm64: dts: sc7280: Configure SPI-NOR FLASH for sc7280-idp
  arm64: dts: sc7280: Configure uart7 to support bluetooth on sc7280-idp
  arm64: dts: sc7280: Add aliases for I2C and SPI

Roja Rani Yarubandi (4):
  arm64: dts: sc7280: Add QSPI node
  arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
  arm64: dts: sc7280: Update QUPv3 UART5 DT node
  arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes

 .../bindings/spi/qcom,spi-qcom-qspi.yaml           |    5 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  125 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 3196 +++++++++++++++-----
 3 files changed, 2510 insertions(+), 816 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

