Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7160A1555EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 11:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgBGKjk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 05:39:40 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:21853 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726999AbgBGKjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 05:39:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581071979; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8SA8ehciD7y6aJS/ZzpFCj7wcIPwQZR49u7HDZf+h04=; b=qYVjJyLvqmn5eG3yMZh2urj3csMe587W8HnYuTyFuEDXYC56cp+oA5XMfngV+X2eqNAukyPh
 E/G/lyaJ5FMfjoWjJoI8Qib/opjvpGezxLXLoKWVbuMAN6bRBTUbHO9lOmYJSIr8PF+vrPZE
 +M/nXmgkRU7j8QKKnfifyoOzxmQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d3e6a.7f4e520f6b20-smtp-out-n02;
 Fri, 07 Feb 2020 10:39:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0E976C447A0; Fri,  7 Feb 2020 10:39:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96364C433CB;
        Fri,  7 Feb 2020 10:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 96364C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>,
        robh@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 1/2] dt-bindings: clk: qcom: Add support for GPU GX GDSCR
Date:   Fri,  7 Feb 2020 16:09:18 +0530
Message-Id: <1581071959-29492-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the cases where the GPU SW requires to use the GX GDSCR add
support for the same.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 include/dt-bindings/clock/qcom,gpucc-sc7180.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gpucc-sc7180.h b/include/dt-bindings/clock/qcom,gpucc-sc7180.h
index 0e4643b..65e706d 100644
--- a/include/dt-bindings/clock/qcom,gpucc-sc7180.h
+++ b/include/dt-bindings/clock/qcom,gpucc-sc7180.h
@@ -15,7 +15,8 @@
 #define GPU_CC_CXO_CLK			6
 #define GPU_CC_GMU_CLK_SRC		7

-/* CAM_CC GDSCRs */
+/* GPU_CC GDSCRs */
 #define CX_GDSC				0
+#define GX_GDSC				1

 #endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
