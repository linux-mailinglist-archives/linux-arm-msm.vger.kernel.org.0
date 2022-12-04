Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D98641C30
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 10:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiLDJo5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 04:44:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiLDJou (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 04:44:50 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E76D18B11
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Dec 2022 01:44:48 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id x11so10280911ljh.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Dec 2022 01:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pmjHkxg9cw9s588xsCCx9TGpqKV308uQqtKF8DUe3E=;
        b=EF8Gjmi0BqHFGm0Awu+rO6RhpSxKFK0ai+y5jJwRG5n/9EuAvK/RLd8qIvAWeC+ZQV
         vzLdT1O/KTG3e8VTyPnNzYCFyEEkpqJVxjEHnqP9yAcTFaynxyGV93wSTJUDPmEWkwQU
         h6nQaVii0n0gCN9+Ur/GNGj+4U6EG/Wg2UyLgsmiDh3cKDmsTF0RapT2eUZkOrHMyHn6
         QFlinoGJRtsZ3ZHNkC5sGtsgWDO8P8x4i/6JHCCKqt42988f4aoor558OVGvgEmbdZ48
         ouw5QCH0FdswTQWOc2BMrfw4Ax1H2rszc8XEv7ZRBcs34Bmo5NmZWdxz+o1beNnt8jcW
         auVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pmjHkxg9cw9s588xsCCx9TGpqKV308uQqtKF8DUe3E=;
        b=wFB9FknU/js2j4gICvhuuYIuPbW888iZiHE6vjakfw0BKZj8Jp8gdEYf7CMBEyD9sc
         3fycL1F5ZF+APV59O9SQ3pcITqBb0zX7XljtqQwHyIbcCPp4Bq9uF6kH50URD/Gy2cDF
         RmiMuB2/sds7W0RcVwIb/77o1Hw4xVipeo/C7mwMZ7dlbnKb7o5oiqDIFZj4sxM6GRX3
         ey9XIT/3Y4KGzQ0Xbccv2P8ILFvqJGIzInPPprxY6QFHPx8dCGMfAt3FTDd4uPow4Ct2
         gu3m3qMvXbTmDTusYbgD8zV0lgsX1Q+SAuS84mlfQ8hylkyalUHFoKnP0XC55X+/XpLG
         u0Dw==
X-Gm-Message-State: ANoB5pnukRdpulu+M1fE0fCnaczcUO1L2xpq79x6htuxyIVDQpKp12q0
        Oi9UFQBwPHZk1zYbTjpd4yxHZw==
X-Google-Smtp-Source: AA0mqf7VsLtops04VrB6HEtPXcE8xanx5DZlMCheyt7EXimJuUREfFrDXL0G8Fi/6qF5Dgvuf1o92Q==
X-Received: by 2002:a2e:380a:0:b0:279:aef2:292f with SMTP id f10-20020a2e380a000000b00279aef2292fmr7859683lja.479.1670147086676;
        Sun, 04 Dec 2022 01:44:46 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o10-20020a056512052a00b004b07cdef19csm1711593lfc.138.2022.12.04.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 01:44:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/6] arm64: dts: qcom: sm8250-sony-xperia-edo: fix no-mmc property for SDHCI
Date:   Sun,  4 Dec 2022 10:44:38 +0100
Message-Id: <20221204094438.73288-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org>
References: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org>
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

There is no "no-emmc" property, so intention for SD/SDIO only nodes was
to use "no-mmc":

  qcom/sm8250-sony-xperia-edo-pdx206.dtb: mmc@8804000: Unevaluated properties are not allowed ('no-emmc' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 2a223ed50102..a9dc318e45f2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -587,7 +587,7 @@ &sdhc_2 {
 	vqmmc-supply = <&vreg_l6c_2p9>;
 	bus-width = <4>;
 	no-sdio;
-	no-emmc;
+	no-mmc;
 };
 
 &slpi {
-- 
2.34.1

