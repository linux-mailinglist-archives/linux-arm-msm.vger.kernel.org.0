Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94DA66C0B75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 08:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjCTHin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 03:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjCTHim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 03:38:42 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFB7B77D
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 00:38:40 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso15522897pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 00:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679297920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNoZCqbMgBSH40W4pfEiFDhEI90p6zM5KTABLDNwlQM=;
        b=N5CrJk/HsF7f/yD83EjLqKLRQxEl17o2JpHJWYCXkUPVmlc+nIoq+dafz8LcOYZxQN
         JXIFQIs8kG19LPZZ9xKIMaeZVqyeetLzspjI3E0HyGVxDFYNOhNHLEGLXQTh+uRQdn83
         d9i8zT7wxkR3HMehAea5nhgfER6PgfXpaeundJLB0YILUcId36J7G/dEHpBnrQk/zbd8
         t9G/A9qmLm9rmhpvBJe2Uq1203xpiPtLJPMkUKTkPo6U+V/QVNChawBAlDN7w6+dGGgA
         bZmyK/cq2isLXGe1WDSmwFKLc8P1kwLT/J1/dUGakanCijAdC5hxSKJQeySyk42M+Zzr
         85cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679297920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNoZCqbMgBSH40W4pfEiFDhEI90p6zM5KTABLDNwlQM=;
        b=Gb0/Ss8Dv3ovtAn4y/k130eF+qtViKs0InB6GF1kYl8pwR8FMKfNrWHcPA3OVabp84
         vIeVEAJFqkxM3Ocp9x8dG6QRKT8CaOxoC/xBPO69F36VD/M93dD4TAkEOAHnwfoFXu+n
         Utno6JHb6fC9jEAoA8begmRdjUyD5D2mlIz7wz60wjXYBd9z86jCKOvxBkbDM27f81R7
         JHV7FXbEN+tO4KJZa4zrQrWEGsqfVLeW99NR+3iqAgiGhTQNdziEhL8xW8kQDXeUSKdF
         Z+rQu2AozlvgqDYoua+o790gIDcXiD5/G1wFWxA9zMi8FGhSjm6wuJrlF60Uv02HZx9V
         Z6gQ==
X-Gm-Message-State: AO0yUKWVc8PUcDM6oXuLR04Wu10nS4qmRKRYKlql8tFFLmaYggWawjVV
        b9lbZTktalRv+r/8/26q//tyYQ==
X-Google-Smtp-Source: AK7set9YbJZDMR6YZ4q3B1kwJTPJHAsZo6yP2x5I+WCbNAh0suT4iofAlq4O4AAF3uOIf9LZ7o/eeg==
X-Received: by 2002:a17:902:fa4f:b0:19c:be03:d1a3 with SMTP id lb15-20020a170902fa4f00b0019cbe03d1a3mr13752029plb.40.1679297920245;
        Mon, 20 Mar 2023 00:38:40 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:7331:922d:c0be:85c4:f0ae])
        by smtp.gmail.com with ESMTPSA id jj5-20020a170903048500b0019edcc30d9bsm6010251plb.155.2023.03.20.00.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 00:38:39 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-crypto@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org,
        vladimir.zapolskiy@linaro.org
Subject: [PATCH 1/1] dt-bindings: qcom-qce: Add compatibles for SM6115 and QCS2290
Date:   Mon, 20 Mar 2023 13:08:16 +0530
Message-Id: <20230320073816.3012198-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Crypto Engine block on Qualcomm SoCs SM6115 and QCS2290
do not require clocks strictly, so add compatibles for these
SoCs, indicating that they are similar to the flavour
found on SM8150.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index e375bd981300..e6840d124af3 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -35,10 +35,12 @@ properties:
 
       - items:
           - enum:
+              - qcom,sm6115-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
               - qcom,sm8450-qce
               - qcom,sm8550-qce
+              - qcom,qcs2290-qce
           - const: qcom,sm8150-qce
           - const: qcom,qce
 
-- 
2.38.1

