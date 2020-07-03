Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF16A213641
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 10:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgGCIS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 04:18:57 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:35070 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgGCIS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 04:18:57 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 03 Jul 2020 01:12:50 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jul 2020 01:12:48 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Jul 2020 13:42:21 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 3698A2168F; Fri,  3 Jul 2020 13:42:19 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [v6 2/4] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for QCS404
Date:   Fri,  3 Jul 2020 13:42:17 +0530
Message-Id: <1593763939-19096-3-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593763939-19096-1-git-send-email-gokulsri@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
 <1593763939-19096-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Govind Singh <govinds@codeaurora.org>

Add a new modem compatible string for Qualcomm QCS404 SoCs

Signed-off-by: Govind Singh <govinds@codeaurora.org>
[rebased on top of 5.8-rc3]
Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
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

