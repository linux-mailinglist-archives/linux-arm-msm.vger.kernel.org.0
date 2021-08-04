Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E4A3E02BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 16:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238398AbhHDOGk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 10:06:40 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:60960 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238518AbhHDOGj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 10:06:39 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 9AEFB440EAC;
        Wed,  4 Aug 2021 17:06:03 +0300 (IDT)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Baruch Siach <baruch@tkos.co.il>,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: phy: qcom,qmp: Add IPQ6018 USB3 PHY
Date:   Wed,  4 Aug 2021 17:05:05 +0300
Message-Id: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible string for USB3 PHY in Qualcomm IPQ6018 SoC.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index f0497b8623ad..3ae865988f04 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq6018-qmp-pcie-phy
+      - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-pcie-phy
       - qcom,ipq8074-qmp-usb3-phy
       - qcom,msm8996-qmp-pcie-phy
-- 
2.30.2

