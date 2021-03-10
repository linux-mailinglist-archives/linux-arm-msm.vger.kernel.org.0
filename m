Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A9D333663
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 08:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhCJH2r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 02:28:47 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:54903 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230242AbhCJH2b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 02:28:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615361311; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wbFJQdmCSw/vt9KO4uQIUUCM+EzzacAlvvZ0xaURRf4=; b=IXCl2KceL1p2vgBXckPg8Q4Gktyi/R52SZ7EvVeHp11XOgX8GJsrE0masGT98VBWUw1+ZJbj
 xYXdvmUoZZrEQmIaCY8dvwT/hrnJmDNmAckglRnpWP60Zr9Nt9FgRJH+vFYVJCgVwocMq0hK
 kGoy2bwGhsrKdcONY3PlUzLdeho=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6048751eb2591bd5680337b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 07:28:30
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CB44C433ED; Wed, 10 Mar 2021 07:28:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5EF0BC43461;
        Wed, 10 Mar 2021 07:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5EF0BC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Wed, 10 Mar 2021 12:58:09 +0530
Message-Id: <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add WPSS PIL loading support for SC7280 SoCs.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 .../bindings/remoteproc/qcom,hexagon-v56.txt       | 35 ++++++++++++----------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
index 1337a3d..edad5e8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
@@ -9,6 +9,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
 	Definition: must be one of:
 		    "qcom,qcs404-cdsp-pil",
 		    "qcom,sdm845-adsp-pil"
+		    "qcom,sc7280-wpss-pil"
 
 - reg:
 	Usage: required
@@ -24,7 +25,13 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
 - interrupt-names:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
+	Definition: The interrupts needed depends on the compatible string
+	qcom,sdm845-adsp-pil:
+	qcom,qcs404-cdsp-pil:
+		must be "wdog", "fatal", "ready", "handover", "stop-ack"
+	qcom,sc7280-wpss-pil:
+		must be "wdog", "fatal", "ready", "handover", "stop-ack"
+		"shutdown-ack"
 
 - clocks:
 	Usage: required
@@ -35,19 +42,17 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
 - clock-names:
 	Usage: required for SDM845 ADSP
 	Value type: <stringlist>
-	Definition: List of clock input name strings sorted in the same
-		    order as the clocks property. Definition must have
-		    "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
-		    "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
-		    and "qdsp6ss_core".
-
-- clock-names:
-	Usage: required for QCS404 CDSP
-	Value type: <stringlist>
-	Definition: List of clock input name strings sorted in the same
-		    order as the clocks property. Definition must have
-		    "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
-		    "q6ss_master", "q6_axim".
+	Definition: The clocks needed depends on the compatible string
+	qcom,sdm845-adsp-pil:
+		must be "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
+		"lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep",
+		"qdsp6ss_core"
+	qcom,qcs404-cdsp-pil:
+		must be "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
+		"q6ss_master", "q6_axim"
+	qcom,sc7280-wpss-pil:
+		must be "gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
+		"gcc_wpss_rscp_clk"
 
 - power-domains:
 	Usage: required
@@ -65,7 +70,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
         Definition: must be "pdc_sync" and "cc_lpass"
 
 - reset-names:
-        Usage: required for QCS404 CDSP
+        Usage: required for QCS404 CDSP, SC7280 WPSS
         Value type: <stringlist>
         Definition: must be "restart"
 
-- 
2.7.4

