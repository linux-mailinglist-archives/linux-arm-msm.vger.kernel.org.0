Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9948B3CF783
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 12:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhGTJd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 05:33:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30807 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235706AbhGTJd1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 05:33:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626776045; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=sENmdPPj1WvDapYECAz+5wuupJetaDUJLzYLR6hCXp4=; b=BR9qBXu5E/l5W3XRGhr2WhvDqP9Yh0vyz0OIrhic2FP09pTy1GAiyyPdS2rzJbtBYyubgweg
 38FBOkRjmdwCNX3cXkkCa/R0gbiNeFBKcsc2nrJvdozUUNzccEetmJl+4hU49TwzPkfXC3MP
 G09qQcHct4Gc4SNphSHEFTPw0o4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f6a1cbc923fb7e09a3c6fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 10:13:31
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 51FDAC4360C; Tue, 20 Jul 2021 10:13:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC978C4323A;
        Tue, 20 Jul 2021 10:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC978C4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 01/10] dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS support
Date:   Tue, 20 Jul 2021 15:42:51 +0530
Message-Id: <1626775980-28637-2-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MPSS PAS support for SC7280 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 1182afb5f593..c17b9a0c36ff 100644
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
@@ -150,6 +151,7 @@ allOf:
               - qcom,msm8998-adsp-pas
               - qcom,qcs404-adsp-pas
               - qcom,qcs404-wcss-pas
+              - qcom,sc7280-mpss-pas
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
               - qcom,sc8180x-mpss-pas
@@ -295,6 +297,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7180-mpss-pas
+              - qcom,sc7280-mpss-pas
               - qcom,sc8180x-mpss-pas
               - qcom,sdx55-mpss-pas
               - qcom,sm8150-mpss-pas
@@ -399,6 +402,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc7280-mpss-pas
               - qcom,sdx55-mpss-pas
               - qcom,sm8150-mpss-pas
               - qcom,sm8350-mpss-pas
@@ -474,6 +478,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7180-mpss-pas
+              - qcom,sc7280-mpss-pas
     then:
       properties:
         resets:
@@ -491,6 +496,7 @@ allOf:
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

