Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07BD3DAAB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 20:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbhG2SFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 14:05:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63575 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231622AbhG2SFd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 14:05:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627581930; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zEf+GUHAHyaCP4W1RkCUAiFeqiR9geQkwyVoYKLbl4E=; b=j/fsbKSCV1mi8FB4OGd2HYCtIRMKaCPeaKLVck+eYHlDpwdI9md+ClouEeBtn9hhWLkHSh7B
 C6EZcbwIiM0DDjlWkNKM1JDPR18n+AiKORJpmGuu/dqSQ+oLZJTm8Uov2Q3Tfx76+bTJ2E8w
 W9mB6ToNWM1c/PlUKFul7vNdELQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6102eddb1dd16c87885dfd29 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 18:05:15
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6CBC2C433F1; Thu, 29 Jul 2021 18:05:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B90F1C4323A;
        Thu, 29 Jul 2021 18:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B90F1C4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mka@chromium.org
Cc:     viresh.kumar@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dianders@chromium.org, tdas@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sc7280: Fixup the cpufreq node
Date:   Thu, 29 Jul 2021 23:34:44 +0530
Message-Id: <1627581885-32165-4-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627581885-32165-1-git-send-email-sibis@codeaurora.org>
References: <1627581885-32165-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixup the register regions used by the cpufreq node on SC7280 SoC to
support per core L3 DCVS.

Fixes: 7dbd121a2c58 ("arm64: dts: qcom: sc7280: Add cpufreq hw node")
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 5764c5b5cae1..ddb8697aff9f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1829,9 +1829,9 @@
 
 		cpufreq_hw: cpufreq@18591000 {
 			compatible = "qcom,cpufreq-epss";
-			reg = <0 0x18591000 0 0x1000>,
-			      <0 0x18592000 0 0x1000>,
-			      <0 0x18593000 0 0x1000>;
+			reg = <0 0x18591100 0 0x900>,
+			      <0 0x18592100 0 0x900>,
+			      <0 0x18593100 0 0x900>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
 			clock-names = "xo", "alternate";
 			#freq-domain-cells = <1>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

