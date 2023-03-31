Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D516D2606
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 18:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbjCaQp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 12:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbjCaQpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 12:45:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740901EFF3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:44:04 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso25996807pjb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680281042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScrPtwLifF81mLBCSzco8cbRfT+aGGc+R4ZbxOTPL28=;
        b=jMqNDnVJgU7VTnx/m509pjSRih3eionpwuF1Gywgv0QT1Oqq9LDiOdiG0QGzWigaQM
         xz7C5xZ75rov/5S+huNW+OioCbk++BKSro8tivaJmk/ltyPFxcwcBM8KE6RcuZFCokMi
         GHUYeBYr+b3UuqK6O4uXwFOEERHFPR1y2aSNZBNBs+uhNt5WLRW2f8vsVVCPEnl2YfNj
         jzM208N0HQ+LHRkNfiiuoPbx0LCqzooF9R2UB7vevtQ1L941SurByakm+R2cVMG6Qevd
         C87SbZdEFQrYVZ7qnZWX1A2RbVTK6uq/snIxTDadLJIa8y7LPVJs8KnLeBiP+ezKoFxe
         DY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680281042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScrPtwLifF81mLBCSzco8cbRfT+aGGc+R4ZbxOTPL28=;
        b=yfTDxfleF0uNbvLe56hB+bopq1wlD1WmQmwmwcs9qox4vgFctU9ACaUaK7cJVhRn9z
         cMturx+MCuFq6k9eculfDTfibM7obXBZ0UC6Lwu7TVAMn9+WU5HA/xv0qu9N2UQ+yO95
         vvcGodkS9Fr3Snbgpp46hqSl+l1zfSy7BRkdKoxxGh/tm52z2npQQc7YAQBs6cSJgQ2u
         Yd23JfLKClmv+77T63SJn88CV5+2+E3SzGX6Hb44j+RyTLolWzyIz1wAB+GHJk+5Xaw7
         Xwil+9Tj8zRZRPE+6exZO6UlQwTXOvLYjfuuDOHZtrvENutfKnbpYJumidnrrPWhgtE7
         s7UQ==
X-Gm-Message-State: AAQBX9euxgm4UB1GovvpShnael8QvpXiliVEbQOXSqcxJDEfUhFrhjKL
        VqvxaxH0twoVnG7JVJ2cA/PFoN5OU/WdT/puL28=
X-Google-Smtp-Source: AKy350axYry1znftsZjzg8LUEoktyveoFzhwG4Bb7Trgg+J45I/+MtYTQDxD96OldYQ7bQM7Lk76PQ==
X-Received: by 2002:a17:90a:1d1:b0:23b:4f1d:f5d9 with SMTP id 17-20020a17090a01d100b0023b4f1df5d9mr32242983pjd.30.1680281042094;
        Fri, 31 Mar 2023 09:44:02 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:53ce:1f39:30a5:d20f:f205])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902b40d00b0019b089bc8d7sm1798767plr.78.2023.03.31.09.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:44:01 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v4 06/11] dt-bindings: qcom-qce: Add compatibles for SM6115 and QCM2290
Date:   Fri, 31 Mar 2023 22:13:18 +0530
Message-Id: <20230331164323.729093-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
References: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

