Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F826C9664
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 17:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbjCZP6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 11:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbjCZP6D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 11:58:03 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757BD3AA8
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:02 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id ew6so26167483edb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679846282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtP+egedF/A51rokRfYpFarwermBFr+4ADB0wda+OkA=;
        b=u+cmdZ0t/HMeZvbp935ooldK5u12pR+cZY1AflmegjJdp9S2+5V8dk9Id8bADBI431
         Qsu8W17GwJ4p96UjCGMPic83XPs2vF0vM579nkzRuA7LLoUeMMzABXcv8sie0Q3ByOZy
         ssFPu0oO/4HPnksrD1UC8wcS2fIcAKFZbM7PFuSe1qYVkAB7ylssJRsTwiq+xq4kGHle
         ALc8sF1CRl3F4/BHpWTSf860cweu+b3rKMvl9Y8mVrAdRveAOiQguHgQJwmayHbVSlL1
         dx+Of0wsNlX6ADVgk28zOgDL+x7ARx3pYgCq5/A7EOAuElAlw4yOSe1IZ7eYkQdlsj0Q
         jq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679846282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtP+egedF/A51rokRfYpFarwermBFr+4ADB0wda+OkA=;
        b=bxTaQQ8n5peVU4HoDy1O0hzExAx3miif4rkmimI9Golg9O4FTjR+o/+NHMjh4jOX1n
         E3AIh0biYfWmkPoLRwuBj1JN7Gs2zTUaCUtMn5GiuS1M4RQjB5ChVKbwYM84bZ2TLmwi
         Yp8LLE4JWIXby8uj8Lr63kNhs5geM4R71+sfvrOne7wLcV5YHcWmbB7Hzd9g25ONtb/5
         7ss/oXH2gxACDExAHWXH43Easvm5fbQGBPpsOEPX7Josk7I05NqSJQyIND8Czg4mMLn+
         xm7id8IYvgPIm7i4pz0i2xX8jmSN1pUb0qXSzEALGl6RZHAGVP7cwPWdc5oV4G6Yy+g6
         3eBw==
X-Gm-Message-State: AAQBX9c35EKBWTNO4uegWYT/if4wClLHLuzwixbrmCzU66JY7IKpCunN
        vJ+ew1dJDv5+ybwy4tT8iD7B8Q==
X-Google-Smtp-Source: AKy350YG1MKD/INCAMJkwADt+KkplVppa5cAEVlEpzc9q0ZlMQ1+lw6fnAs5DaxejS5Y9mO4f8eVxQ==
X-Received: by 2002:a05:6402:15a:b0:4f9:deb4:b984 with SMTP id s26-20020a056402015a00b004f9deb4b984mr9867023edu.9.1679846282060;
        Sun, 26 Mar 2023 08:58:02 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id q3-20020a50cc83000000b004fc86fcc4b3sm13705502edi.80.2023.03.26.08.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 08:58:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/11] arm64: dts: qcom: sc7180-trogdor-wormdingler: use just "port" in panel
Date:   Sun, 26 Mar 2023 17:57:48 +0200
Message-Id: <20230326155753.92007-6-krzysztof.kozlowski@linaro.org>
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

  sc7180-trogdor-wormdingler-rev1-boe.dtb: panel@0: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi     | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
index 9832e752da35..262d6691abd9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
@@ -124,14 +124,9 @@ panel: panel@0 {
 		backlight = <&backlight>;
 		rotation = <270>;
 
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				panel_in: endpoint {
-					remote-endpoint = <&dsi0_out>;
-				};
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
 			};
 		};
 	};
-- 
2.34.1

