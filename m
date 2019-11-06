Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1975EF0F2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 07:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731097AbfKFGvD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 01:51:03 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45094 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfKFGvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 01:51:03 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 981096121B; Wed,  6 Nov 2019 06:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023062;
        bh=V4WmtBm/quYvY+EKwMP2zlhtoRoFHftEBTZz5MhvZgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YOJHg07/HNe4hLGSabykHCfX+TMfqdplbC94XlldRODft7oax4MIOW46aFJ6s9Eth
         8LgwwFFVARX5jL4L4Q4DkXubXfXlWuduKEG9jS2rmGkv7ixafZT/JwBfKrhUPoQzfL
         Pd47b78+mx5mW2zF+smLPMzORtHjwY8Fd6wW86ik=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DC6C6121B;
        Wed,  6 Nov 2019 06:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023061;
        bh=V4WmtBm/quYvY+EKwMP2zlhtoRoFHftEBTZz5MhvZgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cjc1fz3FJEu2cnIr3s7nH50g6X3QL9O4dPU6tpsAzvsqCgWdzhjoshHlGlDpstncZ
         MCC9weyv5Bh2EpQeIxUB1F4oVI+K3kGZ7idHjUu7qy3+XZVbNO7Bb0d7iUH4mOM5sm
         jE513FP9Or37Ow76qov+kw6oobyXRVfOOxADZLi0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1DC6C6121B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 03/14] dt-bindings: arm-smmu: update binding for qcom sc7180 SoC
Date:   Wed,  6 Nov 2019 12:20:06 +0530
Message-Id: <20191106065017.22144-4-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191106065017.22144-1-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the soc specific compatible for sc7180 smmu-500

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Mark Rutland <mark.rutland@arm.com>
---
v4: Updated yaml, sorted.

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 3b31b4802a54..6515dbe47508 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -34,6 +34,7 @@ properties:
       - description: Qcom SoCs implementing "arm,mmu-500"
         items:
           - enum:
+              - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
           - const: arm,mmu-500
       - items:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

