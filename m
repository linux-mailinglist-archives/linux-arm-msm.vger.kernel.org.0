Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652E22A3AA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 03:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgKCCyI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 21:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgKCCyH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 21:54:07 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78730C0617A6;
        Mon,  2 Nov 2020 18:54:07 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id e7so12900673pfn.12;
        Mon, 02 Nov 2020 18:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
        b=dB2pukbsNMZr6KZVfAidMjwc3OoduhL5lmwZfkb91FaoDDkmRNth47SrrahktcKt7k
         i+KEcjV/NbvB4ZuRDRI/+xFdjrSTIp6R3PeJ09yBiNQJJZSK8Odcnmfo/AB7RcbtlX4E
         rlYO4ehQC9ZqfUhW5Mu5mWeh/EiHFUJ+YZ+g5Syv+kdROZScTLf+ZEsfIJH9rFzIHiI5
         JLStT8wkG6qBsLCaxBNlZko8V3aLXqPpZU4W8r2fL6lojMdxISuOOeodqNkbyusbG7Rz
         GzU5vo+DjIkHKywiW7QfWabHyWouxmJioSiORsK+BBsCXSOI+Cz5kAz4W2vy2iL/v4Ak
         QUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
        b=SUDbFBiOt/zRbZv+sWdbW3HBS6CVNnm1CAmQvWTT7YvF+4IVSNk6680zcYq53+3NYO
         3RN7SAidJJ3O/Kew/bRY5UbP1iVwuodbXBp9EJxV/cIxfW+nicNAuVcKOQCWl+YIiBCX
         udYIWuy5tOvKFnRLhXMXsBPkqree29Lhq0MTBP9FjFxHosCJCnRyUdG9cVseXqNVc9kj
         r/LySNq66+PF+M+rvwZyzI6fjXQClgmNuLkdOY98L9NfenBnvQXQjPhs66Ap3xD1fGOS
         qS/LAjJo0zBpAtvG4LuG+Hi+KFNHgBpp/FWzmLldtO0qmqq7EHEwkNL1X2De5Wjt+VBz
         Bq5g==
X-Gm-Message-State: AOAM533GFklvS1huh+G+yQib1/8EGen1/O2+sFKSgE6qJpbPhmWgZ8yZ
        4F+7DFzJkhFFp0fuRPy7NlSUn9h0AyoIoQ==
X-Google-Smtp-Source: ABdhPJwigCQyZXVpZJRNCBT08Fbeo55lCagCxh1R/LyqYJuB7rPcp9zkcGmx63moqL7nZaJrqLGl0w==
X-Received: by 2002:a17:90b:3587:: with SMTP id mm7mr1464936pjb.234.1604372046783;
        Mon, 02 Nov 2020 18:54:06 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id t15sm937012pji.0.2020.11.02.18.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:54:06 -0800 (PST)
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
Subject: [PATCH v4 1/2] ASoC: google: dt-bindings: modify machine bindings for two MICs case
Date:   Tue,  3 Nov 2020 10:53:46 +0800
Message-Id: <20201103025347.510940-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
References: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
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

