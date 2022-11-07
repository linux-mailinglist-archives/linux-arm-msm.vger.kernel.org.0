Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEA7761F28B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 13:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbiKGMJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 07:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbiKGMJv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 07:09:51 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B9FC19
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 04:09:50 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id z24so15918586ljn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 04:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFPA7Nxa+A29+qXbNJAfRlr+gr6r5BOHPFWJnJ71dzU=;
        b=kJI5bK6O0WEoQyaLCbPd4PgULSDZ01Vy+MTdytmJKbo9YkRxshuBDWu5waTNCs9Liy
         fNgOVllQQC38I1stQjKle6Lt2Kh/JFUdvfjsIi1J6NOjmkZgV5n2E1pKPlsPdwtBtME3
         yB1pcBp+Ue5PGZNDexocGhs3eLcw6XCrLQz8ufAdZj5JQqjst0wtN9X4ImOP8iASqjox
         +IlYQZ2mLIT92aJ6n6SfZ3Z33BPA1DcgIQkJF0q2iFQBy7qoZMZjxxKsB6/M/Y1/1hdo
         3Y6nVVjDOLnwFJaYQYutPhgKMXcGEum+QU34utoHvpXTPxPADqU79o78GQe7bVUHbk32
         9pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFPA7Nxa+A29+qXbNJAfRlr+gr6r5BOHPFWJnJ71dzU=;
        b=hVpId5zXNDhAe0epcuypbKrNP7xY/vl+WZGcSTg+PSnaAvwC9N7RhAI1tgU20CSMcm
         +OgOWrEXohtaBtHEkU8l9Kr1aGJWIIPWdXuTC8qFPmd+Coriynv0Q2zW06X9+VwmtLHr
         4LnITiBxJgNVbE23uMsfs+obPINWyNUoDjYcnJupJl5KYT7AEx76Z2j/ogU2JQckvTPv
         tOgYk5EQKRv/5OLPD1lJQ/8WhO91941qq45qHiTl7UuhPlupdO7XjhPCWZsNeljZxlbt
         FbCvaO1iWkrNA2nudQVn16HfjnKqdypBsFfKFljisYu4dAWIHJQM2ps/qu4eHuQltBaD
         Jqiw==
X-Gm-Message-State: ACrzQf15m7wPNe0Kpv2NNjQFFDgu0IKX1xXkNsrro0HTD4UsYzJaUKii
        G3jPvMDB40pJP+kaU2bUNe14snhsXglnd90W
X-Google-Smtp-Source: AMsMyM7ypMPbhVj2KLCVyuL4+ZlVgGcGVwdCHeT6s9J5MytaQj5cQ+64jLMbcVHBVMxvVz2EeBexJg==
X-Received: by 2002:a2e:b521:0:b0:277:14cf:6da2 with SMTP id z1-20020a2eb521000000b0027714cf6da2mr5096216ljm.94.1667822988747;
        Mon, 07 Nov 2022 04:09:48 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id p13-20020ac24ecd000000b004a608ec6d8csm1219723lfr.27.2022.11.07.04.09.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 04:09:48 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Chanho Park <chanho61.park@samsung.com>,
        Thierry Reding <treding@nvidia.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v3 2/4] dt-bindings: arm: qcom: Document SM6375 & Xperia 10 IV
Date:   Mon,  7 Nov 2022 13:09:17 +0100
Message-Id: <20221107120920.12593-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221107120920.12593-1-konrad.dybcio@linaro.org>
References: <20221107120920.12593-1-konrad.dybcio@linaro.org>
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

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add compatibles for Sony Xperia 10 IV (PDX225) and the SM6375 SoC
it's based on.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v2:
- Add second S-o-b

 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 207e28260206..35e22cf15f9f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -56,6 +56,7 @@ description: |
         sdx65
         sm6125
         sm6350
+        sm6375
         sm7225
         sm8150
         sm8250
@@ -718,6 +719,11 @@ properties:
               - sony,pdx213
           - const: qcom,sm6350
 
+      - items:
+          - enum:
+              - sony,pdx225
+          - const: qcom,sm6375
+
       - items:
           - enum:
               - fairphone,fp4
-- 
2.38.1

