Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76E9309236
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 06:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhA3FaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 00:30:14 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:16935 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233833AbhA3F1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 00:27:42 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Jan 2021 21:20:29 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2021 21:20:27 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Jan 2021 10:49:49 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id AC19320F4B; Sat, 30 Jan 2021 10:49:49 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        govinds@codeaurora.org, sricharan@codeaurora.org,
        gokulsri@codeaurora.org
Subject: [PATCH v9 2/4] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for QCS404
Date:   Sat, 30 Jan 2021 10:49:47 +0530
Message-Id: <1611983989-10125-3-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611983989-10125-1-git-send-email-gokulsri@codeaurora.org>
References: <1611983989-10125-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Govind Singh <govinds@codeaurora.org>

Add a new modem compatible string for Qualcomm QCS404 SoCs

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 7ccd553..69c49c7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -9,6 +9,7 @@ on the Qualcomm Hexagon core.
 	Definition: must be one of:
 		    "qcom,q6v5-pil",
 		    "qcom,ipq8074-wcss-pil"
+		    "qcom,qcs404-wcss-pil"
 		    "qcom,msm8916-mss-pil",
 		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
@@ -39,6 +40,7 @@ on the Qualcomm Hexagon core.
 		    string:
 	qcom,q6v5-pil:
 	qcom,ipq8074-wcss-pil:
+	qcom,qcs404-wcss-pil:
 	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
@@ -67,6 +69,11 @@ on the Qualcomm Hexagon core.
 	Definition: The clocks needed depend on the compatible string:
 	qcom,ipq8074-wcss-pil:
 		    no clock names required
+	qcom,qcs404-wcss-pil:
+		    must be "xo", "gcc_abhs_cbcr", "gcc_abhs_cbcr",
+		    "gcc_axim_cbcr", "lcc_ahbfabric_cbc", "tcsr_lcc_cbc",
+		    "lcc_abhs_cbc", "lcc_tcm_slave_cbc", "lcc_abhm_cbc",
+		    "lcc_axim_cbc", "lcc_bcr_sleep"
 	qcom,q6v5-pil:
 	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
@@ -133,6 +140,14 @@ For the compatible string below the following supplies are required:
 		    booting of the Hexagon core
 
 For the compatible string below the following supplies are required:
+  "qcom,qcs404-wcss-pil"
+- cx-supply:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the regulators to be held on behalf of the
+		    booting of the Hexagon core
+
+For the compatible string below the following supplies are required:
   "qcom,msm8996-mss-pil"
 - pll-supply:
 	Usage: required
-- 
2.7.4

