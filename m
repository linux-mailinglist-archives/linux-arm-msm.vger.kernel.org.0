Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818662A41F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 11:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbgKCKb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 05:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728164AbgKCKb0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 05:31:26 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3171EC0613D1;
        Tue,  3 Nov 2020 02:31:26 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id 13so13810418pfy.4;
        Tue, 03 Nov 2020 02:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
        b=qEcXY4b5+HsZ8QmEcS2mZoob/YDmUeALkVfKMydU//PeD4Rq2m9kJwiGgtCJBz6UgX
         IZdR84A6YmHIvUL09z/m+0oYjTfneLbMddaB0sEu8+oBLMlN9EFFLh/NrvH7AhwJUDgo
         5kzT/wuWml2sOih/jxF68j2HeUeNjnWsT/RXz6vHL5/fxVRCw3PivqoWd/xLsJogmNy4
         2pE2rlkfbSyd5aRYQ7uZvoXd+QX2s27UJVL5Ig9q2f/aKmKhge9RoWaTlrq+Pm6jCXOF
         475KXOHVGFP4DwO3DJCfRwbep7EN6znzEHGvdfsSMfJBtaxCN2KxxmIe6JVY1iKJYUpI
         jvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
        b=R4q/DRqMwzvGxGFmH44eOz46HWiG+HROni3IV3cS3r4mNbQmSWaKfKvXvToqkMMl/+
         mkKBe4wSODvMOeEJgx0qHjfEFvbv4i/JZECqRi9NkEHTrfUmGD7KXjWyn8mUpPhBum/g
         cAHXDc0KZhTL+oJaNQR/Z6NDPegfly5Ag56WEDQZHlIBVwcXUR8z5xQMxPSeBaq2CYXe
         sSKMEQKa66icf3wQaro7JBQLF/eKkt606rBy1eTe6UL3gsmtbpW024tPb0jnYkzlyati
         aqYwbZTnipYZQ3pzLlYr3dApFSVRuR9B6sRWoSjtzUHoL8mxd7JU0wJEIACk81FpajbO
         IVCg==
X-Gm-Message-State: AOAM5304AFVrzaF3FaE81l4a6KwH+CN/bukNrm/zW+G0PDiqGNhW3Lv/
        aO0h1oGH33ViclNt8g3P/48Enapdm/0Y3g==
X-Google-Smtp-Source: ABdhPJx5yus/r8C+63EtUuVe15Jc9Q3Xu6wxrB3O21Hs9YTeDXWxR2YQfWWRJYnszdqtEUVpE7YyMA==
X-Received: by 2002:a17:90a:d246:: with SMTP id o6mr3085560pjw.14.1604399485498;
        Tue, 03 Nov 2020 02:31:25 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id v16sm14733951pgk.26.2020.11.03.02.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 02:31:24 -0800 (PST)
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
Subject: [PATCH v5 1/2] ASoC: google: dt-bindings: modify machine bindings for two MICs case
Date:   Tue,  3 Nov 2020 18:30:50 +0800
Message-Id: <20201103103051.34553-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103103051.34553-1-ajye_huang@compal.corp-partner.google.com>
References: <20201103103051.34553-1-ajye_huang@compal.corp-partner.google.com>
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

