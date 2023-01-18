Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E5D671255
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 05:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjAREMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 23:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjAREMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 23:12:51 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BD954121
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:50 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id qx13so21886189ejb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlAOuwT6a0+kLlug0pSdWU2MG7aHOg98XkEv7Zhzzdk=;
        b=HnMtNU4Y8dkcp72PJN26efwS6aMQk0M30koPe6RBIgDg9Q+6WF+95IATz1M8FvE03K
         HaEslUbJIvBfgSy+xl4dMJ9N+Zus439odBrmdXF73gfx+PfdXohykJahlEfg20Tv/uxo
         8qHH+bk0t1S9phZFhC2R1TitG2M0g8YFLOTgWGuSuUpd73UYxVDp5xA1eAZc2MvxeihJ
         aWfAXqg+MOF00/7bBjDxWmmcRMnH+97ADBKZaCCEHRCpp0w5AzBk6zaiOAmNHXuxK2ns
         WQTtdKgEUlwy5ALxpn0zsLI9zKZFPh0vhRufSo9BzdhQhhABlb/U71EUIj1vgLWH3GQT
         LM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlAOuwT6a0+kLlug0pSdWU2MG7aHOg98XkEv7Zhzzdk=;
        b=HO6HfF2MZGUVWtRMr54L83D2px1yXwZ7fSMNktV6l3299HJyHYdOV62DwX5b3Xn87W
         7MEfmjpaRI/Bis9tfXWOJbHeITBsyL4bMHdvai9W8eObq3qH4bOTuciNR2rEoRz6/dxW
         KgYlUCgNxTdDQEQoaFrq5DLSAn2Q68VMstCz7X6QOuG36FNHpCVeXp3JESmqxtQQDoui
         rhC8Jx4IQWX56EuprUrsE1F6g4RRgRa5OxKJWWOAFrX/P3dfHfOyYZFFqFCtpy2TwMT5
         M+MZc23S16BdBFNLpfFz1wZ9ax3h2UveaDwKkOCTuHGa7relD2si7dOTdBIN4xOKf8nL
         g0KQ==
X-Gm-Message-State: AFqh2krcpAcBpwYMc+Nu9qeIssYmAVPEy9S2whD/CyRP5KlZ+8A8jbpY
        zYDRXs0LJo/zcsectlU+3Jjzsw==
X-Google-Smtp-Source: AMrXdXsS5MGtLfe/3lDjhg6BD1CRnNYyo8jZwtVgfKoSIPFG+TmSJn/SOyLf1YcMgbL3Ax8ssAnIPQ==
X-Received: by 2002:a17:907:2096:b0:7c1:2075:199a with SMTP id pv22-20020a170907209600b007c12075199amr5586276ejb.76.1674015169276;
        Tue, 17 Jan 2023 20:12:49 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:12:48 -0800 (PST)
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
Subject: [PATCH v7 03/11] dt-bindings: display/msm: add core clock to the mdss bindings
Date:   Wed, 18 Jan 2023 06:12:35 +0200
Message-Id: <20230118041243.1720520-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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

Add (optional) core clock to the mdss bindings to let the MDSS driver
access hardware registers before MDP driver probes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdss.yaml       | 32 +++++++++++++------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index d09842db3825..461cb13c7092 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -44,18 +44,30 @@ properties:
       The MDSS power domain provided by GCC
 
   clocks:
-    minItems: 1
-    items:
-      - description: Display abh clock
-      - description: Display axi clock
-      - description: Display vsync clock
+    oneOf:
+      - minItems: 3
+        items:
+          - description: Display abh clock
+          - description: Display axi clock
+          - description: Display vsync clock
+          - description: Display core clock
+      - minItems: 1
+        items:
+          - description: Display abh clock
+          - description: Display core clock
 
   clock-names:
-    minItems: 1
-    items:
-      - const: iface
-      - const: bus
-      - const: vsync
+    oneOf:
+      - minItems: 3
+        items:
+          - const: iface
+          - const: bus
+          - const: vsync
+          - const: core
+      - minItems: 1
+        items:
+          - const: iface
+          - const: core
 
   "#address-cells":
     const: 1
-- 
2.39.0

