Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F543248399
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 13:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHRLKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 07:10:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbgHRLK3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 07:10:29 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A407120706;
        Tue, 18 Aug 2020 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597749028;
        bh=17WXza0/GFSwV+2gDZHobE3KPOe37aWJc6fsWoWltps=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KJMpED4pSE+jy+GPby584lVmd/ecIpx2xh/bUd1LppOaWqcSBf0bUFK9eAULdMi7z
         HY6SgeT43hYFda+tWm+vhdribIOmtxxd+q8JxOslJq1dqj5tKVZjON5PlsynPme8pg
         R9x3B2d4kc7CzmMxkMwerowm0Mz4LdUQyNup7sN4=
Date:   Tue, 18 Aug 2020 13:10:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3.1 43/44] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
Message-ID: <20200818131024.6918c5ca@coco.lan>
In-Reply-To: <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
        <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=46rom e464ec2c38c083403b556e60f189ee8ae2f2c9c6 Mon Sep 17 00:00:00 2001
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Fri, 31 Jul 2020 09:46:02 +0200
Subject: [PATCH] dt: document HiSilicon SPMI controller and mfd/regulator
 properties

Add documentation for the properties needed by the HiSilicon
6421v600 driver, and by the SPMI controller used to access
the chipset.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---

v3.1:
  - Changed the DT properties to better match upstream requirements

PS.: I opted to submit just this patch, instead of the entire
series, in order to avoid flooding people's ML.

I'll be posting the full series again after DT specs match
upstream requirements.


diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pm=
ic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.=
yaml
new file mode 100644
index 000000000000..881bbd83df65
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon 6421v600 SPMI PMIC
+
+maintainers:
+  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+
+description: |
+  HiSilicon 6421v600 should be connected inside a MIPI System Power Manage=
ment
+  (SPMI) bus. It provides interrupts and power supply.
+
+  The GPIO and interrupt settings are represented as part of the top-level=
 PMIC
+  node.
+
+  The SPMI controller part is provided by
+  Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.ya=
ml.
+
+properties:
+  $nodename:
+    pattern: "pmic@[0-9a-f]"
+
+  compatible:
+    const: hisilicon,hi6421v600-spmi
+
+  reg:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-controller:
+    description:
+      Identify that the PMIC is capable of behaving as an interrupt contro=
ller.
+
+  gpios:
+    maxItems: 1
+
+  regulators:
+    type: object
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^ldo[0-9]+@[0-9a-f]$':
+        type: object
+
+        $ref: "/schemas/regulator/regulator.yaml#"
+
+        properties:
+          reg:
+            description: Enable register.
+
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+          vsel-reg:
+            description: Voltage selector register.
+
+          enable-mask:
+            description: Bitmask used to enable the regulator.
+
+          voltage-table:
+            description: Table with the selector items for the voltage reg=
ulator.
+            minItems: 2
+            maxItems: 16
+
+          off-on-delay-us:
+            description: Time required for changing state to enabled in mi=
croseconds.
+
+          startup-delay-us:
+            description: Startup time in microseconds.
+
+          idle-mode-mask:
+            description: Bitmask used to put the regulator on idle mode.
+
+          eco-microamp:
+            description: Maximum current while on idle mode.
+
+        required:
+          - reg
+          - vsel-reg
+          - enable-mask
+          - voltage-table
+          - off-on-delay-us
+          - startup-delay-us
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+examples:
+  - |
+    /* pmic properties */
+
+    pmic: pmic@0 {
+      compatible =3D "hisilicon,hi6421-spmi";
+      reg =3D <0 0>;
+
+      #interrupt-cells =3D <2>;
+      interrupt-controller;
+      gpios =3D <&gpio28 0 0>;
+
+      regulators {
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+
+        ldo3: ldo3@16 {
+          reg =3D <0x16>;
+          vsel-reg =3D <0x51>;
+
+          regulator-name =3D "ldo3";
+          regulator-min-microvolt =3D <1500000>;
+          regulator-max-microvolt =3D <2000000>;
+          regulator-boot-on;
+
+          enable-mask =3D <0x01>;
+
+          voltage-table =3D <1500000>, <1550000>, <1600000>, <1650000>,
+                          <1700000>, <1725000>, <1750000>, <1775000>,
+                          <1800000>, <1825000>, <1850000>, <1875000>,
+                          <1900000>, <1925000>, <1950000>, <2000000>;
+          off-on-delay-us =3D <20000>;
+          startup-delay-us =3D <120>;
+        };
+
+        ldo4: ldo4@17 { /* 40 PIN */
+          reg =3D <0x17>;
+          vsel-reg =3D <0x52>;
+
+          regulator-name =3D "ldo4";
+          regulator-min-microvolt =3D <1725000>;
+          regulator-max-microvolt =3D <1900000>;
+          regulator-boot-on;
+
+          enable-mask =3D <0x01>;
+          idle-mode-mask =3D <0x10>;
+          eco-microamp =3D <10000>;
+
+          hi6421-vsel =3D <0x52 0x07>;
+          voltage-table =3D <1725000>, <1750000>, <1775000>, <1800000>,
+                          <1825000>, <1850000>, <1875000>, <1900000>;
+          off-on-delay-us =3D <20000>;
+          startup-delay-us =3D <120>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-con=
troller.yaml b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-c=
ontroller.yaml
new file mode 100644
index 000000000000..b1cfa9c3aca6
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller=
.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/hisilicon,hisi-spmi-controller.yam=
l#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon SPMI controller
+
+maintainers:
+  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+
+description: |
+  The HiSilicon SPMI BUS controller is found on some Kirin-based designs.
+  It is a MIPI System Power Management (SPMI) controller.
+
+  The PMIC part is provided by
+  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml.
+
+properties:
+  $nodename:
+    pattern: "spmi@[0-9a-f]"
+
+  compatible:
+    const: hisilicon,kirin970-spmi-controller
+
+  reg:
+    maxItems: 1
+
+  spmi-channel:
+    description: |
+      number of the Kirin 970 SPMI channel where the SPMI devices are conn=
ected.
+
+required:
+ - compatible
+ - reg
+ - spmi-channel
+
+patternProperties:
+  "^pmic@[0-9a-f]$":
+    description: |
+      PMIC properties, which are specific to the used SPMI PMIC device(s).
+      When used in combination with HiSilicon 6421v600, the properties
+      are documented at
+      Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yam=
l.
+
+examples:
+  - |
+    bus {
+      #address-cells =3D <2>;
+      #size-cells =3D <2>;
+
+      spmi: spmi@fff24000 {
+        compatible =3D "hisilicon,kirin970-spmi-controller";
+        status =3D "ok";
+        reg =3D <0x0 0xfff24000 0x0 0x1000>;
+        spmi-channel =3D <2>;
+
+        pmic@0 {
+          /* pmic properties */
+        };
+      };
+    };
