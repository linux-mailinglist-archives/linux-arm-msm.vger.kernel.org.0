Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E168E232EE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 10:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgG3Itn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 04:49:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16601 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgG3Itm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 04:49:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596098981; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=NkHZL2NCYPbtWhg9N4NaJaJH7df2RKkoj1Y9zmMOjv8=; b=P9OXEhGrZKdL1iREOzYx2kkkVGyXPBDcSPk2lNCExlcaMFJc/n7kDI/HMlqwMu4BQ8A9iFlf
 THvGSYzwGLHLULaVaz+Dal0g2/q073/SKQs1AlWuMOjKltIt/KzDdi4aNezlnpf0k9bTF7gv
 Fu5RJpwEcLMIkof8gvIdWiLK/Wk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f2289a598acebb4e989ef70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Jul 2020 08:49:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 152E7C433CA; Thu, 30 Jul 2020 08:49:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9407C43395;
        Thu, 30 Jul 2020 08:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9407C43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, sivaprak@codeaurora.org,
        kathirav@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: mailbox: add compatible for the IPQ6018 SoC
Date:   Thu, 30 Jul 2020 14:19:22 +0530
Message-Id: <1596098964-19878-2-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596098964-19878-1-git-send-email-kathirav@codeaurora.org>
References: <1596098964-19878-1-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the mailbox compatible for the IPQ6018 SoC.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 12eff942708d..60e9532fcd29 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -16,6 +16,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - qcom,ipq6018-apcs-apps-global
       - qcom,ipq8074-apcs-apps-global
       - qcom,msm8916-apcs-kpss-global
       - qcom,msm8996-apcs-hmss-global
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

