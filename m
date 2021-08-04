Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC443E02BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 16:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238529AbhHDOGk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 10:06:40 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:60975 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238519AbhHDOGj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 10:06:39 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id E4DB3440EB0;
        Wed,  4 Aug 2021 17:06:04 +0300 (IDT)
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
Subject: [PATCH v2 3/6] dt-bindings: usb: dwc3: add reference clock period
Date:   Wed,  4 Aug 2021 17:05:07 +0300
Message-Id: <22f62c59471e128b681a731997a9416ab2e91acf.1628085910.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the snps,ref-clock-period property that describes reference
clock period when it deviates from the default set value.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 41416fbd92aa..c8027d2852cd 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -252,6 +252,15 @@ properties:
     minimum: 0
     maximum: 0x3f
 
+  snps,ref-clock-period:
+    description:
+      Value for REFCLKPER field of GUCTL register for post-silicon reference
+      clock period in nanoseconds, when the hardware set default does not match
+      the actual clock.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 0x3ff
+
   snps,rx-thr-num-pkt-prd:
     description:
       Periodic ESS RX packet threshold count (host mode only). Set this and
-- 
2.30.2

