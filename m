Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87F4566C3B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 16:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjAPPYJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 10:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjAPPXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 10:23:43 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C15234FC
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:21:34 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h16so27794040wrz.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipy7aLx0VwQlNfAPQLDup1F5SBfWJdQz4FY6bwFHuGc=;
        b=S2uwb2b8BLVVzGbiBGjRSt09lvDYJKv/MTgNZb6TDZSThobAD5VuERDnzC8F9cOSlp
         0GiBxIXYNJXIDrm8ryJeSxUN4MyVCEvi6vQYdDLsZNvU4h7nrj1GNBOmE8wqQTZmLx8P
         1HulAz0E1H4ERGEdGc977PynVl3uL4N1uJMMPjT/T4kQIX+okN0dTGyKD/gdy/lsrG4V
         3cYBA6N+nGdr6Bfa6+28K7WZYYCVXnE9v/K7Dm8I9vccXGCZz61+LwlZwJ9uxRRMvTG6
         lIKRLVlHTAg7Azg6EYzg6QSv47lK25qI24/Qq8UxELibZzMNFpMIAB5pP2k1ouVJGVDE
         wsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipy7aLx0VwQlNfAPQLDup1F5SBfWJdQz4FY6bwFHuGc=;
        b=LyQEhvDa5B4YGqGKwecrKzVBZMExFzKicfDCNH1Lw2xBZXslKmAyUW5et/ix24VY8p
         DFW2FwrxIApcFbBj29DOjD0wVP3s87FWpiCaVe6O5CgoPf6dEEuZOid7VT6CB16geI8s
         YsVHVYxun9GYWVMQuMgY2IskXEnbTXZJSZHe/FUDpTu4fg7MPmi5sXP4UmLVPM8VNHnn
         wUS8ewQHEYwblQ8BqqIoTyHoIarOpLwzwvx85JVj9QZtrN1BTf08AqsDA4mCBMFf6aq6
         VHoQtTza97HO8Nr/TOE76Xw333s5q1se06G7qnLFQNpBwnO+evybIx0I3H3VhKwSP9j2
         YH7A==
X-Gm-Message-State: AFqh2krVkHk++Z9+tgLbrFgkXoEEuD9pIn2b+plt+Dl+KbGgnOaRdDNv
        LB8+6rOPm0+6IM6lITSHeqiVe9qcwv+u8zep
X-Google-Smtp-Source: AMrXdXsrBq9Eua99FPGOxxh5Vws09TzxkzR4rxCItnJMKRlM2+1lUIpRsU6LmmoWschXWnjoED2FHA==
X-Received: by 2002:adf:e987:0:b0:2bb:e891:1829 with SMTP id h7-20020adfe987000000b002bbe8911829mr22933080wrm.4.1673882492423;
        Mon, 16 Jan 2023 07:21:32 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u18-20020adff892000000b002bded7da2b8sm6874686wrp.102.2023.01.16.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 07:21:32 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/4] dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC
Date:   Mon, 16 Jan 2023 15:21:25 +0000
Message-Id: <20230116152128.909646-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
References: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently we do not differentiate between the various users of the
qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
compatible string but, the hardware does have some significant differences
in the number of clocks.

To facilitate documenting the clocks add the following compatible strings

- qcom,apq8064-dsi-ctrl
- qcom,msm8916-dsi-ctrl
- qcom,msm8953-dsi-ctrl
- qcom,msm8974-dsi-ctrl
- qcom,msm8996-dsi-ctrl
- qcom,msm8998-dsi-ctrl
- qcom,sc7180-dsi-ctrl
- qcom,sc7280-dsi-ctrl
- qcom,sdm660-dsi-ctrl
- qcom,sdm845-dsi-ctrl
- qcom,sm8150-dsi-ctrl
- qcom,sm8250-dsi-ctrl
- qcom,sm8350-dsi-ctrl
- qcom,sm8450-dsi-ctrl
- qcom,sm8550-dsi-ctrl
- qcom,qcm2290-dsi-ctrl

Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format while we
do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6e2fd6e9fa7f0..35668caa190c4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,9 +14,31 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,mdss-dsi-ctrl
-      - qcom,dsi-ctrl-6g-qcm2290
+    oneOf:
+      - items:
+          - enum:
+              - qcom,apq8064-dsi-ctrl
+              - qcom,msm8916-dsi-ctrl
+              - qcom,msm8953-dsi-ctrl
+              - qcom,msm8974-dsi-ctrl
+              - qcom,msm8996-dsi-ctrl
+              - qcom,msm8998-dsi-ctrl
+              - qcom,qcm2290-dsi-ctrl
+              - qcom,sc7180-dsi-ctrl
+              - qcom,sc7280-dsi-ctrl
+              - qcom,sdm660-dsi-ctrl
+              - qcom,sdm845-dsi-ctrl
+              - qcom,sm8150-dsi-ctrl
+              - qcom,sm8250-dsi-ctrl
+              - qcom,sm8350-dsi-ctrl
+              - qcom,sm8450-dsi-ctrl
+              - qcom,sm8550-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+      - items:
+          - enum:
+              - dsi-ctrl-6g-qcm2290
+          - const: qcom,mdss-dsi-ctrl
+        deprecated: true
 
   reg:
     maxItems: 1
@@ -149,7 +171,7 @@ examples:
      #include <dt-bindings/power/qcom-rpmpd.h>
 
      dsi@ae94000 {
-           compatible = "qcom,mdss-dsi-ctrl";
+           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
            reg = <0x0ae94000 0x400>;
            reg-names = "dsi_ctrl";
 
-- 
2.38.1

