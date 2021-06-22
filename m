Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2263B04F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 14:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhFVMpa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 08:45:30 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59062 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbhFVMp2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 08:45:28 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 22 Jun 2021 05:43:10 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jun 2021 05:43:09 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 22 Jun 2021 18:12:39 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 0FE6420FA1; Tue, 22 Jun 2021 18:12:38 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, robh@kernel.org, abhinavk@codeaurora.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org, jonathan@marek.ca,
        dmitry.baryshkov@linaro.org
Subject: [v2 1/3] dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
Date:   Tue, 22 Jun 2021 18:12:26 +0530
Message-Id: <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---

Changes in v2:
- New
  This patch depends on [1] (dt-bindings: msm: dsi: add missing 7nm bindings)

[1] https://lore.kernel.org/linux-arm-msm/20210617144349.28448-2-jonathan@marek.ca/

 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c0077ca..d282b00 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - const: qcom,dsi-phy-7nm
       - const: qcom,dsi-phy-7nm-8150
+      - const: qcom,sc7280-dsi-phy-7nm
 
   reg:
     items:
-- 
2.7.4

