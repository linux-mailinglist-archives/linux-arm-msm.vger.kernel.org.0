Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C310525895
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359609AbiELXoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359612AbiELXn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:43:56 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78EA28AB8A
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:54 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y32so11724037lfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x2qQH918JYdrczWJIIm8XRXT3abBOAyM4GeAzsiuGrc=;
        b=aJg8B52S+gciOhJywFmn9XfeNsV8s5n1TBGB7xkNP56vkdkaUXtB9h6f+SrGaoFJ3u
         cPJn2d+dzuWOWr9dkgwql6OSPq1k9SYXGO02g2RgT9+0VKcbq5cisyfM9REnsXxHNBEP
         uNW/0a7ZvCSgloVwUD/6NpakNX6wX4VuVFfdoysCwYvB35QLqzyWzMvQEOaCvfAY4GCX
         YmdeVKCR1qNZPR0UlmWzc37YD8g7W7Giq/nWCN982QadAzmCk0qwurDRgfBC1kxhD2/8
         XOGBbVxfx2z5MUn4jgl2q7xMU2HGsmIhLj1lJkX9a8G2hJi+CY9Rn+373n2UAOLMnM3G
         mA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x2qQH918JYdrczWJIIm8XRXT3abBOAyM4GeAzsiuGrc=;
        b=OOMAR4L7PZgL28F4FgbzagDkP3qgQnDdGwAxFR+I+wA1nmVtn30bRuaYqsVgTyZT7v
         gNt5lUb9DNX8TeEySbvZfEbnOFVJkUt88HVJ6t4cHWHlbIBjp6RDXcD7ieaaKqt7u0f+
         q4vtyz4GWNdw/mJWSHuoFJo51uMTTJwhhcK0lhqVhm7oT2SEhrsUQ05Fwnt2D9b++WEV
         xW8TLfj3R8isnxKoWv+IqGK1qxpnHYAEo9f3cMtJIa4duP/fTocBrvd2WhoI4s6IrV8w
         ziJ1AHAVeKec/bh5tIBTBZjUQLWoZdRp83qN8iw0D1gPKil7LBnO4mOGvRHyPmDuoe4R
         KgZg==
X-Gm-Message-State: AOAM530YUD47Cnp1Y4NCj8arQBipkMnxa6HbxHHShDHOMZiMHZYNVsu5
        nNPKs75iuvRyqOqxdeRAi3jrF+F7Bi0U4g==
X-Google-Smtp-Source: ABdhPJz98jmWJlPjffML1K9eGoPwQwUa3ktR8KUeTBeSxmghQv1CjwmSP/FvRmdTDkVWla/1VTtY5A==
X-Received: by 2002:a05:6512:5ca:b0:471:f1d6:b183 with SMTP id o10-20020a05651205ca00b00471f1d6b183mr1495975lfo.197.1652399033105;
        Thu, 12 May 2022 16:43:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u10-20020ac248aa000000b0047255d211b8sm129976lfg.231.2022.05.12.16.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:43:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RESEND v2 4/8] arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
Date:   Fri, 13 May 2022 02:43:45 +0300
Message-Id: <20220512234349.2673724-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
References: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to the downstram DT file, the qusb2phy ref clock should be
GCC_RX0_USB2_CLKREF_CLK, not GCC_RX1_USB2_CLKREF_CLK.

Fixes: c65a4ed2ea8b ("arm64: dts: qcom: sdm630: Add USB configuration")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e8bb170e8b2f..cca56f2fad96 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1262,7 +1262,7 @@ qusb2phy: phy@c012000 {
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
+				<&gcc GCC_RX0_USB2_CLKREF_CLK>;
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-- 
2.35.1

