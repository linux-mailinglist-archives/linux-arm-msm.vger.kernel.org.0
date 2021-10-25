Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5082C4391FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbhJYJKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 05:10:24 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:2828 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbhJYJKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 05:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635152881; x=1666688881;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=2PkNjhUphczudseeH6pBm+cV1kX02FQKp+tuRQaRBoQ=;
  b=wJHZF7ZoevHsnMHU7NYTJl29L3elFfBoMD2RyTJd6rcvvGZuLmjHpQuV
   owkKGiq4VR7Cdc5K6JnqDWaq76HRzkeqtAbf9Q7DCLe3N41VF0L1r5rvz
   eF1S9ph3iac/dlEOW1PnU8f5SKfswtYUgOPXs/YHx5wXmaUNOq8LXXccE
   k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 02:08:00 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 02:07:59 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 25 Oct 2021 02:07:54 -0700
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>
CC:     <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: [PATCH v2 0/3] USB DWC3 QCOM Multi power domain support
Date:   Mon, 25 Oct 2021 14:37:28 +0530
Message-ID: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add multi pd support to set performance state for cx domain
to maintain minimum corner voltage for USB clocks.

Add corresponding dt bindings, driver changes and dt changes.

changes in v2:
make cx as mandatory power domain.
Added error handling and detach function.Used attach_by_id function.
Changed rpmhd_opp_svs to rmphd_opp_nom for cx domain.


Sandeep Maheswaram (3):
  dt-bindings: usb: qcom,dwc3: Add multi-pd bindings for dwc3 qcom
  usb: dwc3: qcom: Add multi-pd support
  arm64: dts: qcom: sc7280: Add cx power domain support

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  8 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  3 +-
 drivers/usb/dwc3/dwc3-qcom.c                       | 87 ++++++++++++++++++++++
 3 files changed, 96 insertions(+), 2 deletions(-)

-- 
2.7.4

