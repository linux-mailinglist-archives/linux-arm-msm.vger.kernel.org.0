Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9811BEED6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 06:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgD3EAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 00:00:10 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:50405 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725280AbgD3EAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 00:00:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588219209; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=h4kCJNETn7m8Ad7wR1nijxpoOjZhXlKIL1/i8b1sVbg=; b=rrqXwBJvDIijschYUKJr9fL6THeehog8PxYLGpLz0EtIUKE4a6A17IAB/WKgtWVS2X7EdcUY
 lOqDpiUTduxFbWlxB5aO69E4iUU0+fEZcYLRk4Mdlaz+Wiadj0pcEX87Zn0NRow7VXC2tbL+
 Uc7BBn7i42Elv8myjMixRxMVqwE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eaa4d44.7f3fcc4e6d18-smtp-out-n03;
 Thu, 30 Apr 2020 04:00:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C370C43637; Thu, 30 Apr 2020 04:00:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B895DC433D2;
        Thu, 30 Apr 2020 03:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B895DC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, robh@kernel.org, robin.murphy@arm.com,
        saiprakash.ranjan@codeaurora.org, jcrouse@codeaurora.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH v2] dt-bindings: arm-smmu: Add sc7180 compatible string and mem_iface clock
Date:   Thu, 30 Apr 2020 09:29:47 +0530
Message-Id: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds a new compatible string for sc7180 and also an
additional clock listing needed to power the TBUs and the TCU.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
v2: Addressed review comments from Doug

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6515dbe..ba5dba4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - qcom,msm8996-smmu-v2
               - qcom,msm8998-smmu-v2
+              - qcom,sc7180-smmu-v2
               - qcom,sdm845-smmu-v2
           - const: qcom,smmu-v2

@@ -113,16 +114,23 @@ properties:
       present in such cases.

   clock-names:
+    minItems: 2
+    maxItems: 3
     items:
       - const: bus
       - const: iface
+      - const: mem_iface

   clocks:
+    minItems: 2
+    maxItems: 3
     items:
       - description: bus clock required for downstream bus access and for the
           smmu ptw
       - description: interface clock required to access smmu's registers
           through the TCU's programming interface.
+      - description: clock required for the inner working of SMMU TBUs and the
+          TCU like the pagetable walks and the TLB flushes.

   power-domains:
     maxItems: 1
--
1.9.1
