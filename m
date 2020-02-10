Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B184156E3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 05:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgBJEBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Feb 2020 23:01:24 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:54590 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727570AbgBJEBX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Feb 2020 23:01:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581307282; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8SA8ehciD7y6aJS/ZzpFCj7wcIPwQZR49u7HDZf+h04=; b=VteHsD3oH142P4ho/WKmU+f0HjntRf3fGUAsMI161IXRweQJjxmN3YqBe53Aou1Obpwq23JO
 oixJizZpIb8fH1hNAQT34AZ7s+OdlOyURU1Mpkt78i+1moGo42rENehPWd7YJlIf7+73Fitl
 kZ4WDhxd7QZeg+7dFgwWYga7sw8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e40d590.7effc0ed1d88-smtp-out-n02;
 Mon, 10 Feb 2020 04:01:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EC8ADC4479C; Mon, 10 Feb 2020 04:01:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A2849C43383;
        Mon, 10 Feb 2020 04:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2849C43383
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
Subject: [PATCH v2 1/2] dt-bindings: clk: qcom: Add support for GPU GX GDSCR
Date:   Mon, 10 Feb 2020 09:31:05 +0530
Message-Id: <1581307266-26989-1-git-send-email-tdas@codeaurora.org>
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
