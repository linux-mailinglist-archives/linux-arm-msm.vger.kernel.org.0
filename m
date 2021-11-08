Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79192447A88
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 07:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236331AbhKHGoz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 01:44:55 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:6190 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhKHGoy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 01:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636353731; x=1667889731;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Nti7sHlIKPzEpHCUKOFQUUxAJwFZx5QFeH2k2h9zCCc=;
  b=FIR2mo+3V50oR4iQCh9hIA88C7xx/8uXR8FEnj4qBKlWhQxVPhqRiii6
   5Zi+sCJxR1S0geEPC7ROYL2FKGC4clrNTBiMbUgFUVSj/HHW53Kk0xaIz
   O62EaH6aV1cOWozP+f3qnvmxgO7G0FeAXya2VgWFjxD422BMsVnnPnx0X
   w=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 07 Nov 2021 22:42:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2021 22:42:09 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Sun, 7 Nov 2021 22:42:09 -0800
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Sun, 7 Nov 2021 22:42:04 -0800
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
Subject: [PATCH v2 0/3] Skip phy initialization for DWC3 USB Controllers
Date:   Mon, 8 Nov 2021 12:11:47 +0530
Message-ID: <1636353710-25582-1-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
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

v2:
Updated the commit descriptions.
Changed subject prefix from dwc to dwc3.
Increased props array size.

Sandeep Maheswaram (3):
  dt-bindings: usb: usb-xhci: Add bindings for usb-skip-phy-init
    property
  usb: host: xhci-plat: Add device property to set XHCI_SKIP_PHY_INIT
    quirk
  usb: dwc3: host: Set the property usb-skip-phy-init

 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
 drivers/usb/dwc3/host.c                             | 4 +++-
 drivers/usb/host/xhci-plat.c                        | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.7.4

