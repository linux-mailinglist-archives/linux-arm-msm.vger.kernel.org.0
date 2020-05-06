Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164581C7BDF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 23:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgEFVDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 17:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729627AbgEFVDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 17:03:04 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A182C061A41
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2020 14:03:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x15so1743751pfa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2020 14:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jTg3u14b1jSChok706rtCh0zd7QjZC6auThVS1AFynQ=;
        b=D6iW4e20bdBvu9vZ4q+2yhDpXY+9Am0tRCu81Dhyy+TifmOTdibQPRuQja2EVK19fY
         WreYomwshtRjtUvP46bVo9YS8KsZM2rbEQN/0uXvAujvDkzUVef/U0ryQ3Z0cMYh69zp
         EkUSaDewJjfjp/zQ9hImIR112v3DRjTwU6Vj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jTg3u14b1jSChok706rtCh0zd7QjZC6auThVS1AFynQ=;
        b=kgZGrUJFFhtA3p8CAaDhLiCqUMIMrMyoXh8bdY/QFXFJIVxmRTJyCgoFVl3evUFfWB
         8ZMu0Sax/4Mwp9DpKnxL5XI/cTUa8C5lzijh1pt3l+ub3gL6FUJ2tIjG40SAMi12GiUR
         Zc8bknfVSCkqEhtpb7YI+2WNS+S6WlD0yABDGXeJZQ4yMBfJkxwerbIIsznVaFX2nQjH
         nGZi4DZnECrh5rEgSuO1OjpXfOF3W29K8+DvBONRYdi77crydV/0KiqvlM69iZjYCm0q
         K6XxdkkZjZmkLBfBEMvfaizfPWWnYT5MR/Ep0ZAHV+9h6ly6ca7BaD9cbFvg2spwCXR/
         GixA==
X-Gm-Message-State: AGi0PuadzLnxX9uwTp28ZDOrCrCjyYBUuKWbDT18vsPNIhJe5cVZ32Od
        aoXQ6/bn/xaBKnOkOam9/CFfng==
X-Google-Smtp-Source: APiQypJ4p2EB66cdVsjU8aoV6seeh84NlanroNemlQHB07n6r/taT/MsTAE900J1+tl8XNpWPOf5pg==
X-Received: by 2002:a63:cf10:: with SMTP id j16mr8528746pgg.201.1588798983499;
        Wed, 06 May 2020 14:03:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id u5sm2256412pgi.70.2020.05.06.14.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 14:03:02 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     robdclark@chromium.org, seanpaul@chromium.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: drm/bridge: ti-sn65dsi86: Improve the yaml validation
Date:   Wed,  6 May 2020 14:02:42 -0700
Message-Id: <20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
References: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the following checks to the yaml:
- Remapping of the eDP output lanes is now limited to the subset of
  remappings that the hardware supports.
- No more additional properties can be added under 'ports'.

This patch fixes the following bugs in the original yaml conversion:
- Fixed dependency between 'data-lanes' and 'lane-polarities', which
  was backwards.  Now you can only specify 'lane-polarities' if you
  specified 'data-lanes'.  I could have sworn I tried this before.
- We can't remap input lanes in this hardware.

This patch doesn't do, but if someone knew how I'd love to:
- Make sure if we have both 'lane-polarities' and 'data-lanes' that
  they have the same number of elements.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch could be squashed atop the patch adding the yaml [1].  I'm
sending separately for now to avoid churning the series another time.

[1] https://lore.kernel.org/r/20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid

Changes in v2:
- ("... Improve the yaml validation") new for v2.

 .../bindings/display/bridge/ti,sn65dsi86.yaml | 74 ++++++++++---------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 75c4e8b8e4b7..be10e8cf31e1 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -72,6 +72,7 @@ properties:
 
   ports:
     type: object
+    additionalProperties: false
 
     properties:
       "#address-cells":
@@ -94,33 +95,9 @@ properties:
           endpoint:
             type: object
             additionalProperties: false
-
             properties:
               remote-endpoint: true
 
-              data-lanes:
-                minItems: 1
-                maxItems: 4
-                items:
-                  enum:
-                    - 0
-                    - 1
-                    - 2
-                    - 3
-                description: See ../../media/video-interface.txt
-
-              lane-polarities:
-                minItems: 1
-                maxItems: 4
-                items:
-                  enum:
-                    - 0
-                    - 1
-                description: See ../../media/video-interface.txt
-
-            dependencies:
-              data-lanes: [lane-polarities]
-
         required:
           - reg
 
@@ -143,15 +120,44 @@ properties:
               remote-endpoint: true
 
               data-lanes:
-                minItems: 1
-                maxItems: 4
-                items:
-                  enum:
-                    - 0
-                    - 1
-                    - 2
-                    - 3
-                description: See ../../media/video-interface.txt
+                oneOf:
+                  - minItems: 1
+                    maxItems: 1
+                    uniqueItems: true
+                    items:
+                      enum:
+                        - 0
+                        - 1
+                    description:
+                      If you have 1 logical lane the bridge supports routing
+                      to either port 0 or port 1.  Port 0 is suggested.
+                      See ../../media/video-interface.txt for details.
+
+                  - minItems: 2
+                    maxItems: 2
+                    uniqueItems: true
+                    items:
+                      enum:
+                        - 0
+                        - 1
+                    description:
+                      If you have 2 logical lanes the bridge supports
+                      reordering but only on physical ports 0 and 1.
+                      See ../../media/video-interface.txt for details.
+
+                  - minItems: 4
+                    maxItems: 4
+                    uniqueItems: true
+                    items:
+                      enum:
+                        - 0
+                        - 1
+                        - 2
+                        - 3
+                    description:
+                      If you have 4 logical lanes the bridge supports
+                      reordering in any way.
+                      See ../../media/video-interface.txt for details.
 
               lane-polarities:
                 minItems: 1
@@ -163,7 +169,7 @@ properties:
                 description: See ../../media/video-interface.txt
 
             dependencies:
-              data-lanes: [lane-polarities]
+              lane-polarities: [data-lanes]
 
         required:
           - reg
-- 
2.26.2.645.ge9eca65c58-goog

