Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE836232EEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 10:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgG3It5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 04:49:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29066 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729191AbgG3Ity (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 04:49:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596098993; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=eFEMaGgrk8KQwHR4OIYPqIq3dwkqBdgBqS8Ibp3ICP4=; b=UldEMLdtRuRX+lBgZnxwzz+0N3uAmn+YBnsW0JdoW2BKBx55bx0GIJBKj/HQhK7CUVzr8TWh
 +NtqQmPqk+nJV5Tt4MAiS3umK35H4p6q8sPV6PZ4/M0iLnWBPharlsLYxE+OxHWSW5u7yduP
 Y3cHHEjnxca4z6dnsz0c2CWgzaw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5f2289a8298a38b6165490a6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Jul 2020 08:49:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4A562C433C6; Thu, 30 Jul 2020 08:49:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2454FC43391;
        Thu, 30 Jul 2020 08:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2454FC43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, sivaprak@codeaurora.org,
        kathirav@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: regulator: add the sub node names for the MP5496 PMIC
Date:   Thu, 30 Jul 2020 14:19:23 +0530
Message-Id: <1596098964-19878-3-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596098964-19878-1-git-send-email-kathirav@codeaurora.org>
References: <1596098964-19878-1-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MP5496 PMIC is found on IPQ6018 SoC. SMPA2 regulator controls the APSS
voltage scaling. Document the sub node name for the same.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index 8d212bdbee02..d2022206081f 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -22,6 +22,8 @@ description:
   Each sub-node is identified using the node's name, with valid values listed
   for each of the pmics below.
 
+  For mp5496, s2
+
   For pm8841, s1, s2, s3, s4, s5, s6, s7, s8
 
   For pm8916, s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

