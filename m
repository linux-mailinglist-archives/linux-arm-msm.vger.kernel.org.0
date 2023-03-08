Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E5D6B0DEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 17:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbjCHQAT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 11:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231928AbjCHP7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 10:59:41 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A329B9B5
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 07:59:14 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1673807wmb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678291152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zC3rBAyogCXIAD1VsZOmG00wbKNgTNIw5+yFA7bQttI=;
        b=Vdv6DOIg4BCC8wPi5HScxqeJh2mHSjYO6LTl1gfFti6HfFGuWves0nNIH6Wr4OVfk9
         8JyccT7YLSjOjWhQz/VcyUijhmSx95Y+x+9Xodw0+tZwz795HGocqjAY5tk+Q9jW7eig
         OLAMi8o7PJU1MFJ24/H80dIvCB8IY859MFJTnDTjrzqMizgpAm2iHiqxl1RQjl6u7nQ0
         pirP59iG32qyfdrSEo5z2myvjvLe2l6dTa8wXACP6t5q1+AeaKhsqbcCfr8LdZKzSiLm
         Djw0no64M3dIvkc3sReHWXNNcdcUC979LD5dMVj7VvSizVQHBf7WrPdWyBACepoICkve
         1RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678291152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zC3rBAyogCXIAD1VsZOmG00wbKNgTNIw5+yFA7bQttI=;
        b=KgZwkFbZUE/YWlA7EG1gcWs4QLkvQNcGmnKLKt7UWrxBpObb9kXH4hgsCXGrJMCctW
         VuHwnUlcdER+m9bZPSG0hgiRLk2M6g8Gkp69DtR6zs2qm+vurz9G44NlSt97rMjEjpWS
         GdUpKKAM+HTtMDBVjEfCzYS6VbcI+grfCCSM44vLYzBYYo1aIFq+8fkQaBa8uqbc0CTd
         USC6xkBwXky/oNn7MuSg/RtfEaWmwviU5dfMHdIEv/hx4JL9Qd6ZDxtaGMYoONYacVLD
         q+iPD6Oq7t+jkZtwXjGkB4eVnvoA04l0WLTTL3razNb5m3hA4I8NizsbhDfveRs4F6Ee
         LIWg==
X-Gm-Message-State: AO0yUKWjDN0W7x02lEjC1H0F26EILQewR2/ANfWyi7qrqDuVHJ6rU6oK
        VjB1Vi47agqzA7IlF/Lki9lTZw==
X-Google-Smtp-Source: AK7set8YzgMdlIr1cG8BAb8BjyprBjLL4QKMG7It5oJ3gTMQegtLOQwap83fQBD9YQDZcR2AwHDluA==
X-Received: by 2002:a05:600c:4447:b0:3ea:c110:55ba with SMTP id v7-20020a05600c444700b003eac11055bamr16585291wmn.18.1678291152568;
        Wed, 08 Mar 2023 07:59:12 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003eb2e33f327sm2548430wmf.2.2023.03.08.07.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 07:59:12 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: [RFC PATCH v2 3/7] dt-bindings: mmc: sdhci-msm: Add ICE phandle and drop core clock
Date:   Wed,  8 Mar 2023 17:58:34 +0200
Message-Id: <20230308155838.1094920-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308155838.1094920-1-abel.vesa@linaro.org>
References: <20230308155838.1094920-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ICE will have its own devicetree node, so drop the ICE core clock
and add the qcom,ice property instead.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

This patch was not part of the v1.

 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 64df6919abaf..92f6316c423f 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -80,7 +80,6 @@ properties:
       - const: iface
       - const: core
       - const: xo
-      - const: ice
       - const: bus
       - const: cal
       - const: sleep
@@ -120,6 +119,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: platform specific settings for DLL_CONFIG reg.
 
+  qcom,ice:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Inline Crypto Engine node
+
   iommus:
     minItems: 1
     maxItems: 8
@@ -180,14 +183,12 @@ allOf:
             - description: Host controller register map
             - description: SD Core register map
             - description: CQE register map
-            - description: Inline Crypto Engine register map
         reg-names:
           minItems: 2
           items:
             - const: hc
             - const: core
             - const: cqhci
-            - const: ice
     else:
       properties:
         reg:
@@ -195,13 +196,11 @@ allOf:
           items:
             - description: Host controller register map
             - description: CQE register map
-            - description: Inline Crypto Engine register map
         reg-names:
           minItems: 1
           items:
             - const: hc
             - const: cqhci
-            - const: ice
 
 unevaluatedProperties: false
 
-- 
2.34.1

