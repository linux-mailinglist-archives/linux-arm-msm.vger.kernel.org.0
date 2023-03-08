Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D24A86B078E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 13:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjCHM7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 07:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbjCHM7Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 07:59:16 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5198683152
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 04:59:14 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id i34so65338722eda.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 04:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678280353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8kMsbIG/XKTFlKgeGb5WDX3CusbAYjjN7Fik1ZtUDA=;
        b=zrdy7iH6gnpbgt6dSC3hvg6j49jdz6D0fn+Skgu/Aum8loR4EvbLsiugiuGpSxgpqF
         9dQaaTuRzqyK2hZtE/AwOCpKGF5AfHta9WZE7iAD/z7/MLEW4JCMV+8PnWV3DzBn8AbJ
         bBQoSL9xzloHvYqhwdzZY653o71bwLtbwFK/bbBEVBO6GRE78ifBdixkQrjN06k2OULX
         jfqCik6BKgnlHMBjakaW0yKzYKrTYYNCM8VtIxG8p5XeR/p1g8hJyZkZmJkaiweU74n1
         GIqzZsuKTLYOEOXhEPtnRTTGMxuNfMDRdinlo9/K1/mnycGqs30E/NfCHBaJ79JGG4lW
         U9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8kMsbIG/XKTFlKgeGb5WDX3CusbAYjjN7Fik1ZtUDA=;
        b=1wXMrigaZ/nwTnc8RigJR+YSAqMwW5AIkxf8No7ieyxQinp4r4v0dYJfZOAV60ZGRY
         PrC/la4qS/gQkh259jwGSP22m25ad/fXuFRhJB0wcclZZtWB7/dRDwAmo384yihVNSig
         yHsRjn+1RtP/YMbKtWDhyesxa6CcDp0gfsWCeR0SdPX1dHKcJp/KTKD0X984XKyEfJ5f
         KctVgfplH/+l27chdIsAAn0vofEcuGigBTYkr8prAJk+pRgFTEb1SgdPkO6xtMADi3WA
         eHArI9osvjkEZBtfchrY1vpdZI/Krw23wSl529zHor7242YbeAWlgOtUsCI1tAI4UAvZ
         JM7A==
X-Gm-Message-State: AO0yUKXEeNayUMEvtu7qb2muxNUD2D9qg6DF2jHuCbHQKK/Ds/gxV5L9
        nk3ZILgDimptYxX46Dz01Guy19vFgbL/zV/w7zw=
X-Google-Smtp-Source: AK7set+cUuW3z0oQUmlyy7+awsz2o8PWzXcFT7f4tzgBIp/xX22JmiZIeFIVD92IANl5aE/wPHwL2g==
X-Received: by 2002:a17:906:da89:b0:8b1:7de6:e292 with SMTP id xh9-20020a170906da8900b008b17de6e292mr23958736ejb.9.1678280352804;
        Wed, 08 Mar 2023 04:59:12 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709063b5900b008d0dbf15b8bsm7464141ejf.212.2023.03.08.04.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 04:59:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 04/11] arm64: dts: qcom: sdm845-db845c: drop SPI label
Date:   Wed,  8 Mar 2023 13:58:59 +0100
Message-Id: <20230308125906.236885-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308125906.236885-1-krzysztof.kozlowski@linaro.org>
References: <20230308125906.236885-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SPI controller nodes do not use/allow label property:

  sdm845-db845c.dtb: spi@888000: Unevaluated properties are not allowed ('label' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v1:
1. None
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 1dc7076964ff..e14fe9bbb386 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -819,7 +819,6 @@ can@0 {
 
 &spi2 {
 	/* On Low speed expansion */
-	label = "LS-SPI0";
 	status = "okay";
 };
 
-- 
2.34.1

