Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABD42DAA42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 10:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgLOJk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 04:40:29 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:55040 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgLOJkW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 04:40:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608025199; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=DZiZhxU+QmjBSyrstkdH+KF2DMyVDP0z9SD2r4wUhaY=; b=fcH45Ec5W+4NwdjdJDH9IY6YWhKDfREQm8WdcIgPrgECL9ILlXoyu6XHT/6n0y7Er9bj2zTF
 dePyLAaQxxiWc+r4iTsV2yvJbmcHW3TSjA/2RXyNC5E7NS6w3ijubzz5zXl2xsxQjlvDW11N
 /jUoVEOTjFc9j1lCbI5bOHmQHqU=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fd8844d7342d6edfd94d4e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Dec 2020 09:39:25
 GMT
Sender: manafm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D04AC43463; Tue, 15 Dec 2020 09:39:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: manafm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B9DAC433ED;
        Tue, 15 Dec 2020 09:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B9DAC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=manafm@codeaurora.org
From:   Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Enable passive polling for cpu thermal zones
Date:   Tue, 15 Dec 2020 15:09:10 +0530
Message-Id: <1608025150-10779-1-git-send-email-manafm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable passive polling delay for cpu thermal zone for sc7180. It
enables periodic thermal zone re-evaluation on post first trip
temperature violation.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 98050b3..79d0747 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -4355,7 +4355,7 @@
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 1>;
@@ -4403,7 +4403,7 @@
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 2>;
@@ -4451,7 +4451,7 @@
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 3>;
@@ -4499,7 +4499,7 @@
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 4>;
@@ -4547,7 +4547,7 @@
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 5>;
@@ -4595,7 +4595,7 @@
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 6>;
@@ -4643,7 +4643,7 @@
 		};
 
 		cpu6-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 9>;
@@ -4683,7 +4683,7 @@
 		};
 
 		cpu7-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 10>;
@@ -4723,7 +4723,7 @@
 		};
 
 		cpu8-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 11>;
@@ -4763,7 +4763,7 @@
 		};
 
 		cpu9-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <50>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 12>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

