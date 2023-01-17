Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6740766D49D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 03:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235797AbjAQCwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 21:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235766AbjAQCwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 21:52:33 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE75303DC
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 18:48:51 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so19999058wma.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 18:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xCA5EUgHOsGaSJm+l0Mf/p8bYHPKtpaW04F9aMMbZ8=;
        b=u+36Dd8Nobty6WugHJlctyKf3Dcnq/2B4nl54+Y7foyxwmVxRM+cfD23/sLA0F6QYM
         hk2ijwN1SrAnum0pMrlvYrfmabsC+v+39WVcS8hDoWkFBvebS6JxvAoHJWNpH7wI0TeP
         2fKiyMDKCrwRBFFkldg80vtKwjiZypU4zK0pmRRjRuidTmEku5cn/Zlv/u/RbJfgk2xG
         E9RxzV88eaqkdPfyAifTsglneDLB1AI7IZsMlrdI97Cmbjgbei76XNCe7xc0YlNKnfVD
         hwlZKl/nvO2idiISjgNjY6kPWxwDjrH0f6H6AKMAG2ngfzoUglspjTCGF/1l49W7VL8B
         CDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xCA5EUgHOsGaSJm+l0Mf/p8bYHPKtpaW04F9aMMbZ8=;
        b=PUraw9HVjG69OLefAvYtgv/Mx00Dx67uTl3W3y2kBesP4Vk5cB+wOZrbYzPK+DaL15
         ci8H6VTaNXaO7inyLGcRP2bv80UJAAjXvcy7NR7JIg59Sbq0BblOt8XPU5wCoDwc7z3u
         kshL0leW4nd5c5j5Wezk28MIoGAU9yPy4ccvYA0Mx68PYDfPakBe89dTmwGpSd2TlUmS
         5Qb9RjNVBC9cUcypksmdsg6I32d6nBvMfUQFVov19L5bFxE6F2Nm6J/Tyn2jAuas3VJC
         /a53scRsEpX1UF0o7yUXfljNutCGFQn2Lwszy3M1g5O/xSuOiUUd6ty+l2pUSyq+eJSJ
         77fA==
X-Gm-Message-State: AFqh2kqiwkEmGCOF4OqGFKzv0vR+/VuL+YuRvwK7/VQPRINOmNqKwoSq
        AwjojpZWNt7IWckJfTqaLIJ+WA==
X-Google-Smtp-Source: AMrXdXtEDH/zbDvpHGRk8Txbxih5+0F7+HdQEWjlHmKs7nL4k4CGMCldSwmx5ay6i5krkyuLeTSFgA==
X-Received: by 2002:a05:600c:3d99:b0:3d2:381f:2db5 with SMTP id bi25-20020a05600c3d9900b003d2381f2db5mr1423608wmb.22.1673923730513;
        Mon, 16 Jan 2023 18:48:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b003c6bd12ac27sm39482660wmq.37.2023.01.16.18.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 18:48:50 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        djakov@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, benl@squareup.com,
        shawn.guo@linaro.org, fabien.parent@linaro.org, leo.yan@linaro.org,
        dmitry.baryshkov@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/8] dt-bindings: arm: qcom: Document MSM8939 SoC binding
Date:   Tue, 17 Jan 2023 02:48:39 +0000
Message-Id: <20230117024846.1367794-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117024846.1367794-1-bryan.odonoghue@linaro.org>
References: <20230117024846.1367794-1-bryan.odonoghue@linaro.org>
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

Document the MSM8939 and supported boards in upstream Sony "Tulip" M4 Aqua
and Square APQ8039 T2.

MSM8939 is one of the older SoCs so we need to expand the list of
qcom,board-ids to allow for the bootloader DTS board-id matching
dependency.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 47913a8e3eea3..0721d1a0b80e6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -35,6 +35,7 @@ description: |
         mdm9615
         msm8226
         msm8916
+        msm8939
         msm8953
         msm8956
         msm8974
@@ -164,6 +165,12 @@ properties:
               - samsung,s3ve3g
           - const: qcom,msm8226
 
+      - items:
+          - enum:
+              - sony,kanuti-tulip
+              - square,apq8039-t2
+          - const: qcom,msm8939
+
       - items:
           - enum:
               - sony,kugo-row
@@ -966,6 +973,7 @@ allOf:
               - qcom,apq8026
               - qcom,apq8094
               - qcom,apq8096
+              - qcom,msm8939
               - qcom,msm8953
               - qcom,msm8956
               - qcom,msm8992
-- 
2.38.1

