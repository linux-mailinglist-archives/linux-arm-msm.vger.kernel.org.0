Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7EA33EF0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 12:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhCQLCn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 07:02:43 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62475 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbhCQLCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 07:02:31 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 17 Mar 2021 04:02:31 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 17 Mar 2021 04:02:29 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 17 Mar 2021 16:31:48 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id CA5D037DF; Wed, 17 Mar 2021 16:31:46 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 0/3] Add DT bindings and DT nodes for USB in SC7280
Date:   Wed, 17 Mar 2021 16:31:38 +0530
Message-Id: <1615978901-4202-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series includes usb controller and phy binding updates
for SC7280 SoC and DT chnages for SC7280 SoC and SC7280 IDP board.

The IDP board change dependency on the below patch series
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=448321

Sandeep Maheswaram (3):
  dt-bindings: usb: qcom,dwc3: Add bindings for SC7280
  dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings for SC7280
  arm64: dts: qcom: sc7280: Add USB related nodes

 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   1 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  39 ++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 149 +++++++++++++++++++++
 4 files changed, 190 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

