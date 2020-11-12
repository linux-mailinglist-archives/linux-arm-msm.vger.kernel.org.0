Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962542B09C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 17:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgKLQVj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 11:21:39 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:52580 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbgKLQVi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 11:21:38 -0500
Date:   Thu, 12 Nov 2020 16:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1605198095;
        bh=Yab+DpMKrzGHr1XGNcNAibAtjY21k1y20x0J0byD9z8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=hwIBm348uoWLaXaGsDhBSwkqe7zLprsuTipBE+5KHT8srMsz7h4U8T5MrKBUUb984
         ZJ3LffR4aSj2xPaJIvzSjDvOqDQONvK/PZAMvAnkNL8GAPWxAEBdoB8FcbpWDYNSV8
         8OJS2cGuz8Cl4chCzIjIKuzPEVe52tveenbemeCc=
To:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb@connolly.tech>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 2/5] dt-bindings: panel-simple-dsi: add samsung panels for OnePlus 6/T
Message-ID: <20201112161920.2671430-3-caleb@connolly.tech>
In-Reply-To: <20201112161920.2671430-1-caleb@connolly.tech>
References: <20201112161920.2671430-1-caleb@connolly.tech>
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

Add compatibles for the samsung,sofef00 and samsung,s6e3fc2x01 panels
used in the OnePlus 6 & 6T respectively.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-d=
si.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.=
yaml
index c0dd9fa29f1d..04d829177aa8 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -47,6 +47,10 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Samsung sofef00 1080x2280 AMOLED panel
+      - samsung,sofef00
+        # Samsung s6e3fc2x01 1080x2340 AMOLED panel
+      - samsung,s6e3fc2x01
=20
   reg:
     maxItems: 1
--=20
2.29.2


