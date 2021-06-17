Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774013AB0AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 11:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhFQKAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 06:00:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58689 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230312AbhFQKAp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 06:00:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623923918; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=nZjdf/YIZuObh/zYQVUmteSyPqAUYoSWQnYeQyM+fME=; b=lCQKDrZmhZZhTxvUSyWaRylm/Rf/cuGZBHBijciEC0p4Ik4/9BlZABTQw5QApBExbHW/tkfp
 rUKuXjkbv7f02VfP21npwLt5wEM+WnyiY89bod4q5IhRzZV/8KWTiVSMc5ZvzEJvR9FvaCgg
 yTSz0kRl9nO38S5tsN6p2Zne0f4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60cb1cc8e27c0cc77f937acf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 09:58:32
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 53883C43460; Thu, 17 Jun 2021 09:58:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E036CC433F1;
        Thu, 17 Jun 2021 09:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E036CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v10 6/6] dt-bindings: usb: dwc3: Update dwc3 TX fifo properties
Date:   Thu, 17 Jun 2021 02:58:19 -0700
Message-Id: <1623923899-16759-7-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the tx-fifo-resize property with a better description, while
adding the tx-fifo-max-num, which is a new parameter allowing
adjustments for the maximum number of packets the txfifo resizing logic
can account for while resizing the endpoints.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 41416fb..078fb78 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -289,10 +289,21 @@ properties:
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

