Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBEF25B5434
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiILGUO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiILGTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:19:13 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6044029823
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:30 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id k10so13154802lfm.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Kly+7x9ihf9PeM0EfSaLRyWHlTHThn1xyufL9SH1Mkk=;
        b=xeBmlterGWh/U+JS0vtsstUra2lrkbxnYk5rWcBKrHL4zZHPzQwCo9nYmNZQAxIkjK
         6VFwPt8WK+FDmuCPmaDTrSi1ZLDeY39eECCX7bA4uBCDju99EpmH9GHZJuUdVfQTOY9g
         sT7zpyYE/CEYlb7UaJpwNjWDztGJlj9V+9rOT4vd9Rzl8+YAt6iK/pMPYyvK2rm5O86E
         Fxp/Ilz3JM22N3n0rLe0+BwrnjqYZokpG6GDz8GqCNuBoItMuT2LEIPmKToRWTmYTJLw
         XghwlTnfKpgZ2bTtFXVg7wr7KExiMichaC3ZFk2KBN7DjD0vQ8othz01kg8g2mH68dB7
         1muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Kly+7x9ihf9PeM0EfSaLRyWHlTHThn1xyufL9SH1Mkk=;
        b=4ipLnfzd8HfPpq0pmbh8ALMlgDmYRcd2cXCF8U9JsJnG95nVyN1tLAMtzH3g5oSz7d
         Y5/msTlQgqti8sS88WgY7WRvMgdoh3bWNSb7ZJSn8CXoKwvf4UvSejPfudBZeM6ht1cQ
         fGUxElISAaoiTgqTru+tt3SYNpc0+yCMPsjCCkmsNZbWCq3Z/o5Qm4b10l2d+i2UI1w/
         1nSnjxmkd9KkdE45p0azB3p02ViQ2YAQGEtV1rugEHfpwqDM67tHDlHJKsr3rPv08q/s
         H5xdC65NTq/2kL8gnoIVC1EG1buFSt2BGtRZmNviWRKu5Nlk2HRTAnJW3Uj1jg+5Ah3H
         Qquw==
X-Gm-Message-State: ACgBeo053TuBJZ94NMT8CzLJl0+iKHwRGhIu6cZW728KtKVybdw0srrq
        sJ9coh3xm7kMAvGaxbbhezp1vA==
X-Google-Smtp-Source: AA6agR7dtmvrVPKLZRJ5GpakNOHSirzshDenRP6aJbciJLYjckp97je3Um3P2uaRiKUxymcGijX+Vw==
X-Received: by 2002:a05:6512:a8c:b0:491:d4b8:47c9 with SMTP id m12-20020a0565120a8c00b00491d4b847c9mr8018352lfu.258.1662963509810;
        Sun, 11 Sep 2022 23:18:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 26/40] dt-bindings: pinctrl: qcom,sc7280-pinctrl: reference tlmm schema
Date:   Mon, 12 Sep 2022 08:17:32 +0200
Message-Id: <20220912061746.6311-27-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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

Qualcomm TLMM pin controller bindings should reference generic TLMM
schema (which also pulls generic pinctrl schema).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 463f2e95e237..2ad79029d9b0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -134,7 +134,7 @@ patternProperties:
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
-- 
2.34.1

