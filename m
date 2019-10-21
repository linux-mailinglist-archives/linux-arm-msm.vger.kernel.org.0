Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB512DE4EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfJUG4P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:56:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34952 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUG4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:56:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 15EDD607EB; Mon, 21 Oct 2019 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640974;
        bh=M0XSthhFfWfi3Ks5ZtKfWZuTLFeAs8nLz1N9/9ijyDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nscMWv2rtSWPUE9Sf4Sm8/rdL/4fK46aUQ9hhyVWx3qh78wFB55zf7Te+5z5xGe+3
         0Sgd3IZ0wiw4vS/A+xKtbMRIEVdaz/RK9lea+DvOpNwJ17t1jKv3EjBEjwTViVU/hE
         Ia+DwQDWaukITXzMXrNrMDOwOqWOs4SG4qLbd9Tg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E4E460540;
        Mon, 21 Oct 2019 06:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640973;
        bh=M0XSthhFfWfi3Ks5ZtKfWZuTLFeAs8nLz1N9/9ijyDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nxzez3bIK3BzEwrknQITZbJ20peGGURLtSIJvN5Z4vd958T8QojLxB5gk2PebTYAq
         nrAc0KjW/GY6aGFIohQByirVgK5PFBb4MLeo3gkR22GrRwjisH57/Nh14ytIr/PZfe
         7NOmhRCMdfxgJQ7nd79UvXDIhr8UBeD4lmL+yRmo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E4E460540
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 03/13] dt-bindings: arm-smmu: update binding for qcom sc7180 SoC
Date:   Mon, 21 Oct 2019 12:25:12 +0530
Message-Id: <20191021065522.24511-4-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021065522.24511-1-rnayak@codeaurora.org>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
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
v2: No change

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

