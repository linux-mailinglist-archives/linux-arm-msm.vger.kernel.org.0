Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4409D744DF9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjGBNnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjGBNnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:52 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967CA10DE
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:43 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b6a0e36d42so43136441fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305421; x=1690897421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Lvzan3D8CllrgXI2W1/onOF86lUlT8hKXUQ2Bchqc=;
        b=IW8YVQ2cHksGjRVYlp3tSjhqB84oPcmB03e3YYEzOv+NEK2WLZ4Z1ftFqIBa0TFIAz
         xlLzvlXvHfKRXdM6QgW/E1Xvf9T7V6EonrcxioQuXoEELziTGlnDjuum0dkvhglwfxbO
         QXCn1wwL/Tc4z+SMlCtv6spbJlru39WAF4f8PzAHEaMBosl9E0LK5aQ659SuOrF2PR0v
         y9+mNHhSsbrrTyofIhSgicfU8tMaL/1U2LYZGRF4CCLqYMLH/10/QETIWZDAKC09I+aQ
         vqnx7MVQhe/tY7JHiSb3VPDMW84TOxFtfLO8Duw/K0aq4Q9+YZTGrbt9HYuOeskkJLpn
         F1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305421; x=1690897421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Lvzan3D8CllrgXI2W1/onOF86lUlT8hKXUQ2Bchqc=;
        b=euqDKALFT9HfyTCxYCwnjNhVjK0o8QrhPSLJ0IsOKz+ssfAioLhmj0BekG9171SKci
         8qmC9eM2/CC9/un87uPnK7i7o+/q23rnKIT9mINesGeRy5lOu6iWrwDFKS7lgzAbkbCm
         DdtT2KX3v815b50sRkc2iSZbm8Y5MzL3rJERO/U0uusE5jV8rccpjb1S1Cu618esc/7C
         aIND3zCe2RaPhF56x6o0/LxnT5TjKhTbFeVSGzh7YENAojloalW7AaCQKIX6l8EI9s/a
         CIS9ueN+E5Jn+TnDPvcqZD6wLwF8koLMcDsdbAXOHQ0k62/H8xWJEyy/h7OdHvpPHKmk
         BHwg==
X-Gm-Message-State: ABy/qLbBWMqKEvJfZ2qWPOx9U0edY4IoNsRR5noxkncljcVesiG6EXHp
        Efxa/l3/0xEduz6rzzsDMK5QWlV1/mCPY3NhJ0o=
X-Google-Smtp-Source: APBJJlESn6XMCQtRlcl2Ldba8dvYt/Dmdc4D2Z0W6CP1OexqQUnIr/WKrsENy0O7LJZHDLUz2jw5XQ==
X-Received: by 2002:a2e:9ac4:0:b0:2b6:98c2:635f with SMTP id p4-20020a2e9ac4000000b002b698c2635fmr2522786ljj.11.1688305421237;
        Sun, 02 Jul 2023 06:43:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 26/27] ARM: dts: qcom: msm8960: drop useless rpm regulators node
Date:   Sun,  2 Jul 2023 16:43:19 +0300
Message-Id: <20230702134320.98831-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The set of regulators available over the RPM requests is not a property
of the SoC. The only msm8960 board file (qcom-msm8960-cdp) also defines
this node together with the compatible string. Drop the useless device
node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 8157236f249d..b25cd58003e2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -200,10 +200,6 @@ rpm: rpm@108000 {
 				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ack", "err", "wakeup";
-
-			regulators {
-				compatible = "qcom,rpm-pm8921-regulators";
-			};
 		};
 
 		acc0: clock-controller@2088000 {
-- 
2.39.2

