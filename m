Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44BAA100E0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbfKRVnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:43:47 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:43032
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727289AbfKRVnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113425;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=J1ohjYa/A0ppm0mtsb6KCvM/xhbEyqzhsOuSpEpPFxY=;
        b=Rz5q5FPzE1I2OSB8obRgoAnhy+wSR0eQugTaVVNqGqNeT179AHbFKMTeLyqquqlI
        Fy4zzc1zz48obGaOR1JiKwtRK7nywElmXtgQIFzS7CsDilUxs4UomSbqX6fFld4fs9t
        8LUJW1n7G9AfxaFINApiJFnv9NJMduEMDN7TnmLE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113425;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=J1ohjYa/A0ppm0mtsb6KCvM/xhbEyqzhsOuSpEpPFxY=;
        b=CrMZaaTiOg6xKFtBJhErK0WS3hV0BZ+6my0hgs8k4PoHRnZ+bzaApsQ28Q0/pnG+
        zB1wtd/oR7tLtTQW+lpaqIZMm55xM2dmVU6oMmpMHCJMFGsORE+yRHqLxMTYW9+JVSi
        uUpuAVsd4DAiNYvqipsKwXVH5WcEf4yLaN9FzhhQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FFDEC58C3B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 08/16] dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998 SoC
Date:   Mon, 18 Nov 2019 21:43:45 +0000
Message-ID: <0101016e8078b957-e3cf34ad-0bd0-41b0-9d92-ec1d86df352c-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ADSP and SLPI compatibles for MSM8998 SoC.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index fea25b8b050ed..34dc1d94a78c7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -10,6 +10,8 @@ on the Qualcomm ADSP Hexagon core.
 		    "qcom,msm8974-adsp-pil"
 		    "qcom,msm8996-adsp-pil"
 		    "qcom,msm8996-slpi-pil"
+		    "qcom,msm8998-adsp-pas"
+		    "qcom,msm8998-slpi-pas"
 		    "qcom,qcs404-adsp-pas"
 		    "qcom,qcs404-cdsp-pas"
 		    "qcom,qcs404-wcss-pas"
@@ -29,6 +31,8 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,msm8974-adsp-pil:
 	qcom,msm8996-adsp-pil:
 	qcom,msm8996-slpi-pil:
+	qcom,msm8998-adsp-pas:
+	qcom,msm8998-slpi-pas:
 	qcom,qcs404-adsp-pas:
 	qcom,qcs404-cdsp-pas:
 	qcom,sdm845-adsp-pas:
@@ -78,9 +82,12 @@ on the Qualcomm ADSP Hexagon core.
 	Definition: The power-domains needed depend on the compatible string:
 	qcom,msm8974-adsp-pil:
 	qcom,msm8996-adsp-pil:
+	qcom,msm8998-adsp-pas:
 		    must be "cx"
 	qcom,msm8996-slpi-pil:
 		    must be "ss_cx"
+	qcom,msm8998-slpi-pas:
+		    must be "ssc_cx"
 	qcom,qcs404-adsp-pas:
 		    must be "lpi_cx"
 	qcom,qcs404-cdsp-pas:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

