Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF967744DCF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjGBNn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjGBNn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C59E69
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:27 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b6e7d7952eso2535971fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305405; x=1690897405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS4tS46Wt2bF/A6aYMT37LuXJaPlC2jK1TxmIfbaIXc=;
        b=X30ZYndFhc8pFjbfI5fFep2k4+vIdwN0xfExy+bcOxdxInGFwOcrq2Zc6f1fh5DIeO
         1Gu1TIue3N1mkERyEIPq0Wv81dLrOEdQ6rdUCgRTZBiNpzcOAn0TuaoMhec9/ucDn4Tc
         nv96MU+bhdGN5yr3T38H38pkEjEZs7E3C15aP2To1IhyWXkuATLygz7fubeKcxFaFE4m
         WdbJrzjux9xxfQlxcqTrNub3WFVpEEcjIr4GHfEIrw9TCi45KW6CGjrSht0njYd7RnHk
         U59Si7hUOe0bLBm+b46ayeJ7oVHS7kNjHtyF5oJXhiUNncvfmCmHcL8FJd3KLEseX3fg
         Dfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305405; x=1690897405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS4tS46Wt2bF/A6aYMT37LuXJaPlC2jK1TxmIfbaIXc=;
        b=kN5oovRpwmzIWt0pHqi5Krz4zj+x3N48zOgAW+b91LvoyeUu5fTwQkC2xELrYPt++o
         OQYYq44J3boQFBDOnV6WsLWGRQ6z64Zz4+K2X9fgykthw3xid8I/pqU8BPZ+7KemgRH5
         NK83F6/+dgw/oasFI6bYLF5GZWnKXe/BIO6lJ/KjWw5HuzFvtbp6L8PF8KOR+aoo/8GA
         Vj/NXDiCJiT6Re5ArnlGCQIvCuCXr2M8RHmFURyztmDMKKSTBhB2/vEPX/p1fFlBZeQB
         Bjo9GBX1Q8zF9wHj4m2y2DYs0/CHDnDfWKRWDy+TKTtil62k7oLZCswS+oR1oZW4yrGz
         KObw==
X-Gm-Message-State: ABy/qLZiXPnyxE0JW+tAFKZUm4J/z3y+Lz6adtJaTxp7hFbtMI2TsBtE
        IcbCqXR4XOmAYO6OUARyo/McHg==
X-Google-Smtp-Source: APBJJlHocc5hEVIqBsA0reFFT+YMlohkXM+fyWObkzVPmZLjG1MLa/tzIB9LSp6ssDp8gYYDtBWMqQ==
X-Received: by 2002:a2e:7a0e:0:b0:2b6:ad79:a4fb with SMTP id v14-20020a2e7a0e000000b002b6ad79a4fbmr4170016ljc.1.1688305405477;
        Sun, 02 Jul 2023 06:43:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 05/27] ARM: dts: qcom: mdm9615-wp8548-mangoh-green: group include clauses
Date:   Sun,  2 Jul 2023 16:42:58 +0300
Message-Id: <20230702134320.98831-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
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

Group file inclusion to follow contemporary practice.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
index b269fdca1460..e3b4b93c3d38 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
@@ -6,11 +6,11 @@
  * Author : Neil Armstrong <narmstrong@baylibre.com>
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 #include "qcom-mdm9615-wp8548.dtsi"
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "MangOH Green with WP8548 Module";
-- 
2.39.2

