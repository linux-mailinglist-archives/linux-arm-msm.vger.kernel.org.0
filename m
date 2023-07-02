Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0FD3744DCC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjGBNn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjGBNn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:27 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C499E6B
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:26 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b69ea3b29fso55977811fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305404; x=1690897404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=ljiETbURdG4sMCxFQn9lg3uh9cmxFBVOTMn9Ivm6pRr/vtL/7KOptRovREONbOpkFi
         88ijnMzyWZ4SYeAFvQyzqjsdPtOy+Fx7s+EF1KxQMglZ5f1cnnxrOJBFLwwZwM7rZPzO
         ifPDhJr/X7h6gz2KI8qvpgwaofnthK4y6+DNKLetLX4dzkDcDT7kccoiufViutWyrP9b
         cl9i4A7vzAgjkhJQpLhy3dBj4HCXhYxeeGj5/NL5x7bhywdCDYnZdvU1wGy3wMxTWz75
         xVgRH+3+LrpF1PhxS2NTedPjDbWIgaCYHKuSPEKCFYh31xz/NLECFAU6Uoo+XYO9Ybss
         v+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305404; x=1690897404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=gNxFkStdMbokyiRnDCNrdmoc03fOu48rU9HRhYG8tqEBYuu8diDpQtFOvYTU8qWljK
         sG8x3W7sj44B8TV1oRq8rLJsrb1lwWwUxQEWUOeF2FMB8YQEZa9Ni5+IbaB25DuBPNk1
         k+paXYQkdrqUbXH3R2ZHu98hsWPxsGztJWaeKBoB/BnknLj0M1YK+Zmd5Z8DC8zVuz3d
         ipFVqONvWU8HL8NrWTV55QdxTcsSgOc3tdD8hRv8SwmUjQrLZNgBmPqGT5MZ1WNHlto0
         mKwB1R9aBoaYDjdBj5aKq/juNmpZcDBeHxr+Sz/KX04Tl7gHm/mSnWuw6F4wy3kf5zMr
         YrBA==
X-Gm-Message-State: ABy/qLYmjvT0q1qom9RfB1lUn6sJvLzjh8VFxJ3bDuGLRVywiyueHUsE
        0kAg4ZFtF7vpk9mH9tNaO2Nk1Q==
X-Google-Smtp-Source: APBJJlHAmJeMjdGms8FlJxqAcm2dvIa2heyuVtPlB5zstLwg820xZbETa7IZg65i9rOPH1QVb/J4zA==
X-Received: by 2002:a2e:8095:0:b0:2b6:a344:29cf with SMTP id i21-20020a2e8095000000b002b6a34429cfmr4778918ljg.17.1688305404791;
        Sun, 02 Jul 2023 06:43:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 04/27] ARM: dts: qcom: apq8064-nexus7: move sdcc1 node to proper place
Date:   Sun,  2 Jul 2023 16:42:57 +0300
Message-Id: <20230702134320.98831-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
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

Move sdcc1 device node to follow the alphanumberic sorting order.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index c57c27cd8a20..0e80a5a8e3c6 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -181,13 +181,6 @@ &mdp {
 	status = "okay";
 };
 
-/* eMMC */
-&sdcc1 {
-	vmmc-supply = <&pm8921_l5>;
-	vqmmc-supply = <&pm8921_s4>;
-	status = "okay";
-};
-
 &mdp_dsi1_out {
 	remote-endpoint = <&dsi0_in>;
 };
@@ -336,6 +329,13 @@ lvs7 {
 	};
 };
 
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
+
 &usb_hs1_phy {
 	v3p3-supply = <&pm8921_l3>;
 	v1p8-supply = <&pm8921_l4>;
-- 
2.39.2

