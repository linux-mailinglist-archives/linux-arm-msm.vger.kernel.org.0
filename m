Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14EE9557846
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 12:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbiFWKyN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 06:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbiFWKyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 06:54:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BE64B855
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 03:54:10 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eq6so20599304edb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 03:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PVF1kQELJGnzeWwHQpr93Ja3CpfIbtJSBiq/WRe2Aqw=;
        b=Hrcc+nTbmnhpQv11LayIwg5lNZPM/3POSXfsA8Z75hhHzGPzhNPvakPc5ED+ad/dzR
         +9/2LS/sD0chbY5ff7XT4X9OqxJLCovSiq1wdVuQDwNb/S3/iteuaQyuYN5qn8r+JIoE
         UkUGFr2XiC6dfVKcija7RQ+nmaDEDr/qrjy8eGqHFjJAEzv8K5lGjs995p/Z0P6H/jd1
         OgRLlamZR2p9ka1djUaE+H8E5koTjIaH2KAnQRFuV3ZTTR5EXBI9QAGGjrAGyjkJ1/Vo
         SDnxiTHKzNGdQxxHiZXuX2p44nAzIaMw3rBx8rgSAZ8yP4YYBeg45pN2Ev333D2ixUnS
         Zq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PVF1kQELJGnzeWwHQpr93Ja3CpfIbtJSBiq/WRe2Aqw=;
        b=jKpWAC2eEv/GxPUHr1UfolK7d4VyCsOphLRFJnR9Dzf17ZeSFG2lheKbQfNRvSB41C
         jcs2AjKU4mnviGhyotJjU3TMTTBM0XPhGdMDK+FyJBHgRoJE1BgvqyeeWT/09o2JiT8U
         mHIkTzMkl5FalnnwaWPI0cvRQ6sn8stlKYVGxrourAHGawV+BWb9S0IrhCDaGi6V/WzZ
         f9wsrAOrQj5xKEO3T0f3lWDLCN2kx+yZ+vRh8jKYfdQIX30MR/cr0ICRFukF6BFHXfEI
         disdKRPbusSEkraxTOuH94WDGQXV0qjQlWDvhCxr/mpyAy2tiye6crCMP4DRhJGTBRsJ
         3VKQ==
X-Gm-Message-State: AJIora9XCklTAocUjtTJFih4NjHrh2gSNZ2+smKW92507V13m3NJn46l
        /cWegYbWw1P4BePWE4rlS8hKaA==
X-Google-Smtp-Source: AGRyM1uItwKsGyJeORI3FlRtBRML/0ErH0REHdy523CIYi2C6VFk0vNawW7BMEwC4wiFYRqnQPfmgg==
X-Received: by 2002:a05:6402:528f:b0:42a:c778:469e with SMTP id en15-20020a056402528f00b0042ac778469emr9816056edb.404.1655981649027;
        Thu, 23 Jun 2022 03:54:09 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k27-20020a17090632db00b00721d8e5bf0bsm7854096ejk.6.2022.06.23.03.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 03:54:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 3/3] arm64: dts: qcom: msm8992-xiaomi-libra: split qcom,msm-id into tuples
Date:   Thu, 23 Jun 2022 12:54:01 +0200
Message-Id: <20220623105401.168122-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220623105401.168122-1-krzysztof.kozlowski@linaro.org>
References: <20220623105401.168122-1-krzysztof.kozlowski@linaro.org>
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

