Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA2141D798
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 12:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349879AbhI3K1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 06:27:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:53731 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349865AbhI3K1M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 06:27:12 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 30 Sep 2021 03:25:30 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Sep 2021 03:25:28 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Sep 2021 15:55:12 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id A598421640; Thu, 30 Sep 2021 15:55:11 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, mka@chromium.org,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V1 1/2] dt-bindings: spi: Add sc7180 support
Date:   Thu, 30 Sep 2021 15:54:09 +0530
Message-Id: <1632997450-32293-2-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632997450-32293-1-git-send-email-rajpat@codeaurora.org>
References: <1632997450-32293-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree compatible for sc7180 SoC.

Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 09aa955..055524f 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sc7180-qspi
           - qcom,sc7280-qspi
           - qcom,sdm845-qspi
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

