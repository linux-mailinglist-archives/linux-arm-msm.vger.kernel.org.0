Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 282A9686AC4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbjBAPvf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:51:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbjBAPvY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:51:24 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D8E74C26
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:51:20 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t7so9385277wrp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1rsiTI7UwHw7phclNE4/ASYO2V8AAHv5RGPlvescl0=;
        b=qDlndRQGWrW94HAUc5CcWXb4MZWZao4zWYaxUzFLLjd5KAJlcYliJanEeMp+Bzm+gP
         VNzqnRwXQ6Ra1bB4XfmRBo5q2mLOd5zeS7K0DqSdljHg5TO4u5nHp2Y6vHStQsY0KdpL
         Yh8BKUb/zToqFfr5qwBqALkjd9xE6SE5kedgyNmTrS2RYNYjxlZ4IAW6aDl96K1G/HYo
         hJ3Z8zWXB+SgwA2VpVDZWMadkfitf6+EVRFdncUkACy0Wc12jprby/S9Sktk0QVL8dpY
         n+N+tlEqtqRdlHdwNhqzKuNws30eXEh5nXuGUOOW3r9XCmZYpEu2wgtgXzfFnO7gMGIx
         Rr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1rsiTI7UwHw7phclNE4/ASYO2V8AAHv5RGPlvescl0=;
        b=uPoEpFoPkBx9yuT2zLUs28zQA5wAOjVZ52M/ZKez6cMOnnPr6Txy0AkgWJFOW9RIRy
         HuQcIhzLFvNxI5mWFuqPZrY28Mu30glpT6QrorrM/Kban2fory731RNquJejImK+XwsC
         C1hbVwulaFLZVGkmlVASXUjguaNEE3oy2LDuOAeF8MsQQWWqnBQgoLc4T2awXpkx4vuh
         4YdKsCB3MBmO2/C3lB6aohXv7GzoEdCi5HZdk4+bhYL8lzzlu1BFy5jcNxuT3MCeInST
         TeNLz2CYn1bEk6k+ZW/rzRCauO9e4aPVAEqgOni/3LtQ28H/1LA5uK+2l/lw9r3Ovyo3
         oP/Q==
X-Gm-Message-State: AO0yUKUfST/4+J9HrhuGDEwp50IPMHai+9LY7IsB5geGfgPNM0ddIFVK
        8oJnwVeUIcLmxEZunbAM9aFz3Q==
X-Google-Smtp-Source: AK7set/QZQnWVCK3LotJLBnFihqztsStXEyV3jIFNQxowxc06ejfP/+ehZtKzK5meKRVWFczrB/Qhg==
X-Received: by 2002:a05:6000:1285:b0:2bf:d0a4:3e5d with SMTP id f5-20020a056000128500b002bfd0a43e5dmr2870727wrx.42.1675266680403;
        Wed, 01 Feb 2023 07:51:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe441000000b002bfd524255esm14816189wrm.43.2023.02.01.07.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:51:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 08/14] arm64: dts: qcom: sm6115: correct TLMM gpio-ranges
Date:   Wed,  1 Feb 2023 16:50:59 +0100
Message-Id: <20230201155105.282708-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
References: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
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

Correct the number of GPIOs in TLMM pin controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 50cb8a82ecd5..d1bfd264c2d3 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -363,7 +363,7 @@ tlmm: pinctrl@500000 {
 			reg-names = "west", "south", "east";
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
-			gpio-ranges = <&tlmm 0 0 121>;
+			gpio-ranges = <&tlmm 0 0 113>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.34.1

