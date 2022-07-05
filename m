Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65C5566F92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 15:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbiGENlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 09:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbiGENlV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 09:41:21 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E4A2B63D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 06:03:10 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id q8so1972970ljj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PVF1kQELJGnzeWwHQpr93Ja3CpfIbtJSBiq/WRe2Aqw=;
        b=IsE2R2K7pFxOzFhzYXiZ2d6hcHBUMDwm5H0XblmvYebWGQc+P4TXFmO+hEhLQ10N8Z
         aFgq4iThu7N5I9X6F8r73UQw1JZYWElnvR1livfY9kyaWb56ewjnIBN4Ed2NzdcJYcaK
         sPs/55QkAj4yBm5qZgLnywgsHH/7j6usARuGMYG2eozQNZ7DSStNac5M/MUeXNWTwrv8
         /o9u2MN7UjqOTK5hokkOTCDOcsvyQyXG96LJlTcn+bZ2fZpCxTSe1a6jDK7duQl+/9o7
         oTrvyj73UrGArE5v4J6fHf8r1bb5ZR9sRfByLOFSEv9jCd07S8HunzA6FrFmiSw2o5rk
         AxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PVF1kQELJGnzeWwHQpr93Ja3CpfIbtJSBiq/WRe2Aqw=;
        b=GOGDRr8hqNHwelHENXPswSPqVF1C5HETkVTGr5bjv17uaSIjctxxcbEhrgtPwAdj6k
         oTFbf4oBkGjupU4NNDU6X3lNqsvugwdCCNyLN+Pa0BfOCj4cXRGWPNuG7rIsG7LQhggr
         HZxscXwg0SZhF+HvXfc3u02a/uvO1oY0yitoXwAcLsTWUNcqIQ/F++JcCt/DA1Mosk70
         by7Gz3AO4FVJvVsB1MSWS+2bf+5tNd9kd5OBPxY354ECSeX5DDzi6aze1GbHgLkTBeov
         t80s88wS3Df5R5HI2UDqmT7gvlasIAxdRMnBI3GPWPDPEHVU14wl3NvjpE0RUtUA8fLv
         WdoA==
X-Gm-Message-State: AJIora+SFUBYRIyGsOzXWbe36nfaxDw3TYBXC4FyvjKk+KSObrG58awm
        1FxAJyW/SIW0LmPcARwRdtVHXg==
X-Google-Smtp-Source: AGRyM1v3ZHOg/Sr69DG/sQb32TgYKDnDwYDYrKmzsBfUajC+Gvs79KoMCL0ND712yBNWq1x+YN++kw==
X-Received: by 2002:a2e:b048:0:b0:25a:6dc9:dcd0 with SMTP id d8-20020a2eb048000000b0025a6dc9dcd0mr19951258ljl.402.1657026188757;
        Tue, 05 Jul 2022 06:03:08 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b0047f68d77008sm5688086lfc.178.2022.07.05.06.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 06:03:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 3/3] arm64: dts: qcom: msm8992-xiaomi-libra: split qcom,msm-id into tuples
Date:   Tue,  5 Jul 2022 15:03:00 +0200
Message-Id: <20220705130300.100882-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705130300.100882-1-krzysztof.kozlowski@linaro.org>
References: <20220705130300.100882-1-krzysztof.kozlowski@linaro.org>
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

The qcom,msm-id is an uint32 matrix, so a list of tuples.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 7748b745a5df..15467b697e94 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -17,7 +17,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <251 0 252 0>;
+	qcom,msm-id = <251 0>, <252 0>;
 	qcom,pmic-id = <65545 65546 0 0>;
 	qcom,board-id = <12 0>;
 
-- 
2.34.1

