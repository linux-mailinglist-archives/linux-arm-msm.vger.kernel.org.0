Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D609A1EB9D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 12:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgFBKuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 06:50:23 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:57579 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726110AbgFBKuX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 06:50:23 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Jun 2020 16:20:20 +0530
Received: from vbadigan-linux.qualcomm.com ([10.206.24.109])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Jun 2020 16:20:06 +0530
Received: by vbadigan-linux.qualcomm.com (Postfix, from userid 76677)
        id 8DF574BFA; Tue,  2 Jun 2020 16:20:05 +0530 (IST)
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V3 1/3] dt-bindings: mmc: Supply max load for mmc supplies
Date:   Tue,  2 Jun 2020 16:17:54 +0530
Message-Id: <1591094883-11674-2-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591094883-11674-1-git-send-email-vbadigan@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1591094883-11674-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Supply the max load needed for driving the mmc supplies.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index acc9f10871d4..d95219721fa1 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -290,6 +290,12 @@ properties:
     description:
       Supply for the bus IO line power
 
+  vmmc-supply-max-microamp:
+    description: Maximum load for the card power.
+
+  vqmmc-supply-max-microamp:
+    description: Maximum load for the bus IO line power.
+
   mmc-pwrseq:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

