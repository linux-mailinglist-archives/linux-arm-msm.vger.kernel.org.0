Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA896CBB02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 11:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbjC1J3B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 05:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjC1J2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 05:28:51 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E752A6A67
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:28:44 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso1326424pjf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679995724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9gxxdsDfgbWi0NQQ186kXUJvaTNrijmTWV7yOKYXxI=;
        b=FMNK1KG4hh3KF9LIjVy7UAnMYaTqYiBxl3yPjMAwaFIxgq+BSbQuUoc4YNkrVBUHc3
         eKCBExtnmGd4mwTqA27tY38LVbDT9M0LwoAHcjKgPgK7XI6eLvdIDTs1XVfaeFGcre0X
         LvDmSocBlcWYzp0oyAg4P/RfeZbKcXuXi5GYa/Erk8XXlWO2a65qLnIg9n2MJ7CBwpex
         fHRy55HVNK5ciFi3/RsShHMMt6j3odoU/9jy0xky47G2WoFNZSVRMijrTLObAiFn1GYM
         cUFKmiPnP2lB1p9wB7CW4hw7WYogeBiOWUl3zTx41FUC7pyz54Xxab6QTrlVz/E7khZ+
         5l9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679995724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9gxxdsDfgbWi0NQQ186kXUJvaTNrijmTWV7yOKYXxI=;
        b=kx1gNzCqy7G6hfbpsIXt4Hs+XrEsch+Qg9UcKc+a4ttk2k3b9NRqxvrCjvwk72+kEf
         MuuHYzyV4sn2oj/uxrbbMD08A9Eu7SsVj7VEVei/CV4nPX/WYshuZG/ZE3YkSSFGHKz7
         GR/0uXqEEJTqiWHjSOaKg/DLDk8v+a12Le/KGGPCGzcgyQdIdqws1SAUesqmGduwvHIs
         uMvkqTU+9bzPK9e+JlqDXGm5oiTaDS5ONhSIJXc3ZP3qw+/781/Ryqh1/KfIbhGC6f4o
         mmiH9fxioU8fKCPTFwFvb0D1DwRPgZ7knV4d7wso3TYovH4LywcMOMmTy0cfPFgrUKr0
         vGyQ==
X-Gm-Message-State: AO0yUKXHpIH8iCR8MeBcFdubGLGfgJ3aZMrF9D4Bqkggkdm+EaGDaPsi
        FWimWkts/GV2qb/THV4qx+2+pW4YeQE2A7SQpLw=
X-Google-Smtp-Source: AK7set8taBpj8KbSL/h4BUE97kdRijyKP1HzmAAn7qhsC7cUSQEQjlUs0jk6Wp95cGh5Gn4Q7H2AAA==
X-Received: by 2002:a05:6a20:1e4d:b0:da:6652:b1f1 with SMTP id cy13-20020a056a201e4d00b000da6652b1f1mr12553746pzb.35.1679995723952;
        Tue, 28 Mar 2023 02:28:43 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:449a:10df:e7c1:9bdd:74f0])
        by smtp.gmail.com with ESMTPSA id a24-20020aa78658000000b005a8bc11d259sm21261518pfo.141.2023.03.28.02.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:28:43 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v3 4/9] dt-bindings: qcom-qce: Add compatibles for SM6115 and QCM2290
Date:   Tue, 28 Mar 2023 14:58:10 +0530
Message-Id: <20230328092815.292665-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328092815.292665-1-bhupesh.sharma@linaro.org>
References: <20230328092815.292665-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Crypto Engine block on Qualcomm SoCs SM6115 and QCM2290
do not require clocks strictly, so add compatibles for these
SoCs, indicating that they are similar to the flavour
found on SM8150.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 90ddf98a6df9..82ea97568008 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -41,6 +41,8 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcm2290-qce
+              - qcom,sm6115-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
               - qcom,sm8450-qce
-- 
2.38.1

