Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD486C9669
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 17:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbjCZP6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 11:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbjCZP6E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 11:58:04 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B1335A2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:02 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id cn12so26268637edb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679846281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4hfrl9D1xTFwHoIhReISLeplz4idFvjJ3iKGdsJH3A=;
        b=zHwVfeqy3nEa9M389uabRlt0fhQloFRrWQJYAgR0Q57FLmpzj9p72yuI+F+qsdXlFY
         74iSAUIEm1oBF95iJCHaSQ4VgUOdbJv0+JJFedblrGVZQq0jGgX4rNfHn1RWKtGUK2m7
         9iHarJZVfWC2VcI0/RUbuwyxTWsz7z404CwkVEW1SEz1qB/OFcVKEZByykpiP4WKNa01
         sb9+k46v0eOzuxk3CNtc9rlxUBqP0njjmKrUYbLvzJNcBMN2Sz7A5jeRWZyF9diRYRbw
         CPh2S7S9s0o4wrmzIwVoLxUI5tQ3dDbp1mlsXVaXfWYEeCjbYVuvCaySoRDs3Kk0LpyA
         GiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679846281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4hfrl9D1xTFwHoIhReISLeplz4idFvjJ3iKGdsJH3A=;
        b=d0jFntSLXiHkIilRBaZrDBSkAs3mM1pw7YH8TaQHuno43doFFno9AmYnYssm6FzPMf
         BqWn383rIYuCWlN+EvSDl3qf0aJkjUaYzhlYcOurdLz62gFbRj6edUsjk9hjM3t+V8sg
         aoUoIhET0yTQ1JOranLPMRydA23SOxDvqFTmxtfKAIbS0UegWk2EX523Xs+2Ow1GPHGT
         5KBvynubbJ4ot5xp46CnnbcrKLn1s0VfjjF096HyCyeeZji6+jxOqnKImzuaxwf3A2WN
         RsPvZEi11HGWL8NEiHRcTPeBzMa1gGAdKsI9Kq9do8Rcf7rM34nSssfy82a7r3oNYV2D
         syMg==
X-Gm-Message-State: AAQBX9fB671T7F5wUo2gHxxyWh0+CFeZBd0VYWyuHDt+jULe1nZq6Nb1
        mlXq66g44N5SWF052ZFdfv1S1A==
X-Google-Smtp-Source: AKy350Zb7d7URXbnImYtyJ/oAWjHIApZPnNcU14XWHLdO0uhrCDmSgP3SGItSAh42dctq8MNFo5PGw==
X-Received: by 2002:a05:6402:c5:b0:4fd:f0a7:e0a1 with SMTP id i5-20020a05640200c500b004fdf0a7e0a1mr9618234edu.24.1679846280820;
        Sun, 26 Mar 2023 08:58:00 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id q3-20020a50cc83000000b004fc86fcc4b3sm13705502edi.80.2023.03.26.08.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 08:58:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/11] arm64: dts: qcom: sc7180-trogdor-quackingstick: use just "port" in panel
Date:   Sun, 26 Mar 2023 17:57:47 +0200
Message-Id: <20230326155753.92007-5-krzysztof.kozlowski@linaro.org>
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

  sc7180-trogdor-quackingstick-r0.dtb: panel@0: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi   | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
index cb41ccdaccfd..8e7b42f843d4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
@@ -65,14 +65,9 @@ panel: panel@0 {
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

