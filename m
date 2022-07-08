Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3997656AFE0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 03:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237168AbiGHBo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 21:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237172AbiGHBo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 21:44:28 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A06A28E3D
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 18:44:27 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r14so22819341wrg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 18:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I0vsy3nOfEBocgEXlD5YYOEw0Nm9b6yNglnomLM83zo=;
        b=Qh0wf7L1+2EPG5PniRX060RhSC46zeDAY3XH564m2FidqzJJ+TOqP3mTHf8I2s9o4g
         5sQSpge8bXywGfRFChOtDDB7fT98qtklJT1pvPB7g8Q5LF4QSiXFSJn9PLZAgfzf6s8T
         0z49EcD1RU/yubNyaHhmx2jgBU2kWgB0eaRzA5iLK74CxsEkm2ZMe1g8rrCBj65k3SMX
         5/DV1VVVg4b4kZFqVgzhpRn+g5YPgejp8bBIpdMGW6SdBLqZT1lckqSCDrrbXUWDaqs0
         JkdU5BOkdpPq1iNBIZGv1Y+8PcyQx73xYx4wcGZ9zWCecaJdmrzvqekThXsKjs3LUYr5
         sq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I0vsy3nOfEBocgEXlD5YYOEw0Nm9b6yNglnomLM83zo=;
        b=P2CWAWoEaE+Ovv31H+zmxenSoBqfeCnNDAVfjUZdMaOgYm/xyrNnwmX86qFNZvxPsq
         36WTGbOYrvllm1FbSMdlaW2paUkH5I7Pf+ajjtrsGe1c7DSLmjZbxXSUS97lBbGQUHJ6
         EFDgq8vuKURdXkFI3Hfwo1c3HZGIIc8GmU69Jmm2yvEP0iin2wLllQuJtEWy3JAvClkF
         CySK4KGwN9JD3o2ZFU486bepSUg3tIysjaPEzgOA8OPxwMUwACIoRgVp/bHKCWT4X3X3
         tG1vITeI7T3gOKZpYWze+HKRuBsh7gmhwZynrfjAl3rJfLuI0sbyTagSSIjiuha1gCrc
         92Zw==
X-Gm-Message-State: AJIora8sG/sVwZvHg1Q3M0wmlU15twMriEqmALQRgsZrZ8AUrYKplHfT
        zoRbz/OEAaotnyigtzmEzSg7LQ==
X-Google-Smtp-Source: AGRyM1uGKxjVy7oRREdaPxj8/EXUdR+EVZZ0V6NpHZkQIruQquYie9GF6ejcrqoju3a90v3/PKfHSg==
X-Received: by 2002:adf:dc0d:0:b0:21d:ea5:710f with SMTP id t13-20020adfdc0d000000b0021d0ea5710fmr761773wri.48.1657244665766;
        Thu, 07 Jul 2022 18:44:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d4d8a000000b0021d4aca9d1esm22732846wru.99.2022.07.07.18.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 18:44:25 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, stephan@gerhold.net
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/4] dt-bindings: opp: Add msm8939 to the compatible list
Date:   Fri,  8 Jul 2022 02:44:18 +0100
Message-Id: <20220708014419.2009018-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708014419.2009018-1-bryan.odonoghue@linaro.org>
References: <20220708014419.2009018-1-bryan.odonoghue@linaro.org>
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

msm8939 will uses this driver instead of the generic dt-cpufreq. Add to the
compatible list.

Cc: ilia.lin@kernel.org
Cc: robh+dt@kernel.org
Cc: krzk+dt@kernel.org
Cc: devicetree@vger.kernel.org
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index b8b6cdc73209f..a11e1b867379a 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -25,6 +25,7 @@ select:
           - qcom,apq8064
           - qcom,apq8096
           - qcom,ipq8064
+          - qcom,msm8939
           - qcom,msm8960
           - qcom,msm8974
           - qcom,msm8996
-- 
2.36.1

