Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAADA28A46B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Oct 2020 01:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgJJXhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 19:37:55 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57928 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgJJXhz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 19:37:55 -0400
X-Greylist: delayed 1799 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Oct 2020 19:37:53 EDT
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id DC6488002547;
        Sat, 10 Oct 2020 22:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4maO7b5Sdc2M; Sun, 11 Oct 2020 01:41:37 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH 18/18] dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
Date:   Sun, 11 Oct 2020 01:41:21 +0300
Message-ID: <20201010224121.12672-19-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm msm8996/sc7180/sdm845 DWC3 compatible DT nodes are supposed to
have a DWC USB3 compatible sub-node to describe a fully functioning USB
interface. Let's use the available DWC USB3 DT schema to validate
the Qualcomm DWC3 sub-nodes.

Note since the generic DWC USB3 DT node is supposed to be named as
generic USB HCD ("^usb(@.*)?") we have to accordingly extend the sub-nodes
naming space and fix the DT node example.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Alas there are many Qualcomm DTS files, which have got the Qualcomm DWC3
node defined with sub-nodes named as "^dwc3@.*". Since the generic DWC USB3
DT schema will be automatically selected for them and the naming doesn't
comply with the USB HCD DT schema, the dtbs_check procedure will fail.
I don't really know what is a most suitable way to fix that. It's either
to alter all the Qualcomm DTS files, or extend the USB HCD schema to
accept the "dwc3@.*" nodes, or redesign the usb-hcd.yaml schema. What do
you think?
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index dac10848dd7f..b3737f0e4dc1 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -103,11 +103,8 @@ properties:
 # Required child node:
 
 patternProperties:
-  "^dwc3@[0-9a-f]+$":
-    type: object
-    description:
-      A child node must exist to represent the core DWC3 IP block
-      The content of the node is defined in dwc3.txt.
+  "^(usb|dwc3)@[0-9a-f]+$":
+    $ref: snps,dwc3.yaml#
 
 required:
   - compatible
@@ -160,7 +157,7 @@ examples:
 
             resets = <&gcc GCC_USB30_PRIM_BCR>;
 
-            dwc3@a600000 {
+            usb@a600000 {
                 compatible = "snps,dwc3";
                 reg = <0 0x0a600000 0 0xcd00>;
                 interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.27.0

