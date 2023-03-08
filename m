Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 858DD6AFC05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 02:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjCHBR0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 20:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjCHBRZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 20:17:25 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAC1A92CE
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 17:17:23 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id i28so19551372lfv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 17:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678238241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnNZH9Drw/MoaoUZbOvjj8rfTjtiFcEzRwtiu8frN6A=;
        b=RQ07lhei6sASNDadIFt8TAzr9uPXoWua6pYttLSe2YpNRAynfMfJSciJUmyQFGmvRN
         fi5D9OtC4b59JEVUPiXBwhXuUCSJw3X6R/wpSN4b5Id7/Ywjwdh2/YiwW2vBCRLGOsOl
         GZMlyQ1dq7AEJ5pnjRXptijJtNzMEG+N0mLGdD8x945i3uTC0ontT3Mq+xd8FEfsdJ9g
         l+jIjT3BAPCXAWAypfIsB0iNVabZ9E2JWfStnK4/yp5MMUHpCO9mQjBmMJzcHR0jOuUV
         CHgKGDrxHisMvFmDefWiIA2uxuEfmJqo+y5zJVRcyRiGvXgQWVpVHkkXIbleq9gh151d
         D1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678238241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnNZH9Drw/MoaoUZbOvjj8rfTjtiFcEzRwtiu8frN6A=;
        b=aIJXDxp6i0NScHIeLpHgHuJjyxNK2Ycli4hxNnk8MMsmBrf2ycSWToxoKO/24gV5sA
         jzaWCZ2y3Js9RnQEBo3Zes2DOE/yEO4C7RBWjtm6fpoSwrjTBUBG5CvT6jtRwlXIPeXr
         EKL04yEF+Uh9RslCXDdx3vG7IhZncCWi5lJQnI0iKTQ1DUxRrcGKP7792LlLMjwgPEkh
         u3WmQHXJs/+QptNHpwrvf1cC1i+Ke+aDOjux2kItOiAVWKsQ8Mi5Fo/u6+V0dr94nu2L
         39GCfIgc8vXNsVCmZzDU9FpSZnQISWYXP6gH8Ez7HiobUja0P0OVmce+ti9LLAQKmyX+
         0Lfw==
X-Gm-Message-State: AO0yUKUSTXmXMSrMWN2XYq8mR8jXWjWl+ecNllmrjfsajMn9KXcD/xYW
        ElvFzSdy0CKLfuwmTlGysa/hVEXMjygozoDGw/4=
X-Google-Smtp-Source: AK7set/ga/+XC0HT4xLnuFeRdhBtdQE+1XK4NqdBxHRXvRxadMdq+a5GwDdfLw6LfZKqeMmiGENrMA==
X-Received: by 2002:a19:c208:0:b0:4bc:af5:b8d9 with SMTP id l8-20020a19c208000000b004bc0af5b8d9mr4291879lfc.6.1678238241433;
        Tue, 07 Mar 2023 17:17:21 -0800 (PST)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u3-20020ac243c3000000b004dc4cb4f9c4sm2183207lfl.35.2023.03.07.17.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 17:17:20 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Allow #power-domain-cells
Date:   Wed,  8 Mar 2023 02:17:05 +0100
Message-Id: <20230308011705.291337-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MPM provides a single genpd. Allow #power-domain-cells = <0>.

Fixes: 54fc9851c0e0 ("dt-bindings: interrupt-controller: Add Qualcomm MPM support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
index 509d20c091af..4c470dc143e5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
@@ -62,6 +62,9 @@ properties:
         - description: MPM pin number
         - description: GIC SPI number for the MPM pin
 
+  '#power-domain-cells':
+    const: 0
+
 required:
   - compatible
   - reg
-- 
2.39.2

