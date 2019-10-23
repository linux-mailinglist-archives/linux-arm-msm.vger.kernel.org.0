Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D828DE1514
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 11:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390590AbfJWJCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 05:02:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41972 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390708AbfJWJCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 05:02:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8189460D7D; Wed, 23 Oct 2019 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821373;
        bh=F0rUzHr644YUCpGYNrm4/b45IlRQL1QeDT//bfPmztk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hPC2F6HPKsIyCWw9B5Kv6/UmA4Tg17brpnYp9a6nnvwYZOHBbIqX5X6kB6Kv2rT9O
         oCqBtUPE62dCGhTNog4AASpw8NDp/JQbLN2kKAtm/q30TM43ICapHZ9gfSwGkG7zYy
         QuIbGwPfiu1RzhrXynBhH562kzOOz2ke18bfMlv0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 998DB60B16;
        Wed, 23 Oct 2019 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821370;
        bh=F0rUzHr644YUCpGYNrm4/b45IlRQL1QeDT//bfPmztk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YTtos7jR7aDIVDwYgV2ugZih/aMQasZOSwJRMqhHlmhKAMJ4ETtusJNP+SpwIJ/a+
         y6YdO6z7h3TUGPtH9NHZR10c2VipggKu/tSPmEwUdtWGOHistIo5uJhmhkXSOYm3JN
         6+T0xho92sE1eWoEAvFyfsSCNCFN/d58uPkTOeRE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 998DB60B16
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 03/11] dt-bindings: arm-smmu: update binding for qcom sc7180 SoC
Date:   Wed, 23 Oct 2019 14:32:11 +0530
Message-Id: <20191023090219.15603-4-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191023090219.15603-1-rnayak@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
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
 Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
index 3133f3ba7567..347869807cf2 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
@@ -30,6 +30,7 @@ conditions.
                   Qcom SoCs implementing "arm,mmu-500" must also include,
                   as below, SoC-specific compatibles:
                   "qcom,sdm845-smmu-500", "arm,mmu-500"
+                  "qcom,sc7180-smmu-500", "arm,mmu-500"
 
 - reg           : Base address and size of the SMMU.
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

