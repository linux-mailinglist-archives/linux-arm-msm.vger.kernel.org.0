Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DAD40184C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 10:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237787AbhIFI4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 04:56:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13626 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231712AbhIFI43 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 04:56:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630918525; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4ByLA/mqzGqIFlZ2I9mCxjC/CF+OEy7CVA7srTyKrGw=; b=GhiST8NtEiInhPbD9Q/2HTa/GZ+Ni0VMu0+rTsIQjReqfrjUEGA7+B9LC1uWzoWx2S91QUK/
 Gkp0QgfTUvASaqGtuKhnhGPJZ3H2fUZYg7tc0xlVNnCKRIrH6UeJuwTo/KIqqw50N33Fz5OB
 KPYTinmpNUuj66nDelpuPjzvGto=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6135d77cc603a0154f060ae7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 08:55:24
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A7600C43617; Mon,  6 Sep 2021 08:55:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 06C83C4360C;
        Mon,  6 Sep 2021 08:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 06C83C4360C
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
Subject: [PATCH v4 01/10] dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS support
Date:   Mon,  6 Sep 2021 14:24:36 +0530
Message-Id: <1630918485-15052-2-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630918485-15052-1-git-send-email-sibis@codeaurora.org>
References: <1630918485-15052-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MPSS PAS support for SC7280 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 0d2b5bd4907a..68ee7febddd9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,qcs404-cdsp-pas
       - qcom,qcs404-wcss-pas
       - qcom,sc7180-mpss-pas
+      - qcom,sc7280-mpss-pas
       - qcom,sc8180x-adsp-pas
       - qcom,sc8180x-cdsp-pas
       - qcom,sc8180x-mpss-pas
@@ -151,6 +152,7 @@ allOf:
               - qcom,msm8998-adsp-pas
               - qcom,qcs404-adsp-pas
               - qcom,qcs404-wcss-pas
+              - qcom,sc7280-mpss-pas
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
               - qcom,sc8180x-mpss-pas
@@ -296,6 +298,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7180-mpss-pas
+              - qcom,sc7280-mpss-pas
               - qcom,sc8180x-mpss-pas
               - qcom,sdx55-mpss-pas
               - qcom,sm8150-mpss-pas
@@ -400,6 +403,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc7280-mpss-pas
               - qcom,sdx55-mpss-pas
               - qcom,sm8150-mpss-pas
               - qcom,sm8350-mpss-pas
@@ -475,6 +479,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7180-mpss-pas
+              - qcom,sc7280-mpss-pas
     then:
       properties:
         resets:
@@ -492,6 +497,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7180-mpss-pas
+              - qcom,sc7280-mpss-pas
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
               - qcom,sc8180x-mpss-pas
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

