Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9C929FF36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 08:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgJ3H5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 03:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgJ3H5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 03:57:41 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3AFC0613CF;
        Fri, 30 Oct 2020 00:57:41 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id g12so4523459pgm.8;
        Fri, 30 Oct 2020 00:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
        b=TIAZA7N8mLmP6GAoy04oBaSwZCDUDemagaep0eIu6AVKSnUnnYtVhNIHCbEpMG83/6
         vFXKk85L3GDQnUQja8BMduB43h6WCwm8GO4sbAEsIrOZpCMsw25Rlj5buLnDSbAY8TC2
         q+NMGg0/JaGHONi3izuRNMWV2o1sWYA657QDl4nEksP5Ok8DkeycBPgkZHTGM78FKv3x
         K2PLL+kUkHWEwPwA8LYwqbm4s0h+r71tMTD+99n/xZLMae79b0SvC9FTGmqnvsmOiNVX
         WwmsrRnCJGM2VyOSe+SLDQ5H4X8FDJDIGW2af4SZPRevmXkuIfOPj4X2svN3nKlzQ0AP
         LbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
        b=CBleGD76a/gwAARiQpxJH6tiJc6TnA2IfaPTDPG9CvTGJik0+MXsmWbKWTjB5bGb+z
         xRSW7c94GtW8lYvChAGTL8p42qdJ1jeHNyvtgbqa7yCU18KM5wEBsArPAFs4wNDc5uup
         CbO05SfGgxn3xjvpeWnevMtaYFJ2jztLbkVFRBS/TOEA1nia/n9x1clkbCT1bRPk2LiK
         gi4D/fypPefR8T/95OnmLkWJAs3aCRwofRCa5WxDU1C4DV5GkM0qzw2jOJaI8uJbVGTw
         zc+1/rtLPc4qr20NxXCiMXrhHssPEv5vgA0JRT8nBCMTaet6BEQRA4ozmAeacpLw32IS
         qF+w==
X-Gm-Message-State: AOAM532PyDBsRUXMJKRJA3yk3OyRDaZPvW56G7D2uSMyCfClHo+0d6tY
        nmy8vZXX8Iu5VzcvqV4xi7rXd1qbwbIimA==
X-Google-Smtp-Source: ABdhPJw/cGM0YEr1SGpC70+EE0aduMjiy3DUOtzXdXm1f2UI48ICWPnnjkNAv7zmg2/7VnoLQWJSkw==
X-Received: by 2002:a17:90a:5106:: with SMTP id t6mr1303122pjh.235.1604044661233;
        Fri, 30 Oct 2020 00:57:41 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id a143sm5423045pfd.138.2020.10.30.00.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 00:57:40 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ASoC: google: dt-bindings: modify machine bindings for two MICs case
Date:   Fri, 30 Oct 2020 15:57:23 +0800
Message-Id: <20201030075724.1616766-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
References: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
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

