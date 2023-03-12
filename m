Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8886B6A31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Mar 2023 19:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbjCLSi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Mar 2023 14:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjCLSiK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Mar 2023 14:38:10 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9C2AD
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 11:37:36 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y4so10797177edo.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 11:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678646195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV/MH7WZmYISkh6LFOF0VM3Whd1y0ginbM5Br8Xuc/8=;
        b=Fe2RaJLKOllHJINzBNtquWnmelJqdiw2VyZEqRAvbIx/vGaHqCv2IUE7BJw19owSAf
         jhXgV8SwfVvjqWgi6uQHZGTMZuDTmfaTEqqXF4FuYeSdIKcJPeX3gH+b2AR8+HO4k+6g
         vnpGHVHVeJm/neMiHbnztyD8+5HWsTxUIVFonyckBXCnYGIshR9/s71a0ZFwaknJfiiq
         1gTRvdy5ynGew+GY0kxDRTj3SAAnUp32J6dSyYt6wab3UjrMqFaM+ekofXI5XVCTo76K
         CENC7veKD5ylW5/i4pSOdj81l8UrvBH5um01+7OZj2iK5YDVOZAVhuSL/T74CMTPQ+Fd
         ffLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678646195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yV/MH7WZmYISkh6LFOF0VM3Whd1y0ginbM5Br8Xuc/8=;
        b=sePs9DHg94TWcCGzoZmKua1QLkBSjRHO2kaSxNHVQSKzyMYkoppQWLbx/JDnZTICAr
         DAder8ktqREDE9LW5MYOijsH6yy8z4i4KF4+uAq4dkSW2vjjtq5JtX+fGzV/5f5cWj1d
         YxFTi0TKF+kweMZfZR+YDcZBnqjFcjXbnsBp97V7VcHKGa4JqmnKzmVnltI4FOt+v4Rc
         NxNaVf0COYc0cs6TXrr313p/xsW/xTpkCRKtg1r8mnxestrfa+e4P+bqAfiFp/E4UTbx
         jwN2PPnDU4dd4fUhfYU26deXQWaCuv9OthaSYsJC92NLv9BZ2ek+wT2iEiwohELQb+yk
         nIPQ==
X-Gm-Message-State: AO0yUKURKGF2EMticHGZH4ah++IJOEKOVd6/6nxlZ+hqii1WmLHIZs6J
        grPRZZ0MoWtMkZ3gC1RGI1+43Q==
X-Google-Smtp-Source: AK7set82NGVVZXVYQolPmUmPT1KCDtSxUuDB3U+/5A2ADEToQYOrozRB0au6U3TD0DQBPiY2EiqE7w==
X-Received: by 2002:a17:907:320b:b0:91d:9745:407a with SMTP id xg11-20020a170907320b00b0091d9745407amr8919989ejb.14.1678646194996;
        Sun, 12 Mar 2023 11:36:34 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709060dce00b0092669fb4ba1sm893806eji.130.2023.03.12.11.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:36:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/8] arm64: dts: qcom: apq8096-db820c: drop unit address from PMI8994 regulator
Date:   Sun, 12 Mar 2023 19:36:22 +0100
Message-Id: <20230312183622.460488-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
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

The PMIC regulators are not supposed to have unit addresses.

Fixes: 2317b87a2a6f ("arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 3 +--
 arch/arm64/boot/dts/qcom/pmi8994.dtsi       | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 5ceaab5d4039..4476e2e22816 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -704,8 +704,7 @@ pmi8994_mpp2_userled4: mpp2-userled4-state {
 &pmi8994_spmi_regulators {
 	vdd_s2-supply = <&vph_pwr>;
 
-	vdd_gfx: s2@1700 {
-		reg = <0x1700 0x100>;
+	vdd_gfx: s2 {
 		regulator-name = "VDD_GFX";
 		regulator-min-microvolt = <980000>;
 		regulator-max-microvolt = <980000>;
diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index a0af91698d49..0192968f4d9b 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -49,8 +49,6 @@ pmi8994_lpg: pwm {
 
 		pmi8994_spmi_regulators: regulators {
 			compatible = "qcom,pmi8994-regulators";
-			#address-cells = <1>;
-			#size-cells = <1>;
 		};
 
 		pmi8994_wled: wled@d800 {
-- 
2.34.1

