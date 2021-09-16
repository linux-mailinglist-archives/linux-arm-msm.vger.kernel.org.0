Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0237040DC02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 16:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237018AbhIPOBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 10:01:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:47126 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236822AbhIPOB2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 10:01:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631800808; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=I5z7NRG7RvJa4jKHVPGL8/xmVoB4Vn3a0Vc9VxthTQA=; b=Rwg+gDqk6lngVzPv0L+foS3R5X4rKZkNScpNn05sgXvwbcduBm/I5p2HtVI+yUxcbFcNEqoA
 USZ5+tLuAzvKVvmdqdMYXNft+KYFsjvHN7afDnkb0GcMCxTvnIslfDptbW0TXclHRjIwKuAa
 hIaAnxGVhxKYBOJl7Y6/GE63Rko=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61434dd7bd6681d8eda4f72d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 13:59:51
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 91383C4360C; Thu, 16 Sep 2021 13:59:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B256C43616;
        Thu, 16 Sep 2021 13:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2B256C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v7 01/13] dt-bindings: soc: qcom: aoss: Drop the load state power-domain
Date:   Thu, 16 Sep 2021 19:29:18 +0530
Message-Id: <1631800770-371-2-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The power-domains exposed by AOSS QMP node are used to notify the Always
on Subsystem (AOSS) that a particular co-processor is up/down. These
co-processors enter low-power modes independent to that of the application
processor and their states are expected to remain unaltered across system
suspend/resume cycles. To achieve this behavior let's drop the load
power-domain and replace them with generic qmp_send interface instead.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 1904612fad85..e2e173dfada7 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -19,8 +19,7 @@ description:
 
   The AOSS side channel exposes control over a set of resources, used to control
   a set of debug related clocks and to affect the low power state of resources
-  related to the secondary subsystems. These resources are exposed as a set of
-  power-domains.
+  related to the secondary subsystems.
 
 properties:
   compatible:
@@ -58,13 +57,6 @@ properties:
     description:
       The single clock represents the QDSS clock.
 
-  "#power-domain-cells":
-    const: 1
-    description: |
-        The provided power-domains are:
-        CDSP state (0), LPASS state (1), modem state (2), SLPI
-        state (3), SPSS state (4) and Venus state (5).
-
 required:
   - compatible
   - reg
@@ -102,7 +94,6 @@ examples:
       mboxes = <&apss_shared 0>;
 
       #clock-cells = <0>;
-      #power-domain-cells = <1>;
 
       cx_cdev: cx {
         #cooling-cells = <2>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

