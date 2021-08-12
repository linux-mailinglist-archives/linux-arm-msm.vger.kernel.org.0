Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC72A3E9F99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 09:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234923AbhHLHnS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 03:43:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:16613 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234892AbhHLHnR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 03:43:17 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 Aug 2021 00:42:52 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Aug 2021 00:42:50 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Aug 2021 13:12:19 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id 2C39321501; Thu, 12 Aug 2021 13:12:18 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V5 0/7] Add QSPI and QUPv3 DT nodes for SC7280 SoC
Date:   Thu, 12 Aug 2021 13:11:11 +0530
Message-Id: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Rajesh Patil (3):
  arm64: dts: sc7280: Configure SPI-NOR FLASH for sc7280-idp
  arm64: dts: sc7280: Configure debug uart for sc7280-idp
  arm64: dts: sc7280: Configure uart7 to support bluetooth on sc7280-idp

Roja Rani Yarubandi (4):
  arm64: dts: sc7280: Add QSPI node
  arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
  arm64: dts: sc7280: Update QUPv3 UART5 DT node
  arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  129 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 3181 ++++++++++++++++++++++--------
 2 files changed, 2487 insertions(+), 823 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

