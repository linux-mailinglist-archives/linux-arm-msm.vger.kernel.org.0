Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7AF628C832
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 07:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732314AbgJMFQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 01:16:43 -0400
Received: from z5.mailgun.us ([104.130.96.5]:48650 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732326AbgJMFQn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 01:16:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602566202; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Bht3vJuZ6I+kqolNjEBJfCtJHjoNUWeXQ45D9frSuTI=; b=Oaa6XOu9eI1qLsc7CacWl6f6Hb4W7lceQofs/jO1VQYL3yma8w82XwCkIrD0cZPkMyuJeKmO
 fQQhIa0O3v8NoJrtcvKCHxAgyV1uMddXCF3LUF+LxvAl8+m323PH8fRfgdCWxJa4SfVOsxQm
 rIlDkJC9eiwzJmLl7EBSInozt/c=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f8538024f8cc67c317aa9cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 05:15:46
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2E38C433C9; Tue, 13 Oct 2020 05:15:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 20CBBC433CB;
        Tue, 13 Oct 2020 05:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 20CBBC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, robh+dt@kernel.org, sivaprak@codeaurora.org,
        peter.ujfalusi@ti.com, boris.brezillon@collabora.com,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kathirav@codeaurora.org
Subject: [PATCH 1/3] dt-bindings: qcom_nandc: IPQ6018 QPIC NAND documentation
Date:   Tue, 13 Oct 2020 10:45:22 +0530
Message-Id: <1602566124-13456-2-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
References: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the binding for the QPIC NAND used on IPQ6018 SoC.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 5c2fba4b30fe..5bdcd9990a94 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -6,6 +6,8 @@ Required properties:
 			    SoC and it uses ADM DMA
     * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being used in
                             IPQ4019 SoC and it uses BAM DMA
+    * "qcom,ipq6018-nand" - for QPIC NAND controller v1.5.0 being used in
+                            IPQ6018 SoC and it uses BAM DMA
     * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being used in
                             IPQ8074 SoC and it uses BAM DMA
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

