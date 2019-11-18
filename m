Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8BC100DF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfKRVnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:43:22 -0500
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:45744
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726647AbfKRVnV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113400;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=7n39Z3aR/kmuIpGXlnnncRYhdVwoWYR4naB6vDLfd1g=;
        b=QGca6Dbi3b4wMBkOoOL3YTcoo/HnyzUmyQTp51nPYFtSykfSipYx5F2JAfkr8Gim
        W4HSkmnmRoxEl0ywJDeAogbE9ba375si++ITfCYiCqxQowaOkQNKjYmPVhedGAmR0vF
        s/ucCueWmakp4aE6OcH/X2uF0iM9i7D+tVfrjOZg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113400;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=7n39Z3aR/kmuIpGXlnnncRYhdVwoWYR4naB6vDLfd1g=;
        b=NSd8QLyba+pEO4jsr8+M0WseQeZHRLo2H00nHcNFgltADyzBO/41CamfJwIFnXKu
        GPJsuw8pT1XQVCVOe8iHfoSSlbu4eCuYqbqDg2z1Aii2OaCTTQAhN1tr9Rl0KmYZVx8
        0uWDQl7jhMCvrhHw31s6dNlTW8ZVq/GccJkLYajs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D8B2BC58C06
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 03/16] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for SC7180
Date:   Mon, 18 Nov 2019 21:43:20 +0000
Message-ID: <0101016e807856d0-14dc2e21-4406-4150-8ffb-6982e37fc3cb-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new modem compatible string for Qualcomm SC7180 SoCs and introduce
the "qcom,halt-nav-regs" bindings needed by the modem sub-system running
on SC7180 SoCs.

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

