Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC9D27A7AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 08:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgI1GiH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 02:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgI1GiH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 02:38:07 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246BDC0613CE;
        Sun, 27 Sep 2020 23:38:07 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f18so9320pfa.10;
        Sun, 27 Sep 2020 23:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J9fPNn2hkvUvRS1FoBqTdwdl0ikK+0K/8i5MIze2SS4=;
        b=EvW1auzeaeX+5P91nfpAeNz3iU3z6CXl1gD1XAWygHj/x0evv/YLyspd75P/ksoy33
         3nVjlPmZjT6ZnNetqaqDPlAPzuuy6rlHXgFEa0nOSDqhBn7HfjEcCRSj5cEYx6Ny2yRo
         +Ki+TDRfUpNA4phWyuxqaKjCnEL8Mh4HyT3elj7VQONpzdS+h/UiwvMfUKMu9hGlZqqB
         lOQtoGiDYfWb4OEfRjemFbIstZy/a5gWi+rASC9MguiWr/Z2kWRVSWmZVN2XsSZsGjNO
         gPoyDRbBnwcvIwk8TAUAxBN9hBkDqXEq+xBy2Kaqk8zyzFsObQTMfGmorhlDJEd4vVYn
         se2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J9fPNn2hkvUvRS1FoBqTdwdl0ikK+0K/8i5MIze2SS4=;
        b=IWafYUutdvx/AcSLk2vnxm4sTdLF03LSTNf+Q3gWfcNeItByhdTxYWmy4BkcqXmfno
         C724hgtIPcYgAzs365BEwUJoPIX//5/IimR5iWK3/h4QQYjV46+kCug0rCLvpKBgcCg6
         mtPhFcy6UYf3P//7883LTY6pbNmwZ6MXD1OefL+a8rRvXmjAEHdZrs6FJPGbyrW6Wrzu
         +COevxUYQZwhL00BR7pHsunUA2ex089ttH0BEVuYJSwzySfJahDSuuj1Qys0etJnhHCt
         nwTeSJpiCSoWGe0h+Zi1uQAy/pvnWZ2ja2oeVrVk8OI1fZSSr3rVAHtpN9jFuFgO4YmY
         WcAg==
X-Gm-Message-State: AOAM5323BM/uf/o7zXewUsT0ROqRms+ByUmDZKeCZiyAHtqlnfPs7BC1
        zBP6/rUd7MY9ogzNju8+e5N/afHkWZdSwjr3
X-Google-Smtp-Source: ABdhPJxG7BOD2ezBdXdfZEH8XstwCs/b4Bb6Xk3lDpQvpYBcSTLCgVvLyhndkIczw2+7IlEErCpQpQ==
X-Received: by 2002:a17:902:9007:b029:d2:8cdd:d8cd with SMTP id a7-20020a1709029007b02900d28cddd8cdmr206114plp.85.1601275086370;
        Sun, 27 Sep 2020 23:38:06 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id c7sm189527pfj.100.2020.09.27.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 23:38:05 -0700 (PDT)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine bindings
Date:   Mon, 28 Sep 2020 14:37:43 +0800
Message-Id: <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
for 2mic case.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
This patch depends on this patch series
https://patchwork.kernel.org/patch/11773221/ .

 .../bindings/sound/qcom,sc7180.yaml           | 64 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
index b77311bb5190..ec84dbfc1bc9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sc7180-sndcard-rt5682-m98357-1mic
+    enum:
+      - qcom,sc7180-sndcard-rt5682-m98357-1mic
+      - qcom,sc7180-sndcard-rt5682-m98357-2mic
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -34,6 +36,11 @@ properties:
   "#size-cells":
     const: 0
 
+  dmic-gpios:
+    description:
+      GPIO for switching between DMICs, it is required when
+      compatible is "qcom,sc7180-sndcard-rt5682-m98357-2mic".
+
 patternProperties:
   "^dai-link(@[0-9])?$":
     description:
@@ -81,6 +88,7 @@ additionalProperties: false
 examples:
 
   - |
+    //Example 1
     sound {
         compatible = "qcom,sc7180-sndcard-rt5682-m98357-1mic";
         model = "sc7180-snd-card";
@@ -128,3 +136,57 @@ examples:
             };
         };
     };
+
+  - |
+    //Example 2 (2mic case)
+    sound {
+        compatible = "qcom,sc7180-sndcard-rt5682-m98357-2mic";
+        model = "sc7180-snd-card";
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

