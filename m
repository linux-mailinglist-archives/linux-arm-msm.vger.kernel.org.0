Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5D655C3E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237567AbiF0Odx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 10:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235525AbiF0Odw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 10:33:52 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52910B1FE
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:33:51 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q9so13350540wrd.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sWc3J/CV8Dtuzf2S0I8qVO7xqFOXn3NKNC59Q9TMvRQ=;
        b=UbLPodrqAHIe1Am49Jl0smN4f299SAzH8V94mbM/HXZOKBMiT2tDFem+KKm5Z9ammZ
         a8mtrRODvmxRvsGtyhAIntCA2XzmMpGhcnzQK6C05F8qCy7PsDKWEJJ0dBDu3i2TWhFI
         wiqov+jDEEdzVOQREep9skMioOzRBFWRx+hzDvEjR+4lTOu7CZAYyNe18UjbJQZU1gug
         yq7AvsAph5EqbHGwi/YIKou3IE5CVQ6bzw1wyBD4v9ndoZaBJ+jHgXzrXTU49pEF1JQe
         8LWZYVRoqsWZHfoFEinAN9A7hkYmBKVxa5ejeJDRa5D2EsXPxs6hexOOHpYBKhQh777n
         xQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sWc3J/CV8Dtuzf2S0I8qVO7xqFOXn3NKNC59Q9TMvRQ=;
        b=m8jBxybM6VqQ3uTGVzDSl53wEf49hA1Y4EyTlFlJh+PviVmqKpyWy3tXHQvwcdnOT5
         LvGGQgM+YWUngU2Al7py0wNhd+dIVKKnzsZL7H3zJjIVxii65BQufH/zh0X/ShPJ05m1
         eUcHIrfgBiV6kpKI0MTPm/bZCnuZlpgxPLgtpHs+KAJek6NsUtNs2Zfxupl6EjURnIBq
         12mmhhKcsRIvLLuTAN8lJWyLNAB9vaHTZyjfjeg8/9wQd1xCC64GsOhi4pQcz7lRhxTu
         xzy4DNSH1JlICJrio817MHa5+Gex7b6ukuHg94NFydJ7hCHaTabzry0IgHC57NKK3o80
         N7Kg==
X-Gm-Message-State: AJIora+V/UyxeITkbarLdbzK5EjCCjQ5U8iML1jHKwqdB5vT2nFZlF7z
        A4jkpkXI6lw1bm2wsl1yXezEGQ==
X-Google-Smtp-Source: AGRyM1td5C3j6o9ZaJOP1OSfx0uzHnsd1SFmlzB3W+qSi+8mrcTsis3hcWPGR5bJVuGmc7yL4DdJtg==
X-Received: by 2002:adf:e102:0:b0:21b:af5d:6f15 with SMTP id t2-20020adfe102000000b0021baf5d6f15mr12781924wrz.648.1656340429944;
        Mon, 27 Jun 2022 07:33:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r10-20020a05600c284a00b0039c41686421sm16890723wmb.17.2022.06.27.07.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 07:33:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: fix board compatible in example
Date:   Mon, 27 Jun 2022 16:33:40 +0200
Message-Id: <20220627143340.477120-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

In the example, alone compatible "qcom,qcs404" is not correct.  Add
proper board compatibles for QCS404 Evaluation Board.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Can be picked up independently, although the issue reported by Rob was
caused by:
https://lore.kernel.org/all/CAL_JsqKXDs=QHKob2Xy6vAFZfnkM9ggfmqf9TNA1hv8TScTmgQ@mail.gmail.com/
---
 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index a9a776da5505..10b3a7a4af36 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -63,8 +63,8 @@ additionalProperties: true
 examples:
   - |
     / {
-        model = "Qualcomm Technologies, Inc. QCS404";
-        compatible = "qcom,qcs404";
+        model = "Qualcomm Technologies, Inc. QCS404 EVB 1000";
+        compatible = "qcom,qcs404-evb-1000", "qcom,qcs404-evb", "qcom,qcs404";
         #address-cells = <2>;
         #size-cells = <2>;
 
-- 
2.34.1

