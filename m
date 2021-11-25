Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6A945D88D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 11:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349526AbhKYLC0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 06:02:26 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:27669 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349870AbhKYLA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 06:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637837835; x=1669373835;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=amCIHawtN/pC9ZDAKPBFZV2qD9VS958Y5zjo1xIWmTc=;
  b=kiqNKO+BF1q2C7iVk2fVFIo+dFrnadovH2FZ+Tjao778TZboJ1WGYcXA
   dSY1SynrzYaXAicoE6Yns+cPszYsw/P+MZW5aMGEfypy0rgxFsjBWp2iY
   t2GdwuFRYrceC+RFRzEL3mOVEFuVCbcdFzhoWCrxdgzJh/w97xqTuC+yU
   E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Nov 2021 02:57:14 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 02:57:14 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 02:57:12 -0800
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 02:57:07 -0800
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
CC:     <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: [PATCH 0/2] Remove USB2 nodes from SC7280 IDP common dtsi file
Date:   Thu, 25 Nov 2021 16:26:53 +0530
Message-ID: <1637837815-8532-1-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove USB2 controller and phy nodes from common dtsi file as it is
required only for SKU1 board.
Add these nodes in SKU1 dtsi file.

Sandeep Maheswaram (2):
  arm64: qcom: sc7280: Remove USB2 controller and phy nodes from common
    dtsi
  arm64: qcom: sc7280: Add USB2 controller and phy nodes for SKU1 board

 arch/arm64/boot/dts/qcom/sc7280-idp.dts  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.7.4

