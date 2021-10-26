Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5035643B95F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 20:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238259AbhJZSWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 14:22:36 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:19746 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236622AbhJZSW0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 14:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635272402; x=1666808402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=9F6ndHarAVUhGg1jtbfIy+tm1Iuqe+qhI3p206Exjg8=;
  b=rhGdRAYvwHC2e7A9NkTTETFazpbopVU95PbWBa4v/2mXVsE+1xKDkY7n
   adOWJjKHcrgTUNqV1sj1KUzIXEXGkZqwrTQfYPplyD5wvVyxiUomF2Cjs
   J2qzQY8fGJD8F4qanozw/ove4ElHZsZlyWUbWrGzq3q+gI0fF0dp2WhY/
   A=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 11:20:02 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2021 11:20:02 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 26 Oct 2021 11:19:56 -0700
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: [PATCH 2/3] usb: host: xhci-plat: Add device property to set XHCI_SKIP_PHY_INIT quirk
Date:   Tue, 26 Oct 2021 23:49:31 +0530
Message-ID: <1635272372-9982-3-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635272372-9982-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1635272372-9982-1-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device property usb-skip-phy-init to check and set XHCI_SKIP_PHY_INIT
quirk.

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c1edcc9..2a45f89 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -323,6 +323,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev, "usb-skip-phy-init"))
+			xhci->quirks |= XHCI_SKIP_PHY_INIT;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
-- 
2.7.4

