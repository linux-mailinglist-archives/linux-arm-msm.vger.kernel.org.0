Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCBB401857
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 10:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240394AbhIFI4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 04:56:52 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58992 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240360AbhIFI4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 04:56:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630918548; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=6kmRt+62AYymFFict6MR0MM9X0396ycJxFm2jNCrWwo=; b=vXfe6bT/leHDvLV37ugD03LMHS9/uDFI9VRmNdPhaeDlf67aizJq+wep05xJrVApx4cDKGuR
 9cR381I193teHG+VsGav9QUMDYO+Qp50GWPrGWawYJrMQzEYUZJ53ufvci78qEf4/dcZKaMY
 PLP+E9GJdeeK7QLi+8CUlTW+prk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6135d78997222b4b5b935344 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 08:55:37
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9DF11C43638; Mon,  6 Sep 2021 08:55:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 83276C43619;
        Mon,  6 Sep 2021 08:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 83276C43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, swboyd@chromium.org,
        mka@chromium.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 03/10] dt-bindings: remoteproc: qcom: Update Q6V5 Modem PIL binding
Date:   Mon,  6 Sep 2021 14:24:38 +0530
Message-Id: <1630918485-15052-4-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630918485-15052-1-git-send-email-sibis@codeaurora.org>
References: <1630918485-15052-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new modem compatible string for QTI SC7280 SoCs and introduce the
"qcom,ext-regs" and "qcom,qaccept-regs" properties needed by the modem
sub-system running on SC7280 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 32 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 494257010629..bc1394f5d677 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -15,6 +15,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8996-mss-pil"
 		    "qcom,msm8998-mss-pil"
 		    "qcom,sc7180-mss-pil"
+		    "qcom,sc7280-mss-pil"
 		    "qcom,sdm845-mss-pil"
 
 - reg:
@@ -47,6 +48,7 @@ on the Qualcomm Hexagon core.
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
 	qcom,sc7180-mss-pil:
+	qcom,sc7280-mss-pil:
 	qcom,sdm845-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
 		    "shutdown-ack"
@@ -87,6 +89,8 @@ on the Qualcomm Hexagon core.
 	qcom,sc7180-mss-pil:
 		    must be "iface", "bus", "xo", "snoc_axi", "mnoc_axi",
 		    "nav"
+	qcom,sc7280-mss-pil:
+		    must be "iface", "xo", "snoc_axi", "offline"
 	qcom,sdm845-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "prng"
@@ -98,7 +102,7 @@ on the Qualcomm Hexagon core.
 		    reference to the list of 3 reset-controllers for the
 		    wcss sub-system
 		    reference to the list of 2 reset-controllers for the modem
-		    sub-system on SC7180, SDM845 SoCs
+		    sub-system on SC7180, SC7280, SDM845 SoCs
 
 - reset-names:
 	Usage: required
@@ -107,7 +111,7 @@ on the Qualcomm Hexagon core.
 		    must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
 		    for the wcss sub-system
 		    must be "mss_restart", "pdc_reset" for the modem
-		    sub-system on SC7180, SDM845 SoCs
+		    sub-system on SC7180, SC7280, SDM845 SoCs
 
 For devices where the mba and mpss sub-nodes are not specified, mba/mpss region
 should be referenced as follows:
@@ -173,6 +177,9 @@ For the compatible string below the following supplies are required:
 	qcom,msm8998-mss-pil:
 		    must be "cx", "mx"
 	qcom,sc7180-mss-pil:
+		    must be "cx", "mx", "mss"
+	qcom,sc7280-mss-pil:
+		    must be "cx", "mss"
 	qcom,sdm845-mss-pil:
 		    must be "cx", "mx", "mss"
 
@@ -198,6 +205,9 @@ For the compatible string below the following supplies are required:
 	Definition: a phandle reference to a syscon representing TCSR followed
 		    by the three offsets within syscon for q6, modem and nc
 		    halt registers.
+		    a phandle reference to a syscon representing TCSR followed
+		    by the four offsets within syscon for q6, modem, nc and vq6
+		    halt registers on SC7280 SoCs.
 
 For the compatible strings below the following phandle references are required:
   "qcom,sc7180-mss-pil"
@@ -208,6 +218,24 @@ For the compatible strings below the following phandle references are required:
 		    by the offset within syscon for conn_box_spare0 register
 		    used by the modem sub-system running on SC7180 SoC.
 
+For the compatible strings below the following phandle references are required:
+  "qcom,sc7280-mss-pil"
+- qcom,ext-regs:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: two phandle references to syscons representing TCSR_REG and
+		    TCSR register space followed by the two offsets within the syscon
+		    to force_clk_en/rscc_disable and axim1_clk_off/crypto_clk_off
+		    registers respectively.
+
+- qcom,qaccept-regs:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: a phandle reference to a syscon representing TCSR followed
+		    by the three offsets within syscon for mdm, cx and axi
+		    qaccept registers used by the modem sub-system running on
+		    SC7280 SoC.
+
 The Hexagon node must contain iommus property as described in ../iommu/iommu.txt
 on platforms which do not have TrustZone.
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

