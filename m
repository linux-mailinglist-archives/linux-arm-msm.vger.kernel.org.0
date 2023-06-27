Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3817773F060
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 03:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjF0BYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 21:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjF0BY2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 21:24:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA4510CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:27 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f973035d60so5079866e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687829066; x=1690421066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1FRzzfzoBSpF/RuWAmqWO6amo1ABUW2O7UYkBEXF8k=;
        b=kn7kWzWcABHn20N8m7Qc3W41CYBnnqjlEn6TcRGTyF8X9zbEpVV8skvcGt/zo3gkAA
         ky/uc4H+DVLHAte02GXhZ2Q60GvbI7k/3AUo2HVYrYF9XxvXkiehIEW+xU52prGXVrHc
         mI6GoTVY8CX2l9HBvaZ31PH5qAPhLHihWCnAyBrGIjwWxyMnxOhW1SeAPp4roEc6OxlH
         kmfQxzkJExKs7DpLut0vYXqm6Qs9jqhIU8IiUZQHQNRn/2ozt8mThqPwYOlx6WBMO27L
         mQ4UkkiHrOgKq8PL/eXhXjV55l1x2J/IJYqsuI2pd1ssb5Ttfi61GNe1lHlXhstkeAGq
         X3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687829066; x=1690421066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1FRzzfzoBSpF/RuWAmqWO6amo1ABUW2O7UYkBEXF8k=;
        b=L6b3S2+CNdfnwZdyas0S8LRs332P7m4I/q78u/dwp421XXQdDU1+0RkVPvhPM6ZgUQ
         Bn8MhKyZCIuD067s4BUpsfi+mG+VhYS/j9QgPdXWOLFFYAlIVDs2ie0ntfSyd9fi+CvD
         DFPJ7BAmuJCjj+UXVLlRjb6nnFLsu4oRIQJhONetL71/wNn1cqiCAq4F3W9vT2qN4pam
         dcCz0koMLM1wrG0O5X2ex6DbekkD5iORD14JV5yc6vjcShk1eBboBaCmyu5VeB6gpgTW
         sUUOBi2rlEJ1Sd30KxnCWSOK98f6xTRLpu7IDj2CYmKYdPR+tTo13uBJdZw4wCNBAbvx
         aUjw==
X-Gm-Message-State: AC+VfDwA3Ld9MJ+Z/zBjO3+WI419KYeGXM3r+wmXWyOuk7CCq8OoWSs0
        h34sETRVi5fCefncMdX4beA7YA==
X-Google-Smtp-Source: ACHHUZ7csYqVPOyo8waH8/mmoPLbvPiNH5dogVsjnCqoNmV1Nak1qT61oy99hRbb1fTOP9upFEtnzA==
X-Received: by 2002:a05:6512:39c4:b0:4f9:5a0c:85b8 with SMTP id k4-20020a05651239c400b004f95a0c85b8mr10470905lfu.36.1687829065824;
        Mon, 26 Jun 2023 18:24:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004cc9042c9cfsm1331301lfh.158.2023.06.26.18.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:24:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 03/15] ARM: dts: qcom: msm8660-surf: use keypad label directly
Date:   Tue, 27 Jun 2023 04:24:10 +0300
Message-Id: <20230627012422.206077-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Directly use pm8058_keypad to declare keypad properties instead of
referencing pm8058 top-level node.

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

