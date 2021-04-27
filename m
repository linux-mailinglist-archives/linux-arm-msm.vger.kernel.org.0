Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C97636C01B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 09:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhD0He5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 03:34:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14433 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230206AbhD0He5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 03:34:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619508854; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rGmkvJffnvsem2AG8eBG4PZhzOjv87wwh4d+LNdtLwk=; b=ejKynIiSIKPfbYgpb8KTvPrO5kRelKIFvM5nz3o3Q9oU2jRAB0Bm5JoqcodC5P1i8sVqvdM5
 pjxuKWmXh8+/raIaSB3tll+uvKup0f2qZIUfzcDt2a1iZJ8ep8Z7DvxqAjQblqDc1ASJvUzL
 YLIeQ4dcE26gbRPISaraylG+iAE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6087be6f2cc44d3aea5499b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 07:34:07
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 347F4C43217; Tue, 27 Apr 2021 07:34:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1996C433F1;
        Tue, 27 Apr 2021 07:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1996C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, sboyd@kernel.org
Cc:     agross@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/5] dt-bindings: reset: aoss: Add AOSS reset controller binding
Date:   Tue, 27 Apr 2021 13:03:41 +0530
Message-Id: <1619508824-14413-3-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619508824-14413-1-git-send-email-sibis@codeaurora.org>
References: <1619508824-14413-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add AOSS reset controller bindings for SC7280 SoCs.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml
index e2d85a1e1d63..a054757f4d9f 100644
--- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml
@@ -21,6 +21,11 @@ properties:
           - const: "qcom,sc7180-aoss-cc"
           - const: "qcom,sdm845-aoss-cc"
 
+      - description: on SC7280 SoCs the following compatibles must be specified
+        items:
+          - const: "qcom,sc7280-aoss-cc"
+          - const: "qcom,sdm845-aoss-cc"
+
       - description: on SDM845 SoCs the following compatibles must be specified
         items:
           - const: "qcom,sdm845-aoss-cc"
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

