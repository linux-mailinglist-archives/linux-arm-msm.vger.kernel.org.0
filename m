Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63A132B237
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242041AbhCCBPG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:15:06 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:62184 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381417AbhCBH34 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 02:29:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614670147; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5HUNDyh7jVQOcJGyQ6H1XmiYHVuP2wQCg/ffkR2kRfg=; b=mlIzlvDmRiO3EExXQ7aD4dqVnBsY7L8+tl092/uHzuo7+FNmtWJqF7uiEPOf0aVSfYBq9mO6
 weyIwV7Q9slURdNfMGpUNxxddm+vB1GtQ2mV6lnQ5l7gL42mS554o51AEBk4MP8c9lRmpAKn
 Gky8PboY0YXnqpR3Qoh4cpN1b2I=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 603de91b6bfdd67a0095e68d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Mar 2021 07:28:27
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 12B72C43466; Tue,  2 Mar 2021 07:28:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E14B6C433ED;
        Tue,  2 Mar 2021 07:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E14B6C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 2/4] arm64: dts: qcom: sdm845: Rename the qmp node to power-controller
Date:   Tue,  2 Mar 2021 12:58:02 +0530
Message-Id: <55416e116dda4aad977bb050451d328b1f6b00d3.1614669585.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1614669585.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614669585.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the generic DT node name "power-controller" for AOSS message ram
instead of the protocol name QMP(Qualcomm Messaging Protocol) since
it is used for power management requests.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..8acc731b58a3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4428,7 +4428,7 @@ aoss_reset: reset-controller@c2a0000 {
 			#reset-cells = <1>;
 		};
 
-		aoss_qmp: qmp@c300000 {
+		aoss_qmp: power-controller@c300000 {
 			compatible = "qcom,sdm845-aoss-qmp";
 			reg = <0 0x0c300000 0 0x100000>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

