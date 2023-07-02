Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C0E744DC9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbjGBNn1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjGBNn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:26 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9AEE70
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:25 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6c3921c8bso56452961fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305403; x=1690897403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXzP32qCaTwfy8d8tbSEIpFNXV74/ZqsIG5KtR4zvko=;
        b=Uo/x4mja7WuImTweh78Ppq3d/axSf0J0kn1VKi3h6zIC3b9RKkM01I9BxF7jVPNNRk
         3Txy6Q4ng9S/j/aETW4lw5hMiC8+o0VKetfC01eE01x0KBd8JBPK7f3YtZxf2K63uI1H
         BTFVgR4RRR7EYsVqxV/oyNz/j5IBx3YCVFgWfEidG8Hyw488B6eE3mHd+IPt23XC8Hwj
         lcl+F2A2BO3UpRcOlE1ic4ZfI1Y+xDbpBsssiNfsvDK99xrRy++61llF2OIDd3VRj7GM
         OWrAUsaIVgNI5OvoliJyiao3vz7Sxov6mkVEFRlflS9WJ465VAEqRYZYvj37OHWc+ofu
         HsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305403; x=1690897403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXzP32qCaTwfy8d8tbSEIpFNXV74/ZqsIG5KtR4zvko=;
        b=jOWO4xwFE+niqvOJrCHHrGfVDU6IFzUBh8oDCx5Npo30s4fjuZ+k39q/yiFpcb166o
         +bIWKEkpVjwoYYhNsU0eGEc9u7E1Be9HExtvnFDZ2Q0kPfHI3F8HGASgRH5oDlLnZleg
         8XMVTSEzP3eq4K2eq9Js0KZX9x/eJxOzcKSg0fCW+VE8lnIGjreQxi4HI1dHgo67xf76
         uPbx/HoW9C5ILdiVGVLMVxQX7JQ7coUdfJlro629ho8kL5Clz7Xt1C31WnmCVQJ/76mI
         bx0JKvIcuUXTaTcfDzbVOiufBHvVA3OSbzb9rHv//6eE/u12iKWYMSwadN29FlTM2Sl9
         uC9Q==
X-Gm-Message-State: ABy/qLbF7qhhkOjp+oXgMZunELQDovdXjIYUehkgfpdAdGN2U3p/4upB
        V+xGsq5PT0+eg08n4XFsCWA2tw==
X-Google-Smtp-Source: APBJJlHmwJ1eZW/qtrSXk3PLXzwEGWQekfWM+enD6Nrs678L5I9SmrBbKtSQQa1aFuvPUMXVx8Ww6A==
X-Received: by 2002:a2e:9258:0:b0:2b5:9d2a:ab51 with SMTP id v24-20020a2e9258000000b002b59d2aab51mr4964982ljg.5.1688305403180;
        Sun, 02 Jul 2023 06:43:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 02/27] ARM: dts: qcom: msm8960: introduce label for PMIC keypad
Date:   Sun,  2 Jul 2023 16:42:55 +0300
Message-Id: <20230702134320.98831-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
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

To simplify MSM8960 CDP board file, add label to PMIC keypad node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 20 +++++++++-----------
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi    |  2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 6c1bc3818883..4641b4f2195d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -88,17 +88,15 @@ clk-pins {
 	};
 };
 
-&pmicintc {
-	keypad@148 {
-		linux,keymap = <
-			MATRIX_KEY(0, 0, KEY_VOLUMEUP)
-			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
-			MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
-			MATRIX_KEY(0, 3, KEY_CAMERA)
-			>;
-		keypad,num-rows = <1>;
-		keypad,num-columns = <5>;
-	};
+&pm8921_keypad {
+	linux,keymap = <
+		MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+		MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
+		MATRIX_KEY(0, 3, KEY_CAMERA)
+		>;
+	keypad,num-rows = <1>;
+	keypad,num-columns = <5>;
 };
 
 &rpm {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fa2013388d99..913bc6afd0a1 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -283,7 +283,7 @@ pwrkey@1c {
 					pull-up;
 				};
 
-				keypad@148 {
+				pm8921_keypad: keypad@148 {
 					compatible = "qcom,pm8921-keypad";
 					reg = <0x148>;
 					interrupt-parent = <&pmicintc>;
-- 
2.39.2

