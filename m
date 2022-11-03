Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 781EF618904
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 20:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbiKCTyA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 15:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbiKCTxq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 15:53:46 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9821CFC7
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 12:53:45 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id x21so1908343qkj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 12:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8OPD5SdDugxqBTcH6K5BwRgjhIONxvnoSDJQa8wlKs=;
        b=NiOjngkra0YgcxX92AvSFHaEiKJ2RLuDxh5KHGSXBUij3nxztpOaWtHGt2cVeSi6QD
         c3hajrwQnWk40SBqrwYqQ39whdrLxYZKDapLoBI3w7fFsdXMCr7XPK+4Z7j613yhCPnx
         HGuUgn7IqXQioBmJ7tHHp+zewdzqM0NZbH5vCeI4p7cxz+0IgNWXvCSUQGYUzI7Zlzwz
         1U4GtWjm/5VJSaeLFfmBCqftDUgx+vrRk4zkPcgELzwF3gZtRGLav/eCwBe0a2Sef7Iw
         iGz/1HVFmJsIw3FbtPSR6udzyfz0/lyNFImtdgnyWFA8ke6Jybj1s8JUKF+IDdCyAxB/
         1rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8OPD5SdDugxqBTcH6K5BwRgjhIONxvnoSDJQa8wlKs=;
        b=ZMPOwzjZAqLQp8BjSn5YWsXrdyYnsmhtzvtd0F4iGB9oV2CdrtdI7wDOiOG/wu/fBi
         g/6mLco5ROVw8JrSwiltImXm3qEwi95Xk+F+LRY1gNPO8l2DdhJlfVFSYsDk2ofC1j12
         lSx0BHfNFwIB02XamVVD4sZsWbKCurcD65PZ3IyoQ3sPcIMnFedT6wvV471t86RWFo6Q
         xxAGmtc6IY0khUDAAJ4G9f2/BkplfPRShzQh1ce2VfJD/SxKqi/WV4FPr5rTTGcwdsCZ
         ekEva5E3KtIjp3o5hUOVYAuKPtA0EWPY2KH0h6Sa/vjt4XAkOpz0k5+rHWy71lTcA8fj
         ziyQ==
X-Gm-Message-State: ACrzQf1w/7h+i/tJYt0KeygHe22R+cadNd8pbqkxEeR5J1gQS8rDxDDS
        N04qIfgmilrcBnKTpFWugf4p3K4A0Y70BA==
X-Google-Smtp-Source: AMsMyM7FFoacjbKWGh/95PpW8gyE0h/dzOYTRGJt9GOcoOtoKRUw00mgda8sl/n++3DtKfBSsR91EA==
X-Received: by 2002:a05:620a:13ee:b0:6fa:1ef7:a3b7 with SMTP id h14-20020a05620a13ee00b006fa1ef7a3b7mr20957047qkl.265.1667505224868;
        Thu, 03 Nov 2022 12:53:44 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id de41-20020a05620a372900b006b615cd8c13sm1328892qkb.106.2022.11.03.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 12:53:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass: do not hard-code clock-output-names
Date:   Thu,  3 Nov 2022 15:53:39 -0400
Message-Id: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The purpose of clock-output-names is to customize desired clock name,
not use one, same name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml         | 3 +--
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml         | 3 +--
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml         | 3 +--
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml        | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 1de11e7f33bb..14016671f32b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -43,8 +43,7 @@ properties:
           - const: fsgen
 
   clock-output-names:
-    items:
-      - const: mclk
+    maxItems: 1
 
   power-domains:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index de8297b358e8..e647ba392a0f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -43,8 +43,7 @@ properties:
           - const: fsgen
 
   clock-output-names:
-    items:
-      - const: mclk
+    maxItems: 1
 
   power-domains:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 9f473c08cb2e..c36caf90b837 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -39,8 +39,7 @@ properties:
           - const: mclk
 
   clock-output-names:
-    items:
-      - const: fsgen
+    maxItems: 1
 
   power-domains:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 4959ad658eac..155c7344412a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -38,8 +38,7 @@ properties:
       - const: fsgen
 
   clock-output-names:
-    items:
-      - const: mclk
+    maxItems: 1
 
   qcom,dmic-sample-rate:
     description: dmic sample rate
-- 
2.34.1

