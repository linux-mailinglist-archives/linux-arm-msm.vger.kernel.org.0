Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1ED459B20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 05:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbhKWEdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 23:33:39 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:16971 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233428AbhKWEdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 23:33:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637641829; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=OwFZL1WoH6B7+W2CACodchUWwy/KRXMv0eFDp4cllTs=; b=PJQsxSLt8jO6qxvQ2kbnW29xcdE7gx1hgfgXagtRA9sVa+2cJeCMofJd3YixBiwM2wm3+jTS
 1RmwvimmgIs9IyYLkErkZMAYF8Xm0GuwhmCe62P465WU2KbN7O4FCnG+AQNt5TcERpy6/a7+
 BGyL7d4zzpK/tr0wBWOVtgJyN1Y=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 619c6e6586d0e4d888c0754b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 04:30:29
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BEA8BC4361B; Tue, 23 Nov 2021 04:30:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BED1BC4360C;
        Tue, 23 Nov 2021 04:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BED1BC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        bjorn.andersson@linaro.org, greg@kroah.com
Cc:     linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, rnayak@codeaurora.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        quic_schowdhu@quicinc.com,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V1 2/8] dt-bindings: connector: Add property for EUD type-C connector
Date:   Tue, 23 Nov 2021 09:58:20 +0530
Message-Id: <c208e66967a6185c54758862446fb76edfda642f.1637639009.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1637639009.git.schowdhu@codeaurora.org>
References: <cover.1637639009.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1637639009.git.schowdhu@codeaurora.org>
References: <cover.1637639009.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added the property for EUD(Embedded USB Debugger) connector. EUD
is a mini usb hub with debug and trace capabilities and it has a
type C connector attached to it for role-switching. This connector
is attached to EUD via port.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 Documentation/devicetree/bindings/connector/usb-connector.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 7eb8659..bd1823a 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -30,6 +30,10 @@ properties:
           - const: samsung,usb-connector-11pin
           - const: usb-b-connector
 
+      - items:
+          - const: qcom,usb-connector-eud
+          - const: usb-c-connector
+
   label:
     description: Symbolic name for the connector.
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

