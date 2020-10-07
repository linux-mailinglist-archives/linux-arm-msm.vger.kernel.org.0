Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8916286632
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 19:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgJGRtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 13:49:42 -0400
Received: from mail-02.mail-europe.com ([51.89.119.103]:46652 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgJGRtk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 13:49:40 -0400
Date:   Wed, 07 Oct 2020 17:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1602092974;
        bh=55HoEt0OV8YYq8cG2qxe2D4pju6+UzBhBfwJ7r5tuRA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qLo/NgZIpSs46hyvVjgLfwP8TrBoaOfiQSXlxHJYasHMtOIUurtx+Q/KAzpY7ZfPu
         a25UYuK2Kqd5mjAxFOFsYfvKCdYJoQ5dc0Vt4Kds1TNA7gObe9JSklK0lRHmMdDd8p
         a3uPa0qDTtmR4yCll0ksvud0dgzqwbJI65fW4YXc=
To:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Caleb Connolly <caleb@connolly.tech>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 4/5] dt-bindings: add vendor bindings for OnePlus
Message-ID: <20201007174736.292968-5-caleb@connolly.tech>
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

Used by the OnePlus 6/T device trees

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../bindings/arm/oneplus/oneplus-boards.yaml  | 25 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/oneplus/oneplus-b=
oards.yaml

diff --git a/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.y=
aml b/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml
new file mode 100644
index 000000000000..a4d9bbd5681f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/oneplus/oneplus-boards.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OnePlus based boards
+
+maintainers:
+  - Caleb Connolly <caleb@connolly.tech>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: SDM845 based boards
+        items:
+          - enum:
+              - oneplus,enchilada               # OnePlus 6
+              - oneplus,fajita                  # OnePlus 6T
+          - const: oneplus,oneplus6             # OnePlus 6 and derivative=
s
+
+required:
+  - compatible
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml
index 63996ab03521..6672d7242d54 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -754,6 +754,8 @@ patternProperties:
     description: OLIMEX Ltd.
   "^olpc,.*":
     description: One Laptop Per Child
+  "^oneplus,.*":
+    description: One Plus Technology (Shenzhen) Co., Ltd..
   "^onion,.*":
     description: Onion Corporation
   "^onnn,.*":
--=20
2.28.0


