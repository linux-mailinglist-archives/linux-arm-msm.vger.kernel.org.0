Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6231A63A94A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 14:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbiK1NSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 08:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbiK1NSZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 08:18:25 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECCF222BD
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:15:57 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id b9so13085949ljr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cN3ci674j5MZP7fl3KkNOFt/FyleeiOdHLXAu5/IuPo=;
        b=D67Nm7Kv9bS3sJHZDYT3PxQLjj7Jn+IG2vIQ2tqsR7dNSEGVCMbMlVv0qPIwot7GCI
         8gpD9dXWaBcRAgyUY698xqoq6nOhtbfr1wRe3fKcvC/W5VSF8LmOo7KWvN+1KJo9iawu
         EiGZZGr+lL35fiNdbTXqZZct0GcCoDK/EQvNA+ifJMhMyH70fbt5AK/hZtgO2fhWTXuA
         xK6dhuHlWkpSCOdhfMSbVnVV5vjHcpqN1Uvr+OVjHnjn4LL2OvOQAV5hCsuR6BtSRckL
         5KEXtufMoLuCDECqehQZji97QcQZN0E83i3oxHPVd0m1ELVvtLoNEAgO7Tro9VhNdzNL
         30TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cN3ci674j5MZP7fl3KkNOFt/FyleeiOdHLXAu5/IuPo=;
        b=aImVQNAKiCDiPnnPeDvwfprD8VByBVxAzWx5acDspzcrwQtzGJ9muEFXXjx96SYURt
         SGbGYuM/XTrV3Ti0oUxvLj3fCnYePIOELoKA0h2p80AdhodfvJH1gdF0+F+o+9ENGNhS
         G0q6kF85U62zIMzqMvhndhW61n2O9wPYzQeOG2DilsKNXe8usYLuJP4q0TY3G9d4FQcD
         m78wJILOR/uclNNn6jJwawwrwr7Z4pL7RwugWlW6s0e2T59CL/cc/NRAeHYHjliEx7cF
         FHvL7cK7P5DQ6g+xeK2ZLbGGp5KU9jSfpRXaW8LxCktiM7NyWX2m0SlJS7TbmxuUh3+V
         bg4g==
X-Gm-Message-State: ANoB5pndcHyG8GMuXhy9P2C7hc5AcPphqAgWge/i0eaDab4VhZ7a51+h
        x9fPDvkbt14ffbYG6fTykIN4Gw==
X-Google-Smtp-Source: AA0mqf5vYotgEd+hWchR4KHK24U9EzyasvyCL9z9itXeOuRGjS8uKJBZWMYMEWqp6qrdkMmNUFxpdA==
X-Received: by 2002:a2e:94cd:0:b0:277:d75:f1de with SMTP id r13-20020a2e94cd000000b002770d75f1demr4208704ljh.272.1669641353690;
        Mon, 28 Nov 2022 05:15:53 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id r2-20020ac25c02000000b004b4e373df2bsm1739044lfp.202.2022.11.28.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:15:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: split MSM8974 Pro and MSM8974
Date:   Mon, 28 Nov 2022 15:15:49 +0200
Message-Id: <20221128131550.858724-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The MSM8974 Pro (AC) and bare MSM8974 are slightly different platforms.
Split the compat strings accordingly to clearly specify the platform
used by the device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 463509f0f23a..a53a24b3edbb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -165,14 +165,19 @@ properties:
 
       - items:
           - enum:
-              - fairphone,fp2
               - lge,hammerhead
-              - samsung,klte
               - sony,xperia-amami
-              - sony,xperia-castor
               - sony,xperia-honami
           - const: qcom,msm8974
 
+      - items:
+          - enum:
+              - fairphone,fp2
+              - samsung,klte
+              - sony,xperia-castor
+          - const: qcom,msm8974pro
+          - const: qcom,msm8974
+
       - items:
           - const: qcom,msm8916-mtp
           - const: qcom,msm8916-mtp/1
-- 
2.35.1

