Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7CE23B3625
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 20:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbhFXSzW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 14:55:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60201 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbhFXSzW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 14:55:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624560783; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Pjzw7igBgSNjiF2WffIB2RSLUSj5IKEOn76VwfzcJ38=; b=lyItM7JqMA5Vj9nb8QRiRuH1heEnLC28HEQLTfPekGOMcEoM1gJRMpBCe3U12Z1pJiGGHKEi
 xCdS+1cKlceDCnqFpo1AdX532hs2JK8Nnf3dx4EyNbevTJ6NQkw+ngFm43H1ItuiKz+3aeqe
 ktItbXmaa3efiOXhn41Xq3C8LSQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60d4d48019389419554a5678 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 18:52:48
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C1C70C433F1; Thu, 24 Jun 2021 18:52:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6742DC43217;
        Thu, 24 Jun 2021 18:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6742DC43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, swboyd@chromium.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 01/13] dt-bindings: soc: qcom: aoss: Drop power-domain bindings
Date:   Fri, 25 Jun 2021 00:21:55 +0530
Message-Id: <1624560727-6870-2-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The power-domains exposed by AOSS QMP node are used to notify the Always
on Subsystem (AOSS) that a particular co-processor is up/down. These
co-processors enter low-power modes independent to that of the application
processor and their states are expected to remain unaltered across system
suspend/resume cycles. To achieve this behavior let's drop the power-domain
bindings and replace them with generic qmp_send interface instead.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt       | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
index 783dc81b0f26..c0ae051a5b76 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
@@ -9,8 +9,7 @@ Messaging Protocol (QMP)
 
 The AOSS side channel exposes control over a set of resources, used to control
 a set of debug related clocks and to affect the low power state of resources
-related to the secondary subsystems. These resources are exposed as a set of
-power-domains.
+related to the secondary subsystems.
 
 - compatible:
 	Usage: required
@@ -46,14 +45,6 @@ power-domains.
 	Definition: must be 0
 		    The single clock represents the QDSS clock.
 
-- #power-domain-cells:
-	Usage: optional
-	Value type: <u32>
-	Definition: must be 1
-		    The provided power-domains are:
-		    CDSP state (0), LPASS state (1), modem state (2), SLPI
-		    state (3), SPSS state (4) and Venus state (5).
-
 = SUBNODES
 The AOSS side channel also provides the controls for three cooling devices,
 these are expressed as subnodes of the QMP node. The name of the node is used
@@ -66,8 +57,7 @@ to identify the resource and must therefor be "cx", "mx" or "ebi".
 
 = EXAMPLE
 
-The following example represents the AOSS side-channel message RAM and the
-mechanism exposing the power-domains, as found in SDM845.
+The following example represents the AOSS side-channel message RAM as found in SDM845.
 
   aoss_qmp: qmp@c300000 {
 	  compatible = "qcom,sdm845-aoss-qmp";
@@ -75,8 +65,6 @@ mechanism exposing the power-domains, as found in SDM845.
 	  interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
 	  mboxes = <&apss_shared 0>;
 
-	  #power-domain-cells = <1>;
-
 	  cx_cdev: cx {
 		#cooling-cells = <2>;
 	  };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

