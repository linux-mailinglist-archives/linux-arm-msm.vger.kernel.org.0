Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22238694577
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 13:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjBMMLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 07:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjBMMLN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 07:11:13 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B893196AB
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:43 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id sa10so31228401ejc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep4dAxNDBfiGXuqBk5NhBpEX23ggwEaT57AExj6qK0E=;
        b=eGCWScynR/KATjl4CR1NQ0awa37mNI8v0bJtA/rygcer1I0LVc7i04Jp43z2vUlwgn
         a+ODzt8JJtOMHJOwKcCsq7PmgRM4WcbMAMOhQTU4Ci90i6K301aHcKQZccfvxfyaNlVl
         qdpImCNac1yuuItnpKBJdB6tXjAMeE+rAK9UAEKMKsNuUjIwN5FrnvTlt+JfeE388AzT
         1WMdLj1Yy/arp6lE7YgTtFbdACRVTqZNkLGtqBdxfIyyiH5WVbvZ2iqgvpSSuTpYFMK0
         Rx7E/iMJySn0UCfGQ882aKjZRwOjoh6lAECPD324X5W2V2SMOjomSR8NJ8OIcKr9EB/k
         8PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ep4dAxNDBfiGXuqBk5NhBpEX23ggwEaT57AExj6qK0E=;
        b=JFQ7fRAnt0N4YzqFPpKaSJthXEkXVff6NnHjY3zqa0Q5mvOFHti5e3IgzWBK/U7tZ5
         71RUIyX/ylZOnt3hEZxoCjNQpaglOXk6yIdS6lCqRNRe/rCXeOQ4fpR7fz/IyvGqGiNK
         LYg9QoyQk0Z7XK/3OROwbxtN9NN/IX6TflKlqYcAuSm6rvVy/o+6M5txlaz7o0HfP6mo
         yIgM1YbLnp0tovmoM8FL9+boHIop+nN6JVXifTWBo1n7lx1/QCjQffZJxssrE8d5aPcm
         t86odob8myYxzN2YvMLHrt2IJS3txfBRRJD9JukVYDSiGSzRJggBy7TFD3ILhY9jnNYb
         L7tA==
X-Gm-Message-State: AO0yUKWylQsMSHWCJFpP/Xbgvw/3aVEBibCnR7nwXTMkDkCU09Hhn+vY
        V/ZHwH3WcJ1gZd2JLh9BGzibWPU0e/RIO1Zu
X-Google-Smtp-Source: AK7set+oaFvbn6bdk7MKi3sYaFLAIXKhNo6TsrYTdMaZ19tEGQAs+T1gzlVpdLZijLrJ/9xVXmdmjw==
X-Received: by 2002:a17:906:988b:b0:88c:3a48:715b with SMTP id zc11-20020a170906988b00b0088c3a48715bmr26558712ejb.30.1676290239364;
        Mon, 13 Feb 2023 04:10:39 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 04:10:39 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] dt-bindings: display/msm: dsi-controller-main: Add SM6115
Date:   Mon, 13 Feb 2023 13:10:11 +0100
Message-Id: <20230213121012.1768296-9-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
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

Add a compatible for the DSI on SM6115.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2494817c1bd6..f195530ae964 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -351,6 +352,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
     then:
       properties:
         clocks:
-- 
2.39.1

