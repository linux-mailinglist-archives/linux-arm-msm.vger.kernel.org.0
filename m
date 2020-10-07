Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3615E28662F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 19:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgJGRt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 13:49:26 -0400
Received: from mail-03.mail-europe.com ([91.134.188.129]:53886 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbgJGRtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 13:49:25 -0400
X-Greylist: delayed 1817 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Oct 2020 13:49:23 EDT
Date:   Wed, 07 Oct 2020 17:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1602092959;
        bh=d2j//6xhs2PPOH5F6O6PlO0HsUSK+06Ub5QJ1wgRpaw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Xc9rQiDbg99CWVIGSugGIzMxY8sYg4tiFj9BWlF6aH8OOY7H8R1vlyPX7Pwfly7kA
         7MbuWJUDnFNRL8mflf1nIuHB8wQotZGBAdmSeenPThWntxwF94BC4ej3QxHtULSL5b
         3BvzC509kBmjqLgQ9viUvX1OyE7GlQPz1TPyVo2U=
To:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Caleb Connolly <caleb@connolly.tech>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 2/5] dt-bindings: panel: add documentation for oneplus6 panel
Message-ID: <20201007174736.292968-3-caleb@connolly.tech>
In-Reply-To: <20201007174736.292968-1-caleb@connolly.tech>
References: <20201007174736.292968-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the OnePlus 6/T common panel driver, example from
arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../display/panel/panel-oneplus6.yaml         | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-o=
neplus6.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-oneplus6=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
new file mode 100644
index 000000000000..23ba369cc2f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-oneplus6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OnePlus 6/T panel driver
+
+description: |
+  The OnePlus 6 panel driver encompasses the display panels found in the
+  OnePlus 6 and 6T devices, the panels have almost identical behaviour and
+  are not used by any other devices.
+
+maintainers:
+  - Caleb Connolly <caleb@connolly.tech>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - samsung,sofef00
+      - samsung,s6e3fc2x01
+
+  reg: true
+  reset-gpios: true
+  port: true
+
+  vddio-supply:
+    description: VDDIO regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    &dsi0 {
+      status =3D "okay";
+      vdda-supply =3D <&vdda_mipi_dsi0_1p2>;
+
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      display_panel: panel@0 {
+        status =3D "okay";
+        compatible =3D "samsung,sofef00";
+
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        reg =3D <0>;
+
+        vddio-supply =3D <&vreg_l14a_1p88>;
+
+        reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+        pinctrl-names =3D "default";
+        pinctrl-0 =3D <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
+
+        port {
+          panel_in: endpoint {
+            remote-endpoint =3D <&dsi0_out>;
+          };
+        };
+      };
+    };
+
+...
--=20
2.28.0


