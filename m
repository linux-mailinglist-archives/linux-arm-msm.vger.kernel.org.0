Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A296338FE8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 12:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhEYKNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 06:13:36 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15371 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhEYKN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 06:13:27 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2021 03:11:58 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 May 2021 03:11:56 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 May 2021 15:41:26 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id BF1EF5031; Tue, 25 May 2021 15:41:24 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     mka@chromium.org, Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V5 04/11] arm64: dts: qcom: pm8350c: Correct the GPIO node
Date:   Tue, 25 May 2021 15:40:59 +0530
Message-Id: <1621937466-1502-5-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
References: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add gpio ranges and correct the compatible to add
"qcom,spmi-gpio" as this pmic is on spmi bus.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V5:
 - This is split from patch [3/11] and added newly in V5.

 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index f926508..e1b75ae 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -21,9 +21,10 @@
 		};
 
 		pm8350c_gpios: gpio@8800 {
-			compatible = "qcom,pm8350c-gpio";
+			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
 			gpio-controller;
+			gpio-ranges = <&pm8350c_gpios 0 0 9>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

