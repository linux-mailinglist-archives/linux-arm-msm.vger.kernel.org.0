Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9F6245DC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 09:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgHQHTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 03:19:25 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:12120 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726779AbgHQHTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 03:19:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597648763; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=MZU7T9LxEvrRKQvyR2bl9lu84wdbuHYxAZ5urZIlxTU=; b=b8XC3bCzaLOJzctUh2UJYNLQgJgkOodLnKplpY20L8L8fJ4mWC2u0Nia26vvbpWgyR6edqd4
 pcqapyW2T5RULpLmsEdD9WbgX33ivp8UOJnBRaIRsv6D+azPh5/hzkJFM35R7c70vHulJtmN
 bRcp//SgLUS/KhfG+KmzwiirF0k=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5f3a2f63ba4c2cd3677ec4d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 07:18:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D1E6C433C6; Mon, 17 Aug 2020 07:18:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E92AC43391;
        Mon, 17 Aug 2020 07:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E92AC43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sivaprak@codeaurora.org,
        devicetree@vger.kernel.org
Cc:     kathirav@codeaurora.org
Subject: [PATCH V2 1/2] dt-bindings: mailbox: add compatible for the IPQ6018 SoC
Date:   Mon, 17 Aug 2020 12:48:39 +0530
Message-Id: <1597648720-13649-2-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597648720-13649-1-git-send-email-kathirav@codeaurora.org>
References: <1597648720-13649-1-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the mailbox compatible for the IPQ6018 SoC.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 8f810fc5c183..ffd09b664ff5 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -16,6 +16,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - qcom,ipq6018-apcs-apps-global
       - qcom,ipq8074-apcs-apps-global
       - qcom,msm8916-apcs-kpss-global
       - qcom,msm8994-apcs-kpss-global
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

