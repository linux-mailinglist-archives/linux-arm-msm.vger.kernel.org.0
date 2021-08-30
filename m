Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0DA3FBB3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 19:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238172AbhH3R4F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 13:56:05 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61663 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbhH3R4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 13:56:04 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 30 Aug 2021 10:55:10 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Aug 2021 10:55:07 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Aug 2021 23:24:40 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 0A16F3D10; Mon, 30 Aug 2021 23:24:39 +0530 (IST)
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
Subject: [PATCH 0/3] USB DWC3 QCOM Multi power domain support
Date:   Mon, 30 Aug 2021 23:24:30 +0530
Message-Id: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add multi pd support to set performance state for cx domain
to maintain minimum corner voltage for USB clocks.

Add corresponding dt bindings, driver changes and dt changes.

Sandeep Maheswaram (3):
  dt-bindings: usb: qcom,dwc3: Add multi-pd bindings for dwc3 qcom
  usb: dwc3: qcom: Add multi-pd support
  arm64: dts: qcom: sc7280: Add cx power domain support

 .../devicetree/bindings/usb/qcom,dwc3.yaml         | 13 +++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  5 ++-
 drivers/usb/dwc3/dwc3-qcom.c                       | 49 ++++++++++++++++++++++
 3 files changed, 65 insertions(+), 2 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

