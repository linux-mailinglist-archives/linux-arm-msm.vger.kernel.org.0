Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AE939B77E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 13:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhFDLGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 07:06:05 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25829 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbhFDLGF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 07:06:05 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 04 Jun 2021 04:04:19 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2021 04:04:17 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2021 16:33:42 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 5E01F393F; Fri,  4 Jun 2021 16:33:41 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v4 0/2] Add DT bindings and DT nodes for USB in SC7280
Date:   Fri,  4 Jun 2021 16:33:36 +0530
Message-Id: <1622804618-18480-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series includes usb controller and phy binding updates
for SC7280 SoC and DT chnages for SC7280 SoC and SC7280 IDP board.

changes in v4:
 changed usb3-phy to lanes in qmp phy node as it was causing probe failure.

changes in v3:
  Moved the board specific changes to separate patch.
  Addressed comments from Matthias in v2.

changes in v2:
  Dropped dt bindings patches as they are already merged in linux-next.
  Addressed comments from Matthias in v1.

Sandeep Maheswaram (2):
  arm64: dts: qcom: sc7280: Add USB related nodes
  arm64: dts: qcom: sc7280: Add USB nodes for IDP board

 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  39 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 149 ++++++++++++++++++++++++++++++++
 2 files changed, 188 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

