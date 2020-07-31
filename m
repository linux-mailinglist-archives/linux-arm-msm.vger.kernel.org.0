Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A499234158
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 10:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731761AbgGaIku (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 04:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730337AbgGaIku (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 04:40:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5F2C061575
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:40:49 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id p1so16763210pls.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NIzfJh8T5wa5GwVtEriaAG+RkPfrW2T7ykJIcihGjlM=;
        b=MOhgr/rC/RSWF73gWEq40/BYQohycUznx2d/6Zk8WrjVGuxsY8FGS/NYO/7RzAdTOt
         Dpg2irL3d+rb2V7VGdXH/PlJiDZZc24s+CDVG07CgrcRcURH8XCCg3jEkASUj6u8w3Jq
         EhkS60lWZW4FE7iPvg/Y7hcmxWB5rusNzXHec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NIzfJh8T5wa5GwVtEriaAG+RkPfrW2T7ykJIcihGjlM=;
        b=QTxeAPPIV7sJ1GL8LjU3mqo87CadoUSeiM8NWwLrxtpY7iMYgOg0fn9baV/s4gXLnw
         jspN+DXP1AWAzRw3X6fX1hbldTG9L8R/jGJY3lrW1FEJ5V2MF0ZwzO/76uJ80ClXvwCL
         ULxhBGZFYSq9SZueW7uAGDdya77PqD/3tayD8xbguiW/KM2HURQCTX8HQnvEad8fMw4M
         MkPa/envfF0SBUgZWdlbhHi6gPKKVbtZ6QRQl10XVSFr5g5eoqaL5xX5XYR2US+n/dgj
         CsM6VDAVTPvefQMpjHoO8PDqln2YSdPEZ44jYtiQvtVcWNjsSzv8rFtaoYu8jqkBaiTE
         UXoA==
X-Gm-Message-State: AOAM5338GkkyhQD3s73BfGjTV9SxKAWzpTFS2q9Uk7fJOxza0gc5eIW+
        bdqVkdkutoWTiL0h/+rrtATVGw==
X-Google-Smtp-Source: ABdhPJyRoMIwdPxNIs97ZW15pfn3HhdNwjkFFIWLN02NWZAUtvGEPnnpMVHcyoFTzdJO0kGOteRhwg==
X-Received: by 2002:a17:902:aa91:: with SMTP id d17mr1223925plr.27.1596184849385;
        Fri, 31 Jul 2020 01:40:49 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id n25sm9228625pff.51.2020.07.31.01.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 01:40:48 -0700 (PDT)
From:   Cheng-Yi Chiang <cychiang@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH v3 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
Date:   Fri, 31 Jul 2020 16:40:22 +0800
Message-Id: <20200731084023.2678931-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200731084023.2678931-1-cychiang@chromium.org>
References: <20200731084023.2678931-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree bindings documentation file for sc7180 sound card.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 .../bindings/sound/qcom,sc7180.yaml           | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
new file mode 100644
index 000000000000..ce8a5a2d9df9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
+
+maintainers:
+  - Rohit kumar <rohitkr@codeaurora.org>
+  - Cheng-Yi Chiang <cychiang@chromium.org>
+
+description:
+  This binding describes the SC7180 sound card which uses LPASS for audio.
+
+definitions:
+
+  dai:
+    type: object
+    properties:
+      sound-dai:
+        maxItems: 1
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: phandle array of the codec or CPU DAI
+
+    required:
+      - sound-dai
+
+properties:
+  compatible:
+    contains:
+      const: qcom,sc7180-sndcard
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  aux-dev:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the codec for headset detection
+
+patternProperties:
+  "^dai-link(@[0-9]+)?$":
+    description:
+      Each subnode represents a dai link. Subnodes of each dai links would be
+      cpu/codec dais.
+
+    type: object
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name.
+        $ref: /schemas/types.yaml#/definitions/string
+        maxItems: 1
+
+      cpu:
+        $ref: "#/definitions/dai"
+
+      codec:
+        $ref: "#/definitions/dai"
+
+    required:
+      - link-name
+      - cpu
+      - codec
+
+    additionalProperties: false
+
+examples:
+
+  - |
+    sound {
+        compatible = "qcom,sc7180-sndcard";
+        model = "sc7180-snd-card";
+
+        audio-routing =
+                    "Headphone Jack", "HPOL",
+                    "Headphone Jack", "HPOR";
+
+        aux-dev = <&alc5682>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai-link@0 {
+            link-name = "MultiMedia0";
+            cpu {
+                sound-dai = <&lpass_cpu 0>;
+            };
+
+            codec {
+                sound-dai = <&alc5682 0>;
+            };
+        };
+
+        dai-link@1 {
+            link-name = "MultiMedia1";
+            cpu {
+                sound-dai = <&lpass_cpu 1>;
+            };
+
+            codec {
+                sound-dai = <&max98357a>;
+            };
+        };
+    };
-- 
2.28.0.163.g6104cc2f0b6-goog

