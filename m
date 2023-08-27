Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E3D789D97
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjH0LvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjH0LvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:51:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55A61B6
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso3501988e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137051; x=1693741851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwm1Y1yKYRC2h+rKhVRBCueR16O0EXSdEm7pH6xao2g=;
        b=zeDkuL9gLDOtGUp3sxh74K4EK+IzvWipMMDLCvIh7VPsj5D8Wu6woMcZV24JehwQyk
         abgsKoOz5xJ9ncztZWgoax0uIGcnvl0wVOOaAspWHcy/2KJWoVJWNKFk9Pb2KqLCEGUY
         SumSLkPaRz23E9XHi2TP4RgNr0vFFXiPuS4FLiJm+WRuVYFHbC+9Xa2kh/o1Mr0BQ1gK
         awkepLX3yifRJ+02dKJ+0U81yaiOcmR+YVkePME1Q0MksupFx/BFfBqpG0fvVwPcf0rb
         qT7dYTXd+rGUYdUay10BIK+HRXbduQpqTi5q6HBoG9CYA638dIDzcYGQ5n+cNAJkFZUm
         iiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137051; x=1693741851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwm1Y1yKYRC2h+rKhVRBCueR16O0EXSdEm7pH6xao2g=;
        b=g2KbnVru4irXUd6wr4XpK6tN+jvwp+0si/XQdBj3zQQwZ1gGobDZl9hPVLuQXLZGXt
         elgbVOBtGMcSy7bcL480ghodKUEj/m3SQDenx06H4MVv23nkQmGO94+73WoaxKseDj6L
         Tkm00nejS3iODoAqYbpohFJxaaQFDojmz8Bof7+A7jl+RtvGsOi4XahqN1NELzZorJMA
         /7jbvSxllQjHTazPsduxsNGnkYgh+K6C+rqe5m3OB6r/PGcyuahnDN72wFOZGN6J2isy
         bS45xhUVJDeHDGrdonvNTENA+0wbEy8Dq975vLoFyHXM6r+WdtCYZ8c3+qEic05ANZhH
         kamg==
X-Gm-Message-State: AOJu0YykTbSx/4sAxXuPAJKgnUDQIq78hPKNy/ffV7X0wUOYZmkNfqgj
        fQd5wTXKTb5Fjrf5KVViXFvvtw==
X-Google-Smtp-Source: AGHT+IGFpGW7MeqAUFh8aVAXu7OTE6U1OKVMAOiRtG4IiJPhDohiehKW0Qi1TrQenA9YoNglJnTxqA==
X-Received: by 2002:a05:6512:2203:b0:4fe:2efa:b847 with SMTP id h3-20020a056512220300b004fe2efab847mr21623379lfu.23.1693137051233;
        Sun, 27 Aug 2023 04:50:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 20/23] ARM: dts: qcom: apq8084: drop 'regulator' property from SAW2 device
Date:   Sun, 27 Aug 2023 14:50:30 +0300
Message-Id: <20230827115033.935089-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator node show be added
instead.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 2b1f9d0fb510..24bc2cbfbd96 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -652,7 +652,6 @@ saw3: power-controller@f90b9000 {
 		saw_l2: power-controller@f9012000 {
 			compatible = "qcom,saw2";
 			reg = <0xf9012000 0x1000>;
-			regulator;
 		};
 
 		acc0: power-manager@f9088000 {
-- 
2.39.2

