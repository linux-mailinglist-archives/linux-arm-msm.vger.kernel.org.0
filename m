Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD5E4FEB57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 01:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbiDLXiU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 19:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbiDLXdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 19:33:05 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4BDC6ED4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 15:21:50 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-e2afb80550so241156fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n2t5ELawI3mUGg5tVhQenYNK1LUgXG/kP/zI61cw9fw=;
        b=dlFBx561eGgl6eUR5ImhHgVTKuYkXl/ojvlX22n3XxtoPeqLJaRB/1gDSynytpJ/y4
         pKsjINyyo5j6bEF3tXEzfdEiqp2M7UykVGgQ3bxgjpGbM4x1Q0oYKdRbXBi4VPwUU/KQ
         z50kgTSPe+N/xzlXcXuqbB4v0Pkjrgfx+ceJ7iVmwnEMvvzEuM3UJKc6Sn53CK6h6hE+
         qExCYE5PKCfhumGnT6RDoOeEGMyJV4Eby8DQNFRy+XXU72QMTRToOipl0namuD8ZHMB7
         MyynSZUVEKN34YHGMqDZ7HtdFvxAmDjG6YuOXQ2lvJWujZQ5PNJceGPZHCPMewzeUW1s
         U3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n2t5ELawI3mUGg5tVhQenYNK1LUgXG/kP/zI61cw9fw=;
        b=lROsZLJ0uZ1Lnoj9wAf5bQezHCJf5v80gJ30fhCaRGJ/v8IiuStGWbSg8eM/haeHky
         AaVjX5SQ2QbN64qDs2lRWEZSlGrsJZ72KoIfo9+KacLGLVmJpC0oP7vfdl59XIExPqCZ
         /Gccs9p901ZwXA8GSqGAOzgmDaufzfEhee/aUt1MLuYspX6OV6Gc0Llx2T7iI7DdTE8W
         N8a/bEn2Eg5ZVuzQ829WOJocomqWKJugUUVWQlMSF6qVaDtn1AvKMDJd05fszXK4ZJBy
         ZA8wxYbww6a003zIlOjF9YdTaY+M6kS+/+O/0DDdQ1R8vj+6IKIjLqVe82/zUyx0ZXn4
         BXTg==
X-Gm-Message-State: AOAM532EkOwpiF3c7aS4N590suVWfi1wFhn/peWcxpOqsH13VlD1A0gB
        BqGlCUtw9ozRLn76o80nCBI/3HR+o5DoA7ZR
X-Google-Smtp-Source: ABdhPJyTnRuP1yacOaJWVIrnwQcAXI1nG3rUeVaXhd+WJFZfwEo1k8Wg6LjUniaWx2FofkEzD7TgEQ==
X-Received: by 2002:a05:6808:11ca:b0:2d9:a01a:488b with SMTP id p10-20020a05680811ca00b002d9a01a488bmr2892353oiv.214.1649800165960;
        Tue, 12 Apr 2022 14:49:25 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k10-20020a4abd8a000000b00324907b406fsm12809059oop.21.2022.04.12.14.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:49:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8350-hdk: Enable &gpi_dma1
Date:   Tue, 12 Apr 2022 14:51:37 -0700
Message-Id: <20220412215137.2385831-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412215137.2385831-1-bjorn.andersson@linaro.org>
References: <20220412215137.2385831-1-bjorn.andersson@linaro.org>
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

Some versions of the firmware for the SM8350 Hardware Development Kit
(HDK) has FIFO mode disabled for i2c13 and must thus use GPI DMA. Enable
&gpi_dma1 to allow this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 8c33fce0b414..246006ab4a2b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -213,6 +213,10 @@ &cdsp {
 	firmware-name = "qcom/sm8350/cdsp.mbn";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 };
-- 
2.35.1

