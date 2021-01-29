Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5828C3084A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 05:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhA2EtW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 23:49:22 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:14132 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231853AbhA2Erz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 23:47:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611895656; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ZF8vF2fXsfi0RVA4nhuPT8u9xa7jaAoRy2vf7Vy4rT8=; b=mqRy0Wlhq0d8qcl09v5UaIQgxMMu8AdiONkUuqFYJ4fq+4EqXYx0DMA/95ugaKRp/R4QykAy
 HQJHAgOI+9l8LEaS3otsZTECCLlQldeJ46eG/4TSOQj+9h+HRLDB+Jllr9jWFO8ABd3DK72S
 SeJWPKduYCyzVeh7JfQDTqMvP60=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6013934183b274b0af6520d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Jan 2021 04:46:57
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BA6ACC43461; Fri, 29 Jan 2021 04:46:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 779F2C43462;
        Fri, 29 Jan 2021 04:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 779F2C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v7 5/5] dt-bindings: usb: dwc3: Update dwc3 TX fifo properties
Date:   Thu, 28 Jan 2021 20:46:44 -0800
Message-Id: <1611895604-4496-6-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611895604-4496-1-git-send-email-wcheng@codeaurora.org>
References: <1611895604-4496-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the tx-fifo-resize property with a better description, while
adding the tx-fifo-max-num, which is a new parameter allowing
adjustments for the maximum number of packets the txfifo resizing logic
can account for while resizing the endpoints.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 2247da7..652b246 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -283,10 +283,21 @@ properties:
     maximum: 16
 
   tx-fifo-resize:
-    description: Determines if the FIFO *has* to be reallocated
-    deprecated: true
+    description: Determines if the TX fifos can be dynamically resized depending
+      on the number of IN endpoints used and if bursting is supported.  This
+      may help improve bandwidth on platforms with higher system latencies, as
+      increased fifo space allows for the controller to prefetch data into its
+      internal memory.
     type: boolean
 
+  tx-fifo-max-num:
+    description: Specifies the max number of packets the txfifo resizing logic
+      can account for when higher endpoint bursting is used. (bMaxBurst > 6) The
+      higher the number, the more fifo space the txfifo resizing logic will
+      allocate for that endpoint.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 3
+
   snps,incr-burst-type-adjustment:
     description:
       Value for INCR burst type of GSBUSCFG0 register, undefined length INCR
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

