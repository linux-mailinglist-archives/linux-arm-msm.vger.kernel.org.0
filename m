Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E2C5AF22D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 19:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbiIFRN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 13:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235084AbiIFRMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 13:12:55 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF7C8C018
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 10:02:32 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso7840202wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pE/wXMKDu2HTLm4nxMQCANKnWbd/WYM89vdJpLu9FcU=;
        b=VYRTVGMQRqOwTouxak7LtLp7dc4GIzykhdstFKXt6s0ERXTosZBvcR3uTC1sqqhf0E
         NFszOBssMXrW+Wep5qU7dUPPKFvNL1uH2PkxcysQJhirqUqwgdMX41fcPjoVYXsabG7Y
         MVEXLXPJXf09fIuMFe9D8eOPRLhYVX/dl+lTcC+b5NxGfc68V6oxRb7Iuh5w51DGYbWd
         R0nmymCFTe2/E9h/DOyih4NRRc69ra1lHsRmDquGawJTHRidNCMQGcU1meoV84RF7IFj
         GUM4t7C/DI7y99Uo7bd/aFxm6OwjE00yUks5BHEAdRZt0hoVO3utIqs9wnWu1zhzpTmG
         99Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pE/wXMKDu2HTLm4nxMQCANKnWbd/WYM89vdJpLu9FcU=;
        b=ZvcIC+gYqEnKDFjbWflzkRjcE46nA74Loe7DcH8OiRkTnLYBUzT0/FVso2nNcTe7k5
         SFiL0C0Klqoo2blsVBo4Cj1y7o4ZPp9ObDIznWtVchWfNJJ45WrsScXHDGPNME37emaF
         3l/NpwgWSSWS7Yi0bdNm11x4pnJj/Bf2+duxZBVJi/ebCxmYKpSJDqLXAg9A/rwjvm2E
         6WcWQnqLPc2zUUJl4MwAND7ul0L7O9at69aXDhyXsPHvvElDxk+TtBF054XomgdLxSh/
         2VbXFlf5oNhgmohxVHL2I5oZT5/Y+OmtOUrMv84Xfuw7NrEd6s0gKCpLEa0JVoI6ZfCg
         z9cQ==
X-Gm-Message-State: ACgBeo2NinlFbU4X5jzbDDGjdAsfaxBWv7g54WsUV6oDEXxmTnSx4p/a
        9QWAMhJXQ4OtdIp9eMQVDbbDNA==
X-Google-Smtp-Source: AA6agR4eZQRkCNEjfnHqGohLVi6VKLUeCDmUGuENJPgIzLDol1RAz0fp/6VjlL3ZnyNVNcetluePuw==
X-Received: by 2002:a05:600c:2483:b0:3a5:e70c:d5f6 with SMTP id 3-20020a05600c248300b003a5e70cd5f6mr14557588wms.51.1662483734275;
        Tue, 06 Sep 2022 10:02:14 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:02:13 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 07/12] ASoC: qcom: dt-bindings: add sm8450 and sc8280xp compatibles
Date:   Tue,  6 Sep 2022 18:01:07 +0100
Message-Id: <20220906170112.1984-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds SM8450 and SC8280XP compatible entry for LPASS TX, RX, WSA
and VA codec macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml          | 2 ++
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml          | 2 ++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml          | 2 ++
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml         | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index a6905bcf89d2..1de11e7f33bb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-rx-macro
       - qcom,sm8250-lpass-rx-macro
+      - qcom,sm8450-lpass-rx-macro
+      - qcom,sc8280xp-lpass-rx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 324595a62ae8..de8297b358e8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-tx-macro
       - qcom,sm8250-lpass-tx-macro
+      - qcom,sm8450-lpass-tx-macro
+      - qcom,sc8280xp-lpass-tx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 7b4cc84eda8c..9f473c08cb2e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-va-macro
       - qcom,sm8250-lpass-va-macro
+      - qcom,sm8450-lpass-va-macro
+      - qcom,sc8280xp-lpass-va-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 13cdb8a10687..4959ad658eac 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-wsa-macro
       - qcom,sm8250-lpass-wsa-macro
+      - qcom,sm8450-lpass-wsa-macro
+      - qcom,sc8280xp-lpass-wsa-macro
 
   reg:
     maxItems: 1
-- 
2.21.0

