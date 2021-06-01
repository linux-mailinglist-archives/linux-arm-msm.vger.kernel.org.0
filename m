Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55843397A51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 21:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbhFATBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 15:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234465AbhFATBq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 15:01:46 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA7AC061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 12:00:03 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id l1so142137pgm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BjSsL+RYZ+Q0RhIg/GdDpOBrbHM4/OAFr/ZVDgOzxmg=;
        b=avnMapG4X/3F6hbySsJBTDLwVx8lYZ38H7SMk21myYXWqNp/ACiJ4jGmjlN8WrBXI9
         TUDkzfpTQfiJH6oieYUYb6bnZvRMoGdTzZI5HpCn6JBWExqHqXcsmsJs/mPolKB2yaA6
         XgFXRADOd1m/iCYZliloQwY8yHE+De9KWl0EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BjSsL+RYZ+Q0RhIg/GdDpOBrbHM4/OAFr/ZVDgOzxmg=;
        b=p5khLdfmRvAQTh+aByNeOa4TRfMrGxPFsc6O2dMtavJ/L2inVdNi5BRxQBOSLwLtNZ
         TcwWLpbwl0HAMwtKRcuRvpHm50TCqtkp3VECrg37rWBez6zamqsk2TfWSePT8Wk3F96n
         dYavIAhYI4zlB6M1sMb+MSAfQI20lEbaA41gmHrbh9eO+tI1evb7qlGvBxHCn9p3EvN1
         Xk4aE0uYWqvuZS2q3fHXFUKzUEu7lqkgiFtUZdYB2zyWcjv0TZoa+xsoxWUIL5ZzmrkQ
         XEYJDupPc5ULansvv6r/u93ClXxGVL5nCeAuwfYtmhz6Q4bmuI4dcnL66h2OaYapqfVj
         Ab9w==
X-Gm-Message-State: AOAM530NyFf5zBG8JXs3V6307WOHxeYbncemeAEAIMAPJZmyz8e/Heqf
        sD4bZaggrFEj+mJCn03FoSbGmw==
X-Google-Smtp-Source: ABdhPJwtltjXqh+Fi6FukJ+KNQRPzQtrkk8lSxLumIEp+wGrZYqf8YUCE43xzWr/fWaO0rCDB8Ux3g==
X-Received: by 2002:a63:543:: with SMTP id 64mr18881214pgf.288.1622574003246;
        Tue, 01 Jun 2021 12:00:03 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ee82:b2a7:c8bd:18e7])
        by smtp.gmail.com with ESMTPSA id a10sm2709753pjs.39.2021.06.01.12.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 12:00:02 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/2] arm64: dts: qcom: Remove cros-pd-update on Cheza
Date:   Tue,  1 Jun 2021 11:59:59 -0700
Message-Id: <20210601185959.3101132-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210601185959.3101132-1-swboyd@chromium.org>
References: <20210601185959.3101132-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This compatible string isn't present upstream. Let's drop the node as it
isn't used.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 216a74f0057c..dfd1b42c07fd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -714,10 +714,6 @@ i2c_tunnel: i2c-tunnel {
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
-
-		pdupdate {
-			compatible = "google,cros-ec-pd-update";
-		};
 	};
 };
 
-- 
https://chromeos.dev

