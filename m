Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924DF780D24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 15:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377490AbjHRN4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Aug 2023 09:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377559AbjHRN4B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Aug 2023 09:56:01 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A504480
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 06:55:42 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52580a24128so1163379a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692366941; x=1692971741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u8c4lUkFwMTd8t+9hbWzlMS2+06J2PyO+7AtFRoosww=;
        b=PE341OJJdp3qA/yo0OsAXN8vgrYYVYoZqYKEW2AplqK0+xxgTEKeacUkAQHpueiuYV
         1hzKnJXqC103W9fzq22uBG1JMd/qcRRnZBGvqes4o1dTOqpBIMpFgnjDvgk2mZznw6Fe
         uS9MeFL779idAam5FnrdmqZmRSJpmKpl+45+4mCMViMJI/VKxxZVNAYX4+ju4YE0hDWx
         yM8ZSRMk4GznlUrU9ixmH4GAkKYdJ3MBvTAR5MFRCRQwuy+SAE6tRcDll8pZ/tKntKxb
         xGq4TThNhpxYkcLjnlyyVnnG5ktIG8DJEJiw/fNeoaO64JQZF5/5gapzcFamHcWWL90O
         pXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692366941; x=1692971741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8c4lUkFwMTd8t+9hbWzlMS2+06J2PyO+7AtFRoosww=;
        b=EePmqrIqM0QPn2wRNSeZNc4IAH5d5FcD5YHB8YuhZXJS4S7GHZcAKkTavQUBPlvCvs
         l3GhahTp/B0FRDCbL5glY1dxO1bOquPdXbPTI8f3ur0KAubxStQIyC6Jse90pzm8T9VI
         wXj4k4ozKehZ+N3DfVSx3cbuTOqG30KQEc9KOmt4AZ6WEeV+RKnRgKHaKR0CFsG78Tz5
         4vnhe+WKD2S7xzPWowZ/JaJnqXurS36QoEWvypLp1Rw6VxsHfK0g7RRT45TFU3wWFYBM
         ZC6AexKzAxDPLlXDXpS8S3IiIzQUQb4gKrc8VLlkMrltFd0oOlXPhOHQRPLLTy9tXkme
         COJQ==
X-Gm-Message-State: AOJu0YzE1IpEgq4PuBzIuLZsRINqQUCZaKFJEcqPm+7WQZsqPNtxprW5
        0H4ncwy8gBtoEiE1XyfQ9zXNrQ==
X-Google-Smtp-Source: AGHT+IGDed+dXOVWOjaEzL+sa5B/Iv3ilIVkYD8DyctGAbTB+SLduHf4F4ysvhH2iqSLEaaqO4ZkTg==
X-Received: by 2002:aa7:dd14:0:b0:522:27f1:3c06 with SMTP id i20-20020aa7dd14000000b0052227f13c06mr1918012edv.21.1692366941322;
        Fri, 18 Aug 2023 06:55:41 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id t26-20020aa7d4da000000b005233609e39dsm1092356edr.30.2023.08.18.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:55:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Brian Masney <bmasney@redhat.com>
Subject: [PATCH] arm64: dts: qcom: sa8775p: correct PMIC GPIO label in gpio-ranges
Date:   Fri, 18 Aug 2023 15:55:38 +0200
Message-Id: <20230818135538.47481-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are several PMICs with GPIO nodes and one of the nodes referenced
other's in gpio-ranges which could result in deferred-probes like:

  qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: can't add gpio chip

Reported-by: Brian Masney <bmasney@redhat.com>
Closes: https://lore.kernel.org/all/ZN5KIlI+RDu92jsi@brian-x1/
Fixes: e5a893a7cec5 ("arm64: dts: qcom: sa8775p: add PMIC GPIO controller nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index 3c3b6287cd27..eaa43f022a65 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -173,7 +173,7 @@ pmm8654au_1_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
 			gpio-controller;
-			gpio-ranges = <&pmm8654au_2_gpios 0 0 12>;
+			gpio-ranges = <&pmm8654au_1_gpios 0 0 12>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.34.1

