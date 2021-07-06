Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386A23BD75D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 15:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhGFNEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 09:04:10 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:44064 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbhGFNEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 09:04:04 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 06 Jul 2021 06:01:24 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Jul 2021 06:01:22 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Jul 2021 18:30:42 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 2DD123A90; Tue,  6 Jul 2021 18:30:41 +0530 (IST)
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
        Pratham Pratap <prathampratap@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v5 0/3] Add DT bindings and DT nodes for USB in SC7280
Date:   Tue,  6 Jul 2021 18:30:10 +0530
Message-Id: <1625576413-12324-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series includes usb controller and phy binding updates
for SC7280 SoC and DT chnages for SC7280 SoC and SC7280 IDP board.

changes in v5:
 Added patch for usb3-dp phy bindings for SC7280.
 Changed qmp usb phy to usb dp phy combo node as per Stephen's comments.
 Changed dwc to usb and added SC7280 compatible as per Bjorn's comments.

changes in v4:
 changed usb3-phy to lanes in qmp phy node as it was causing probe failure.

changes in v3:
  Moved the board specific changes to separate patch.
  Addressed comments from Matthias in v2.

changes in v2:
  Dropped dt bindings patches as they are already merged in linux-next.
  Addressed comments from Matthias in v1.

Sandeep Maheswaram (3):
  dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SC7280
  arm64: dts: qcom: sc7280: Add USB related nodes
  arm64: dts: qcom: sc7280: Add USB nodes for IDP board

 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml         |   1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  39 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 164 +++++++++++++++++++++
 3 files changed, 204 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

