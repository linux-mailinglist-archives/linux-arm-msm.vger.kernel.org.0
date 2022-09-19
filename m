Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20D095BD501
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 21:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiISTAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 15:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiISTAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 15:00:47 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD32F19016
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:00:43 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a14so272307ljj.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aUGyMNqc8cKKpYv2HV/JKrYM4rzVQf3OhMi97HcGq5g=;
        b=Xk4ChYnpe68bphjOCVXaxrqGf5Ioo6L35RJSjTU3VPwXaprCJ3XwtyEY7xCf58j+jX
         3jQID9q/BC5WKcw1NGHj+nk/ZbAI05gJlfGfCCC5Fl5TeKXywA6bKBQW/kpJot4Go1KV
         WCIw6riRHKfokfqX6HN9gr/2wDWtxNz16W3ihEOKtULB8beH89Qg402uUsDi4ekaxh67
         qGCIFssr98hPpTX3dDoT3uZUE073vWgr2Efy+VrbX5+fYpGMVVJnAnK3qI7jArQgb26l
         iLo/HptDQsWq5W2NqPQRIdGx5hOsMrWfZusJmr90eDSSy2WCEdCQBNygd0Hr/8XYmCxO
         1bbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aUGyMNqc8cKKpYv2HV/JKrYM4rzVQf3OhMi97HcGq5g=;
        b=uQYq/TtZ26b7KAF2Z0xj36BvFF/xur6b5+kBde9DxMdL6/UVY/uFc5l1MwCu08ZonP
         7mG+myHFGLXZCvOF22ZZ5h+q6+272te4X7hDWbQ9xe1K6HVYWYzB699JK+8LZZKXtCeh
         +Rg9WxFohPoC3X8+DgFzoWZzOUYvSKocwVGC1//yqI/3l0PJgNFH59SAqzs8BZTyMbA3
         XAFD0HonJRBXbHGTwMeWpi2hfoyBb1eHcLO4dUdY4tOzNw6+PhIlDoE+bc0i+TLH3B+V
         i78Cia8ynXwgWG3+dLgN0uM1k8SCpCjDtor2cxFrT9ViVdu+qNC8qVuYS35ZSWdbPUaW
         r+Fw==
X-Gm-Message-State: ACrzQf01nYJ0ifgPE8lw9hAGOSWX9fj2R6k80OrPAK7gx/0WbWfvL+PI
        VS3ZO5VA4Hq/oL8y5x1Cvcom2g==
X-Google-Smtp-Source: AMsMyM4QULPLmH2r/hKK85ZmsGPYFnHn1Vh5G2jje5dH/nbq87pRKXt+wZuU/3mWf7uwTvuSY6BvjA==
X-Received: by 2002:a2e:a801:0:b0:261:91a3:bc44 with SMTP id l1-20020a2ea801000000b0026191a3bc44mr5574379ljq.497.1663614042224;
        Mon, 19 Sep 2022 12:00:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u12-20020a05651220cc00b0049a747d6156sm4878907lfr.287.2022.09.19.12.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 12:00:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 3/6] arm64: qcom: dts: ifc6560: correct firmware paths
Date:   Mon, 19 Sep 2022 22:00:34 +0300
Message-Id: <20220919190037.2122284-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220919190037.2122284-1-dmitry.baryshkov@linaro.org>
References: <20220919190037.2122284-1-dmitry.baryshkov@linaro.org>
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

Correct firmware paths for the Inforce IFC6560 to include the SoC name.
Do not include the platform name, since the board uses test-signed
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 28050bc5f081..cb009522b194 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -99,7 +99,7 @@ v5p0_boost: v5p0-boost-regulator {
 };
 
 &adsp_pil {
-	firmware-name = "qcom/ifc6560/adsp.mbn";
+	firmware-name = "qcom/sda660/adsp.mbn";
 };
 
 &blsp_i2c6 {
-- 
2.35.1

