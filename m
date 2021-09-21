Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E324131D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 12:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbhIUKlQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 06:41:16 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40444 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbhIUKlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 06:41:13 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 21 Sep 2021 03:39:44 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Sep 2021 03:39:43 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg01-blr.qualcomm.com with ESMTP; 21 Sep 2021 16:09:19 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id A2D4D215EE; Tue, 21 Sep 2021 16:09:17 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, mka@chromium.org,
        dianders@chromium.org, Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V9 1/8] dt-bindings: spi: Add sc7280 support
Date:   Tue, 21 Sep 2021 16:08:59 +0530
Message-Id: <1632220746-25943-2-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
References: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for sc7280 SoC.

Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
Changes in V9:
 - No changes

Changes in V8:
 - As per Doug's comments, added "qcom,sc7280-qspi" compatible

 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index ef5698f..1c8b2ea 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -21,7 +21,10 @@ allOf:
 properties:
   compatible:
     items:
-      - const: qcom,sdm845-qspi
+      - enum:
+          - qcom,sdm845-qspi
+          - qcom,sc7280-qspi
+
       - const: qcom,qspi-v1
 
   reg:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

