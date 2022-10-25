Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D385C60D249
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 19:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbiJYRPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 13:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiJYRPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 13:15:44 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B63D1578A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 10:15:42 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id d16so289307iof.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPchkGJSMNf/bGVi4QMD2CaRXadW0du4YX2JGa57jqU=;
        b=PbFdxsu1YMfbG4GaVPb9yW+FF+vy2Cv9dorwW+mP+0I7YbjQTw4HHT1kWzMXjtZ9mr
         ENvs/hG8wRpepj69cFz8W8dE5jRdQuumgmFXLQwdApKzBSeErqJLniEfe5t+0SFHSTBA
         bfnDTKc4VjGwv4a3SyhubAUzkKxB8+99bOrtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPchkGJSMNf/bGVi4QMD2CaRXadW0du4YX2JGa57jqU=;
        b=x2zDiQWnnFXqft9158HWNpsSJ5+PbqfNNPSAaEQ4idAtUZWXqvX2G2VGWUFWUoM5/1
         G2sLSYkEz+0u4i8Erzsm0pagGPI7NsUwEPKTSUmt22PloDrjUw64WyUOWjjk8mYAuGQ2
         MruVGHmzTBaUaCtjl+v7n4ys2gR6h+j9YQj1i65SpsG2F46T//lyHLkf5wcyZF+J9Yb6
         mfNuCCiE2EMkIt8YybBrp7GbW9Y/FHtUA1WLdh3HfZ6XNBvKCUm/Y9o78njXcIk+V/SG
         Q7Mtehm9rokGhVcR4f7Kn2xNW0NMclfDCo7EOWOoWt9rYcqLJiK3kfo0WeTxqc5hdsJo
         ay3w==
X-Gm-Message-State: ACrzQf3EFGMJpRG/6oV0z7ClXBYg9QF0t9Z2FiMZeOMOuLXPpu7jXKUp
        0psBIExwWSSm0kOTQp7wVHV/yw==
X-Google-Smtp-Source: AMsMyM6rnqedN18dtb/hdsjkMBoxOUDVFoRq78qYzFTaOQZZlECXIWfQgWrq/lxSjq/jKk9IMKMIAQ==
X-Received: by 2002:a6b:c411:0:b0:6bc:1382:37d5 with SMTP id y17-20020a6bc411000000b006bc138237d5mr23770154ioa.133.1666718141538;
        Tue, 25 Oct 2022 10:15:41 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id l11-20020a92d94b000000b002fc681a6ad8sm1165373ilq.78.2022.10.25.10.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 10:15:41 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH] thermal: qcom-spmi-temp-alarm: Log the actual max stage 2 threshold
Date:   Tue, 25 Oct 2022 17:15:08 +0000
Message-Id: <20221025171453.1.I13c2a23f276fb63bfc225aeab0bf0db9560a90e0@changeid>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the critical trip point of the thermal zone is higher than
the max threshold of the PMIC log the actual max threshold of the
chip, not the gen1 max threshold of 140°C.

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index be785ab37e53..bdfe2129c357 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -252,7 +252,8 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 			disable_s2_shutdown = true;
 		else
 			dev_warn(chip->dev,
-				 "No ADC is configured and critical temperature is above the maximum stage 2 threshold of 140 C! Configuring stage 2 shutdown at 140 C.\n");
+				 "No ADC is configured and critical temperature is above the maximum stage 2 threshold of %d C! Configuring stage 2 shutdown at %d C.\n",
+				 stage2_threshold_max / 1000, stage2_threshold_max / 1000);
 	}
 
 skip:
-- 
2.38.0.135.g90850a2211-goog

