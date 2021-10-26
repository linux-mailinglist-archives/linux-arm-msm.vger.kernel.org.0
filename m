Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9FEF43B95B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 20:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238240AbhJZSWc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 14:22:32 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:4099 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238270AbhJZSWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 14:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635272393; x=1666808393;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Q2bZm+M9LPNA9PRwSmsHhCtNkExJgxbpQm2azeVP3H4=;
  b=pcz0CnljwMWuyLuCfwkBgnUlxQ/oZrIkj0CXIi8vr29AKewBrvohrSzj
   lRgZaZOSTAI80QW9972wMGa6CSw11l+TgdS8D1uPMTsAErSm7m6H0oZAm
   tOzFXI6SjULi2+0s2R7rl/nzu6slJamTs+cvl7m/HUXUUmySHxYTI6Kv8
   s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 11:19:52 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2021 11:19:51 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 26 Oct 2021 11:19:46 -0700
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
Subject: [PATCH 0/3] Skip phy initialization for DWC3 USB Controllers
Date:   Tue, 26 Oct 2021 23:49:29 +0530
Message-ID: <1635272372-9982-1-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DWC3 manages PHY by own driver, so skip the management by HCD core.

Sandeep Maheswaram (3):
  dt-bindings: usb: usb-xhci: Add bindings for usb-skip-phy-init
    property
  usb: host: xhci-plat: Add device property to set XHCI_SKIP_PHY_INIT
    quirk
  usb: dwc: host: Set the property usb-skip-phy-init

 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
 drivers/usb/dwc3/host.c                             | 2 ++
 drivers/usb/host/xhci-plat.c                        | 3 +++
 3 files changed, 9 insertions(+)

-- 
2.7.4

