Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8213D1F6A01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 16:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgFKO24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 10:28:56 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:25936 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728321AbgFKO2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 10:28:55 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jun 2020 19:58:44 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 11 Jun 2020 19:58:16 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id E908B2AC5; Thu, 11 Jun 2020 19:58:14 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 0/2] usb: dwc3:  Host wake up support from system suspend
Date:   Thu, 11 Jun 2020 19:58:01 +0530
Message-Id: <1591885683-29514-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Avoiding phy powerdown in host mode so that it can be wake up by devices.
Set usb controller wakeup capable when wakeup capable devices are
connected to the host.

Added GENPD_FLAG_ACTIVE_WAKEUP flag to keep usb30_prim gdsc active
when  wakeup capable devices are connected to the host.

Sandeep Maheswaram (1):
  usb: dwc3: Host wake up support from system suspend

Taniya Das (1):
  clk: qcom: gcc: Add genpd active wakeup flag for sc7180

 drivers/clk/qcom/gcc-sc7180.c |  1 +
 drivers/usb/dwc3/core.c       | 47 +++++++++++++++++++++++++-----
 drivers/usb/dwc3/core.h       |  1 +
 drivers/usb/dwc3/dwc3-qcom.c  | 66 ++++++++++++++++++++++++++++++++-----------
 4 files changed, 92 insertions(+), 23 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

