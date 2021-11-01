Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255CD44146F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 08:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhKAH4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 03:56:37 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:3117 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231223AbhKAH4h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 03:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635753244; x=1667289244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=X+wdQRBLa1HC/CfK9EAfVpdM/vS8LjVQFtsSsB/pc90=;
  b=KundQqpW3rH/c8iwFTbWfvSURk1vcAs0v4L4vFrvvQIbt/uvSwXu9xIa
   hElGiiFNIlQ4Hh9YeRlpRSp8ohw1ELpBuor7rQKiVwswgn3gltWYw9p8f
   sxIrzFdFQa8N0E1DVbqMTSlKwmw5xmryE5ZuDMlKM51hwFh0DGIFtpUzQ
   g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Nov 2021 00:54:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 00:54:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 1 Nov 2021 00:54:02 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 1 Nov 2021 00:53:58 -0700
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
Subject: [PATCH v9 1/5] usb: host: xhci: plat: Add suspend quirk for dwc3 controller
Date:   Mon, 1 Nov 2021 13:23:40 +0530
Message-ID: <1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During suspend check if any wakeup capable devices are connected to the
controller (directly or through hubs), and set the wakeup capable property
for xhci plat device.

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
 drivers/usb/host/xhci-plat.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c1edcc9..7ab272b 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -431,6 +431,14 @@ static int xhci_plat_remove(struct platform_device *dev)
 	return 0;
 }
 
+static void xhci_dwc3_suspend_quirk(struct usb_hcd *hcd, struct device *dev)
+{
+	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
+		device_set_wakeup_capable(dev, true);
+	else
+		device_set_wakeup_capable(dev, false);
+}
+
 static int __maybe_unused xhci_plat_suspend(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
@@ -440,6 +448,10 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 	ret = xhci_priv_suspend_quirk(hcd);
 	if (ret)
 		return ret;
+
+	if (of_device_is_compatible(dev->parent->of_node, "snps,dwc3"))
+		xhci_dwc3_suspend_quirk(hcd, dev);
+
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
 	 * to do wakeup during suspend.
-- 
2.7.4

