Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03DE8447A94
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 07:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbhKHGpM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 01:45:12 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:6266 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237180AbhKHGpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 01:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636353746; x=1667889746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=NY60+9RbJmuSbzCyMdFlgec8Bnna6jLnovIzVcr/yCs=;
  b=l2CE3RS7sEqJJT+IZVmxWHpvtwr7rnRy2imEhOJR4twgxVwc3M5R7eBA
   WNVV47n4Dy+oT8KDCOaF3n6PQh/YTDFHnBizvY0VrpLrLKzXlBqSdwa+v
   xtEM7115ey8daci5/Zch1OZ1iqwlFd7V/zLM4zlPgrYEbZn4S16VPgH11
   w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 07 Nov 2021 22:42:26 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2021 22:42:25 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Sun, 7 Nov 2021 22:42:25 -0800
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Sun, 7 Nov 2021 22:42:19 -0800
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
Subject: [PATCH v2 3/3] usb: dwc3: host: Set the property usb-skip-phy-init
Date:   Mon, 8 Nov 2021 12:11:50 +0530
Message-ID: <1636353710-25582-4-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636353710-25582-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1636353710-25582-1-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Runtime suspend of phy drivers was failing from DWC3 driver as
runtime usage value is 2 because the phy is initialized from
DWC3 core and HCD core.
Some controllers like DWC3 and CDNS3 manage phy in their core drivers.
This property can be set to avoid phy initialization in HCD core.

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
v2:
Changed subject prefix from dwc to dwc3.
Increased props array size.

 drivers/usb/dwc3/host.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index f29a264..ece7912 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -44,7 +44,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[4];
+	struct property_entry	props[5];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	struct resource		*res;
@@ -107,6 +107,8 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
+	props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb-skip-phy-init");
+
 	if (prop_idx) {
 		ret = device_create_managed_software_node(&xhci->dev, props, NULL);
 		if (ret) {
-- 
2.7.4

