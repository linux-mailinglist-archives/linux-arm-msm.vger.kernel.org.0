Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5616A1490E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 23:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729248AbgAXWcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 17:32:43 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:23172 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729074AbgAXWci (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 17:32:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579905157; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=FVjFxHUDub6SbAvYfGEAxOkKwiZBycsgDmoJKCRC37k=; b=m/MmEU1c7xBxobqM0BjmjJfbSMGAEB58ZzXUYpPwSGAphgs40dLheBdI8AC1D/RVBBTVrCFC
 rE2ivU3pceHHnK6wnvWQYsovylMBpWgz8CjY7KyE3PO9m7qbIXhgaUqjKJtpsqRiWjqcXnsv
 xJDHIK2e2zb4OhVXmkjg1Zh7jIQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2b7085.7f8efddc3340-smtp-out-n02;
 Fri, 24 Jan 2020 22:32:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B627FC447AA; Fri, 24 Jan 2020 22:32:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vgutta-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vgutta)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BB76C433CB;
        Fri, 24 Jan 2020 22:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9BB76C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vnkgutta@codeaurora.org
From:   Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/7] dt-bindings: clock: Add RPMHCC bindings for SM8250
Date:   Fri, 24 Jan 2020 14:32:21 -0800
Message-Id: <1579905147-12142-2-git-send-email-vnkgutta@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

Add bindings and update documentation for clock rpmh driver on SM8250.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 94e2f14..21398d1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,sc7180-rpmh-clk
       - qcom,sdm845-rpmh-clk
       - qcom,sm8150-rpmh-clk
+      - qcom,sm8250-rpmh-clk
 
   clocks:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index edcab3f..2e6c54e 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2018, 2020, The Linux Foundation. All rights reserved. */
 
 
 #ifndef _DT_BINDINGS_CLK_MSM_RPMH_H
@@ -19,5 +19,7 @@
 #define RPMH_RF_CLK3				10
 #define RPMH_RF_CLK3_A				11
 #define RPMH_IPA_CLK				12
+#define RPMH_LN_BB_CLK1				13
+#define RPMH_LN_BB_CLK1_A			14
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
