Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71CFB6E837A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 23:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232573AbjDSVUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 17:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232649AbjDSVTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 17:19:54 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DD872A0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:26 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id xd13so1710083ejb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681939165; x=1684531165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5lqdT+tLsAr+XE4OnUIxn/ulTD3/L58wPb8AxCBTws=;
        b=sXxL9wp1L0KgiqQcaJ91MTlHmO817qJTXS1VLtbZQqnebCX9CgSr/nIxosJONZ4TmY
         lWgCtt2v4FSymGLOsRMyyH4htAjmLlOpzf+IHAba5mi8uQn+azdignEfEhIz7cCo2e/e
         aLUwUwqFMpbVug6TZS8Rbs69J0i/kMVTZf+c0sVh3ASDbsLyTc6+3YSZ8lOubu2l8XgY
         rQQsgPC7X07o3OO+3mUSnZSnJnRK02USFnodLtQQWFtvM5I1CzGm4Fi8OQMl/Mg4ST04
         bxDK6GVsiiBggXovp53Qh7ERywhsRJS9Zf68fPmMoolCT62Y9BebisHTl5BwzHdJbf+i
         jePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939165; x=1684531165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5lqdT+tLsAr+XE4OnUIxn/ulTD3/L58wPb8AxCBTws=;
        b=Y5dpRwON0nqoHs4YJwycUxHmjT7yCSYp8YJHh+VDVNnREzhuJTqYfcutOQ3sTccXRt
         VNagPEKzKI+FbMPoEru662UJyTzAuO3orejaOT5lg4xzFNJ2XX1IunEFUlzU36ouF2G3
         bkPlCL7bgkKWVXCezMqgr6vUET5/5i43cRPjv1qAJ7Diuw9JeARDtnUt1Oh9/15sUhMq
         FPjkRV79ivmFByLNiM6u2NfxIhng8R+Ex2kHnKX2+wHKqSE/zjqFkhUpCeMvuJHcgj5f
         hBgIpSkQSs9Cf5WHrqNSiSVz8FgRR1toWJrZJYTLQXnmbQ2bDQ+qHQRmosw5a9Pcj0FH
         nfEw==
X-Gm-Message-State: AAQBX9dCg8ddyKZebgJ6y+bCsSSZC8awQPrDjjEChR7LSCMKVrH1XN8X
        +U0aNM67jXF9pDZ7M98YxV5l6w==
X-Google-Smtp-Source: AKy350ZOf4pTeH1i/ZXrfyG/XvEUHhtav0md9ZsxF2GujDO8x0UriBQqO0YR4sz1WiTMWV9mHYvU7A==
X-Received: by 2002:a17:907:7787:b0:94e:8cdb:bcee with SMTP id ky7-20020a170907778700b0094e8cdbbceemr15086898ejc.70.1681939165015;
        Wed, 19 Apr 2023 14:19:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090682cc00b0094f109a5b3asm7092739ejy.135.2023.04.19.14.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:19:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 16/18] arm64: dts: qcom: sm8550: correct crypto unit address
Date:   Wed, 19 Apr 2023 23:18:54 +0200
Message-Id: <20230419211856.79332-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
References: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Match unit-address to reg entry to fix dtbs W=1 warnings:

  Warning (simple_bus_reg): /soc@0/crypto@1de0000: simple-bus unit address format error, expected "1dfa000"

Fixes: 433477c3bf0b ("arm64: dts: qcom: sm8550: add QCrypto nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 43192ef21aec..90d2b7057b75 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1858,7 +1858,7 @@ cryptobam: dma-controller@1dc4000 {
 				 <&apps_smmu 0x481 0x0>;
 		};
 
-		crypto: crypto@1de0000 {
+		crypto: crypto@1dfa000 {
 			compatible = "qcom,sm8550-qce", "qcom,sm8150-qce", "qcom,qce";
 			reg = <0x0 0x01dfa000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
-- 
2.34.1

