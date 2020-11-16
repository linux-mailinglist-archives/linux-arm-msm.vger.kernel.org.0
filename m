Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0AD2B42E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 12:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgKPLeQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 06:34:16 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:25133 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728928AbgKPLeP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 06:34:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605526454; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4R/SJz4piuEq/2FZIirdd0xK/g3RiqqG2lw5ozxZmT4=; b=UUL2VaFr78w7kFlOjCXfYOinWWvWFXgtnYPNBm5nHrtmt7FaCWiq5alLZ3lwhePoRXn+l0C9
 /TNuPOFNirL+dGyjxRjfvYC1n3GKsWbrWZ+wGLpBOmZS4IJn+wDt349VQGaqGVQiiDjuilao
 CCypWOpW605AtkujLXaiaBL2Weo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fb263988e090a888661d955 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 11:33:44
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11277C433ED; Mon, 16 Nov 2020 11:33:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CAB1AC43460;
        Mon, 16 Nov 2020 11:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CAB1AC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH] Asoc: qcom: dts: Change MI2S GPIO configuration to pulldown
Date:   Mon, 16 Nov 2020 17:03:28 +0530
Message-Id: <1605526408-15671-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Change LPASS MI2S gpio configuration to pull down from pull up.

Fixes: 9b72f4e6a3f8 (arm64: dts: qcom: sc7180: Add lpass cpu node for I2S driver)

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 802ea0a..b0419e0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1751,8 +1751,8 @@
 
 				pinconf {
 					pins = "gpio49", "gpio50", "gpio51";
-					drive-strength = <8>;
-					bias-pull-up;
+					drive-strength = <2>;
+					bias-pull-down;
 				};
 			};
 
@@ -1764,8 +1764,8 @@
 
 				pinconf {
 					pins = "gpio53", "gpio54", "gpio55", "gpio56";
-					drive-strength = <8>;
-					bias-pull-up;
+					drive-strength = <2>;
+					bias-pull-down;
 				};
 			};
 
@@ -1777,8 +1777,8 @@
 
 				pinconf {
 					pins = "gpio57";
-					drive-strength = <8>;
-					bias-pull-up;
+					drive-strength = <2>;
+					bias-pull-down;
 				};
 			};
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

