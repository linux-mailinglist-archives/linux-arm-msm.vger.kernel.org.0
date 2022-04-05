Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09734F55E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236379AbiDFFih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1851318AbiDFDDF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 23:03:05 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0B6DF21
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:59:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 5so1269908lfp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vhtdAyfV1krIwAG7X02HHXOhQylPf2Ui3KgfDhnX9YE=;
        b=AdfKLHZmoPdZNSJVkKgzqHaBcewohzGlnexe7aUiZnUeb96K3nSEMuABGpn0o9TEa2
         jWfEdpTp6+A8t5xMdmjYFpt4Yfx8js+FmgJvO9b2imXbFg+/EibkxQqeC+TNa9IhBaiK
         dS2BD0NS1yhnyDZvy5DfjIoSW5fObsX0g9hoCi8L6x+zsbiQsA6/HNcTQjLY7Qt8dEQJ
         czalAv8ypf8nB18VulsbioUUImKDISAT9gFjYYxEtFafZ3RrAhtIxPKkfjIsAXyUXDch
         zYcYM8SzxTgwHVUdUiEssklx3MPosadvIOsv4zosGjthe77t9QkLlGuKuPDM0/DoBGga
         pmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vhtdAyfV1krIwAG7X02HHXOhQylPf2Ui3KgfDhnX9YE=;
        b=LjLqhvhORpX9prIYkNTVmXJ/HMA+8SlW6HHpvVoDUuQPVx7WGpZdPWND6evqeoaPD7
         UWGBlIMddHXvLmGrj5Z0rCBf88/ZjHo7w4MKe6k2ngO+NdT0J4lbQClRdrc5iMqQSigr
         LsQnnSIkHb1aU6vaPWQdSBcyFQe7NAMuj97TI//+IJ0D/M4r1oSFwdKJuhG+y8hVO168
         vV6LSIgxE0WSAmVFVv8vNCbtKoh93oIJbAieEzfPzwjZPcpX2u9xtpKVD5GydREq16Ei
         1W8S5vJAEhUpB96JKBc9pKyVf4aAKl8bbShLvks+8sJU6Xu1DeCBTneVJnx8l+NyDKRQ
         bHhA==
X-Gm-Message-State: AOAM530PK47DQDI72MVgU6oFabJTrutzQh9uiDHngXlog4eClF6wEJFK
        Q089p05ub1eQ3L6h4fl+/NTITw==
X-Google-Smtp-Source: ABdhPJyneH2lzB2yrK/wBsY3Lw+u6V/ruICOrErnb9XYe3gesY/IKS6KltXpzrGMx1WhSTRCwdk9yQ==
X-Received: by 2002:a05:6512:1281:b0:44a:b492:5e7 with SMTP id u1-20020a056512128100b0044ab49205e7mr4015837lfs.265.1649203152796;
        Tue, 05 Apr 2022 16:59:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w14-20020a0565120b0e00b0044a9b61d2b3sm1646471lfu.221.2022.04.05.16.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:59:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: thermal: qcom-tsens.yaml: add msm8960 compat string
Date:   Wed,  6 Apr 2022 02:59:07 +0300
Message-Id: <20220405235910.373107-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405235910.373107-1-dmitry.baryshkov@linaro.org>
References: <20220405235910.373107-1-dmitry.baryshkov@linaro.org>
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

Add compatibility string for the thermal sensors on MSM8960/APQ8064
platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index b6406bcc683f..43510b8399ff 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -19,10 +19,11 @@ description: |
 properties:
   compatible:
     oneOf:
-      - description: msm9860 TSENS based
+      - description: msm8960 TSENS based
         items:
           - enum:
               - qcom,ipq8064-tsens
+              - qcom,msm8960-tsens
 
       - description: v0.1 of TSENS
         items:
@@ -116,6 +117,7 @@ allOf:
               - qcom,ipq8064-tsens
               - qcom,mdm9607-tsens
               - qcom,msm8916-tsens
+              - qcom,msm8960-tsens
               - qcom,msm8974-tsens
               - qcom,msm8976-tsens
               - qcom,qcs404-tsens
-- 
2.35.1

