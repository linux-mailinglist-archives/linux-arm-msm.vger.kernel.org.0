Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7EF22BCAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 05:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgGXD6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 23:58:50 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25514 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbgGXD6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 23:58:48 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 Jul 2020 20:58:47 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jul 2020 20:58:46 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Jul 2020 09:28:21 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id D84F74272; Fri, 24 Jul 2020 09:28:19 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 0/3]  Add wakeup support over UART RX
Date:   Fri, 24 Jul 2020 09:27:59 +0530
Message-Id: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
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

Hi Greg,

These patches are based on qcom tree. Please ack the serial driver
patch to land via qcom-tree.

Thanks,
Satya Priya

satya priya (3):
  arm64: dts: sc7180: Add wakeup support over UART RX
  arm64: dts: qcom: sc7180: Add sleep pin ctrl for BT uart
  tty: serial: qcom_geni_serial: Fix the UART wakeup issue

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42 ++++++++++++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 98 ++++++++++++++++++++++++++++-----
 drivers/tty/serial/qcom_geni_serial.c   |  2 +-
 3 files changed, 121 insertions(+), 21 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

