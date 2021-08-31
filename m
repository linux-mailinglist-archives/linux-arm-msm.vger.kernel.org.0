Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E7E3FC25E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 08:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239541AbhHaF64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 01:58:56 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:52727 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235078AbhHaF6z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 01:58:55 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 80AD6440627;
        Tue, 31 Aug 2021 08:57:40 +0300 (IDT)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Baruch Siach <baruch@tkos.co.il>, Rob Herring <robh@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Robert Marko <robert.marko@sartura.hr>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: usb: qcom,dwc3: add binding for IPQ6018
Date:   Tue, 31 Aug 2021 08:57:31 +0300
Message-Id: <6a9b00d16a707aa2a94bcba71a24932cc201a473.1630389452.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <f5ea5bc3664a98a684ad4b699a1ac610e847176f.1630389452.git.baruch@tkos.co.il>
References: <f5ea5bc3664a98a684ad4b699a1ac610e847176f.1630389452.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible string for Qualcomm IPQ6018 SoC.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 4e6451789806..55ed4b4c7f51 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,ipq6018-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
           - qcom,sc7180-dwc3
-- 
2.33.0

