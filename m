Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8724C78B52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 14:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfG2MHI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 08:07:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37504 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbfG2MHG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 08:07:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 92B6460592; Mon, 29 Jul 2019 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402025;
        bh=nUW84jmRBWi/aG2R9/BTe4pKSMgNQDGoEXC+WfguHOY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HWU+zowui49YEP1umTomloUHKGkNhNz/hX736gm8I9q/DWBXn5yv9gYCaeppzOs57
         h0ypYPJvv2rGBm4Gs4ZgaiOc7kuVrUdnQNuSrGtffoRccuMn1qs0egFJOaiIXbhJZj
         OnhH4WOiUz00fbn/y3ykB/suPJibfW8bjwQawbvc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F94D60E42;
        Mon, 29 Jul 2019 12:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402025;
        bh=nUW84jmRBWi/aG2R9/BTe4pKSMgNQDGoEXC+WfguHOY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HWU+zowui49YEP1umTomloUHKGkNhNz/hX736gm8I9q/DWBXn5yv9gYCaeppzOs57
         h0ypYPJvv2rGBm4Gs4ZgaiOc7kuVrUdnQNuSrGtffoRccuMn1qs0egFJOaiIXbhJZj
         OnhH4WOiUz00fbn/y3ykB/suPJibfW8bjwQawbvc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1F94D60E42
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 5/6] dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
Date:   Mon, 29 Jul 2019 17:36:32 +0530
Message-Id: <20190729120633.20451-6-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729120633.20451-1-sibis@codeaurora.org>
References: <20190729120633.20451-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SM8150 and SC7180 AOSS QMP to the list of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
index 954ffee0a9c45..91b972c1fee57 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
@@ -15,7 +15,10 @@ power-domains.
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be "qcom,sdm845-aoss-qmp"
+	Definition: must be one of:
+		    "qcom,sdm845-aoss-qmp"
+		    "qcom,sm8150-aoss-qmp"
+		    "qcom,sc7180-aoss-qmp"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

