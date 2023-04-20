Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9391B6E8BCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 09:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbjDTHvo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 03:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbjDTHvd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 03:51:33 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CA849D8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:11 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5055141a8fdso574804a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681977066; x=1684569066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhC4C3gDaGLDcJmLs9RblhPLQ+eqneUsR/ukLpS+INQ=;
        b=OCJEzp/YkjaiOw9IEV6/vVgo+LMgtEQEX3PJVwQh/uQLacHoYDzxO5dlSpaIqXzAZc
         E9JMMgecdUXPG/LFRZaPfiwS62EOy7JCdGUKA8eyz84k8qwiwLzFcQkeFzFCSz45NDsn
         Xju5YWOuBn3ndO9Mf+Y9fcxe8R5/Qm25PGwZByn3ke7DFizs7omSFQzaTgpkO6FJfgAS
         dTR10664Nug+O1KXJlScSaajRg38Ql7k2IYXtvjdriFN8Cfll3lnVgn0pO9NRdXRO9pj
         IwfdPWvHG4GkEUmJLgVHGRMH/3htzqaTJTK5Hy3hc1hGNRq5LbthnBnUpugaY4fmSLpT
         k4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681977066; x=1684569066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhC4C3gDaGLDcJmLs9RblhPLQ+eqneUsR/ukLpS+INQ=;
        b=kjiVqXsU4T3riL1WtSTgoXQqlReDUmO8CZFSD/vRQaAhAQiD0Q1XfyDyuaZlIYYIzr
         kLdg3sXPXCoLQsGB/JyNNdIx01Oqg5KJBh77VHK4SfeUw2rAPUBdhp9CxobzPV+1qk+e
         8MelJKWm2A7h1KoYpW+d8g+xeHtD0F2qKYV0OJ6GaeBfmtVY2s0IszfuTxOX0MAxqyU8
         KENS2h2aya3Fdy0g5QXtJA410OZjEE+kPF+g5Rn5Wm5y1BaGYrkWXBOFCAx0dP/ZhYJ3
         seiTpkPDDamRZxeLqAU1nWFyV9foUX4wSE97R3RF1u8iQzEwTfbrFljkqqHwYDxA3aXl
         z8TA==
X-Gm-Message-State: AAQBX9cXVXqYplHKOGQHfHSiVjTxN82b58uTgVHKdpKJiVLip9y0OD8s
        dp9aPc9LZJI2uF3VxGoksrk0rw==
X-Google-Smtp-Source: AKy350bAbHma/uOLYT1wgGt0R/94USWj2tA98muWzpBpHHfT1DR0yEq+Bjp45zwxkZ0qkkjvBKWByA==
X-Received: by 2002:aa7:d713:0:b0:508:4414:f648 with SMTP id t19-20020aa7d713000000b005084414f648mr1055911edq.32.1681977066609;
        Thu, 20 Apr 2023 00:51:06 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id h25-20020a50ed99000000b00505060e4280sm447165edr.94.2023.04.20.00.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:51:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/10] ARM: dts: qcom: apq8084: correct thermal sensor unit-address
Date:   Thu, 20 Apr 2023 09:50:53 +0200
Message-Id: <20230420075053.41976-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
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

Match unit-address to reg entry to fix dtbs W=1 warnings:

  Warning (simple_bus_reg): /soc/thermal-sensor@fc4a8000: simple-bus unit address format error, expected "fc4a9000"

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 83839e1ec4d1..8f178bc87e1d 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -507,7 +507,7 @@ tsens_s4_p2_backup: s4-p2_backup@44e {
 			};
 		};
 
-		tsens: thermal-sensor@fc4a8000 {
+		tsens: thermal-sensor@fc4a9000 {
 			compatible = "qcom,msm8974-tsens", "qcom,tsens-v0_1";
 			reg = <0xfc4a9000 0x1000>, /* TM */
 			      <0xfc4a8000 0x1000>; /* SROT */
-- 
2.34.1

