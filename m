Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37EA56ADF9D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjCGNCS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:02:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjCGNCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:02:12 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754E46EBD
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:01:56 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id i9so16948140lfc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZF+P+KuHxf5dBJTVkEyyKo/3JePMMypQFYOBYKOGgac=;
        b=gH11q8jaF2QSf5Mxc8Ar3BA3u6PQu60JC7bmQnGCqpawbd/wBQpe6X56ikR28DQqvY
         fZjF3Kl/eMBQ6j3aNYSMVuxpYVK+HmHDOOHPYnCiO/lPzyar7SJhqms0+AahzOARALLm
         /cccSx/plO2b1ZtNU4OGxKjvuRyUfgoTu5ZzevyCLBCgfy3hRXtGiG7xBPzazn/VvWLL
         Ux89C9F3uySfkMlacczhdxawRtzOA9yiTzSypGR0p+LU8jXiIuzvU9XLUbkleshIgDiE
         mWb+Mj7QmUsnFgpcZeJHnhGSHaXkICre1QPPlx32EGHUkJUp75oEHzexeEkTs2gGC0PP
         hqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF+P+KuHxf5dBJTVkEyyKo/3JePMMypQFYOBYKOGgac=;
        b=nBgghIhzW7JOBsOibjcG/WZC0V1GHRb+dI8Cfe7Vp0bOQ0ZEqsiWNRU6f6th0NbkPW
         JlYLeSL9LQpuxG1pzomNdjDzZfhi/QGjqEmryktjgGKRHpwi1Gnpgxf0z5wQEfze7GEm
         bLTy60LRXKnXe126AGkJWECclKo85g2r/gYQumLkfJ2GhtWtpzfBRuxNz0eYX9MjsWMa
         lC+nixHGGH/IxsxpCbW6GIxCCFPpj1KIP7XIqFxYYahhiN7o70IliVCzMlP572zPwu4f
         I0aMXrha7POvPZ1QQvoLExhEiJjN4ORpSme2HgKYe0D03D5UMLR1/yAw5vpaLz7b+YbH
         UXiw==
X-Gm-Message-State: AO0yUKXMPUe7kgUMVRsxUrwVKidqkF0rzml0OUq9RP1W2/CcRZE/bFJH
        ALXkRtfNCVypqYW4amC0c4svrtMs2yj1aypguog=
X-Google-Smtp-Source: AK7set9xw8Dw5H4iw9qKZOv6rmUxjR22BePQJRIxzWdIatHaLcBQewJoS0t1ZGrUSx58OCfrYzITkg==
X-Received: by 2002:ac2:46f8:0:b0:4e0:a7cb:33fd with SMTP id q24-20020ac246f8000000b004e0a7cb33fdmr3402725lfo.27.1678194115481;
        Tue, 07 Mar 2023 05:01:55 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:01:55 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 07 Mar 2023 14:01:47 +0100
Subject: [PATCH v3 09/10] dt-bindings: display/msm: dsi-controller-main:
 Add SM6115
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v3-9-8bd7e1add38a@linaro.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=1973;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zfDVyzhXwH/WgE9j+QCB1vVza9+Omo+GX8sYcEeMzLs=;
 b=/RRmg0u5dKuyfv+1AQdnxpgBD4qmZ80GyzHiRnbNGFbB1XB8KCKMCe+pvq6H+onFvB4GUudLNBA4
 dtnsYpKEBrXGhsLdy4zycKMVWSnnt7ctlAPE2Dw8ZsHOpD+zd1Mr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for the DSI on SM6115.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 94f4cdf88c95..d534451c8f7f 100644
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..605b1f654d78 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -40,7 +40,13 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        oneOf:
+          - items:
+              - const: qcom,sm6115-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - description: Old binding, please don't use
+            deprecated: true
+            const: qcom,dsi-ctrl-6g-qcm2290
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.39.2

