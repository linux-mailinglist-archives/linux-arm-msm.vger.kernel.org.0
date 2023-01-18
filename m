Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7EB671E70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 14:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjARNwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 08:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjARNvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 08:51:44 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427D6367D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:23:02 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id az20so64100930ejc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRKyrZr81DMca68YFjyhXPTCMmSK78W5VKDY0bLRYxE=;
        b=ntttPA7BIz+aA2yMG5R99dACf+qfOMuzzC3vIE/q4g/0T3792YOn9fx186fPq0otDn
         Dv1pxEnB9xKh/6lm9Aiua22sJRhdRlMneSHtSLCrH+ORh9arvxaJWmmIgVRV5FaomIk3
         PVs7EQIihKlSUAEbFd4Gt+Y9kapHFDM2mf/y6AbqJCxyKqjxpZcq4NQtzxesQKqafO7R
         V1Ckm1Wj2qHGeel/xW/Wm13Frh3vS4aV2OCaYkZBjLfn40YDeC0ApTeY7OwIqLnFuRCK
         j0ZZuTM1uVp52toKBwrBaIqfzdPwPcn53KZM4Y0Zl9Q4qQolvOsFo2gpmEXmpQMZ0zuI
         9ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRKyrZr81DMca68YFjyhXPTCMmSK78W5VKDY0bLRYxE=;
        b=cH6ccGpvb2jMm41yb/77C0RTfqhLZSobD6efbx2317dAgO9DpGcK5dp2Im1HY20/W/
         m/en1dQVRlzBO/xXhXwYoySoSxWSDmHdXq45Qp9C017+wJ8ywBUozg1wTsUCERtqNOTk
         rm9O5BmSwPSWW1lvBPApaC1CagSxPqrJWJ0IWl2GZpZX1qhMbO90nVu2JaMhwuLJx105
         LEW9FKl1CxPjEfZ5JM+F8KYOhj1ouBkqCaGDUHTpWG0g2E5BFCfRQQpzPqvGbWz3CnFL
         TJmINqbkMOeOOVgpRmIlGNXbA8UNF5YIRvntxQRzcCJiGUYNCa42yqppHdDSC4A+oUdZ
         ZOVw==
X-Gm-Message-State: AFqh2krnuolrIoCqKW1M/JFCiLqZ7xtD03BlXgAoaPx9mty5yZyj20if
        dM0HX1yePkItf5OsAuYn4Wbftg==
X-Google-Smtp-Source: AMrXdXsqju9rIDXFcQjbit3W1i9sZZx9gKeO8uR4chgMb7j+hXPDI08hI8OcNdvvoe4YWLZwsPyHgQ==
X-Received: by 2002:a17:907:6d0e:b0:871:7b6f:9c53 with SMTP id sa14-20020a1709076d0e00b008717b6f9c53mr9341365ejc.30.1674048180860;
        Wed, 18 Jan 2023 05:23:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0083f91a32131sm14633831ejh.0.2023.01.18.05.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:23:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] dt-bindings: mailbox: qcom: add missing platforms to conditional clauses
Date:   Wed, 18 Jan 2023 15:22:51 +0200
Message-Id: <20230118132254.2356209-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
References: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
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

Add missing platforms to the conditional clauses selecting whether the
clocks/clock-names properties are required or whether they must be
omitted.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 5f7770036fed..7d8de7a16984 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -72,6 +72,7 @@ allOf:
         compatible:
           enum:
             - qcom,msm8916-apcs-kpss-global
+            - qcom,msm8939-apcs-kpss-global
             - qcom,qcs404-apcs-apps-global
     then:
       properties:
@@ -121,12 +122,18 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,msm8953-apcs-kpss-global
+            - qcom,msm8976-apcs-kpss-global
             - qcom,msm8994-apcs-kpss-global
             - qcom,msm8996-apcs-hmss-global
             - qcom,msm8998-apcs-hmss-global
+            - qcom,qcm2290-apcs-hmss-global
             - qcom,sc7180-apss-shared
+            - qcom,sc8180x-apss-shared
             - qcom,sdm660-apcs-hmss-global
             - qcom,sdm845-apss-shared
+            - qcom,sm4250-apcs-hmss-global
+            - qcom,sm6115-apcs-hmss-global
             - qcom,sm6125-apcs-hmss-global
             - qcom,sm8150-apss-shared
     then:
-- 
2.39.0

