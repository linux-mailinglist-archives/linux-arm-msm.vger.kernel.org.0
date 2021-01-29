Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C22F308B0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 18:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhA2RLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jan 2021 12:11:10 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:24279 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbhA2RKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jan 2021 12:10:54 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 29 Jan 2021 09:10:13 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2021 09:10:10 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Jan 2021 22:39:38 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id CF94021251; Fri, 29 Jan 2021 22:39:38 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, nprakash@codeaurora.org,
        gokulsri@codeaurora.org
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for IPQ6018
Date:   Fri, 29 Jan 2021 22:39:36 +0530
Message-Id: <1611940178-24546-2-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611940178-24546-1-git-send-email-gokulsri@codeaurora.org>
References: <1611940178-24546-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new modem compatible string for IPQ6018 SoCs

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 69c49c7..7f1d5783 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -9,6 +9,7 @@ on the Qualcomm Hexagon core.
 	Definition: must be one of:
 		    "qcom,q6v5-pil",
 		    "qcom,ipq8074-wcss-pil"
+		    "qcom,ipq6018-wcss-pil"
 		    "qcom,qcs404-wcss-pil"
 		    "qcom,msm8916-mss-pil",
 		    "qcom,msm8974-mss-pil"
@@ -40,6 +41,7 @@ on the Qualcomm Hexagon core.
 		    string:
 	qcom,q6v5-pil:
 	qcom,ipq8074-wcss-pil:
+	qcom,ipq6018-wcss-pil:
 	qcom,qcs404-wcss-pil:
 	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
@@ -68,6 +70,7 @@ on the Qualcomm Hexagon core.
 	Value type: <stringlist>
 	Definition: The clocks needed depend on the compatible string:
 	qcom,ipq8074-wcss-pil:
+	qcom,ipq6018-wcss-pil:
 		    no clock names required
 	qcom,qcs404-wcss-pil:
 		    must be "xo", "gcc_abhs_cbcr", "gcc_abhs_cbcr",
@@ -165,6 +168,7 @@ For the compatible string below the following supplies are required:
 	Value type: <stringlist>
 	Definition: The power-domains needed depend on the compatible string:
 	qcom,ipq8074-wcss-pil:
+	qcom,ipq6018-wcss-pil:
 		    no power-domain names required
 	qcom,q6v5-pil:
 	qcom,msm8916-mss-pil:
-- 
2.7.4

