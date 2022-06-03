Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D0153D2B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 22:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236480AbiFCUNx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 16:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbiFCUNw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 16:13:52 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD86C30546;
        Fri,  3 Jun 2022 13:13:48 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id y29so9543991ljd.7;
        Fri, 03 Jun 2022 13:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ea34sRZaSwJnjGLjrLEGsQgF3V+GU0G0Kj9D8AgUyZE=;
        b=hLL6/Vi0BT7fbqJ6nj/EkTy6gXFeuMwqCXjU6PpmcOd2Mzbrta/daiLzF1D6j+bent
         s3AcsbxbyBDucDvwECmK379T8mib1TooyB9yAkrjXsTRvdvyflvV7QnotYz7XUMqbBVd
         wrEeSSoX9TxDxD4TriqsvhOWjbzs1+3NvWqKdHIL/wgqwHLDB59oOOZMKxaCV6r8c0HG
         lguUpsR3rNJP9CoUjXVRK4bT+5NV6V+bNg7Ra7vQES+tjeFDLNZRZmAGoA4wz6P6Mjus
         LVBRxU2cN/fxd299bPyICHV5ISZxEkJgmZEUX/WEtHor8O+DFRaVp294OOJrwHMeQ2vh
         QQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ea34sRZaSwJnjGLjrLEGsQgF3V+GU0G0Kj9D8AgUyZE=;
        b=nKfCC1wIFYj+/4G21BYfMtRaHNJvlPSZuNJFjrMcC6GvH+r0QuHuAI8w8lAiam/pHe
         bVl5CpigXx1dfwpkAr1mkihg6oTQHicLspAWn1Epdrz0AhRgl6c+GuQb14vFm+TCFk8p
         B/NYR5q67upUVMiIsmSFy8sCpkGizs90GJoCJxkjg9s+AdWSD7jdkpsHTnv7rVPinWp1
         fCe4/2BlranGRzhh6HbUeCnviFfxEuBHkIrEZ9e9enxHErrGleZ7TA0j7ylewu4qjt2u
         x2rKP48DU7moasYwaPydiJMHGFTJTfMeM/WSazXNztyMZEAE1Od8tHAAGu3weiE5K6Lo
         o/0w==
X-Gm-Message-State: AOAM5312ueCAANMDYZeCzTFI8Pp9vnf2ZiVF3WEYsIopoPVXijQ7Z+eF
        mpEyBLBiRYUA0Fer/HNEGdBwKUHIYnw4Qg==
X-Google-Smtp-Source: ABdhPJwfj98mmJMTdgqEAvsEwNEZW+BxgOIbCIcQ/T0UzpXIZVRP3xK+/7CEzfmQQj/MF8GeT25d9g==
X-Received: by 2002:a05:651c:1a29:b0:255:47f9:c975 with SMTP id by41-20020a05651c1a2900b0025547f9c975mr19575111ljb.285.1654287227054;
        Fri, 03 Jun 2022 13:13:47 -0700 (PDT)
Received: from shock.lan ([2001:2002:2f8:bfc5:11e3:17a5:f449:1926])
        by smtp.gmail.com with ESMTPSA id w12-20020a19490c000000b0047255d210f5sm1733330lfa.36.2022.06.03.13.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 13:13:46 -0700 (PDT)
From:   Stefan Hansson <newbie13xd@gmail.com>
To:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Cc:     Stefan Hansson <newbie13xd@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add sdm845 compatibles
Date:   Fri,  3 Jun 2022 22:13:40 +0200
Message-Id: <20220603201341.94137-1-newbie13xd@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SDM845 and all supported devices that use it.
---
 .../devicetree/bindings/arm/qcom.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 129cdd246223..6436b79dc60a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -235,6 +235,24 @@ properties:
               - xiaomi,lavender
           - const: qcom,sdm660
 
+      - items:
+          - enum:
+              - google,cheza-rev1
+              - google,cheza-rev2
+              - google,cheza
+              - lg,judyln
+              - lg,judyp
+              - oneplus,enchilada
+              - oneplus,fajita
+              - qcom,sdm845-mtp
+              - shift,axolotl
+              - sony,akari-row
+              - sony,akatsuki-row
+              - sony,apollo-row
+              - thundercomm,db845c
+              - xiaomi,beryllium
+          - const: qcom,sdm845
+
       - items:
           - enum:
               - qcom,sdx55-mtp
-- 
2.36.1

