Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AB3368611
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 19:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236817AbhDVRhC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Apr 2021 13:37:02 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46526 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238224AbhDVRg6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Apr 2021 13:36:58 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 22 Apr 2021 10:36:21 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Apr 2021 10:36:19 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 22 Apr 2021 23:05:46 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id EBDCC394A; Thu, 22 Apr 2021 23:05:45 +0530 (IST)
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
Subject: [PATCH v2] Add DT bindings and DT nodes for USB in SC7280
Date:   Thu, 22 Apr 2021 23:05:30 +0530
Message-Id: <1619112931-2144-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series includes usb controller and phy binding updates
for SC7280 SoC and DT chnages for SC7280 SoC and SC7280 IDP board.

changes in v2:
  Dropped dt bindings patches as they are already merged in linux-next.
  Addressed comments from Matthias in v1.


Sandeep Maheswaram (1):
  arm64: dts: qcom: sc7280: Add USB related nodes

 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  40 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 150 ++++++++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

