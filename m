Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF5E7789E1E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 15:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjH0N0Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 09:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjH0NZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 09:25:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3FB1B1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:32 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50087d47d4dso3771446e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142731; x=1693747531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1RH0IG0rrFXei9V7mpYpuNzaTfiQ9cfBSSJRkGF8B0=;
        b=l7ssnG8fWl2Uh3pRsNZ7pi5vjvdqrHp22Tfb1c+OrfI2nk6gGqm2le9Pbqn0ZyAUoJ
         NQSKq5AhzPeMZvl5jKfNP4xeE+4PbfkoM+dYQQFoKGNBZ8s49U3g3zCh8B+fs9GyF1+m
         8dj4cHXjV+zqGhpx4tQYVn9PbnzFjkLR8pmfgPvgg2YnM4cUHAFLbieWWn66MMIpw7cm
         DhbWmgXgiWc0SKqTG3fn2i+B3rneU6uhFsSTftO2kTNbMcP9Gd0wBvrMGOn35HRvFYTL
         3HdDfP9fMFnktMVyvk31NK6o7ZLUX7O+xSP74V23/kCWbxy1w6dSRj/X+81aK2WSBCuw
         kF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142731; x=1693747531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1RH0IG0rrFXei9V7mpYpuNzaTfiQ9cfBSSJRkGF8B0=;
        b=X5JG6C7bWIYP0THJ7vioqbIjIv8VoCWEJd6dV97XymQNnnMmqSqhV2sDxqTjUUAhtG
         2Fu3yUizZJkzewp45fETPYKl/Tv0sszqTzDrkEsHHangijeimdLE9FTrU2xdRSsXf61V
         0ymOg7JtbJGUAdasiD9lOm1ACPcFwuopEfNVzwrwbmVVwe1+2iRCHbA0r+tio1NPaT/Y
         yZpr5QX0HwKtoakN02SDW2M7Jbx4gQDKTQtHh0FiMbQJsK9I4Go1KD7sE7iirBAakKFH
         rZAyG+gyfMQCZI5n+51UT134Fmr9fOf8OSEt4Tr69MBIi3zM6VeOR7i3g41KYbxEDm73
         RTzQ==
X-Gm-Message-State: AOJu0YzZOdxnzi6+lO5tSMewIpSo7ReP9ub0uteglqQ44Q+HDMA7RyNw
        RCdHyFK+8cf931z0Em8ofTDGUA==
X-Google-Smtp-Source: AGHT+IFlRJg2VB3CjxCY67h40Ds9BnXczCaD/wGcdFxzWU15UDLhSgRKC30D9LPOWc80GAkqLFzCRg==
X-Received: by 2002:a19:385e:0:b0:4fd:d517:fbcd with SMTP id d30-20020a19385e000000b004fdd517fbcdmr13967001lfj.6.1693142730990;
        Sun, 27 Aug 2023 06:25:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v5 05/37] ARM: dts: qcom: msm8660-surf: use keypad label directly
Date:   Sun, 27 Aug 2023 16:24:53 +0300
Message-Id: <20230827132525.951475-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Directly use pm8058_keypad to declare keypad properties instead of
referencing pm8058 top-level node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts | 50 ++++++++++----------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
index be18f1be29a1..86fbb6dfdc2a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
@@ -34,32 +34,30 @@ &gsbi12_serial {
 	status = "okay";
 };
 
-&pm8058 {
-	keypad@148 {
-		linux,keymap = <
-			MATRIX_KEY(0, 0, KEY_FN_F1)
-			MATRIX_KEY(0, 1, KEY_UP)
-			MATRIX_KEY(0, 2, KEY_LEFT)
-			MATRIX_KEY(0, 3, KEY_VOLUMEUP)
-			MATRIX_KEY(1, 0, KEY_FN_F2)
-			MATRIX_KEY(1, 1, KEY_RIGHT)
-			MATRIX_KEY(1, 2, KEY_DOWN)
-			MATRIX_KEY(1, 3, KEY_VOLUMEDOWN)
-			MATRIX_KEY(2, 3, KEY_ENTER)
-			MATRIX_KEY(4, 0, KEY_CAMERA_FOCUS)
-			MATRIX_KEY(4, 1, KEY_UP)
-			MATRIX_KEY(4, 2, KEY_LEFT)
-			MATRIX_KEY(4, 3, KEY_HOME)
-			MATRIX_KEY(4, 4, KEY_FN_F3)
-			MATRIX_KEY(5, 0, KEY_CAMERA)
-			MATRIX_KEY(5, 1, KEY_RIGHT)
-			MATRIX_KEY(5, 2, KEY_DOWN)
-			MATRIX_KEY(5, 3, KEY_BACK)
-			MATRIX_KEY(5, 4, KEY_MENU)
-			>;
-		keypad,num-rows = <6>;
-		keypad,num-columns = <5>;
-	};
+&pm8058_keypad {
+	linux,keymap = <
+		MATRIX_KEY(0, 0, KEY_FN_F1)
+		MATRIX_KEY(0, 1, KEY_UP)
+		MATRIX_KEY(0, 2, KEY_LEFT)
+		MATRIX_KEY(0, 3, KEY_VOLUMEUP)
+		MATRIX_KEY(1, 0, KEY_FN_F2)
+		MATRIX_KEY(1, 1, KEY_RIGHT)
+		MATRIX_KEY(1, 2, KEY_DOWN)
+		MATRIX_KEY(1, 3, KEY_VOLUMEDOWN)
+		MATRIX_KEY(2, 3, KEY_ENTER)
+		MATRIX_KEY(4, 0, KEY_CAMERA_FOCUS)
+		MATRIX_KEY(4, 1, KEY_UP)
+		MATRIX_KEY(4, 2, KEY_LEFT)
+		MATRIX_KEY(4, 3, KEY_HOME)
+		MATRIX_KEY(4, 4, KEY_FN_F3)
+		MATRIX_KEY(5, 0, KEY_CAMERA)
+		MATRIX_KEY(5, 1, KEY_RIGHT)
+		MATRIX_KEY(5, 2, KEY_DOWN)
+		MATRIX_KEY(5, 3, KEY_BACK)
+		MATRIX_KEY(5, 4, KEY_MENU)
+		>;
+	keypad,num-rows = <6>;
+	keypad,num-columns = <5>;
 };
 
 /* eMMC */
-- 
2.39.2

