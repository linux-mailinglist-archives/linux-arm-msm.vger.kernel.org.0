Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93D92A24C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 07:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgKBGY0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 01:24:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgKBGYZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 01:24:25 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867CEC0617A6;
        Sun,  1 Nov 2020 22:24:25 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id r10so6342191plx.3;
        Sun, 01 Nov 2020 22:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
        b=TN1kXme8So3nia93jft19a+yG8QKdaRwbSY/mPtmcT8biUf+vQfmqNY8p2Z8ZBVB73
         Ho33MAvyzujMMFhlK/tvFLWDcfxrBcX8a5Ap08W0FN5u/MrV6p5YW2aVgM2c5LsC5CK0
         SMUxEgP/YxigD1Px2YACVZehKZN5KDXMbB1Hg0VYfykdTFa0D6a3KEssxs+17whM3kWa
         o/IC+3a1WKN4K6qGkQX5hlXEUaVnVwqr3GE1LVKhy8vzaGqHRKspujuEFT5Hx4erJU7e
         3/6oBBBafMp5xbSUJ72IEibN9vMag3rUQT249DqbLTXpdcOIFAeJFIPmyFI0UGNRkwEI
         sbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
        b=rfwq8ltHcN5CKvjqe7fvEhlIXh2HmtAZzknNSv3uuuHXSJITkIYTEz8O6dspu9XgJ9
         T6E/nZHZ0tKqPRgJLjb6Q8WGuFaKJCxmfKo+I70RkG+A2RJGLsebyK3gSLyjToWPzMvq
         pN3/BviYRFN5m6oz4v+HyAHsxK/Gz6QwHBrSNpQkR3n6yQOQBkrBcj4xPTAQpCOf9s/I
         0Vf2aszGCH6n7ez4wNcYOHrppsK5pUVSR6txEnsnzyWPdQIu2sLPu0yTxD5yqr94yjQC
         /BFKWnmPiKQTR23nc5cDiSkB+evIlLXyvJqu4ddR9S9APNkuSeSwACBBT7R52lVhzhOw
         wj3Q==
X-Gm-Message-State: AOAM531Fj9HvLDTciAkqem7dyljCipNwnTujDu3cmmZcGhXdIXm+B56E
        MOZBfba3K2Vjk5kG+iiHZHnvnecd+EDeeQ==
X-Google-Smtp-Source: ABdhPJyD3zMZ2MYz2bL49+U1aM89ASMcZIWw5ML7y7UgnGaUcnEzAwxcO9RxEmhcWdzaQu0qkIu8rA==
X-Received: by 2002:a17:902:bd4c:b029:d6:8c38:7221 with SMTP id b12-20020a170902bd4cb02900d68c387221mr18332551plx.82.1604298264823;
        Sun, 01 Nov 2020 22:24:24 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id q123sm12902114pfq.56.2020.11.01.22.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 22:24:24 -0800 (PST)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v3 1/2] ASoC: google: dt-bindings: modify machine bindings for two MICs case
Date:   Mon,  2 Nov 2020 14:24:07 +0800
Message-Id: <20201102062408.331572-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
References: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a property "dmic-gpios" for switching between two MICs.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../bindings/sound/google,sc7180-trogdor.yaml | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index efc34689d6b5..9e0505467e57 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -34,6 +34,9 @@ properties:
   "#size-cells":
     const: 0
 
+  dmic-gpios:
+    description: GPIO for switching between DMICs
+
 patternProperties:
   "^dai-link(@[0-9])?$":
     description:
@@ -81,6 +84,7 @@ additionalProperties: false
 examples:
 
   - |
+    //Example 1
     sound {
         compatible = "google,sc7180-trogdor";
         model = "sc7180-rt5682-max98357a-1mic";
@@ -128,3 +132,57 @@ examples:
             };
         };
     };
+
+  - |
+    //Example 2 (2mic case)
+    sound {
+        compatible = "google,sc7180-trogdor";
+        model = "sc7180-rt5682-max98357a-2mic";
+
+        audio-routing =
+                    "Headphone Jack", "HPOL",
+                    "Headphone Jack", "HPOR";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dmic-gpios = <&tlmm 86 0>;
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
+
+...
-- 
2.25.1

