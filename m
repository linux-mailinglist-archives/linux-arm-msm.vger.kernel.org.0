Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF955E9AAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbiIZHoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbiIZHof (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:44:35 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BF3B4B
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:32 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id b6so6410726ljr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FWVDuWp8BwqwRmMZ9J51BUVWuUxtUS1YpggdRQgiP8U=;
        b=lSD1tqaalRfKDPzzWVi+u9hio5F71v5vbCbtcl+EypuvicMB5WXd0C7ykBzNI3tzru
         ErvzSOhVWv5yqiGw2f4ZM2oX+WQuFrVZeiSS3frn7nu6X6qWEDH3V1JzRPB659PftTvs
         vfIGUZDg/qEn7+/8PmbX19tJjhsLRfxJDqIx77RtfOJCe23UYoNeHM2C6DAkbEdXderW
         v9TyDThJVNpRyfzhX1NdXYzz/w1kB8/322DwCEE99qOk7gzmT6jFGCGDsd5Wcbl50GQo
         45Po86GWt8u9H3JFrVWFQA4b3lo/SS0fhRvLaWgdQQ2/q614gBeMqHekvH4m6R4F1voy
         6z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FWVDuWp8BwqwRmMZ9J51BUVWuUxtUS1YpggdRQgiP8U=;
        b=XZQVitt5O1yynndSP0aE4R3JB3A+fDnvkDgQO57ZY3rNyERGnIbe3IeGYVQbl3W+aL
         On3hJ/9yT0EaNNys6D7PGCrZb+X9ixSiDyfu3jxGgS+c1H0BWagNJVAy9zjFHtEQJuw9
         HelIX8zGjqUmjzYxgneFFrrDIagk/0mDooEUqbr2YtMVIpACqMfNjyOu0T835EbhTaRa
         if3EqsR+mlzFiA++OdmHbXyeYNdh03Lac+mHKjWPk55XC5o++6Y2LYGPpQPf5W+Xz+3d
         Qw7LpIJVWJrgN2CuUJXQJeheseSULd0fST7USlgezhgZaenVaKELfNZkFgi+XX9xCVLG
         HRKw==
X-Gm-Message-State: ACrzQf2nwK0TEM3VnqW/XBVSmP6NX9750ZT4WpQ9/wIAqVJPjYaS4XJv
        LNO9WCS/nzva+RJTRUxcq3iVtQ==
X-Google-Smtp-Source: AMsMyM5tDH/Zt9KDFGkwfzYzPWjk1peObu3xt6B3PFcaSTgPDgVuvp9Od5M607O6YEV9FkUdvVaE0w==
X-Received: by 2002:a2e:b4ad:0:b0:26c:24f:b260 with SMTP id q13-20020a2eb4ad000000b0026c024fb260mr6723048ljm.173.1664178270361;
        Mon, 26 Sep 2022 00:44:30 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:29 -0700 (PDT)
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
Subject: [PATCH v2 03/33] ARM: dts: qcom: sdx55: add gpio-ranges to TLMM pinctrl
Date:   Mon, 26 Sep 2022 09:43:45 +0200
Message-Id: <20220926074415.53100-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

