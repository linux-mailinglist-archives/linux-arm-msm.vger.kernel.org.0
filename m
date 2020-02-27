Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5019171575
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 11:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbgB0K5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 05:57:18 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:17149 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728954AbgB0K5S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 05:57:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582801037; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=sjA8xjgdSuzT+3bcqBAE9RgoMUeLbDLPxtAnZ/QtR2E=; b=JsjLxqFtT0u1JBCx/UXY15YuNnj2Ip45MOCbLje3DRmgjM0NkJ50OYSw4SWpgRv0WMN2aNUd
 lOdADz8/9jD6abzMO8BueWbst2qur7CbFxCKkYIqBUQQvfaQpCrOjtRCO49NH6O+987plNqH
 zjrGBmvV9jeyvb4belC8YJ6AU8Q=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e57a08d.7f8aa3e3c880-smtp-out-n02;
 Thu, 27 Feb 2020 10:57:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BAF37C43383; Thu, 27 Feb 2020 10:57:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CC45AC447A0;
        Thu, 27 Feb 2020 10:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CC45AC447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        saravanak@google.com, viresh.kumar@linaro.org,
        okukatla@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 6/7] arm64: dts: qcom: sdm845: Add OSM L3 interconnect provider
Date:   Thu, 27 Feb 2020 16:26:30 +0530
Message-Id: <20200227105632.15041-7-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227105632.15041-1-sibis@codeaurora.org>
References: <20200227105632.15041-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Operation State Manager (OSM) L3 interconnect provider on SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ae7d6617d8b87..8105532f6fbde 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,lpass-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sdm845.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sdm845.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
@@ -3323,6 +3324,16 @@ frame@17d10000 {
 			};
 		};
 
+		osm_l3: interconnect@17d41000 {
+			compatible = "qcom,sdm845-osm-l3";
+			reg = <0 0x17d41000 0 0x1400>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@17d43000 {
 			compatible = "qcom,cpufreq-hw";
 			reg = <0 0x17d43000 0 0x1400>, <0 0x17d45800 0 0x1400>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
