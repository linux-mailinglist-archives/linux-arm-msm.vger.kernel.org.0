Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2394DBC07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 02:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352107AbiCQBH7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 21:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235950AbiCQBH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 21:07:58 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C801D0D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 18:06:43 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o68-20020a17090a0a4a00b001c686a48263so15886pjo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 18:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZQaPcDKKFXzU5tYoLycGxECEAPv9mMkSoufmv1EZTg=;
        b=dqcNR3YSEOig3GV63ooaumDDhzuZrloUf0ajwHJAxn0/Jkh6KRG5Llr8qAdUfl6OSd
         O8K4IW3aAb1juEABRFFBJi4+xNR5eOB2q+rD9hg+cLHq41OJQxXQG29XjFzlqLTLMJXX
         40XXyzEg5CHIjdFZagBhPqu5lIlH2zoiXlbmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZQaPcDKKFXzU5tYoLycGxECEAPv9mMkSoufmv1EZTg=;
        b=tuDSbaMAi4hy8GePmfx4n1BYzj/KRC0aIXSgEeL9Gz4mHnAIlev32LRETE9/2zLn/d
         CI+ojrWS8NuJphSLB0dw5be7K5m7iMj37BMHo8omBysCWkoeWo8stmK84iF+UQLS4BRX
         05h/xn9zN936jaUWLTgPm+O1mknMDcKsCmMFCTiep5eKj6J2t66/vFQTf94Sdq/84z2C
         G0YOzH0JAYvpEdMpLLhORGXSFkrsag0fFPA6M8OK702780zy+ee8Ps0DCY8gpLgKHGX0
         a+EXCl3XvCitRQ7twisWEeH6/DJfpvl1/uANkNrWZteAzdt21X6/qyxChkWrOwGnv7ej
         FvFg==
X-Gm-Message-State: AOAM530YclfD6b3zkUH6U7csQZoDtWwEpWE3d0SbA24SS4+puGPzAKRJ
        ft7u9tTDhA/JRQC9fnQrnk8G4Q==
X-Google-Smtp-Source: ABdhPJwSlqdw7Z1UWr/ZNPyRNptixyjPpYfit6VckDanvexqXtsN9gly7JRmSu0PZn4VitzeAoEJpg==
X-Received: by 2002:a17:90b:4d89:b0:1c6:1047:ce4f with SMTP id oj9-20020a17090b4d8900b001c61047ce4fmr2565473pjb.78.1647479203081;
        Wed, 16 Mar 2022 18:06:43 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dec5:e3f8:cbd7:f5a7])
        by smtp.gmail.com with ESMTPSA id s14-20020a056a0008ce00b004f66dcd4f1csm5093923pfu.32.2022.03.16.18.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 18:06:42 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sc7280-herobrine: Drop outputs on fpmcu pins
Date:   Wed, 16 Mar 2022 18:06:39 -0700
Message-Id: <20220317010640.2498502-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
In-Reply-To: <20220317010640.2498502-1-swboyd@chromium.org>
References: <20220317010640.2498502-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Having these pins with outputs is good on a fresh boot because it puts
the boot and reset pins in a known "good" state. Unfortunately, that
conflicts with the fingerprint firmware flashing code. The firmware
flashing process binds and unbinds the cros-ec and spidev drivers and
that reapplies the pin output values after the flashing code has
overridden the gpio values. This causes a problem because we try to put
the device into bootloader mode, bind the spidev driver and that
inadvertently puts it right back into normal boot mode, breaking the
flashing process.

Fix this by removing the outputs. We'll introduce a binding for
fingerprint cros-ec specifically to set the gpios properly via gpio APIs
during cros-ec driver probe instead.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Fixes: 116f7cc43d28 ("arm64: dts: qcom: sc7280: Add herobrine-r1")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index dc17f2079695..984a7faf0888 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -677,7 +677,6 @@ fp_rst_l: fp-rst-l {
 		function = "gpio";
 		bias-disable;
 		drive-strength = <2>;
-		output-high;
 	};
 
 	fp_to_ap_irq_l: fp-to-ap-irq-l {
@@ -691,7 +690,6 @@ fpmcu_boot0: fpmcu-boot0 {
 		pins = "gpio68";
 		function = "gpio";
 		bias-disable;
-		output-low;
 	};
 
 	gsc_ap_int_odl: gsc-ap-int-odl {
-- 
https://chromeos.dev

