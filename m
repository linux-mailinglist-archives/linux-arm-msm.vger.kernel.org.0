Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCC4699570
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 14:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjBPNPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 08:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjBPNOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 08:14:50 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916EB53571
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:44 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id k24so1888622ljn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hw0gmk5DREE6xenNGf5tShOJfXuGFkAiD+ibfoL6i8w=;
        b=kcQe0fvMi7RmeErGk6kwGQi9Dp19dC7szgvGWadGNO9t28dqq6QOyh3JIq6vOcaAJl
         wWhWOUOFriEbLIGCFSUI3sQuSrmcocQEfZKSKWyZBYC9iaTMdv7yrVkGAejTzqCT9xlm
         TsVBSb8rTIwtR2VOjrlyQl9zGlQObyrZ+tqFYCVdnfVmO4jEg+CbIwwQX83yXL5QHtaw
         bkSbExeLtMQI6e0ClxcLOglfN45UHzQl+gUidqEHoIIeB+H9PuClX0HvM7C1j+sAGzkD
         XQe20sjoySO8NbN0KHZ6q9iJDUYA7FTZIkfZeDd6Mzt7OIyQEQmRnNwW8qHCnOAz22TR
         a2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw0gmk5DREE6xenNGf5tShOJfXuGFkAiD+ibfoL6i8w=;
        b=RgXyVAIi7gQxcgYvyXpEtu/e2URY0w0x+AZszAuSakZ4UdEtAlqhdGgaBz6WWys8kv
         WbHNxvxJwztKPdkZKHi8njECQM3Fl5NcrD5C04l7eVY7qsMzYOz+MXwlOUOwwnvymcBI
         7xag3Zgn+OPOswH/egJz5oZr0Jk2e5xzOzuk1ycUzWfFeMkSdPSccAoiDBmP18kUeA5e
         iJpWmbecJzgv+cSQAiUZjhXNYJ80hOgnLhFODfsWvK945NFe1Fl0QsJy0fItCFSMISvm
         tdI4QSW7HDcxHQ3iKKs3iBO4poJyONaWl+vP1paM2GPngFdiVpENnYWRlFwYYeAE+gGu
         Ddwg==
X-Gm-Message-State: AO0yUKVwKKzGWTki7ml9DJIQZkyjm+yJ8VyxyMfgDzG7/i8GigvovkGU
        UkhiBVYL7i6vrFch5XrXXJyS+w==
X-Google-Smtp-Source: AK7set9mDE9My+3H2Im+b+rWgprK+5YdqwwwYgPVHiBEkLf8SgNzgrG9EOF2J/gGdr6kZMrK3b4uNA==
X-Received: by 2002:a05:651c:1543:b0:293:52a4:9717 with SMTP id y3-20020a05651c154300b0029352a49717mr2515916ljp.4.1676553282904;
        Thu, 16 Feb 2023 05:14:42 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id j8-20020a2e8248000000b00293500280e5sm194345ljh.111.2023.02.16.05.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:14:42 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 07/10] arm64: dts: qcom: sm8550: add QCE IP family compatible values
Date:   Thu, 16 Feb 2023 15:14:27 +0200
Message-Id: <20230216131430.3107308-8-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
References: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
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

Add a family compatible for QCE IP on SM8550 SoC, which is equal to QCE IP
found on SM8150 SoC and described in the recently updated device tree
bindings documentation, as well add a generic QCE IP family compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ff4d342c0725..05ab0d5014c6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1861,7 +1861,7 @@ cryptobam: dma-controller@1dc4000 {
 		};
 
 		crypto: crypto@1de0000 {
-			compatible = "qcom,sm8550-qce";
+			compatible = "qcom,sm8550-qce", "qcom,sm8150-qce", "qcom,qce";
 			reg = <0x0 0x01dfa000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
-- 
2.33.0

