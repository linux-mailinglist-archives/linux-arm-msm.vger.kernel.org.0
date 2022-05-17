Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9AFE529A25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 09:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240614AbiEQHCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 03:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240607AbiEQHB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 03:01:29 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705353D1DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:26 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id j6so32764798ejc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KYeBcLtOIBRk8eetAhraGQ55nA0X3XbtRB4w/tNkBGA=;
        b=cG61NTNM+ZDLAW7nVuf/6PqpcSZfx1QVKqJJJ1zpe+EOLS6pUwOs3XhzPf0KQUT8E4
         7qB08/i9v3EEikoxIofIr/gRImD5o+/wg0Urg172SRXUZWav+J+kA2Tp40vijS4xaxnH
         QusrQq1F6NIocC48zkiwe0aYwU9zXzIUjV/ydHEpJQxZadpxOcCz92Zm4jYVl8W9H5x5
         yNWT2+QHlUQcGhe+Cyjv/gUadGNRvMW4abaj45iY269AhlDNilmlwl5MeQ2GspFl5Ikx
         NAxD8bXKruURoVObOnvoRKVNfF1m/H0G3EnEaaoJ0TI/SbXTq6OGqR10/VrOfe5MUDvT
         OlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KYeBcLtOIBRk8eetAhraGQ55nA0X3XbtRB4w/tNkBGA=;
        b=hNePOuDYJAarKlOv/sZ3sMgEhROIW/HlmZvYUWzoCst2AdnRlFW+OWx1VOHyjn5JHh
         dvOX4fvpDNfGguiULUAzckBA9lh3LiTd/JjCcAiQ38gYNP9FDuusKFXy+wB/9/XfhMgn
         lM36XcpmoFOjTensTqI7weQW6OF3S5/hI3723VCf2mkVBDve8yi33lAa5ecJd96YfBWA
         LtbR6uJHQgpOohEFTFkYTWwmm53lB/ZOnAFhXCE00n5jvOgraxy93cJecqP4vyIm8mRl
         W9UCA5zR9tnVomZrf+Mk1LfV+O0lX6O3PvcMRPm5YpKieOOseePeVtXeZ+TUnRjGb8Qd
         4ZvA==
X-Gm-Message-State: AOAM533VYS7+AGLVjr0T3l3WF00TxZzm+ENO+UCeqf7COe4TVEtYIwck
        SKUxJvm8DewBQyG+yHj8JkuEvA==
X-Google-Smtp-Source: ABdhPJxd5QFcbp/FZrPylMNIisctJd9WG/F8SkiGk1dWCV7+wPGAPI+hp9C/ZrhzR6QnmO3N8ipYWw==
X-Received: by 2002:a17:906:3099:b0:6f3:e8e1:87cd with SMTP id 25-20020a170906309900b006f3e8e187cdmr18483709ejv.290.1652770885058;
        Tue, 17 May 2022 00:01:25 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 06/12] dt-bindings: remoteproc: qcom,adsp: use GIC_SPI defines in example
Date:   Tue, 17 May 2022 09:01:07 +0200
Message-Id: <20220517070113.18023-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use GIC_SPI defines instead of raw value in the DTS example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index e3a193299c4a..d04de60ae017 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -575,11 +575,12 @@ allOf:
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     adsp {
         compatible = "qcom,msm8974-adsp-pil";
 
-        interrupts-extended = <&intc 0 162 IRQ_TYPE_EDGE_RISING>,
+        interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
                       <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
                       <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
                       <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -601,7 +602,7 @@ examples:
         qcom,smem-state-names = "stop";
 
         smd-edge {
-            interrupts = <0 156 IRQ_TYPE_EDGE_RISING>;
+            interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
 
             qcom,ipc = <&apcs 8 8>;
             qcom,smd-edge = <1>;
-- 
2.32.0

