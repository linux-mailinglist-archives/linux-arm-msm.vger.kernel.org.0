Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786EE45D893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 11:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349870AbhKYLC3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 06:02:29 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:27676 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350033AbhKYLA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 06:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637837837; x=1669373837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=LWoxzXrShwI0QzdFIByhcep4gH5Efw+MaC4bA1TweYM=;
  b=VEoCeRnZ4zQ8GdpvTz1GdaEw8GOBDXdnTtM87nRByit1VRHbjdTZ9FZ/
   f7y189SH2eusBQqgUwXrAbOTIB7CvlMpsIF7+j794mzQJ987ySP1i/iB+
   XHK5KwPKXbUG7f/wV0OY1j/aI3v2o+p11u87QDTEcmvDkv45mWXxiiygN
   I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Nov 2021 02:57:17 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 02:57:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 02:57:16 -0800
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 02:57:12 -0800
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
Subject: [PATCH 1/2] arm64: qcom: sc7280: Remove USB2 controller and phy nodes from common dtsi
Date:   Thu, 25 Nov 2021 16:26:54 +0530
Message-ID: <1637837815-8532-2-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637837815-8532-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1637837815-8532-1-git-send-email-quic_c_sanm@quicinc.com>
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

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index d623d71..c54ad62 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -398,22 +398,6 @@
 	vdda-pll-supply = <&vreg_l1b_0p8>;
 };
 
-&usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
-	dr_mode = "peripheral";
-};
-
-&usb_2_hsphy {
-	status = "okay";
-
-	vdda-pll-supply = <&vreg_l10c_0p8>;
-	vdda33-supply = <&vreg_l2b_3p0>;
-	vdda18-supply = <&vreg_l1c_1p8>;
-};
-
 &uart7 {
 	status = "okay";
 
-- 
2.7.4

