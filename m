Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1ED46C965C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 17:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjCZP6B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 11:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbjCZP6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 11:58:00 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9591BD7
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:57:59 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id ew6so26167089edb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679846278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNPVK2ReHkSGBM2gXG4E7jHMeD3nyYKiKbBuZIOLG8w=;
        b=XJdHf89/UMGpUOKk5hZjPXCyzeQLTdJhp00CsClJIhzar/hLVW3xGAYXpA1O0WmCqA
         moXuq4XDSOFW7iR59cXucdQHHbKbnhk1H3ZBgQtutBkF9bVFqcMzKxWciXbTVQn/YiOe
         ZaDnnEs0jLZ1SE2Tnlf2x194csxyz9QSSMvVMURDrExgagmUiEmvRcZdgMjNtp4Xgsuw
         z8OvoQ759XXDSZr7YQAZTZftEEDPxguh9rf0zUsejaZgUPLaaw7mpCGrq0cR8QJBApK7
         Jy66WVorGAVEc9kKOIRrBhImjfDYkShJ2r0A8V0FqpgDJa2fKU5cVelIO04RrByn3HI9
         XqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679846278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNPVK2ReHkSGBM2gXG4E7jHMeD3nyYKiKbBuZIOLG8w=;
        b=jl+Jyq0YsAY0fcy74yYYXcv+jLmthZAflYyJaEIDPKcwA0iNLrxtPN6ISlFGMYTjXF
         yq3GTQPSkJd6+CjhdTyOfASIv+BsQ7sb4zc/DhCCmwR6H/EDHSKlhAUlqVQQU/PyGs05
         O7uXhWD07E39RNXG5rg5X8DESDYYbImW107f7Vs3bgiOssenWdEB20+reF8Vi0l+URYP
         S/j2HmXw9Y3i9lW7hsIVSYVt24lJoCV4mjO9SrnH9nJsPU3+niIP2I3qD1ul42/uyJ27
         YfVOJfzyxyc3PEHRKH6waFuyyYnVGxjYOt4O2UH6lug0AHvNyd3i2hTK7bsLeJTx5sV+
         kGlA==
X-Gm-Message-State: AAQBX9f73hNESu5aCx4rsTtdjwLEJM8AjOy149Ra0ex5/adQJzBEW2Xn
        415phnjfr0reBxnLWuQs10RJhg==
X-Google-Smtp-Source: AKy350a6zetR+juZHisCja6mrYmxW1klRQkVstsBBOsj+qbOY2UiKI+XrxAxTUmKTz2Jk4eSJ4Dzhw==
X-Received: by 2002:a17:906:5a94:b0:931:6f5b:d284 with SMTP id l20-20020a1709065a9400b009316f5bd284mr10307472ejq.57.1679846277838;
        Sun, 26 Mar 2023 08:57:57 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id q3-20020a50cc83000000b004fc86fcc4b3sm13705502edi.80.2023.03.26.08.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 08:57:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/11] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: use just "port" in panel
Date:   Sun, 26 Mar 2023 17:57:44 +0200
Message-Id: <20230326155753.92007-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
References: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The panel bindings expect to have only one port, thus they do not allow
to use "ports" node:

  sc8280xp-lenovo-thinkpad-x13s.dtb: panel: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 0e7aa7bd9a2c..27371d4c186e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -553,11 +553,9 @@ panel {
 			backlight = <&backlight>;
 			power-supply = <&vreg_edp_3p3>;
 
-			ports {
-				port {
-					edp_panel_in: endpoint {
-						remote-endpoint = <&mdss0_dp3_out>;
-					};
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss0_dp3_out>;
 				};
 			};
 		};
-- 
2.34.1

