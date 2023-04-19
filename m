Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5743C6E8374
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 23:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbjDSVUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 17:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232286AbjDSVTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 17:19:32 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E1D7EFD
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:20 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a5so1664483ejb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681939158; x=1684531158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIrQBESI8zc3pwmod0PQqL6XC3zaxmZm9UUKN9rVNqw=;
        b=fYz1hsT2Xyx13gZvfURWBmVYJcPhxq+/JSnaK6lcgOIsDHXd2R74v1vCsGDLBERG87
         0m7eapJtzfLrTkaO8aaR1UPm5gIehIDpeprrWfhAPZjAxErkiGT1F+FwrVJBF+Cx4W5d
         O35xL0001d52tu/YAOpaZBI5mBpOaRkrZg5/ku/a8hES/j7r+zT7IzUf2sXX/HH0sNbv
         IFHJglBsDS6eT6Llrj4Usdr+PNX+j0kIWilY0KGfEouQgAS1xogigFN7tVLN1P47xv5I
         juYSj91bG56eMelfwgVCWkbgeDhXTrDdmWiPQMapVLsrh+4bfzmeWN3FO9p0cXEs6PFt
         otTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939158; x=1684531158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIrQBESI8zc3pwmod0PQqL6XC3zaxmZm9UUKN9rVNqw=;
        b=A7UhcK3VW7eK80AzTP+pKC/dogCza6VAfJj0LIu4ASBU28jBd3XYVK0KWpkN6H0srG
         ghNeraLZDbKoMwtNAfKFFriJKLImmWt0l3RIGQLysa7BObbQ6sXkmW4WUiHcQ4ofOfS9
         pLENQkPsJBCl+IiUYS720d9FTyAznf7XF2qIXHxR9TrhY8xM7OG9RzZNAamxwjlpaYjm
         fgtkC8zMzmfUXb0V6qqeqXRnDmONRlEbHpykY7I0XXc7kC9Q6zGxilgdA8pttn82MJ8k
         KkxhNkD7H77sEmHnjxa92N++xbcm4SCpx2qW3yOp7VgWyjyT2hmOk9OMa8nqGn+Lfwn6
         oBUg==
X-Gm-Message-State: AAQBX9cLcE7Jxl9hi0gsain6QI6eRf6Y6IcCjX3xSuuY+VlXqzObqQJz
        ELVPqtRxGZ/9HlHHieRKNsMUgQ==
X-Google-Smtp-Source: AKy350azyyitsFCUdP+/WzBij9q3mwN73CPEa+FA+WjqOqps2Jy0kKSsSSOpHIG7HR8hIhtIbDwR3Q==
X-Received: by 2002:a17:907:780e:b0:94a:8ead:c7f with SMTP id la14-20020a170907780e00b0094a8ead0c7fmr17914500ejc.23.1681939158413;
        Wed, 19 Apr 2023 14:19:18 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090682cc00b0094f109a5b3asm7092739ejy.135.2023.04.19.14.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:19:17 -0700 (PDT)
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
Subject: [PATCH 12/18] arm64: dts: qcom: sm6115: correct thermal-sensor unit address
Date:   Wed, 19 Apr 2023 23:18:50 +0200
Message-Id: <20230419211856.79332-12-krzysztof.kozlowski@linaro.org>
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

  Warning (simple_bus_reg): /soc@0/thermal-sensor@4410000: simple-bus unit address format error, expected "4411000"

Fixes: 7b74cba6b13f ("arm64: dts: qcom: sm6115: Add TSENS node")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 43f31c1b9d5a..ea71249bbdf3 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -700,7 +700,7 @@ spmi_bus: spmi@1c40000 {
 			#interrupt-cells = <4>;
 		};
 
-		tsens0: thermal-sensor@4410000 {
+		tsens0: thermal-sensor@4411000 {
 			compatible = "qcom,sm6115-tsens", "qcom,tsens-v2";
 			reg = <0x0 0x04411000 0x0 0x1ff>, /* TM */
 			      <0x0 0x04410000 0x0 0x8>; /* SROT */
-- 
2.34.1

