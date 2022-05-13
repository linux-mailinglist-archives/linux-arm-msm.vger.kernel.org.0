Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A05C526F88
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiENBlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 21:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiENBlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 21:41:11 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B888B3AAB08
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:55 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s27so11999719ljd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x2qQH918JYdrczWJIIm8XRXT3abBOAyM4GeAzsiuGrc=;
        b=SeoS+Ay7JrwJplYt71eGo1y7KdWEdpebHQHUFH7uc44/Oiokf9Xuhq5HUcR0IlcZQB
         5nSeDFF8qJmowEkvBKERSetRLJp5V21ZNpTUzooXmuCVqrM3DOTUL8FpzV94OLKU0ZK+
         ngeqho+zdHKi7nMqCcM2zSe5j9eL0SWtpsUzjP84bLAxdPilwcVvPfBUg0kc8wlfJymz
         g7RPXVhTwmTeMterfjNpJpLqf7Ab/HOGHRXJnbW8sHyZqlcmR74Rdb1Mtcnq8akIK88f
         s6wshgspnpJodCwqLEhdIuo9M5z/hT4hRtJArcVcU3d+h9tQgCek9HWnu65t6yJ+ejdP
         DsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x2qQH918JYdrczWJIIm8XRXT3abBOAyM4GeAzsiuGrc=;
        b=fQsRlRGvHqf+wodewlkPb1DhZfBdUrhsyVMnvyoLSWMdB+Io0ZuvLX0E27nSgzRm6G
         ueFMWZIps34VrIaC4D84eK06g0Lhy9kVtY/ssfRC1rwgvPhx6rBrpDuAgL9dB17dYA+9
         O+Dm1MBALz149dL4JUdTDRQ8N3nZfYC9kM+RMnv9bsL/WStnwPtOuly/EL9LSxq8y1yS
         IqVzZyTn7palYXt91qumY2QkpCa2e35y0yoSTMd/W162/O5uuJWRB8/WHrV7v4h7njto
         ioitIdx3fjYtt5RSXwoieaX+ZxTMeWOiwckZptdtRrWgFN20KaDKruVa1hhraGmkPLXN
         iJuw==
X-Gm-Message-State: AOAM532kFtpk9Qp7wxv9DpMzO8zn9M+9iaIBvH7VQEMmsQ0aDczINk0U
        qrG+SMGgpFsCxwUjn0UIEXPpLg==
X-Google-Smtp-Source: ABdhPJxXCLHqAqEgg5HzVVhdNjvALIvlwrJyELVKyeOj4unPswlBVhSCXGXRpYs8nUuM3N/R2b3udA==
X-Received: by 2002:a2e:a552:0:b0:250:6297:8109 with SMTP id e18-20020a2ea552000000b0025062978109mr4420350ljn.504.1652485522710;
        Fri, 13 May 2022 16:45:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o8-20020a05651205c800b0047255d2118csm527342lfo.187.2022.05.13.16.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 16:45:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 4/8] arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
Date:   Sat, 14 May 2022 02:45:14 +0300
Message-Id: <20220513234518.3068480-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
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

According to the downstram DT file, the qusb2phy ref clock should be
GCC_RX0_USB2_CLKREF_CLK, not GCC_RX1_USB2_CLKREF_CLK.

Fixes: c65a4ed2ea8b ("arm64: dts: qcom: sdm630: Add USB configuration")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e8bb170e8b2f..cca56f2fad96 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1262,7 +1262,7 @@ qusb2phy: phy@c012000 {
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
+				<&gcc GCC_RX0_USB2_CLKREF_CLK>;
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-- 
2.35.1

