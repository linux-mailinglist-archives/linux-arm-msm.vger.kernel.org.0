Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87DA418FC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 09:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbhI0HS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 03:18:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:33658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233175AbhI0HSY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 03:18:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C34CD61166;
        Mon, 27 Sep 2021 07:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632727007;
        bh=GhTlDAW0xH7ir0UUmr56Jr65UbGSTVOTfqjzCV3Kv+w=;
        h=From:To:Cc:Subject:Date:From;
        b=JnIbnSuOys/SVDL0oyxsv/9UfmTS7yefkPZg/Z3aV4613nbC0YzKmR2NNn/cdOAWO
         Ylz2rHHdVnsfmzgJne9GKHJk4byL1gLESLbkmiMTEFBUrhAU2TRfBT4TksCCPwZVCt
         BowQMkJMITela0Zt+zJHTawXYnR1lq0NNdao+0KW0+LQQL0X5suyEaF6KPRRS/jfpS
         GyB7uRjPOHoAu2IdxDzRqBStKDWcSNc/QiHRMghsq6d53QR0dMZTDKJdVOTFVYSD1R
         1O+Aw4QrxZotAaSdJIy8N4FnEpDkXdlKToUUH/D6QkotGY2SzRJVd2d580KNjZyjiB
         mso4ZaKu1jlDA==
From:   Shawn Guo <shawnguo@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] dt-bindings: phy: qcom,qmp: Update maintainer email
Date:   Mon, 27 Sep 2021 15:16:39 +0800
Message-Id: <20210927071639.6225-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

Manu's codeaurora.org email address bounces.  Before he comes
back with his new email, fill Vinod's address in there.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 75be5650a198..a167b5c1ae17 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -8,7 +8,7 @@ $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 title: Qualcomm QMP PHY controller
 
 maintainers:
-  - Manu Gautam <mgautam@codeaurora.org>
+  - Vinod Koul <vkoul@kernel.org>
 
 description:
   QMP phy controller supports physical layer functionality for a number of
-- 
2.17.1

