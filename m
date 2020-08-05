Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFE823CE02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 20:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgHESFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 14:05:42 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:62074 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729165AbgHESDi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 14:03:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596650582; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wDrn6qZ0UEY+b7/V0j8agr4SjPY1RYQe65RUiGn653k=; b=fk8PImoSiRdhxn8Ro0i//lYIv0WZ+Z0fExVfzEvOlmRdlR7hUCas6sZLHpyr8YHVNSQ8S3g6
 o1HcOFjCdXjuJ3NJMa+vhaKki3pdvsEuVbLLTwhaIe/qBjcpNQ7n7SpWqF1L6uIDXyMVNtV4
 JWUxfRIhST6hu3KbLo3pFybyktg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-west-2.postgun.com with SMTP id
 5f2af44d5a221ff37b3f5413 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 05 Aug 2020 18:02:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3297CC433CA; Wed,  5 Aug 2020 18:02:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 778BAC433C6;
        Wed,  5 Aug 2020 18:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 778BAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kathirav@codeaurora.org
Subject: [PATCH] arm64: dts: ipq8074: Use the A53 PMU compatible
Date:   Wed,  5 Aug 2020 23:32:41 +0530
Message-Id: <1596650561-11312-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 has A53 cores, so lets use the corresponding PMU compatible.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 96a5ec89b5f0..e4859c7f6208 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -67,7 +67,7 @@
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

