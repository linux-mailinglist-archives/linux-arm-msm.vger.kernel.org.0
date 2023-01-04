Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B840B65D432
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 14:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239423AbjADNcG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 08:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233970AbjADNbY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 08:31:24 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E08265C
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 05:29:21 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id p2so19811669ljn.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 05:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BN1HuBOcO1xYyZSvoay0D2AQ+5agsRugOrVDoErpX48=;
        b=uMe1/V2U49qWV8NEZPXnBhv604lrMCVmp6V05gDvgxyyTl20RkdTh00exLaCUIaY4Q
         IvLpwr+q71gbuCtjpDyihO6jOPT2cJ24BsFGEmiMp6HLVS0CYA0JomJmC8qRaADhCwNT
         fX+C6Zx7R9vdr5inLwnj1LgcLe1NP0KgnOBMUjsPCAeN14UIaJZFvvReWGnr3DyxAvVd
         mmSPx+ridlbM0fgTSxazMOshc/VqIHt4c3eM+hXC4hx7lr5T5YKIx+WjsPsLNfhd1l5u
         LLqVdkMj18OK9Ti0eu7HoQfNYK+UBqszfOR2Zi5iaa04EeLZkszuuxntIZyRg+fI9d3J
         rcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BN1HuBOcO1xYyZSvoay0D2AQ+5agsRugOrVDoErpX48=;
        b=RvxID9aVvNjFlsOPxHnQTyFmhY0VQV1/7C8FZ3XD+5dVbGssyFoCh9I5uyixRVBqbs
         6d6SCQAO3vUmnWuH3hTUidvoIIDeOUSHDt/CrxrXSRqLPHV1IKK3IgA1RHej7z7qq+PQ
         S8s0Qf5yArifn9wBF2JN+EvxMTLxGrMGZgugmk2+hbEmNBvHx6LGOL5enRDFTZIudnL+
         LGhzcM8dfoK6TYMCyRXFJiG0Wq3LswmvWf0jMnwYXvri8y54B1zZxNS49mG6LOc7ZB0P
         WNFE3HLz4q7rDFHmj4PGDuTMUZJJgP3KYHVAFbe6lIguexReAOqVR2MLFmaJ/IOJvsP4
         hblQ==
X-Gm-Message-State: AFqh2kog8Im/05PVA4eQQ97EJQix4UB5UVgg9Ng/W5miZCvm1PWPcx6H
        5gixEM5CA5PCWGo/dsrZqWEx5l2WlZZJVqic
X-Google-Smtp-Source: AMrXdXsXU/nsbyBQ9CPaj3vZFjbU28wyzDRKxpG4BSqgr17viXzaeC0sFPTLEdg2UJcwsic716/a0w==
X-Received: by 2002:a2e:a988:0:b0:27f:e6e6:9bdf with SMTP id x8-20020a2ea988000000b0027fe6e69bdfmr4940249ljq.36.1672838959487;
        Wed, 04 Jan 2023 05:29:19 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id k23-20020a2e92d7000000b0027fd02c99d4sm1947071ljh.75.2023.01.04.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 05:29:18 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: interconnect: OSM L3: Add SM6350 OSM L3 compatible
Date:   Wed,  4 Jan 2023 14:29:13 +0100
Message-Id: <20230104132915.667946-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

SM6350, similarly to SDM845, uses OSM hardware for L3 scaling.
Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 00afbbca9038..9d0a98d77ae9 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,sc7180-osm-l3
               - qcom,sc8180x-osm-l3
               - qcom,sdm845-osm-l3
+              - qcom,sm6350-osm-l3
               - qcom,sm8150-osm-l3
           - const: qcom,osm-l3
       - items:
-- 
2.39.0

