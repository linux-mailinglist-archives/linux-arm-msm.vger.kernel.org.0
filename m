Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164FF540025
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 15:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244780AbiFGNf0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 09:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244788AbiFGNfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 09:35:24 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADEEC9662
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 06:35:22 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id x5so17943023edi.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xDQbY/64npGudGixqFX4Cr/5hLlk9RCSz25mhEaqA2c=;
        b=m2ARHIniY851xN8CFtadCNZjqaVeAHydgmzCm+xX+Ru5UzM97CKTsIrQmrwTMuKqoA
         qq/LVaQlkK5EQKx9mkGt9foUSMiGdVvX/eNmmxL0FG97RgFcZtM9cSu3EEwY+Qp1mc1j
         RZV++y2nZR0rNieLFBGuwYMnW8Y2s2J9niujersBAyc1ywS3ZcJmy2VIdyxEWZth6Tci
         DU1hNjr4h1vCNvSj7eQD1T/EJQlxB/Kh5aSEVC8cUnygrJOKBqhURnGT3NlCHtFr02qn
         59fVxJzsCFKvVR65WJHvsA3fkCZjgwzfO6eti9s61Hld5UvWXtyIS+Xan03FZ4kJYh/j
         Cw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xDQbY/64npGudGixqFX4Cr/5hLlk9RCSz25mhEaqA2c=;
        b=aJfi1db0JYQx+bAd4U7LAi0R5E9alM62yJlGfkLF34JDVbjYd6j1rz8ScXgiv1rbpR
         asIczhGZx+K/Wp2+WaFi54zOqdnBsA5F2sqoHa4ZmfqmJGcWpF3k0Y68OZqQd3kLv4wz
         2Iy4KcnBsnmmRce5na4kXh4lDBlA1UZux/3PTeB82TZHg+0tRitAvQmZBXu0ARSykBHm
         tCijKeLg9zmWiuW8JmFDCY6rxybGjHdVgGWpXqrBuwlCYe4kvCY/PVJM7Nh3BSAUTF4I
         DMVX+HGDGSqVznEBbEOJbgnp5jB9YvNIOmn2Mjb0o6Qf3EkX/h07IV88vsrd0Z+0U2+8
         uv0Q==
X-Gm-Message-State: AOAM533oedLOve1noL0QyaZKlMyWKaq9m5/3KwCL4U691OTeP1MfbByx
        nIyHciz2UzoFevr9ybiknrHxiQ==
X-Google-Smtp-Source: ABdhPJz2bmmQ/mb8Z+m00RUNU/4Q9fwi2oEPL0lZSscE/c56c7Vu+nsR2ZqBwPjPSbWamBkIWnA8SA==
X-Received: by 2002:a05:6402:42c1:b0:42d:fba6:d5c5 with SMTP id i1-20020a05640242c100b0042dfba6d5c5mr33801935edc.295.1654608920839;
        Tue, 07 Jun 2022 06:35:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b23-20020a17090630d700b0070e1adff390sm5644204ejb.34.2022.06.07.06.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:35:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: mfd: qcom,tcsr: Add qcom,tcsr-mdm9615
Date:   Tue,  7 Jun 2022 15:34:43 +0200
Message-Id: <20220607133443.182468-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607133443.182468-1-krzysztof.kozlowski@linaro.org>
References: <20220607133443.182468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the (already used) TCSR on MDM9615.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 428973f97a72..2f816fd0c9ec 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,tcsr-apq8064
               - qcom,tcsr-apq8084
               - qcom,tcsr-ipq8064
+              - qcom,tcsr-mdm9615
               - qcom,tcsr-msm8660
               - qcom,tcsr-msm8916
               - qcom,tcsr-msm8953
-- 
2.34.1

