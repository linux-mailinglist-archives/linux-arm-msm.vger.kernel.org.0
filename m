Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03773384EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhCLFMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:12:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:33186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231348AbhCLFMM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:12:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCADB64FA3;
        Fri, 12 Mar 2021 05:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615525931;
        bh=HQ1tro5PCDW92A/sOIKcBwNFev1y/F2w1RT8q74jPPo=;
        h=From:To:Cc:Subject:Date:From;
        b=bILnbjYehMnrHvM3OqUs5+Puei0+o/f054SvoOX/HbnS6pjaoE06eBaoUtKd+ELLJ
         pGFf1Rn8kK/FplXLAxl3hwR5E9UaciyeyXlnml8KNG8nZAL4e8tzkhPxhJ2NvnIo2g
         wzrPNNo4mnLNnyVhzzmBd1eLADVSFreQPgJwtM9RWvyqFRCBhgSmDf6P2bAc4MGntU
         976WzG55MqcKay/V3ENskQFYJh4sEFDsRitv2FeZIg7hhV3t4v4oazw8vVd41JvTIi
         +qJurRF6mnlkeBdFLEqqDkk9MhB8dC0EsbfYciUsWBXwE3E7WUUoVAVtt95+uVSgj9
         VMzYbTyAZhixA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Add compatible for SM8350 IPCC
Date:   Fri, 12 Mar 2021 10:42:03 +0530
Message-Id: <20210312051203.3555751-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible string for SM8350 IPCC block on this SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 168beeb7e9f7..fe17ba9b84f2 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - qcom,sm8250-ipcc
+          - qcom,sm8350-ipcc
       - const: qcom,ipcc
 
   reg:
-- 
2.26.2

