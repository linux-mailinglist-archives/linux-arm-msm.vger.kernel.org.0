Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3601675F52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 22:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjATVBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 16:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjATVB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 16:01:27 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9EED05EB
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:23 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id ss4so16923668ejb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Veplr5IplpsIE+N/JtztnF6OOoAX9f7YpVDcqrasHfM=;
        b=Xls9h+sYxcvDr5UTEpAeFZMPxFyMeCNqBGGV7vygDNLUNL+XxP8sxdaL1TXOzP/NEN
         Uba+eSQOUlOscqZ/ysX0/G5a1PQ58eo9JjVOlhlPMK/JkjAzoZOlVJxs9jxTAznK/4bQ
         gmF6latMIRPTBp5X0pDHLu38t4lZ6w/XmXKhiMfd1FkNwFt+dgjjL4fz6XO4u9RA6mV6
         YIRr81WWZJLEKILxG/vyq2gkFliFC5fQN2l+Qo3oIVFcX4v2/i7L17WA8U2N/bOtXnr4
         d/2lSTaYG+BmxoJYIjbM4J6IYAIxNytRW/c44R03mmcWJY7gHAwPvqw64COrjEHf2Tbd
         yYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Veplr5IplpsIE+N/JtztnF6OOoAX9f7YpVDcqrasHfM=;
        b=WwdrGWe/9Yk+5tpr8IojeK7J3s1i9OmenrCHjQTs8d3Eurkd4O8XWf5+0KPCG9WfGz
         6cJ0+nnvE7LWmz3xo5IeLa2Ex5P+2eIemBWLkNQbb771+Q3dkkkMW8AcviPzDSYNIQmd
         Lcw/mpIGJSNHXsA/UW3LsaQP37+UnbfhR6ZThh4Lu/7Sf9GJwIJUIgWZ6w4xVNxmiUA4
         V83kvNfPbSgC6tAC7ZgPc2qBEe8TwxkjZ5nDGDLr542s543z2efLW8TkZEmuvpWVMctS
         nNGJfRuty6Bj2AGI5aQFmprD6tamvhSt/m38X/wpSf+IddC7MxOyCCWy0vsXvFal89rJ
         H4Qg==
X-Gm-Message-State: AFqh2krf8SXNdrbFog+3lA9YoNzqa2yEuUGBi54Lk47fI/6SU9IGpM+z
        QwRgc6eMKGhLfA0+GI9ZHVvVyY9ndcEp/2rx
X-Google-Smtp-Source: AMrXdXsGSpMHspdo9UKJBzUTwC3A7SP/koad8iFC23sChS1yCaQRgkl0iJPOCJHE71sUkuP+nLdtKg==
X-Received: by 2002:a17:906:5f82:b0:871:45b2:19fb with SMTP id a2-20020a1709065f8200b0087145b219fbmr16125826eju.25.1674248481420;
        Fri, 20 Jan 2023 13:01:21 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 13:01:21 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 4/8] arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to DISPCC
Date:   Fri, 20 Jan 2023 22:00:56 +0100
Message-Id: <20230120210101.2146852-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
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

This was omitted but is necessary for DSI1 to function. Fix it.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ed0106829cb9..c964d939289b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3159,7 +3159,7 @@ dispcc: clock-controller@af00000 {
 			reg = <0 0x0af00000 0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
-				 <0>, <0>,
+				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
 				 <0>,
 				 <0>;
 			clock-names = "bi_tcxo",
-- 
2.39.1

