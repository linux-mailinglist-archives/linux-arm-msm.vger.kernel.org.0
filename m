Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B66CE7798BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 22:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbjHKUso (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 16:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236610AbjHKUsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 16:48:43 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAE82D52
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:48:43 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso3947883e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691786921; x=1692391721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQV2jupR/5vAA1PevJI0x6uxV/GO18vdetPpmLfoZ7M=;
        b=VVeg8s6mHL9YLWJM716a3dogBj1tlmEN35YqbJDaUIiCeEBJFmPazGDriEEtuNIaUz
         OP4estcVaYCOyVGB303jT1LnARQnOb/Gwsl9VXB4PKOtFAKZTo4ia9DFd7FQB/wl6Elc
         dvx3tHn6AqGrPFs177sy3UKs8kQN5klz9/iaqAVtLWBkqFMx7dXkAz7/YtXu+Je62Apk
         2yx00uszaget7nTdBvqbxHJo70dZt8mnf48tzoMqkiY/7I0R2+cCeQHdDERPQkiayPkf
         2lxoXpdynqCOZr9lHrMMUkRrm0sjdFknSfTNUUVKdAEo772BR5iaRiGMW/y8K6dBJq2+
         HPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691786921; x=1692391721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQV2jupR/5vAA1PevJI0x6uxV/GO18vdetPpmLfoZ7M=;
        b=NrMzoMAVFH1LlWwoSC2mukRBJuCB7ZvV/wLtoiZklyZ2NUvsrtGGnkaUjmzsJbUT6o
         WzM41ygjXvxUHlxgyd60l7jnFmlaDmgjvChtCY/wQ8cMrsZ2gusaKF09ld1FYJk8E7L7
         7flWVqegFeknK4yKnEVsif2XPO7qkj6aIYDyPjWZsFsk6YI8xKzd2sOuUK8EGEj5ihFd
         ignwKBlusIr6rfsTiU+fT/6+umT82cnq5e2a8eeU8P/LRJKHBcpXFPpb6DIrPXbXPMQr
         +H3Q9Yzsh4a5ncqaSPIZCFS8varQIiPSgBZmVEdb/z3eJjvx/TfhPIYng6GYoH5a69hA
         T/8Q==
X-Gm-Message-State: AOJu0YzzONgD7YqT+FGcDqoFP7AkxP5ymFdaYOHgXB/mbg9NpKQJ8toR
        9Ko3YSnGhlXLz2nZpY66ic46zw==
X-Google-Smtp-Source: AGHT+IEyj81biEjwMa+myp4lxZLUlbvs5I+bpigRzdvE2PMZ4RTeLxYDTnZZ+j1wjf+n1T44e3pzCw==
X-Received: by 2002:a05:6512:3b2a:b0:4fe:8ba9:4c0 with SMTP id f42-20020a0565123b2a00b004fe8ba904c0mr3002975lfv.26.1691786921602;
        Fri, 11 Aug 2023 13:48:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id w1-20020ac24421000000b004fe8d684172sm843603lfl.234.2023.08.11.13.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:48:40 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 22:48:34 +0200
Subject: [PATCH 1/6] dt-bindings: interrupt-controller: qcom,pdc: Add
 SDM670
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-tlmm_wakeup-v1-1-5616a7da1fff@linaro.org>
References: <20230811-topic-tlmm_wakeup-v1-0-5616a7da1fff@linaro.org>
In-Reply-To: <20230811-topic-tlmm_wakeup-v1-0-5616a7da1fff@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691786918; l=850;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1jl25QFtvSM1xz4SkIyIuI142d240hG00GfPqC6ikw0=;
 b=jevYVYJoemKYDzANIL+e/uwGk9VOH6buBSkzSuOtMcGGrHL04B+JIKufpz0Co7ZDkagAX4r5z
 eUwMvVb9MjhDzoRj4UNuk7u7+7DyRPRN8q5BAp4CL05MC3Blywoep7g
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Like all other RPMh-enabled SoCs, SDM670 includes a PDC. Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index a106ba6e810b..4847b04be1a1 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sc7180-pdc
           - qcom,sc7280-pdc
           - qcom,sc8280xp-pdc
+          - qcom,sdm670-pdc
           - qcom,sdm845-pdc
           - qcom,sdx55-pdc
           - qcom,sdx65-pdc

-- 
2.41.0

