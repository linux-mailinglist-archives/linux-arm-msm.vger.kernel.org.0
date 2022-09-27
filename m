Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06735ECAFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiI0Rh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbiI0RhX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:37:23 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32CC01D263F
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:37:22 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a8so16746212lff.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=C8o5PFjxV2DbD9sEGHbpRvhtOpSPJbDO58y01xwZ0Oc=;
        b=DjG3389Xr93XVQ5+XBJDTlNwrCXwSMnPetH69F3nIUp60C01yT0PJ6LY8wxQsvJp4k
         Aj1fpAwaRVbXrLYzzF8HOckCW1qzbQlju66xhPLGTlql/cJOPW743crJde9HX64JGRv6
         MF7JycKmWK8ZVT2wCunCRedu+zZHq+uUebMkS23gXDlfjSvkD+LDaypaeFbQ3UZ9sb5a
         FxNdqWJtTVnRiagMAaQn9G/QO7C/UC9E/mfAO5l4OTfTdUHZRx8mSu1pZJj522ygEent
         l0YrPUc3U/IStWgyE0PXCw2nb3SthreSt9hNFwTkvnLfd51gzFgVdyeWB1MPwTtX20a7
         8HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=C8o5PFjxV2DbD9sEGHbpRvhtOpSPJbDO58y01xwZ0Oc=;
        b=HMgQ3l9vgwDHuaLE2kKQEZB+yXDRHJ6cF7yfNv7Fxialx8HIjLOv31oGtbQ3s861MM
         Ajv06BlaLP97EtMv/ToE0z61ZwUiNAL6uAK98XaZ55M7e4YCH3BOMuG+gYZXHgEl/zcT
         gB0cNYEi3tAhJouChMTp1PMJsr0nbjYWYcwO56HzOpHrT9kIaLsGw/fO4nh9nrzAXKAU
         ASeMR3MC+p0hFEcSmYaPXyT4jrQnWB1N0w1kVYUNr9QaaRneVEBw4dN5ZkSja1GDJlBJ
         CH6WK53pAPx+V8IQL4MLtHI5TER2vWftyBb4kHVje4VlM9CWC5BpPxNlytQvu4HnSUHG
         8KTw==
X-Gm-Message-State: ACrzQf0TWKWy056PSnuSbioeSXbVZQuPSff9gse6CsXCFM+hq39yzV09
        hVTXK2VhAQBgQOtIU41gXCTuTw==
X-Google-Smtp-Source: AMsMyM7eTF583bXkUf0LOwqQCcLRAePLgBN4b/NKH5P5Af6w3eZcUE4vKy/b+nJe9t0skUmG3NG0SQ==
X-Received: by 2002:a05:6512:3a8e:b0:49a:e5ed:d6aa with SMTP id q14-20020a0565123a8e00b0049ae5edd6aamr12116690lfu.271.1664300240429;
        Tue, 27 Sep 2022 10:37:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:37:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/34] ARM: dts: qcom: sdx55: add gpio-ranges to TLMM pinctrl
Date:   Tue, 27 Sep 2022 19:36:31 +0200
Message-Id: <20220927173702.5200-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

Add required gpio-ranges property to TLMM pinctrl node:

  qcom-sdx55-mtp.dtb: pinctrl@f100000: 'gpio-ranges' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index c72540223fa9..f1c0dab40992 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -559,6 +559,7 @@ tlmm: pinctrl@f100000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 109>;
 		};
 
 		sram@1468f000 {
-- 
2.34.1

