Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F94252C1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 13:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgHZLFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 07:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728813AbgHZLFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 07:05:11 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D857C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 04:05:11 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 2so713497pjx.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 04:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=57ATY6rlaZ9eWDcltcMWl9pjLEa9gziieo3Id6n6Wg8=;
        b=SODSLjCJPxJuz8GNvtiwPEG9mbBU6waV9kB51eDienSbClMJV7QUxvAjRWVOjIjT1x
         gG2LhvG30xscwrLxUrCcfJVFDeKX5Epw91nWxx3ikTQLnnzCPF6o3sFfrgwsBGnZ6jm6
         g/puoak4Ejacz/UATbtTw739rS7Jl33YuIdsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=57ATY6rlaZ9eWDcltcMWl9pjLEa9gziieo3Id6n6Wg8=;
        b=Qzg/vnAGJ9G6eHevgI4VLv8/as+9nbnNvqy2EZ/ZT7O9VqDD1vupG7OWQhqC4L7lq9
         UKmfTHKvpFRnrZ46qVMObXt8JrcBrKDhisruj6r+EQCGNniWdXuuZvVMw7VLhR/k6D1c
         JS2j7UwvtkEijlbAymXB/0ukmsCei+I3V3S8QVbvqK3viJpZZ7LUKuAFL1vfXSGhcxwr
         dQnvxddWf4bPAys1yNzyylrioRyVLHEZl9258h+qv8wha3MVeGH4JC9lnKRIdPAnzNDb
         w1V6w0WLPwmRn4NBlBccOPQ3QXJrocNkoliH0tXd0xssntjE2U6hdKDMNbR6GVJqgTAC
         fgqw==
X-Gm-Message-State: AOAM531L2a7BdJuK1mn3DVR8c0qHH035fA1vWDm0EzCiZVsqxtK351CA
        /m7k6UkRIC0R6lNXaC5ZOd6fUg==
X-Google-Smtp-Source: ABdhPJzYRhsn/wYXuVMOpPBm4M674M05q8cS5wEqqc7VfH+Jxwmu3FKrFuPJeVxUpfirXrS2ykg3rQ==
X-Received: by 2002:a17:902:bb87:: with SMTP id m7mr11409065pls.61.1598439909717;
        Wed, 26 Aug 2020 04:05:09 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id o65sm2578660pfg.105.2020.08.26.04.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 04:05:09 -0700 (PDT)
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
Subject: [PATCH v6 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
Date:   Wed, 26 Aug 2020 19:04:53 +0800
Message-Id: <20200826110454.1811352-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200826110454.1811352-1-cychiang@chromium.org>
References: <20200826110454.1811352-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree bindings documentation file for sc7180 sound card.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 .../bindings/sound/qcom,sc7180.yaml           | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
new file mode 100644
index 000000000000..a85375974a4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
@@ -0,0 +1,124 @@
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
+properties:
+  compatible:
+    const: qcom,sc7180-sndcard
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
+    };
-- 
2.28.0.297.g1956fa8f8d-goog

