Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61EEE1844E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 11:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCMK3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 06:29:37 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:25663 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726514AbgCMK3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 06:29:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584095377; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zwyBfEdJUO8dhaPzBlME2A8euUXfo1kYJC5G8JyMx5g=; b=eO5o/YOjvQIOVPv52/y6t28CNmSXseadgCTaOeZ6dqvCwl2dQxSmZ5mafTbj6waEsyliE+w9
 P6Rl+jV2MJDDch5T/+KSMS6Gzk/exSmMu7ZncAbWLcgFSo13TfuOVAOvUqQODw3UTImJyeN5
 2Fq2UjP3A3M/h3Ijo9HP/dRmkiI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b6090.7f312662ebc8-smtp-out-n02;
 Fri, 13 Mar 2020 10:29:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 738F6C44791; Fri, 13 Mar 2020 10:29:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B63AC433CB;
        Fri, 13 Mar 2020 10:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4B63AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, c_skakit@codeaurora.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V5 2/3] dt-bindings: geni-se: Add interconnect binding for GENI QUP
Date:   Fri, 13 Mar 2020 15:59:09 +0530
Message-Id: <1584095350-841-3-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
References: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add documentation for the interconnect and interconnect-names properties
for the GENI QUP.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V5:
 - Add interconnect property for QUP wrapper (parent node).
 - Add minItems = 2 for interconnect property in child nodes

 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 23282ab..533400b 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -46,6 +46,12 @@ properties:
 
   ranges: true
 
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: qup-core
+
 required:
   - compatible
   - reg
@@ -73,6 +79,16 @@ patternProperties:
         description: Serial engine core clock needed by the device.
         maxItems: 1
 
+      interconnects:
+         minItems: 2
+         maxItems: 3
+
+      interconnect-names:
+         items:
+           - const: qup-core
+           - const: qup-config
+           - const: qup-memory
+
     required:
       - reg
       - clock-names
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
