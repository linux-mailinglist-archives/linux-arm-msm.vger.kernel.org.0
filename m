Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3054564AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 22:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbhKRVF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 16:05:58 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:36946 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233120AbhKRVFy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 16:05:54 -0500
Received: from localhost.localdomain (ip-213-127-109-54.ip.prioritytelecom.net [213.127.109.54])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id BD6B9CADFF;
        Thu, 18 Nov 2021 21:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1637269372; bh=p1hst4gpIVKupZAuytjyoSn3oOA9pER7aVHo2xuyQS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=a5iAkFFrpBvkoivXS8ulJ+ouiqbx+ONmvP7hvSFSyRUsMLctSepJ6/UKFGEChRAS+
         ZwLhXQq7/g1tZxQjzd+Iv3vIYyBVRFMI8/EJfHUZcwrL6fN6oz1g8kzftrNVU0Szwi
         lo/4Ar0Rmsp4kTxjWGoxcuPUfRDP2WTI07aZv5BI=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: qcom: pm8226: add smbb charger node
Date:   Thu, 18 Nov 2021 22:02:06 +0100
Message-Id: <20211118210210.160895-3-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211118210210.160895-1-luca@z3ntu.xyz>
References: <20211118210210.160895-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node for the battery charger included in pm8226.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-pm8226.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
index dddb5150dfd7..666bc6350c50 100644
--- a/arch/arm/boot/dts/qcom-pm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
@@ -16,6 +16,29 @@ pwrkey@800 {
 			debounce = <15625>;
 			bias-pull-up;
 		};
+
+		smbb: charger@1000 {
+			compatible = "qcom,pm8226-charger";
+			reg = <0x1000>;
+			interrupts = <0x0 0x10 7 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x10 5 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x10 4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x12 1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x12 0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x13 2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x13 1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x14 1 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "chg-done",
+					  "chg-fast",
+					  "chg-trkl",
+					  "bat-temp-ok",
+					  "bat-present",
+					  "chg-gone",
+					  "usb-valid",
+					  "dc-valid";
+
+			chg_otg: otg-vbus { };
+		};
 	};
 
 	pm8226_1: pm8226@1 {
-- 
2.34.0

