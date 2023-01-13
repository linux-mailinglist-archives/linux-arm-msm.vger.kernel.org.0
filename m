Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19DC4669E12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjAMQ2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjAMQ2W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:28:22 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F998142E
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:56 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id l22so23767771eja.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Khdx3Ga85eCQb6IsMCjx6CynZpib1E9o545AtXQA2Fc=;
        b=ma3jG4N5B5obz0s2JVeNyEQIdR0S3Qr8HitCRFHWCXv+EP5PmijF5R6rartbKOGBVM
         u4T2VnKPd6BV0S9kNFWV6K1AeuwhnD7+mKeHvqqijcs1vC2dwRMad9OHguFvV19XzAM6
         K5y1lcEEh29q0TxuCMVaAa5wRxQY9v+pQYb+EN7ZfTtfBd5A+ziJPM60LzHx2H9SMIqz
         M+HsHD15mX4Ie7OMr2oeCNvbmgHoXYpfvd8hLW215rjbrWQkxrVJ3aj+91kw2XueM2UC
         hoqw0ZAFNpjQrF0YHnuJv/zc7aNxJp7cAaqmeOVbX/mVofbEvLdXHRiSOqCs8lPqY6HE
         Cizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Khdx3Ga85eCQb6IsMCjx6CynZpib1E9o545AtXQA2Fc=;
        b=J9EG9IVVMcG9HtzrXq8KIXSAP6F0C0lawZ2gTkBK8vu8ezllx2e4yD7b6E0iz3Jw6T
         DOdDd3M5DUPmod9ordJZYo352PUfOWYIRjyhWzvmCjPXrX/3QptlMkkGEhe0YeWfljnA
         HRaz0Kq31DF3bcPf6+/XLsjvYMX1Cx/WdG4A4O2qxga23g/kEJ1fL8hDcBIuaJrFJFHe
         t2ivoRpiw4r/tucVKvkdlu3NnT8QCyS/047t+i7RUkxbkevU3yNNY7dBtwifietB8sZT
         E8/57jufSbU3FkMk8jWTHbgL3JLmasvP/C2TOY7CjU9VF+Y8SyER+Nc+c4X+GwUZkWyN
         CQnw==
X-Gm-Message-State: AFqh2kqpCEEUX8v6l8/RZBcbiXvGG6b6YnLEwjdALRzTwn3Xk5N0zqjj
        zmLdFowqVheF/oNssX9ak0cOKg==
X-Google-Smtp-Source: AMrXdXvCnqHQGC7HhNpBGI6RSDinwcsGecCbYlNsp2MP+CXZiXAXxUz7BwOnVYgyPjs+Rq3pKRCc8g==
X-Received: by 2002:a17:907:88cd:b0:85c:dc1b:dfb0 with SMTP id rq13-20020a17090788cd00b0085cdc1bdfb0mr13422734ejc.47.1673626976344;
        Fri, 13 Jan 2023 08:22:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090676c100b007c0d4d3a0c1sm8739479ejn.32.2023.01.13.08.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 08:22:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/6] arm64: dts: qcom: sc8280xp: drop unused properties from tx-macro
Date:   Fri, 13 Jan 2023 17:22:45 +0100
Message-Id: <20230113162245.117324-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113162245.117324-1-krzysztof.kozlowski@linaro.org>
References: <20230113162245.117324-1-krzysztof.kozlowski@linaro.org>
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

tx-macro does not have children and does not allow address/size cells:

  sc8280xp-crd.dtb: txmacro@3220000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 5f2bb35a39bf..4986db9d35ad 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1788,8 +1788,6 @@ txmacro: txmacro@3220000 {
 			clock-output-names = "mclk";
 
 			#clock-cells = <0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
 			#sound-dai-cells = <1>;
 		};
 
-- 
2.34.1

