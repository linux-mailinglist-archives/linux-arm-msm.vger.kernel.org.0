Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33609361DB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 12:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbhDPKDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 06:03:04 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:27882 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242322AbhDPKDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 06:03:03 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 16 Apr 2021 03:02:39 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Apr 2021 03:02:37 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 16 Apr 2021 15:32:03 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 5EB8A3816; Fri, 16 Apr 2021 15:32:02 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v6 0/5] USB DWC3 host wake up support from system suspend
Date:   Fri, 16 Apr 2021 15:31:48 +0530
Message-Id: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Avoiding phy powerdown in host mode when wakeup capable devices are 
connected, so that it can be wake up by devices.
Set GENPD_FLAG_ACTIVE_WAKEUP flag to keep usb30_prim gdsc active
when wakeup capable devices are connected to the host.

Changes in v6:
Addressed comments in host.c and core.c
Separated the patches in dwc3-qcom.c to make it simple.
Dropped wakeup-source change as it is not related to this series.

Changes in v5:
Added phy_power_off flag to check presence of wakeup capable devices.
Dropped patch[v4,4/5] as it is present linux-next.
Addressed comments in host.c and dwc3-qcom.c.

Changes in v4:
Addressed Matthias comments raised in v3.

Changes in v3:
Removed need_phy_for_wakeup flag and by default avoiding phy powerdown.
Addressed Matthias comments and added entry for DEV_SUPERSPEED.
Added suspend_quirk in dwc3 host and moved the dwc3_set_phy_speed_flags.
Added wakeup-source dt entry and reading in dwc-qcom.c glue driver.

Changes in v2:
Dropped the patch in clock to set GENPD_FLAG_ACTIVE_WAKEUP flag and 
setting in usb dwc3 driver.
Separated the core patch and glue driver patch.
Made need_phy_for_wakeup flag part of dwc structure and 
hs_phy_flags as unsgined int.
Adrressed the comment on device_init_wakeup call.
Corrected offset for reading portsc register.
Added pacth to support wakeup in xo shutdown case.

Sandeep Maheswaram (5):
  usb: dwc3: host: Add suspend_quirk for dwc3 host
  usb: dwc3: core: Host wake up support from system suspend
  usb: dwc3: qcom: Add helper functions to enable,disable wake irqs
  usb: dwc3: qcom: Configure wakeup interrupts during suspend
  usb: dwc3: qcom: Set genpd active wakeup flag for usb gdsc

 drivers/usb/dwc3/core.c      |  7 ++--
 drivers/usb/dwc3/core.h      |  3 ++
 drivers/usb/dwc3/dwc3-qcom.c | 85 ++++++++++++++++++++++++++++----------------
 drivers/usb/dwc3/host.c      | 59 ++++++++++++++++++++++++++++++
 4 files changed, 122 insertions(+), 32 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

