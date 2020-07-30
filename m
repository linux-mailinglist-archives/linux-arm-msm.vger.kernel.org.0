Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 376772331B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 14:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgG3MOb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 08:14:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15938 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgG3MOa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 08:14:30 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 30 Jul 2020 05:14:29 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 30 Jul 2020 05:14:27 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 30 Jul 2020 17:44:06 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 6F4EB218A4; Thu, 30 Jul 2020 17:44:04 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v8 2/4] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for QCS404
Date:   Thu, 30 Jul 2020 17:44:02 +0530
Message-Id: <1596111244-28411-3-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596111244-28411-1-git-send-email-gokulsri@codeaurora.org>
References: <1596111244-28411-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Govind Singh <govinds@codeaurora.org>

Add a new modem compatible string for Qualcomm QCS404 SoCs

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 1f9a62e..2f3838c 100644
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
@@ -154,6 +161,8 @@ For the compatible string below the following supplies are required:
 	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
 		    no power-domain names required
+	qcom,qcs404-wcss-pil:
+		    must be "cx"
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
 		    must be "cx", "mx"
-- 
2.7.4

