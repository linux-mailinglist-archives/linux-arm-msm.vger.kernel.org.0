Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6919C5EC7E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 17:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbiI0Pez (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 11:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbiI0Peu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 11:34:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC9EDC7
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:34:46 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id u18so16257097lfo.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=b/USyE2rZeGybRiRERaxxJ71NRPvCslQr07H+7bxxRI=;
        b=SKMmAhd5QO+DEf0nXZqbEsmwdSZBbbO0pCaQxyoLqFIJxCJsmKRaqyG0yMeLa/pxMU
         sGQweR5QeC30m9EYFNusGrOstVPqE8/BCPVKaDdx08JXwBokArI9Id/GARSaEbsBdi3t
         XfcXwEtTcotP0p3GBaYh58IAkjXnreAkOzsPQ2A0s9edO223uyFYpf8m86Za3LBe1jIb
         AV1HopEUyE7EBDoaw9FvMZoF3Y6N8ZINCWrWQf9z65ygoefDmtYwTqq3zk+pGhfb+Mji
         drk0RbFEylaRDv4tkv3OvYTqD/OASKBsiCgp3QXxUgLYczHiJEE4saxk2tL5s5bn+hfv
         D3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b/USyE2rZeGybRiRERaxxJ71NRPvCslQr07H+7bxxRI=;
        b=ArGpiIshordCA3PwB/lnTZMRwAN1xNlCcTtymgdqWjkZ1waEG6gGaps11J9nuuu8Dr
         ZpMymqdMpQx2/8verBkOeUhPVNW9f/1/ObgaR5lzZWDfy4DMVtJPf8Vx9nx4vWuJD/0I
         /ckswWxdwmVs6GIO+yU0wksFBY0XpietOCUOmX/EoG6+XVY3sAu1CMtv51c7YBAX4xJd
         I52T93VSAkEUwSZ4soRw+LJyrwRmZ+tTjaMvJVIu672fu854gBStOcFB5Sv0qP0g7Otd
         shERE1tqt+hUTUC8aj01Dg7oGWVOoTRxNTN6RZGFOzC1mkSOOHsOthYxxtdjs/UH7e/2
         akJw==
X-Gm-Message-State: ACrzQf2EMxDQWXLYEHGERN49qx+dvWb1G7Vug9DKlqA77W3JVHS0j3Dh
        ZTQlj21UlmdnzeXFDqT9tFFA8g==
X-Google-Smtp-Source: AMsMyM50Ti+YIC2PY11zpHf2V00xSNu3yDjC4Tj+oW9g01gD3IFjl2/4plEW/e8n2IEpx4qN9Subfw==
X-Received: by 2002:a05:6512:ac9:b0:49c:ebc7:bdae with SMTP id n9-20020a0565120ac900b0049cebc7bdaemr10933603lfu.99.1664292885086;
        Tue, 27 Sep 2022 08:34:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:34:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/12] arm64: dts: qcom: sm8250: correct LPASS pin pull down
Date:   Tue, 27 Sep 2022 17:34:20 +0200
Message-Id: <20220927153429.55365-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
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

The pull-down property is actually bias-pull-down.

Fixes: 3160c1b894d9 ("arm64: dts: qcom: sm8250: add lpass lpi pin controller node")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a5b62cadb129..8f402b912c62 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2454,7 +2454,7 @@ data {
 					pins = "gpio7";
 					function = "dmic1_data";
 					drive-strength = <2>;
-					pull-down;
+					bias-pull-down;
 					input-enable;
 				};
 			};
-- 
2.34.1

