Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB57F439207
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 11:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbhJYJKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 05:10:38 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36225 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbhJYJKh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 05:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635152896; x=1666688896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=P4bXBTYrltaXp9PhngK0POqzvllY4fXOthFXfnrTvcA=;
  b=rI0SSz027FZKTXm2hRUPFPwHSc5Bq8wiZQjF2da+eaGt7Yjf562/U6Ox
   a6yujMW5r0RgILeBQcla89+n4wM7T+WNdYjsctiFyox9A2MShHUCdunLF
   QEkpfgfnQqt0b9UCNcAoPLb1WzFKl0zvzkltNw5CtkhTeeF/jrtyppUTn
   4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 02:08:16 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 02:08:15 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 25 Oct 2021 02:08:09 -0700
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add cx power domain support
Date:   Mon, 25 Oct 2021 14:37:31 +0530
Message-ID: <1635152851-23660-4-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
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

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
v2:
Changed rpmhd_opp_svs to rmphd_opp_nom for cx domain.

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index d74a4c8..9e3b6ad 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2538,7 +2538,8 @@
 			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
 					  "dm_hs_phy_irq", "ss_phy_irq";
 
-			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			power-domains = <&rpmhpd SC7280_CX>, <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_svs>, <>;
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
-- 
2.7.4

