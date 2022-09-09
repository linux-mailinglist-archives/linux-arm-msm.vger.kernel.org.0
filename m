Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 854D45B3D10
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiIIQeZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiIIQeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:34:24 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B36870B8
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 09:34:21 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id t14so3697247wrx.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tcDgOTW+dPWGFaJ/pvGH1qALkjgH3rLUuK48scVtdlo=;
        b=ugAi9Agjwf+S9zu7+DHtF/YDwfLet95v9keT2vBTusjMmeS3QbQroq0nnQ+6X8Ruja
         n2yDBXkHIIAKdaWg0vY2wBNoNCeiSNM3LkUFh2To65pActnLzeYjeqHusJla2BsAA/MA
         NmLTDj+2ffIz1z0fp+13lRvrDbHs5y/yIy0H9HfUR9wTpXXUC2MeAbLL+IrfOr6o/yCd
         oYngYPqD28DelHGVrmsvObg5LKpTqG8v96t6FkQOzJ2H7U6EO3wO7dux46ShtaT+Rj8Q
         o+TQxxPEztXqzRSwKgoo7gtBnTiJfspTGRuJ6aezImt7Ezr89mxlP7m3TOKKiXFZVY3M
         U8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tcDgOTW+dPWGFaJ/pvGH1qALkjgH3rLUuK48scVtdlo=;
        b=axijZ8l8x99svAED/vIwECdn3hIbUXAKgTiDsO6iZFaEUR177ch3AfS5y/1yHgG2zb
         RUMlP0+pNupadQ0EHWj2H/wQ9enDbBV8A+4GBraUyECasGaoKtzdq07pWDYAOt5gn7NK
         5ReRz5zCm3z4cAIB8zYwV/AhPJ2wQc21JJIJalvqIJErmkejoj05wyjyDXtNIjWQtDcM
         aCwnMRfnhWvf3YMBGJO5koXBXenGfWr+KxUt0i+OarzAyKtNXSlrN3wxSAMVpzzdHuXp
         t9MUgN35DqPlWO4i/ShmaGmNDdU6y0ImV0r44zCjG+jykPzb62mERodVZhfyRpt95Atx
         cLcQ==
X-Gm-Message-State: ACgBeo0H4BdXZZ30hx0N5IJzWWwTAIvQTVNIO+a1iGbcsyRGX7he5Jqu
        Dyb6MPJTVfxyMFoB4CsgOQAZ+w==
X-Google-Smtp-Source: AA6agR4f+eEq6duOHr8ajFsbSaKXNwwhi6irSKtjNrjaHG3sEufQNcp1OEQUEWfwaxDJP1fZpOkMkQ==
X-Received: by 2002:adf:fbca:0:b0:225:2ac9:e306 with SMTP id d10-20020adffbca000000b002252ac9e306mr8690482wrs.259.1662741260151;
        Fri, 09 Sep 2022 09:34:20 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c5-20020a5d63c5000000b0022a2e4b2b25sm816849wrw.113.2022.09.09.09.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:34:19 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 1/1] ASoC: dt-bindings: Mark old binding qcom,cpu-lpass-apq8016 as deprecated
Date:   Fri,  9 Sep 2022 17:34:16 +0100
Message-Id: <20220909163416.1021551-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909163416.1021551-1-bryan.odonoghue@linaro.org>
References: <20220909163416.1021551-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We've had some discongruity in the compatible string of the lpass for 8916
for a while.

Mark the old compat as deprecated. New SoC additions such as msm8936 and
msm8939 should use the compat string "qcom,apq8016-lpass-cpu".

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml    | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index ef18a572a1ff3..bb6f0c5dd4e8b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -18,11 +18,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,lpass-cpu
-      - qcom,apq8016-lpass-cpu
-      - qcom,sc7180-lpass-cpu
-      - qcom,sc7280-lpass-cpu
+    oneOf:
+      - const: qcom,lpass-cpu
+      - const: qcom,apq8016-lpass-cpu
+      - const: qcom,sc7180-lpass-cpu
+      - const: qcom,sc7280-lpass-cpu
+      - const: qcom,lpass-cpu-apq8016
+        deprecated: true
 
   reg:
     minItems: 1
-- 
2.37.3

