Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE39029A33D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 04:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504879AbgJ0DWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 23:22:52 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46722 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504881AbgJ0DWw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 23:22:52 -0400
Received: by mail-pf1-f194.google.com with SMTP id y14so74821pfp.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2020 20:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L0KXRaQPI3kib1oWwhD95VIImOSn+JCny/rlfxWZiQU=;
        b=Ll0sXoLIk5hJGxAVBOMnHI0HO8Q6L32owCrh+65IwVxhKPIwAfKyFaBuBut6tSFcRs
         VAo7C4KFCKyZFyr9MKHYqB9JSZ94Ug22Lq+bCGEepc5lo+ROnU7Tp8LNn56ZnEdySsXj
         KLDbnsj/5CgMKU2s3GY2AOXVfJRLg4wqIhFfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L0KXRaQPI3kib1oWwhD95VIImOSn+JCny/rlfxWZiQU=;
        b=Zp0N9lsGW9h8YJqCsM16hhuBQ7SB1Tz+mFuk4IW9xnY7uftG0wVdl+sD7DORKQsYWf
         qoClSo5gUJS9jV43gI9b9w+Ho6MUa4fWvhxkiphFUlNNZLmPhysfpN+fBZO4SJMdKOXn
         EugxhHhBJb/XwAnIub1dGhLLNPK36jAvKb870eswFeKvW5YE96nGrbh2a01Mo23/Ja3h
         e4U+nsDxXhRKF/R9Gf9qLft503uFnXZTx8Wo/OnT4K9GbmYi8HFjp2niRUJAi7L/cQYM
         Pd4rL5blA0pnYVurQ1G3EapeBw7htYKlOehOmBVD1n75PUQ4CxDNvOijnLl1rfk4GcPW
         0ASw==
X-Gm-Message-State: AOAM532K0d1JAuo5gZF/ayMnESyItIO7KDDSlY5pc7PeEdY9Tnm80xos
        uwktmUmc/XFKnzvoUhVj9IXUGQ==
X-Google-Smtp-Source: ABdhPJxlhikuWOsdRT5VC3qte90Wjru+VsLJguqJe9ZwqK/9oriR70SkKepQ1ehtoLTEZShuztZhlg==
X-Received: by 2002:a63:4525:: with SMTP id s37mr102249pga.45.1603768970080;
        Mon, 26 Oct 2020 20:22:50 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id k7sm183824pfa.184.2020.10.26.20.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 20:22:49 -0700 (PDT)
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
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        xuyuqing@huaqin.corp-partner.google.com, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH v12 1/2] ASoC: google: dt-bindings: Add sc7180-trogdor machine bindings
Date:   Tue, 27 Oct 2020 11:22:33 +0800
Message-Id: <20201027032234.1705835-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
In-Reply-To: <20201027032234.1705835-1-cychiang@chromium.org>
References: <20201027032234.1705835-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree bindings documentation file for sc7180 sound card.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
Changes from v11 to v12
- Documentation:
 - Change the file and title name for new compatible string google,sc7180-trogdor.
 - Change the example of model name.

 .../bindings/sound/google,sc7180-trogdor.yaml | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml

diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
new file mode 100644
index 000000000000..efc34689d6b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google SC7180-Trogdor ASoC sound card driver
+
+maintainers:
+  - Rohit kumar <rohitkr@codeaurora.org>
+  - Cheng-Yi Chiang <cychiang@chromium.org>
+
+description:
+  This binding describes the SC7180 sound card which uses LPASS for audio.
+
+properties:
+  compatible:
+    const: google,sc7180-trogdor
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^dai-link(@[0-9])?$":
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
+      reg:
+        description: dai link address.
+
+      cpu:
+        description: Holds subnode which indicates cpu dai.
+        type: object
+        properties:
+          sound-dai: true
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        properties:
+          sound-dai: true
+
+    required:
+      - link-name
+      - cpu
+      - codec
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - model
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+
+  - |
+    sound {
+        compatible = "google,sc7180-trogdor";
+        model = "sc7180-rt5682-max98357a-1mic";
+
+        audio-routing =
+                    "Headphone Jack", "HPOL",
+                    "Headphone Jack", "HPOR";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai-link@0 {
+            link-name = "MultiMedia0";
+            reg = <0>;
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
+            reg = <1>;
+            cpu {
+                sound-dai = <&lpass_cpu 1>;
+            };
+
+            codec {
+                sound-dai = <&max98357a>;
+            };
+        };
+
+        dai-link@2 {
+            link-name = "MultiMedia2";
+            reg = <2>;
+            cpu {
+                sound-dai = <&lpass_hdmi 0>;
+            };
+
+            codec {
+                sound-dai = <&msm_dp>;
+            };
+        };
+    };
-- 
2.29.0.rc2.309.g374f81d7ae-goog

