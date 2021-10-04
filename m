Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FA64209D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 13:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbhJDLSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 07:18:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58085 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230469AbhJDLSn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 07:18:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633346214; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=OM5PMOGkYk5yc9qw+FTQwVgicS42yeXqzGFO/6u5zFM=; b=xTc5XQgcR1nUX34yMbVeC+7v6kqefe/6PZM571jGq9MSmXiZdolnpaJgqh4Hwk8x/FIqG/Fk
 r+1amf8DIuJ8u1naWsutP5VRvW2ps1KF07pXAwOoFK+AL/RVJg5M6mMvNU8+6XYye4o3c6Ef
 dEl7WxJaiXjmWSpoggH0+9KeQdk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 615ae2a39ffb4131491ff835 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 11:16:51
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4E48BC4360C; Mon,  4 Oct 2021 11:16:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EEA98C43617;
        Mon,  4 Oct 2021 11:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EEA98C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <greg@kroah.com>
Cc:     linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V0 1/7] dt-bindings: connector: Add property for eud type c connector
Date:   Mon,  4 Oct 2021 16:46:19 +0530
Message-Id: <246c9d24da27b6ce91d5f1e536fa96ac5656a0b2.1633343547.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1633343547.git.schowdhu@codeaurora.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1633343547.git.schowdhu@codeaurora.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added the property for EUD(Embedded USB Debug) connector.Added
the "reg" and "interrupts" property which is needed for EUD.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 .../devicetree/bindings/connector/usb-connector.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 7eb8659..908129f 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -30,6 +30,21 @@ properties:
           - const: samsung,usb-connector-11pin
           - const: usb-b-connector
 
+      - items:
+          - enum:
+              - qcom,sc7280-usb-connector-eud
+          - const: qcom,usb-connector-eud
+          - const: usb-c-connector
+
+  reg:
+    items:
+      - description: EUD Base Register Region
+      - description: EUD Mode Manager Region
+
+  interrupts:
+    description:
+      EUD interrupt
+
   label:
     description: Symbolic name for the connector.
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

