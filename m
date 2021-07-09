Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E95D3C2A0A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 22:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhGIUIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 16:08:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14207 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhGIUIO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 16:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1625861131; x=1657397131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aizZMLzzlqTp2HGm81SR0cYRvz1cqpfvOAb26y7Mjzc=;
  b=Xy5lB6LnTQ/9KX/jzN2Sp/Z6STTUIVoj1SOldBY5ViRMuQ1Zx32u1BC9
   ePQodhdlOw5l/GJz02M7Lcyw7hUhhUbM4G9xQ1f2CA2YlDmjYyLyW0ErF
   NyURFx1AcSa8qnVNUUlph9UBIjb5Fv85gmPsA3FqfoRs3d3yRpEOLvoEe
   I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 09 Jul 2021 13:05:31 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jul 2021 13:05:30 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nalasexr03e.na.qualcomm.com (10.49.195.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 9 Jul 2021 13:05:29 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <robh+dt@kernel.org>,
        <bjorn.andersson@linaro.org>, <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document SDX65 platform and boards
Date:   Fri, 9 Jul 2021 13:05:05 -0700
Message-ID: <20210709200506.20046-2-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709200506.20046-1-quic_vamslank@quicinc.com>
References: <20210709200506.20046-1-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03c.na.qualcomm.com (10.85.0.106) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Document the SDX65 platform binding and also the boards using it.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 174134f920e1..bdf1da8fc557 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -41,6 +41,7 @@ description: |
         sdm660
         sdm845
         sdx55
+        sdx65
         sm8250
         sm8350
 
@@ -174,6 +175,11 @@ properties:
               - qcom,sdx55-mtp
           - const: qcom,sdx55
 
+      - items:
+          - enum:
+              - qcom,sdx65-mtp
+          - const: qcom,sdx65
+
       - items:
           - enum:
               - qcom,ipq6018-cp01-c1
-- 
2.32.0

