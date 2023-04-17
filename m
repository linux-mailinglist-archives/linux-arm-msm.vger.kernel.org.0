Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552006E492F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 15:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjDQND3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 09:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjDQNDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 09:03:15 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5681027E
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:00:07 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f0aabd1040so40261305e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681736332; x=1684328332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6xOM6kW9d1XemumKm9ThuZAahqdk8FAknM6sfO+HnQ=;
        b=G600gfdtoGISreZKazkE37aq+n8EEUqdVz7LzsyES/+fkHWF1p+uAwyCSqp4go1RXe
         mLgSAnD7FA/vciOznmp3jJ4IDHVxm6mUO7tuyFoqdgteLc52L0mz7JR374stocYtad5a
         9rtKbOFG1pz4B+ZUgSZHJVxP1Uo+esZRTlwNeREiDHRgGwuDyzI9e7fda5YpD4KhrRo+
         b6Mx911aUatpwQXbpXQTLV0ugD1CHsNyDOPZqn1ExvQQv9P7N0WtwOqB6y0oT0SXchoD
         wrdqls4pnKetQCnQnF1djR7x6rOrhwd6ZjhbuIp9yEC0YS0XcDP+lT2aGLa45r0ch3rU
         ieZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681736332; x=1684328332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6xOM6kW9d1XemumKm9ThuZAahqdk8FAknM6sfO+HnQ=;
        b=TZ7TFlgzkaNpDczddmFcs+3+9nW5Rv7D1y5094hEdMg/lfFT/tq45BlpqpATZikdUm
         LiSvBY++avCKqKNjp3JtDkt+2WZ8QuE0BuEsGcmqdiPRRdzwnec1boMKsdv+no98iJL8
         /j90BETl+rA+hcJX2TsFQs/IFtlaEkz/2MXTgghnAMa20pBex8rYw42iCDWtOGd4POlK
         83EgSjnrEuRvW8UN7DdIq+OQ5AFZDH5FUFpmNYJ/CUjI0o5WlhuT9EnQyOY2SHCmxZIz
         GZ6hBhkA/5nsZPoduTCqu+OObXcQpl3/amehAcWNmK4GpCsoiqcXWI61IP0U2NtIdIUM
         /JTQ==
X-Gm-Message-State: AAQBX9ekg9XTUKbkAFG+e/Ceo8EBdM/4e0Ydla/sEP8My43rBuVkEDlF
        Blyi632z6YzZf1kRm9ic9U/AaQ==
X-Google-Smtp-Source: AKy350aHV3rB33KJYxoRPuAbvtOioyLe8bzk18K+L5Pq4TM/y0gQtT6KxZ1jjnt5n9/dT0+9+jdhdQ==
X-Received: by 2002:a05:6000:1b8c:b0:2f8:33bd:a170 with SMTP id r12-20020a0560001b8c00b002f833bda170mr6347571wru.32.1681736332450;
        Mon, 17 Apr 2023 05:58:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:374a:ffae:fd26:4893])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c471500b003ef5bb63f13sm15557546wmo.10.2023.04.17.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 05:58:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 4/5] dt-bindings: iommu: arm,smmu: enable clocks for sa8775p Adreno SMMU
Date:   Mon, 17 Apr 2023 14:58:43 +0200
Message-Id: <20230417125844.400782-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230417125844.400782-1-brgl@bgdev.pl>
References: <20230417125844.400782-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GPU SMMU will require the clocks property to be set so put the
relevant compatible into the adreno if-then block.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ba677d401e24..53bed0160be8 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -79,6 +79,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,sa8775p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
@@ -331,7 +332,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,sc7280-smmu-500
+            enum:
+              - qcom,sa8775p-smmu-500
+              - qcom,sc7280-smmu-500
     then:
       properties:
         clock-names:
@@ -413,7 +416,6 @@ allOf:
               - nvidia,smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qdu1000-smmu-500
-              - qcom,sa8775p-smmu-500
               - qcom,sc7180-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
-- 
2.37.2

