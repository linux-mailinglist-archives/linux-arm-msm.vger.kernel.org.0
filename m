Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B4838FE88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 12:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhEYKNc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 06:13:32 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56138 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhEYKN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 06:13:26 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2021 03:11:57 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 May 2021 03:11:54 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 May 2021 15:41:26 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 4D7F05056; Tue, 25 May 2021 15:41:25 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     mka@chromium.org, Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V5 09/11] arm64: dts: qcom: sc7280: Include PMIC DT files for sc7280-idp
Date:   Tue, 25 May 2021 15:41:04 +0530
Message-Id: <1621937466-1502-10-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
References: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc7280-idp has four PMICs, include their .dtsi files.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in RESEND V4:
 - As per Matthias comments moved this patch before 'Add ADC channel nodes
   for PMIC temperatures to sc7280-idp'

Changes in V5:
 - No changes.

 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 54d2cb3..f295580 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -8,6 +8,10 @@
 /dts-v1/;
 
 #include "sc7280.dtsi"
+#include "pm7325.dtsi"
+#include "pmr735a.dtsi"
+#include "pm8350c.dtsi"
+#include "pmk8350.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. sc7280 IDP platform";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

