Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0BE73DAABF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 20:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhG2SGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 14:06:05 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30056 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbhG2SGE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 14:06:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627581960; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PLW/47MBI7lmzQDOwAD0iszRmpCfxwkuMIi69UJPeG4=; b=wyCRL/KsL6T3leOzoqbjZYzMAXSf+dz40owEzyIkbaMqVl7cBf0AU/RBhd94I9AIXvrmYeG8
 0J07JGPBTsVFQKhotn7B7vu5oORJ2bc/CvooBqh5usaz5nkMYvX9ZZmS0uBj8Bg3RrG+4HC3
 HNpCHBrrg7s4xIKC1BYt6BckZNY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6102eddf4815712f3ade39b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 18:05:19
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7C16EC433D3; Thu, 29 Jul 2021 18:05:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3FE23C43217;
        Thu, 29 Jul 2021 18:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3FE23C43217
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
Subject: [PATCH 4/4] arm64: dts: qcom: sm8350: Fixup the cpufreq node
Date:   Thu, 29 Jul 2021 23:34:45 +0530
Message-Id: <1627581885-32165-5-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627581885-32165-1-git-send-email-sibis@codeaurora.org>
References: <1627581885-32165-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixup the register regions used by the cpufreq node on SM8350 SoC to
support per core L3 DCVS.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a631d58166b1..d0a5a5568602 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -967,11 +967,10 @@
 		};
 
 		cpufreq_hw: cpufreq@18591000 {
-			compatible = "qcom,sm8350-cpufreq-epss", "qcom,cpufreq-epss";
-			reg = <0 0x18591000 0 0x1000>,
-			      <0 0x18592000 0 0x1000>,
-			      <0 0x18593000 0 0x1000>;
-			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
+			compatible = "qcom,cpufreq-epss";
+			reg = <0 0x18591100 0 0x900>,
+			      <0 0x18592100 0 0x900>,
+			      <0 0x18593100 0 0x900>;
 
 			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
 			clock-names = "xo", "alternate";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

