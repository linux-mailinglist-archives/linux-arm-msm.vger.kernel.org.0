Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F90F67D947
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 00:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbjAZXDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 18:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbjAZXDf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 18:03:35 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B258521FC
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:03:34 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id r71so1205044iod.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60xbViVesinnCs8Gq9usNvmq6jftqqElQdF+JDe/eCU=;
        b=tWTI6bI6hZY8GKUxqEourUhIoJzGkInywP019Kc+1c/UouuWQXNB5z/ULI4PqMaJmq
         QJbV9rYsSN51haZU0EXpb237eM4Tpyzj+lpAebR5TGJwAL+TkeqbIryYZGWew5gaQiFt
         F2icF3dF0C/N/fkcjmypIcFmPjSny/jOGw/o54TQXiKWMXufecNZ4MttUOt2IyYNFaSW
         L3YNK38rCA/5P4Ci3fIaBOraV26ATBvTJr18GYNmYHoYS28J6NQPmzxP4sdx3bdrwgNO
         4rV/oYxfXjQfgs0tJyGoMcD0qtvFrtAihxJGVgVkDWIGrxVMoY/JyCljLuPU4ULHQ7fF
         ngcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60xbViVesinnCs8Gq9usNvmq6jftqqElQdF+JDe/eCU=;
        b=OxC/5pfGQGniSHdAqcYukxmNnWzjAh+/EZz0wrejdu1nbVeEUuH0eU1KpEFPbiV3zt
         RdwHNUP5YikolFHMg2fNUNBNktiFp5pbtmgPGahgfvm68NBHGhGRW6tqgb9ONLDWrxSR
         bjCgjuUypunq6yRONnAsAgrYNUwAUnl8n2dSrGdE8k0eKV2FIYagjhPFbfjhbSjSOPp/
         2XY+ZqcebKLloxBVOERvIzm7FffeNYa47NpE3ciApBze5S2dqOOMbsl+QuPkypfgwNMQ
         oKHJLnMwZFMEyrrguNUrgr2uS/BM0j+896Xo6QdzsgfjScgOg0wf9kPz/+nkne8Rf1lP
         7tSA==
X-Gm-Message-State: AO0yUKWLxwMIgUu7mMWbEWkXx0Tz/jwqGhj6eCHrIajm0Bv0IjIVwfZw
        rqVlq/kFYP2Tcko5dXNbhxKMyQ==
X-Google-Smtp-Source: AK7set9QmGuL4g3+bJHs80N+f87Y8dv1O2X1wGPkwhEF+Iy0Oe+D2el+Fwqjt5SHhGQrYi8E5Ep4dw==
X-Received: by 2002:a05:6602:341d:b0:707:f268:989e with SMTP id n29-20020a056602341d00b00707f268989emr8918107ioz.16.1674774213988;
        Thu, 26 Jan 2023 15:03:33 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id l4-20020a6bd104000000b006f8b7d869a0sm670924iob.1.2023.01.26.15.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 15:03:33 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/7] dt-bindings: mailbox: qcom: enable syscon compatible for msm8976
Date:   Fri, 27 Jan 2023 01:03:14 +0200
Message-Id: <20230126230319.3977109-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
References: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On msm8976 platform APCS also uses syscon compatible, so move it to the
block of compatibles using SoC-compat together with syscon.

Fixes: 60545466180e ("dt-bindings: mailbox: qcom,apcs-kpss-global: Add syscon const for relevant entries")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 36deddca1524..ecc286ab49ef 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -20,7 +20,6 @@ properties:
           - enum:
               - qcom,ipq6018-apcs-apps-global
               - qcom,ipq8074-apcs-apps-global
-              - qcom,msm8976-apcs-kpss-global
               - qcom,msm8996-apcs-hmss-global
               - qcom,msm8998-apcs-hmss-global
               - qcom,qcm2290-apcs-hmss-global
@@ -37,6 +36,7 @@ properties:
               - qcom,msm8916-apcs-kpss-global
               - qcom,msm8939-apcs-kpss-global
               - qcom,msm8953-apcs-kpss-global
+              - qcom,msm8976-apcs-kpss-global
               - qcom,msm8994-apcs-kpss-global
               - qcom,qcs404-apcs-apps-global
               - qcom,sdx55-apcs-gcc
-- 
2.39.0

