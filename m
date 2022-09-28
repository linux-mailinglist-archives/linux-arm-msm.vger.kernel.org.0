Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2DF95ED8A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 11:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbiI1JPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 05:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbiI1JPC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 05:15:02 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A52921E09
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 02:14:59 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id bq9so18786403wrb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 02:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=DCuzbrIo029QLEgMuY5wkEvpD11mqtwhQ1pcmeW8k7U=;
        b=XwVmXyrbdc0sJXAEjRkXRx86NO4V9LZk3W1phCeq2Al7mSBiERu7wXpYdrWRD3BjCG
         WDhZ7BwPVYh4DaxYYnCWwdUga5fVVXUmqPwkb+uPeF0H0iXLOPnogid+xumur6b3Ly9N
         ufCVP1VN/cWKTtELj9ZCPlJa9duRzZlA0yxWik2GBBhwa5Z+lOTR7u/ieL2YeLXsbBrF
         qpxFjTn5Cjc1t3MiNzM4n6LMUPvyDXd944eVM3rTt5Bk3BnrciJnMW+DUsViAie4dB7p
         NDs6zawuCCVv/iY2UJxuCoHDQDWJdxsAKtDlioFzx70mLzdaq+/2hZpqzx9V5FP+Auh6
         j52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DCuzbrIo029QLEgMuY5wkEvpD11mqtwhQ1pcmeW8k7U=;
        b=mMfzl5uEce1H+bckJKKGjLUbTwSX0d239aPRQzfSzxYyLj4VTr0AEWbxGtWWzUBpTp
         fmfTLsNPVjx/k83COtS1m+85nlj1+3jnJWWHkj0/CW+9POc6CmhM0HFBq0dZjKi3nR1s
         kSYLx4AvmfE3RDfiMg+8Is6MTr7gD6d2Sj8xXpjwYi+inMUUrq0MV9pZcingyAXeWRfz
         Qudc6Hbv+K7UrzyrUNJKsUJq4LoQMtTHkMxfGoF8ZvxXJzY+Qt4rXJDItDkgPw//8YQz
         c+Hl1qQIoS+f7jf3oNT3ajnv4CfenL4i2yuCfMQ2WbTK/Qgsyhr/vFkSqlBMOjGsy0uL
         waxQ==
X-Gm-Message-State: ACrzQf0HYwof5sK9/ekZQFlKlXS1noCzJaUttjrm7csIIBLlO/HUfLi6
        6gBSnzKSR+bS2x3Sr5a9rVMCtg==
X-Google-Smtp-Source: AMsMyM5yCD2k0rWdZrl0Lb+Q0T1tpCI6QoBVzsiBkctNh3Tfll8vD/KESYkb1W9yLBiLxctVA1vSag==
X-Received: by 2002:a05:6000:178d:b0:226:ffe8:72df with SMTP id e13-20020a056000178d00b00226ffe872dfmr19517534wrg.496.1664356498146;
        Wed, 28 Sep 2022 02:14:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d6382000000b0022a53fe201fsm2420016wru.68.2022.09.28.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 02:14:57 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 28 Sep 2022 09:14:56 +0000
Subject: [PATCH v1 6/7] arm: dts: qcom: mdm9615: remove invalid interrupt-names from
 pl18x mmc nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v1-6-b6e63a7df1e8@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This solves the 'interrupt-names' was unexpected dtbs check error.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 935f7b222200..d8723bd3fedb 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -325,7 +325,6 @@ sdcc1: mmc@12180000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12180000 0x2000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -345,7 +344,6 @@ sdcc2: mmc@12140000 {
 				status = "disabled";
 				reg = <0x12140000 0x2000>;
 				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;

-- 
b4 0.10.0
