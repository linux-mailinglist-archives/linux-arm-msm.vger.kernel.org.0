Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F35C9767D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 11:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbfHUJzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 05:55:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41150 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfHUJzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 05:55:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0944961156; Wed, 21 Aug 2019 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381305;
        bh=M4QvQKNwTCeogOruLJL18+5CPq7Ebj/0WayZROehIOk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BzYzyZVZ+YlMYGraIPW+vvTn5rTZth1jjfdV3GRNkBj48509ufMoVwQ9IF2iVlSKR
         zNJhw/FPyB75I6OYRb2IFP+u2vc81zbUosS/r3W/GGNDVPI52F2WICbt1gU8cp0zWw
         tBN3fovAOghIs3zqifIqc5gBJNtU9aveiEprE7SY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6FADE60EA5;
        Wed, 21 Aug 2019 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381304;
        bh=M4QvQKNwTCeogOruLJL18+5CPq7Ebj/0WayZROehIOk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BklWjrZZiZwQZQJ+Boa9gejaItzoRNJpLdnsFvzRXkUWzZGbNTBP8gYzDaPg3Z8Rg
         Yrj4I74JbTlq8NEGaQW08A8L1POK4lkitg6unefGKFOR4uIZT3FA/67bVLSadCeAbV
         Y2PogcBs6S2bCLBvfve3/SbwGt2jKiLhCNgXok5w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6FADE60EA5
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/4] dt-bindings: reset: pdc: Add PDC Global binding for SC7180 SoCs
Date:   Wed, 21 Aug 2019 15:24:41 +0530
Message-Id: <20190821095442.24495-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190821095442.24495-1-sibis@codeaurora.org>
References: <20190821095442.24495-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SC7180 PDC global to the list of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
index a62a492843e70..1f1ff280b2d69 100644
--- a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
+++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
@@ -8,7 +8,8 @@ Required properties:
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be:
+	Definition: must be one of:
+		    "qcom,sc7180-pdc-global"
 		    "qcom,sdm845-pdc-global"
 
 - reg:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

