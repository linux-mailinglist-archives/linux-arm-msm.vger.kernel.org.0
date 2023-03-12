Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDB46B6A3F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Mar 2023 19:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbjCLSiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Mar 2023 14:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbjCLSiI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Mar 2023 14:38:08 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242EB9ED0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 11:37:32 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id da10so40353126edb.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 11:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678646192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94ec/3Lck7xux4vrbUrW03zCIaDqbzydjt56XL/nSks=;
        b=lf0gwxeU6DY+IZY4GVK57xUVeE7XF73dJkJqqO78Pv8iAbHs9ZfLZggElH7CZu2s7r
         h9FqxkacVflCkgmxcBjX9xz2hCYbiVk7I1brPZYiXAK5Gc+ZPPiXHnFBQqxu5/Ch9P3M
         wSNcl8KKuGTszZgv6oNIfwm2yVBLoXAj13olpU2RwMli6fLDYWoRQlmw1nPGN0T6JIsB
         9PrmpQJfDN9TDYzcvtNHLFn2C2/PDry8OapiPf41EaT1PCaADkX4tPJeKNSvHqkM7GZJ
         bWTsZzUrBpJGcH1Wde8MhGawMvciopWwYbMTa+YOwR5SNuoLBvhRShJOQ9gWXhPYzypX
         JeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678646192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94ec/3Lck7xux4vrbUrW03zCIaDqbzydjt56XL/nSks=;
        b=k0pfWGGiSbEgq0SYZw1GdMxUKMzVhvpiJv3joB4IeyvKHIA2j/bIfTVa6nXWcqglMr
         3DJztZ7f+K1zXtX6x6oTSw8vznmRKAn6O6XbRSDI3p7lqCY5IYDOPbAZzIz1p5RjkxLx
         xxBmrY8ERWGkV/ELRhDFfmESsk1o7dOB4pHPA45pE63+oTKHK5BlCOvbZyDLuXykcS74
         igsrgp+HPmJaVbDpHNcuoUIhf+eOpJo1NXZU3VjsRc9eK5qk5dgoDkkl3fhgDKYP02VX
         +dP3hMhJo/ZBFwlq6n1rPdVnoo3VRxrxz2jTexL24l6Lo9Vxl2PYtliNa3+GXcHB4+wT
         zpjQ==
X-Gm-Message-State: AO0yUKWss5vQJ8Q9bbuwpnRoY9wqEyze565Y7tp2Ls3cresLKOdReZCZ
        xslSqohXaTBU52Eqo/0H89MI/w==
X-Google-Smtp-Source: AK7set8rjzGhg/wmOHsAOLvNcuIFzbRYRuf+zxKpPVlz2pE+Pbd3q8VJefCPwGmYY12b1zIouuJA+g==
X-Received: by 2002:a17:907:2122:b0:926:2363:a276 with SMTP id qo2-20020a170907212200b009262363a276mr2346930ejb.39.1678646192238;
        Sun, 12 Mar 2023 11:36:32 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709060dce00b0092669fb4ba1sm893806eji.130.2023.03.12.11.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:36:31 -0700 (PDT)
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
Subject: [PATCH 6/8] arm64: dts: qcom: msm8994-kitakami: drop unit address from PMI8994 regulator
Date:   Sun, 12 Mar 2023 19:36:20 +0100
Message-Id: <20230312183622.460488-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PMIC regulators are not supposed to have unit addresses.

Fixes: e9783584c9b7 ("arm64: dts: qcom: msm8994-kitakami: Add VDD_GFX regulator")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 3ceb86b06209..26059f861250 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -173,8 +173,7 @@ &pmi8994_spmi_regulators {
 	 * power domain.. which still isn't enough and forces us to bind
 	 * OXILI_CX and OXILI_GX together!
 	 */
-	vdd_gfx: s2@1700 {
-		reg = <0x1700 0x100>;
+	vdd_gfx: s2 {
 		regulator-name = "VDD_GFX";
 		regulator-min-microvolt = <980000>;
 		regulator-max-microvolt = <980000>;
-- 
2.34.1

