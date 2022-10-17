Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 688F3601DD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbiJQXrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiJQXrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:47:07 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA29C7C1D6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:46:59 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id g11so8784966qts.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPs91Vx1W9fG2lCg/tk7Xp1czEvOoCNoRLxtOgz+ygM=;
        b=c83jwx4+AyS0RAwo7UqYo1fihPHgcpmiA6fpL1QztlsykHkxGSKS6vYyn/2T7WfLQ1
         opvk6sd767C0Kj+ITdOk+B+tyWpMQ1KuL3k+ophyJIA/dtXgkM9FioN1mxtIaXqyiVMz
         Q3eEwTwF9gY3MEW/XVEDJiKYy/cO/8cS+oz2Scu14uO8imQ1vcn14mXbVtX3occ76MiF
         mm8one6j4XVee40YYYPzxCX7btwmCKdFt84mSNcvn2KLR9gKVB5frQPalNjXc70/lEIT
         0OCr4PrWVieo1SjCWbhgWo6iYoVJ1mxfKitpGrdwKcG1q8shFL+14tzMNkLSZrAYJ4yt
         wyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPs91Vx1W9fG2lCg/tk7Xp1czEvOoCNoRLxtOgz+ygM=;
        b=vyPev4g3OPissLCbAb3Ed6pF1KSngFc3SDrLcm50p6diYHKm/mlcEAtQwV0aJDTeQ1
         guB2ADVdTWqOEmCIvKsJaNuv8/wwvnmNPWJgXsrt/UZSvwnz2lc9wR+XOPNnfaTMPil0
         GuMd/xtBRmzZevgYjefD0lJjlWudNObNNF0+S8zaaSLmC1Rt3QKTD6mfNPqstNJkEidX
         x2qXYuDaB4OHO2wkBcqZ+wO2P5a8NH87G5uV81k7h/ZNEjg6QQMQjmYiPxj1VYfsDJ0m
         ODtx9kuZLUowCab+WjeAUXOX/4bB0OEUtVpEAF7/TMTbsvIc4Se0lApLmJGiW2eveA3q
         QuJw==
X-Gm-Message-State: ACrzQf2bctUHUdaRVxw68Jeynnw30fXdtnEGuSRck5YW4gxp67ARtIxC
        cfs8V/Gby4+g6j1U4C8HpUtsWw==
X-Google-Smtp-Source: AMsMyM76DV33t+oqE2Y4ARVGxnPrNa5ShCi62G0GXm9HG65LBgwS6mynNp7blDnetlaKKYBNk3Mdqg==
X-Received: by 2002:a05:622a:245:b0:39c:c512:d1d8 with SMTP id c5-20020a05622a024500b0039cc512d1d8mr88352qtx.157.1666050418836;
        Mon, 17 Oct 2022 16:46:58 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id r19-20020a05622a035300b00398313f286dsm858120qtw.40.2022.10.17.16.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:46:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/4] arm64: dts: qcom: msm8998: add gpio-ranges to TLMM
Date:   Mon, 17 Oct 2022 19:46:50 -0400
Message-Id: <20221017234653.55506-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Qualcomm pinctrl bindings and drivers expect gpio-ranges property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

---

Changes since v3:
1. Add Rb tag.

Changes since v2:
1. None
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f05f16ac5cc1..2c4acf227253 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1056,6 +1056,7 @@ tlmm: pinctrl@3400000 {
 			compatible = "qcom,msm8998-pinctrl";
 			reg = <0x03400000 0xc00000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&tlmm 0 0 150>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.34.1

