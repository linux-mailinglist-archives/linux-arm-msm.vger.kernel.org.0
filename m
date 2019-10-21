Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74B88DE9BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbfJUKg1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:36:27 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40295 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbfJUKg1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:36:27 -0400
Received: by mail-pf1-f194.google.com with SMTP id x127so8170613pfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=iVqqU2LAVSCsGxONMpzjN5OaSzKTS+PP+RlrbsDHeMo=;
        b=S9EG7QY/ZgkmqHhRziKbvL3c/VYqOHXyxeTbUYe3phmidMNW6VBcGWA5qYT94oVvwV
         FcDAXIrZHnwKaZPodf4BPLNtpvyHt05p/WPYzzGomf3ic9a1bgRqcT47c3YQX1kTBzTP
         TPm2ahWz0pTsWGK1/SUEJ7Eq8+CeuaX+8RSWgQaP+HdnHfbZfdDo2skD2ZdD0OnEMidt
         mKa3+5D7lLpBUC5WYONM+bjVgGtcN/CH+LHb3+baXgPFR+unyWMICbOgLOWfzCi/Od3z
         +zswnyNg6Q+4KhQqLJbYtWR5WeASo8JWdwRweB759Abf+83GPYHQHcfBc+UQYlQBDpIa
         FLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=iVqqU2LAVSCsGxONMpzjN5OaSzKTS+PP+RlrbsDHeMo=;
        b=UA3CWetVhsV88mufBItN7o77Ua4sTEUBqY7jGm2yIarUOFl53oBoX5uU3HJQGbPCgI
         HzYl5cY1BLJIpYveADzTsROY2CfUMRV/PWbySNt/ydPjd5mC/RcI2uzJcr7NVGRA3P0y
         f1FPIzgHuTNnJd8J/Z3D6nvEVMCAFgK4HXZHZNcLvQeP9mLCwFgBNL1d8ayJuqbhqze2
         TQlDosxJok3taihSP2fO3+47qYE+MEy3XQOxHD7yhfLv+xVCwhUHdiwkFLGJ73VzdbDR
         Unvzoe34d1vBy3Q08c7K2rHKlqVOMfkv3LuU9Iqj5PcDr1AT6gEglMB9iTaPvCzQUoH5
         14Iw==
X-Gm-Message-State: APjAAAUHdsq5juaskrQzNlc2rvN7jCOduOGAWLW920/ZnNffl1Op3l+V
        H9V59ejleXDY2YDYccR0WJc/BA==
X-Google-Smtp-Source: APXvYqzEHGDZ6oIR4ZkTsgaawzrSiWXv0qd13sPs8zKa+jMYleM9/V8ML0gtBkC0Oq7Pc4bCnCZdKw==
X-Received: by 2002:a63:cc4a:: with SMTP id q10mr11017952pgi.221.1571654185644;
        Mon, 21 Oct 2019 03:36:25 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id e192sm15379176pfh.83.2019.10.21.03.36.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:25 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v6 12/15] arm: dts: msm8974: thermal: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:31 +0530
Message-Id: <a2a70ff28e72a14b163a9a9b93ef474ab0836398.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupt for the tsens controller.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Tested-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 33c534370fd5c..c1a3a7d7161cd 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -531,6 +531,8 @@
 			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
 			nvmem-cell-names = "calib", "calib_backup";
 			#qcom,sensors = <11>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

