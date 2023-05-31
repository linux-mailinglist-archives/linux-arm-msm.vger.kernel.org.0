Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 231297172F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbjEaBQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbjEaBQe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:34 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD0E118
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:33 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f122ff663eso5841058e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495791; x=1688087791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GxamGy/fBYkSHOxDQxOC8wRfhuHzbBuJJ5Qq1Q77W8=;
        b=mCqbiyPqZrI/H/5HaZbEHB5FRHvSqqAXdcKC9yX/pAHho1wIpeVQDoxMEgcZQzFmP/
         SK7oeqILwllZY1uWiJrC26WdXgugF4NcXlmsR5IgZ+n2U8/bwjQF7ARhmXAR2nS6U2yE
         a4+/bgj2zMg8pKcJ+ZRfQnYPwvSgxjrj4C34Qs+FFKZErSGkmcFXtIWXkOyaeHU5L7xx
         eX01rOcwk+FNFxXQWGSt1Wu6nqEcCKawUCEE7euykpMHzJzaadlOdMM7iEI5qIG+8Nd4
         61oI/PK1qpjMWo4Y+rYWCxfUUepwcnr2q6MKgZAuK9PMU1j3cCcgKkRsGaRLYai0udKW
         8fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495791; x=1688087791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GxamGy/fBYkSHOxDQxOC8wRfhuHzbBuJJ5Qq1Q77W8=;
        b=cNiwkYgA1/ZSMDRCk9tk7gxrcOv2FT2Y2jyHZRXzxFejkwmb3Y9QxPHjGaJYK4JWTz
         CjQgZ6DXisHRnTbAzvczE8Wm8AQ/96J0+LGg71G4pC7U1N5qKYCXa4JcoSpovbET6PVY
         TMSnr5Jha76d0yMOf4APIup/wjXfbj6awEBwj3pau8/0H3BJ3sDGtSSuZxpgDkg1O/t7
         kbYo9FJWg2Oy657IpFgbszS/HeZHUZW0CVCQopFU7as6elrr2NZok993ulkAsaTEq0qe
         rtVVHp8+ISnWWm/uhyKB+WrR1ACSm2cVI8qr6K5i3m3WCmg8y5axGW/WdfZXSCmLdEO7
         luUA==
X-Gm-Message-State: AC+VfDwRx4oQp/2kWHRGL4+PePaoFP0CcTVeL8fIrxx28XiuPCXfAF3K
        gr8RwF6z8uPD91q3JpLXvNrg2g==
X-Google-Smtp-Source: ACHHUZ7wxkKOeG4ztmm9CSTdTxo05eRayBBzXSNa0sbnC0FPIt0p3APVeaOx3eP7HVooyqBUBSxJTA==
X-Received: by 2002:a05:6512:41b:b0:4f3:a812:5ae with SMTP id u27-20020a056512041b00b004f3a81205aemr1635063lfk.37.1685495791143;
        Tue, 30 May 2023 18:16:31 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 04/14] arm64: dts: qcom: qrb5165-rb5: remove useless enablement of mdss_mdp
Date:   Wed, 31 May 2023 04:16:13 +0300
Message-Id: <20230531011623.3808538-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MDP/DPU device is not disabled by default since the commit
0c25dad9f2a7 ("arm64: dts: qcom: sm8250: Don't disable MDP explicitly"),
so there is not point in enabling it in the board DTS file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index dd924331b0ee..dfcaac266456 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -639,10 +639,6 @@ &mdss {
 	status = "okay";
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &pm8150_adc {
 	xo-therm@4c {
 		reg = <ADC5_XO_THERM_100K_PU>;
-- 
2.39.2

