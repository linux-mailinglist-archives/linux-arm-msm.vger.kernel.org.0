Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4A83125ADF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 06:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfLSFpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 00:45:34 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:22121 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726582AbfLSFpd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 00:45:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576734332; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=sqYsj2QKv+aCqIZZjiK6IbIEceLC0bHonxkLamISQCs=; b=Oxqmold+Qmg1WtgU3pJ5aNFvu8/A2N1EPStDGfDhSesRcnj+BiWOYWMKsi53BV3DWDOogI5a
 dzLpsYA4L+2zR0TDJD1Bo3Yvv3VW4pCif8vPvh6dvNNsIQU4e2PuyrNjnXOu6JpmwWjwBDUv
 Pmmcji0+joKRYYu1gNimv+B38tg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb0e78.7f781e95d228-smtp-out-n02;
 Thu, 19 Dec 2019 05:45:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75D1AC48B3C; Thu, 19 Dec 2019 05:45:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B043C38671;
        Thu, 19 Dec 2019 05:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4B043C38671
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for SC7180
Date:   Thu, 19 Dec 2019 11:15:05 +0530
Message-Id: <20191219054506.20565-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191219054506.20565-1-sibis@codeaurora.org>
References: <20191219054506.20565-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new modem compatible string for Qualcomm SC7180 SoCs and introduce
the "qcom,halt-nav-regs" bindings needed by the modem sub-system running
on SC7180 SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/remoteproc/qcom,q6v5.txt         | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index c416746f93cfd..88dfa3fc15f78 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -13,6 +13,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
 		    "qcom,msm8998-mss-pil"
+		    "qcom,sc7180-mss-pil"
 		    "qcom,sdm845-mss-pil"
 
 - reg:
@@ -43,6 +44,7 @@ on the Qualcomm Hexagon core.
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
+	qcom,sc7180-mss-pil:
 	qcom,sdm845-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
 		    "shutdown-ack"
@@ -75,6 +77,9 @@ on the Qualcomm Hexagon core.
 	qcom,msm8998-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "qdss"
+	qcom,sc7180-mss-pil:
+		    must be "iface", "bus", "xo", "snoc_axi", "mnoc_axi",
+		    "mss_crypto", "mss_nav", "nav"
 	qcom,sdm845-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "prng"
@@ -86,7 +91,7 @@ on the Qualcomm Hexagon core.
 		    reference to the list of 3 reset-controllers for the
 		    wcss sub-system
 		    reference to the list of 2 reset-controllers for the modem
-		    sub-system on SDM845 SoCs
+		    sub-system on SC7180, SDM845 SoCs
 
 - reset-names:
 	Usage: required
@@ -95,7 +100,7 @@ on the Qualcomm Hexagon core.
 		    must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
 		    for the wcss sub-system
 		    must be "mss_restart", "pdc_reset" for the modem
-		    sub-system on SDM845 SoCs
+		    sub-system on SC7180, SDM845 SoCs
 
 For the compatible strings below the following supplies are required:
   "qcom,q6v5-pil"
@@ -144,6 +149,7 @@ For the compatible string below the following supplies are required:
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
 		    must be "cx", "mx"
+	qcom,sc7180-mss-pil:
 	qcom,sdm845-mss-pil:
 		    must be "cx", "mx", "mss", "load_state"
 
@@ -165,6 +171,19 @@ For the compatible string below the following supplies are required:
 		    by the three offsets within syscon for q6, modem and nc
 		    halt registers.
 
+For the compatible strings below the following phandle references are required:
+  "qcom,sc7180-mss-pil"
+- qcom,halt-nav-regs:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to a list of 2 phandles with one offset each for
+		    the modem sub-system running on SC7180 SoC. The first
+		    phandle reference is to the mss clock node followed by the
+		    offset within register space for nav halt register. The
+		    second phandle reference is to a syscon representing TCSR
+		    followed by the offset within syscon for conn_box_spare0
+		    register.
+
 = SUBNODES:
 The Hexagon node must contain two subnodes, named "mba" and "mpss" representing
 the memory regions used by the Hexagon firmware. Each sub-node must contain:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
