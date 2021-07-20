Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617823CFFFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 19:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhGTQcs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 12:32:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55386 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235367AbhGTQ3N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 12:29:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626800991; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=JiHpBkjeEADT7ngmunMJ4OWuRk8tkxvtakVHFLJJdo4=; b=jcAINE9A9pqrYj2EPq28SdlfToGz6QN1z8xSjm6cdcvpoCcnw9T9u8Q55VtAtpX4QGI9CsbJ
 ryKqOGwiDgh6zTu1ZVaVVoKNlP2He+HWo2mU5FsFRE4eZC3BZdMVZ6tqDEqqMV87KDRbG2/W
 it6wkymFTpMwO7Ixuvw8IMJjqAY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60f7035025e5663278832b06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 17:09:36
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 530EAC43217; Tue, 20 Jul 2021 17:09:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5C7FC433D3;
        Tue, 20 Jul 2021 17:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A5C7FC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, mka@chromium.org, tdas@codeaurora.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        stable@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7280: Fixup cpufreq domain info for cpu7
Date:   Tue, 20 Jul 2021 22:39:13 +0530
Message-Id: <1626800953-613-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SC7280 SoC supports a 4-Silver/3-Gold/1-Gold+ configuration and hence
the cpu7 node should point to cpufreq domain 2 instead.

Fixes: 7dbd121a2c58 ("arm64: dts: qcom: sc7280: Add cpufreq hw node")
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a8c274ad74c4..188c5768a55a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -200,7 +200,7 @@
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			next-level-cache = <&L2_700>;
-			qcom,freq-domain = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 2>;
 			#cooling-cells = <2>;
 			L2_700: l2-cache {
 				compatible = "cache";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

