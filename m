Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43B36739E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjASNW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjASNWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:22:25 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37C565AB
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:23 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id y19so2856903edc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50rzk8fpGbRdVDZHXg9S8+HwYz3izR2NNax3H/NsJOM=;
        b=EQYH8nmRze7ju0NbzV5aVZ8wk9IbpDAYSndDpevL/LReS8lfr7YzunKXHo3QMiB0Lw
         VLP1NUEjdznTS9vHjNh0Jmb0dUVH0ozAZ24QnjD24rx+zBEOx9NVmoUCgoHLo7VO7UC9
         bMrue2H7jqabZLVHKKrNCP5ElmwXfSi5mwy77IqBs/EougFYRAM8h5xFyHneLiYFJTCQ
         4jINsqTV+QLeM/TgA8u0xTD57rUCk3bcBtQKWON7rtxUGeD1WHVd3F9SbqIaIxsHKZMI
         7GY5i6huJhpc44Zo+NLgj8yTJblKA8m7t+PTWuLHp/dCIcW3KFAFCsELcOpsK36kmgcf
         jmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50rzk8fpGbRdVDZHXg9S8+HwYz3izR2NNax3H/NsJOM=;
        b=p//ACpSthou5OCAEsH+CPurVVDhbXoiOCpQr8aBw9Ft3QMCr3n70j+YOe0qDV+cONc
         w5yy2cuGSqs8c2TKtYZFuqURJRy47k0j8ij6WylHrYM+v0gMqSE5mLqBFKbQ4+TOO2JE
         BCED//tKweo+qUliRI/SU/yRcerqqJaXizbm+qemTjy0PJ5+unQ20zlHglkd1kmnL4zj
         Gd+5RVqFMggGKJfIjKI5bFJOYe9Q7UGzp7b4V54WNDkUgWPSPig266q8ou17niIGR4yn
         8V2fndsQWmyplFenno28dMBuhncRustCPR2WqRE4sWX6GDDQf3yJmB+3LDinfgI3pO4J
         Y/Ew==
X-Gm-Message-State: AFqh2kqbt9jJTtvoA7EL5lwd8LORT1lL4xhe9XlVfKr1DsVzC4aDd8j5
        PsR4hxNqLv1lbIHefiQUycZ5pw==
X-Google-Smtp-Source: AMrXdXvB9GaISd9Yzhla7Zc6iihEqpzFMjIt4vGeZ4d3vmWFPeCiNEnbZLlRK5LgWUXPdOFpfesk9Q==
X-Received: by 2002:a05:6402:3906:b0:49b:c516:72ee with SMTP id fe6-20020a056402390600b0049bc51672eemr12423199edb.41.1674134542257;
        Thu, 19 Jan 2023 05:22:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:22:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/6] dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
Date:   Thu, 19 Jan 2023 15:22:14 +0200
Message-Id: <20230119132219.2479775-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pxo clock to the 8960 bindings (used by the HDMI PLL)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
index fdb277edebeb..2c21e120ff8d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
@@ -53,7 +53,6 @@ allOf:
           contains:
             enum:
               - qcom,hdmi-phy-8660
-              - qcom,hdmi-phy-8960
     then:
       properties:
         clocks:
@@ -63,6 +62,24 @@ allOf:
             - const: slave_iface
         vddio-supply: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-phy-8960
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 2
+        clock-names:
+          minItems: 1
+          items:
+            - const: slave_iface
+            - const: pxo
+        vddio-supply: false
+
   - if:
       properties:
         compatible:
@@ -98,7 +115,7 @@ examples:
             <0x4a00500 0x100>;
       #phy-cells = <0>;
       power-domains = <&mmcc 1>;
-      clock-names = "slave_iface";
-      clocks = <&clk 21>;
+      clock-names = "slave_iface", "pxo";
+      clocks = <&clk 21>, <&pxo_board>;
       core-vdda-supply = <&pm8921_hdmi_mvs>;
     };
-- 
2.39.0

