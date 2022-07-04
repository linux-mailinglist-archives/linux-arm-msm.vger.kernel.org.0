Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0EA8565AB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 18:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbiGDQL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 12:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234174AbiGDQLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 12:11:55 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA3F6269
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 09:11:54 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a39so11589704ljq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YIUu3Mrd87z3G3m4XzJVsFhhK3Sg+085T4JDYUEl/jk=;
        b=ZSTExc85IrAGJ/rW+vr8WpE2t9QKV6hD6GSEM0kBXEmwHxB78S3NezadIBajKSTIUN
         yU4noebePlvhDLMOeymiPHlc5SSefcYxMfHum3pVnK4UhtElhJsUiQ/FDlT0hW1pQYtK
         WTfSCOft25zdS2u+cy/K9Kah3DaIGYlJmdz4urHGeZeG0pC1DKCrdRXDPCzUd9skV9RO
         O9RPaDiABZtnZ7l7r2uyMqPZQ6bvmWdykudEaU7BUVEO6BWcYBRzu1fIzSrJJ1OY2RDj
         j81p4T7Qgzs4m/E7vtC57W1PgZAKKG+TRlUQhf+f2x/RT+cSfP4Oz35nAEeteI2VT+64
         tnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YIUu3Mrd87z3G3m4XzJVsFhhK3Sg+085T4JDYUEl/jk=;
        b=5iqRczwpPLADfwm0YdMuqFVdzagYfcIvWpxhCR0Ot3UBMqT5mysEeydXC27ucqE+IM
         gah5wFidduR+HXczSGFTcWTZpw021ODNnEe2inXnK3GaOLpW4FwHYrn4+GLmCecuDKUa
         cYJ9cKDjcXSV7IXK0NseUP6Yf1K22Pa42d+7Qn6Puo4KQc6e5zoF58IAgQ1SUMKFoT2/
         XihYGpYLBKegzCcL8CqyXzUGH32MRkNDUn1ppXxoS6pUdWd6etnmkuFrsbFA9uY20Jhz
         ShJhglgDhrUqoJCC0/xkT/mQFLOzjJEjqHqNnknpJtQIQINrCjFAoBFmkN55yAyGHbnz
         VICw==
X-Gm-Message-State: AJIora8fxDawam6PQLqQSbRS17sOnqbu3ai9z0Nb948rRpIlE0Lj2Vqq
        ejNAl8jzvw1USgTZQDF4MRrGCA==
X-Google-Smtp-Source: AGRyM1tvtojLhxu1Ji7ca6nmQ7FH7hsqjwPTL0DGC0s3+tnnbpoth/ZJkxivFg5Gi56gOzZKOVlvcw==
X-Received: by 2002:a05:651c:1989:b0:25b:e6ac:4055 with SMTP id bx9-20020a05651c198900b0025be6ac4055mr17272197ljb.3.1656951112885;
        Mon, 04 Jul 2022 09:11:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bj16-20020a2eaa90000000b0025d254180d7sm381273ljb.113.2022.07.04.09.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 09:11:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO clock to the HDMI PHY node
Date:   Mon,  4 Jul 2022 19:11:48 +0300
Message-Id: <20220704161148.814510-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
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

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock. While we are at it, also add the XO clock to
the device node.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 25d6b26fab60..b72385ffecc6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1049,9 +1049,13 @@ hdmi_phy: hdmi-phy@9a0600 {
 					    "hdmi_phy";
 
 				clocks = <&mmcc MDSS_AHB_CLK>,
-					 <&gcc GCC_HDMI_CLKREF_CLK>;
+					 <&gcc GCC_HDMI_CLKREF_CLK>,
+					 <&xo_board>;
 				clock-names = "iface",
-					      "ref";
+					      "ref",
+					      "xo";
+
+				#clock-cells = <0>;
 
 				status = "disabled";
 			};
-- 
2.35.1

