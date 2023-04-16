Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4606E36FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 12:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjDPKLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 06:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjDPKLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 06:11:41 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4041A1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 03:11:39 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dm2so56886574ejc.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681639898; x=1684231898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GS27KHl3ICcAu0AkTESMGa3br9jNX4cDkfGo7RdgYPI=;
        b=LFMToIUyl5KCjgS7DaJNDb/bLT6dMei3bi68ZWF1xhuop1fnO5U3UGZ+xXs+BWeUT3
         p5DY625PJ9UsZ5Z7sbiRzM+xyOHDd6nAYU0VPJ83B5IH4lzKMdU50SirtgydSqzamlCp
         j0RPd6eYkA9GB7VeHYYcW67lz+/h1v+soz1JSXGfdTO6BHdZ+vMau00nO63zYbbsUxY1
         BSb+geGCobecBW/LCiUlS+0WwCkTI6mr8Ms8F7V8zp1qic/lp7OnfrEHIxMqH1aCT5TA
         DPEmUvt2rxo7G3Mysy2Q/JJ4iqUqJGcjOj6IacLZOPYy9kNPb91NXCkPMoPV/cLO3uxA
         YQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681639898; x=1684231898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GS27KHl3ICcAu0AkTESMGa3br9jNX4cDkfGo7RdgYPI=;
        b=cEITz5bnmaPTVmgI3hSlk0biAVwn8x78OjU9VbawQDIKM/XP3tJnlTxuMqmScWQtS/
         W2J4PYoyjqE3s8maX0LJn7eLmt6cbZqvqla7li++QZIbTEYZddKrsFU3TJ4v8nRx0/HZ
         QB6FUg1E0ToMJl4UHeVSd0sydjXNrVtoZdkTOerLfI6QDNhWKa3oybr6B3LJlYipozk+
         MyvjlqVmb4xtea/aaEn/qbQMzcg/BfCWwwA3xe895EXvXsFVe4SnaLGyvLwkZ0+LsVZs
         JXav3mYGx/Rogvs6rAT6ShzYMieOFGOCWl3ifdLqmSJaEkWSJdRKE3Fw/eVwDJdRj0mM
         ribw==
X-Gm-Message-State: AAQBX9fqrWzvwaYLeOLGJfBLMeyOd3IKZ247oheVZyHlpPI34bOTvLaY
        PGI+YZsBDFYbWdwSTGSDYszSiA==
X-Google-Smtp-Source: AKy350Yodia1XWmgRIdmdpXyPHun3MoGFqKtPpAtoi9n2+DqzNnoeumu2nPqAlQ3iH6P9b4PhlqYSQ==
X-Received: by 2002:a17:907:d08c:b0:94f:247d:47af with SMTP id vc12-20020a170907d08c00b0094f247d47afmr3023263ejc.30.1681639898184;
        Sun, 16 Apr 2023 03:11:38 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id wg9-20020a17090705c900b0094ea48e9052sm4742755ejb.32.2023.04.16.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 03:11:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] arm64: dts: qcom: use decimal for cache level
Date:   Sun, 16 Apr 2023 12:11:32 +0200
Message-Id: <20230416101134.95686-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416101134.95686-1-krzysztof.kozlowski@linaro.org>
References: <20230416101134.95686-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cache level is by convention a decimal number, not hex.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9ff4e9d45065..ece652a0728a 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -83,7 +83,7 @@ CPU3: cpu@3 {
 
 		L2_0: l2-cache {
 			compatible = "cache";
-			cache-level = <0x2>;
+			cache-level = <2>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 84e715aa4310..4056ce59d43f 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -66,7 +66,7 @@ CPU3: cpu@3 {
 
 		L2_0: l2-cache {
 			compatible = "cache";
-			cache-level = <0x2>;
+			cache-level = <2>;
 		};
 	};
 
-- 
2.34.1

