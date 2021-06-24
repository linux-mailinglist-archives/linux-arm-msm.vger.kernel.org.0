Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684DF3B362A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 20:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhFXSz1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 14:55:27 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:36036 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbhFXSz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 14:55:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624560786; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ILTEB962RGcOcJFzYeFC/WTqUCTEJyOXsjqGxTiwQ5E=; b=EwzyvZRNwJXZVpQ6DhC4quSSYCj071rNn0KXgh0W0cdydZ/L/2bXzutUgULk67MeqKgKnaMm
 9TRiQt/1FMZa5f6cJD+xI5R6OcvKAgwLOyX3hidJsE+6OZ45CHRk8S8pFlu9c4jt+cQYGNk+
 RgwZX+/GXI3tIUdIKkvk81ci2a0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60d4d4897e5ba0fdc069c427 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 18:52:57
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7689EC4338A; Thu, 24 Jun 2021 18:52:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 822AEC43217;
        Thu, 24 Jun 2021 18:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 822AEC43217
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
Subject: [PATCH v3 03/13] dt-bindings: remoteproc: qcom: Add QMP bindings
Date:   Fri, 25 Jun 2021 00:21:57 +0530
Message-Id: <1624560727-6870-4-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Qualcomm Mailbox Protocol (QMP) binding to replace the power domains
exposed by the AOSS QMP node.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 69c49c7b2cff..494257010629 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -174,7 +174,12 @@ For the compatible string below the following supplies are required:
 		    must be "cx", "mx"
 	qcom,sc7180-mss-pil:
 	qcom,sdm845-mss-pil:
-		    must be "cx", "mx", "mss", "load_state"
+		    must be "cx", "mx", "mss"
+
+- qcom,qmp:
+	Usage: optional
+	Value type: <phandle>
+	Definition: reference to the AOSS side-channel message RAM.
 
 - qcom,smem-states:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

