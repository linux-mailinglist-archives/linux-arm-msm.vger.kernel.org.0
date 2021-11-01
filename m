Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3E744146C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 08:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhKAH4d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 03:56:33 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26167 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhKAH4c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 03:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635753240; x=1667289240;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=25sah/KSti2H/cMu+ExnGDDFiW6UpNflUADGWlFdf/Y=;
  b=ticHBwlycm/1K/LQwC2GJ6vKpOC+dzOke+4U5Fi4N8j5A3WIiSq+hHBA
   0F7elOWzLEEFxdmAw9UjsRy5WlJ3/ojXXOsB/wuwRlKFQb9k+9lsu3AXA
   CnXRkFIfOpHwlTyxdPkHzvXzV9acUIDJ52fxicZVkRffONy595FI9gf4O
   8=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 01 Nov 2021 00:54:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 00:53:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 1 Nov 2021 00:53:58 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 1 Nov 2021 00:53:54 -0700
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: [PATCH v9 0/5] USB DWC3 host wake up support from system suspend
Date:   Mon, 1 Nov 2021 13:23:39 +0530
Message-ID: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Avoiding phy powerdown in host mode when wakeup capable devices are 
connected, so that it can be wake up by devices.
Set GENPD_FLAG_ACTIVE_WAKEUP flag to keep usb30_prim gdsc active
when wakeup capable devices are connected to the host.

Changes in v9:
Checking with device_may_makeup property instead of phy_power_off flag.
Changed the IRQ flags and removed hs_phy_mode variable.

Changes in v8:
Moved the dwc3 suspend quirk code in dwc3/host.c to xhci-plat.c
Checking phy_power_off flag instead of usb_wakeup_enabled_descendants 
to keep gdsc active.

Changes in v7:
Change in commit text and message in PATCH 1/5 and PATCH 5/5
as per Matthias suggestion.
Added curly braces for if and else if sections in PATCH 4/5.

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
  usb: host: xhci: plat: Add suspend quirk for dwc3 controller
  usb: dwc3: core: Host wake up support from system suspend
  usb: dwc3: qcom: Add helper functions to enable,disable wake irqs
  usb: dwc3: qcom: Change the IRQ flag for DP/DM hs phy irq
  usb: dwc3: qcom: Keep power domain on to support wakeup

 drivers/usb/dwc3/core.c      |  7 +++--
 drivers/usb/dwc3/dwc3-qcom.c | 73 +++++++++++++++++++++++---------------------
 drivers/usb/host/xhci-plat.c | 12 ++++++++
 3 files changed, 56 insertions(+), 36 deletions(-)

-- 
2.7.4

