Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA094264674
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 14:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730508AbgIJM6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 08:58:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:38551 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730740AbgIJM40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 08:56:26 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 10 Sep 2020 05:55:01 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 10 Sep 2020 05:55:00 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 10 Sep 2020 18:24:31 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 3ED0B431F; Thu, 10 Sep 2020 18:24:30 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V5 0/4] Add wakeup support over UART RX
Date:   Thu, 10 Sep 2020 18:23:54 +0530
Message-Id: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in V2:
 - As per Matthias's comment added wakeup support for all the UARTs
   of SC7180.
 - Added sleep state in sc7180-idp.dts file.
 - Modify the if check in set_mctrl API in serial driver to avoid
   making RFR high during suspend.

Changes in V3:
 - As per Matthias's comments modify the idp dts pin config to keep
   only the required pin settings.
 - Remove the extra parentheses from serial driver patch.

Changes in V4:
 - As per Matthias's comments, change the commit text to mention why
   GPIO function needs to be selected in sleep.
 - Add separate patch for improvements made in pin conf settings.

Changes in V5:
 - Moved pinctrl and interrupt configuration to board specific files.
 - Added new patch for trogdor board specific changes.

satya priya (4):
  arm64: dts: qcom: sc7180: Improve the pin config settings for CTS and
    TX
  arm64: dts: qcom: sc7180: Add necessary pinctrl and interrupt config
    for BT UART
  arm64: dts: qcom: sc7180-trogdor: Add pinctrl and interrupt config for
    BT UART
  tty: serial: qcom_geni_serial: Fix the UART wakeup issue

 arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 58 +++++++++++++++++++++++++---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 48 +++++++++++++++++++++++
 drivers/tty/serial/qcom_geni_serial.c        |  2 +-
 3 files changed, 101 insertions(+), 7 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

