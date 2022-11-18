Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406CB62FA80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 17:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242174AbiKRQmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 11:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242145AbiKRQmL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 11:42:11 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED2869DE5
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 08:42:09 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id x21so7415707ljg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 08:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x7yxRPpkQlxtFzHM7bHG1/Tzv/+e3IcCGQCZXSEVD+0=;
        b=wJVKA/nwQz03xEDCkQCELWQ9MDDPlVrqUPd4GxJpaTktRUscHD6sxk90EMix+jk3jA
         W3iWQzEjeCM3HRpDJVF7TXH8EbofaMSZckwrLp827U964n2Hx67j55knk4+oalEk2TSP
         JaAVKIH2MM586IXMtvobq7wF68edYxQyHl/gcWw+VY8g5XIJuWKxcy4uCBUczNjq6Nw4
         KSCgJ2Q0GboN5NDnRtqW3rHhlAI9qL2Ooup75sT/EoxwVBeYQAQgHmdPYB1bLe4MJvdi
         Um83etlYeuoqqeI2PKK7QbxnH3GR3hc0m/r/0FNy+f0ZaWin6SatEf+IDTwrdj26bkJG
         cJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7yxRPpkQlxtFzHM7bHG1/Tzv/+e3IcCGQCZXSEVD+0=;
        b=mOdntuI8n//VjmOoYlc36+Xc1er6XaLwPuaqSSGHxlGnFIRm8bEwyR7NxfPttLVStQ
         jbPpwBSZbUwzoZ5SRpRiXWViZKN9BJyv2M8NoJZrogadybKCfKd9Fsu7hG3LZiCMbQnW
         h0lu/JU0Axg+bVXGjH1452N13dorZFz1i5VEjn4x0X7gBjZJdHAJ86+wdh1xM7M2kWy5
         8qedcWLB43L2T3mwEPEreIw2OUOaK1QzlocYKGNRTLuMd0s/mwvtIx7Wyhh3Pwh5M3Em
         LYNRGvUHroNoSXXuCWtNaJ5+eRUUf7U0DBuHGyLQm7T4RVsU0HW+N93m+Tl3sHaO97gF
         i1Gg==
X-Gm-Message-State: ANoB5pk6ECTNWFA6Xel5pzGOtCW6goX0A6GqwuZ/wrGY7kjn43U24iVh
        4/1A6p5wkWOvDIixlITyWvVnWw==
X-Google-Smtp-Source: AA0mqf7L+sWAhQN2Sr2Z3V3AFYQtJQkH3M8XMLjZDcJ2Fh+QAyEE4ABxI+Ej8IYpG63ePR2D56WcSw==
X-Received: by 2002:a2e:a9a7:0:b0:26e:2de:49ad with SMTP id x39-20020a2ea9a7000000b0026e02de49admr3025781ljq.511.1668789728074;
        Fri, 18 Nov 2022 08:42:08 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e13-20020a05651236cd00b004b4bab7d5a9sm420324lfs.46.2022.11.18.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 08:42:07 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Subject: [RFT PATCH v2 1/2] arm64: dts: qcom: sdm845-db845c: drop unneeded qup_spi0_default
Date:   Fri, 18 Nov 2022 17:42:00 +0100
Message-Id: <20221118164201.321147-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The qup_spi0_default pin override is exactly the same as one already in
sdm845.dtsi.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Doug Anderson <dianders@chromium.org>

Changes since v1:
1. New patch.
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 02dcf75c0745..56a7afb697ed 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1274,11 +1274,3 @@ ov7251_ep: endpoint {
 		};
 	};
 };
-
-/* PINCTRL - additions to nodes defined in sdm845.dtsi */
-&qup_spi0_default {
-	config {
-		drive-strength = <6>;
-		bias-disable;
-	};
-};
-- 
2.34.1

