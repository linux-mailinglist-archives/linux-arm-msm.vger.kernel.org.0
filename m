Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24BA4100E14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfKRVn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:43:56 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:56606
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726739AbfKRVnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113434;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=gflz1Tnf86dtd+vmicl3ujXO2oWhimFrWupL9W+PNOs=;
        b=YSKwb2h1wZxWquq600JlwuHbEn8Pdk4it4ps8vWzGQvWXC/6qso5rHSQTzxCsnhc
        bOmcyIToNxYsRpfR3UFtpqlwdTUklxLjUCVTEIPXYbCa8IUohLw9BgWdPntGlKl42ZC
        a3sQwsLLGRRzBqV7eoMTpAMeYMrmlUgwqIUXcz10=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113434;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=gflz1Tnf86dtd+vmicl3ujXO2oWhimFrWupL9W+PNOs=;
        b=Prm8oKfbIoR3LQyfBbqfu2Wq0qle1N+6y5e3I8s5VzbdtLHiiv2C0Vh0HS5FJBAh
        m4I5ZcrEre3EsfzhxYbm0emTUW5o720kZeezl3R4Fn9avJMP1ReZEbcZzIsCkmrm9K2
        jZLVHg7Q65T8fgALBa5BgLIX5JZLfcqyV7Dwm/Fc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 155A7C00A22
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 10/16] dt-bindings: remoteproc: qcom: SM8150 Add ADSP, CDSP, MPSS and SLPI support
Date:   Mon, 18 Nov 2019 21:43:54 +0000
Message-ID: <0101016e8078dad4-458c8501-93fd-4daa-8938-d01027f248cb-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ADSP, CDSP, MPSS and SLPI compatibles for SM8150 SoC.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 34dc1d94a78c7..9938918b2fea3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -17,6 +17,10 @@ on the Qualcomm ADSP Hexagon core.
 		    "qcom,qcs404-wcss-pas"
 		    "qcom,sdm845-adsp-pas"
 		    "qcom,sdm845-cdsp-pas"
+		    "qcom,sm8150-adsp-pas"
+		    "qcom,sm8150-cdsp-pas"
+		    "qcom,sm8150-mpss-pas"
+		    "qcom,sm8150-slpi-pas"
 
 - interrupts-extended:
 	Usage: required
@@ -37,8 +41,12 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,qcs404-cdsp-pas:
 	qcom,sdm845-adsp-pas:
 	qcom,sdm845-cdsp-pas:
+	qcom,sm8150-adsp-pas:
+	qcom,sm8150-cdsp-pas:
+	qcom,sm8150-slpi-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,qcs404-wcss-pas:
+	qcom,sm8150-mpss-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
 		    "shutdown-ack"
 
@@ -95,7 +103,13 @@ on the Qualcomm ADSP Hexagon core.
 		    must be "mx"
 	qcom,sdm845-adsp-pas:
 	qcom,sdm845-cdsp-pas:
+	qcom,sm8150-adsp-pas:
+	qcom,sm8150-cdsp-pas:
 		    must be "cx", "load_state"
+	qcom,sm8150-mpss-pas:
+		    must be "cx", "load_state", "mss"
+	qcom,sm8150-slpi-pas:
+		    must be "lcx", "lmx", "load_state"
 
 - memory-region:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

