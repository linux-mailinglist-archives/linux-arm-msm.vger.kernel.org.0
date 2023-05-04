Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50F406F6779
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 10:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjEDIag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 04:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjEDIaL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 04:30:11 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36F8618E
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 01:27:19 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-643465067d1so211653b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 01:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683188839; x=1685780839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpKnP1YDIVbRZiADGr23D8oPufyg/cq5r9T3i6z6bvI=;
        b=SqxCUtKDUckciWmrviJ3XhnAkxxA1WC+AmYMmH0dT+ADSNmyojxdmp2LSd/3s7CzZG
         9D8GZERaj+o65tILZzOpY8F6UiueQ/rFMgRi/dAaejXt9BtCqEG54BjOO4ClcZdX36PN
         hcX/BppDb1EXnPq3/EUKvJyrPBDpQmKr7fCc5J+pf3VKTPb6r150uBQzInr1LEDbcI8n
         zryM1VuBSmSfmk3ea31151Uo/Fsc72TPQub9AsAfBpMDYvEy1NsNV8qED5OxVM6j76Pi
         E2gisu2Zz9TpvDqwoNkGnpO7uZA9cx1sh1PqQWXnjB9Nyls7qYZwbXzw7dLiF2T+GZl5
         2l1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188839; x=1685780839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpKnP1YDIVbRZiADGr23D8oPufyg/cq5r9T3i6z6bvI=;
        b=T65/A/gk9aJzaxCmEWttHT55z6LWxWTMtuNvPkWfooeF3WyTwly4qdWk8IWfLFUQVH
         6JAEbrBYAZ/x8fyVVJkGiFgEmqmiFj49cfMqC+IToOaWLyxYZCge/hgB+NAHJn+hH6HB
         B3eun4hiXX7c4ARSJBYR3EWgCEtHK3LgDcdyqoszmgIToRiRDGbCRAGc1US8yJrXl2Ng
         +l8LNBDM91CAxr6kY4vQBRmMIwKNMIIPlpvSteLMDJdJ+JFL0WCZ0mZoju5B4F3lrWf5
         ZxSnp2ecCc3Nkro7VcxmE+66zVjFaCsW29n3OEj+QTOcjyJl0VgsdHozbCteaF8xXFSY
         qw8A==
X-Gm-Message-State: AC+VfDx5edespF7VgIs7YJjLHLWKSGp9+YTxuB1OwBARmeG+E3+vtbHZ
        zjLh2Uh88jH91lW02VVF/u0fyDINUe+t6VC2MxE=
X-Google-Smtp-Source: ACHHUZ7UOqdcHAwQljJYRINyc92mh0tnSr55X6WqOMbku03xQt2V3sl+JoexUlJNe14g7jl5gWeVcw==
X-Received: by 2002:aa7:888d:0:b0:63b:859f:f094 with SMTP id z13-20020aa7888d000000b0063b859ff094mr1782227pfe.20.1683188838921;
        Thu, 04 May 2023 01:27:18 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id s1-20020a056a00178100b00625d84a0194sm24913973pfg.107.2023.05.04.01.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:27:18 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v3 2/5] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
Date:   Thu,  4 May 2023 13:56:41 +0530
Message-Id: <20230504082644.1461582-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
References: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.

On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
needs to be set first to 'enable' the eud module.

So, update the dt-bindings to accommodate the third register
property (TCSR Base) required by the driver on these SoCs.

Also for these SoCs, introduce a new bool property
'qcom,secure-mode-enable', which indicates that the mode manager
needs to be accessed only via the secure world.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index f2c5ec7e6437..3b92cdf4e306 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,17 +18,33 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm6115-eud
       - const: qcom,eud
 
   reg:
+    minItems: 2
     items:
       - description: EUD Base Register Region
       - description: EUD Mode Manager Register
+      - description: TCSR Base Register Region
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: eud-base
+      - const: eud-mode-mgr
+      - const: tcsr-base
 
   interrupts:
     description: EUD interrupt
     maxItems: 1
 
+  qcom,secure-mode-enable:
+    type: boolean
+    description:
+      Indicates that the mode manager needs to be accessed only via the secure
+      world (through 'scm' calls).
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
-- 
2.38.1

