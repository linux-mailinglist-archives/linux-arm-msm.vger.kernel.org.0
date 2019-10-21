Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2A5BDE9AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbfJUKgH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:36:07 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39803 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbfJUKgF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:36:05 -0400
Received: by mail-pl1-f194.google.com with SMTP id s17so6411892plp.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=yL7Qj8/ghjeqWsofoPv2csuJJiKJS+BI17hOcKQw/eM=;
        b=MUTwTSiGPdDBbvXmQKHZ9DYnyo8AkHQ6po0q7qSA0A63lmxlrWVYQVW6dQ+0gCiH3m
         sYL/hBJQD3b3uapKL8Sdcbls+DjVmN3NC1dDncnZEGI3csHkBuekxHMaXDct/MQrcf5f
         WMvKbQj/u50owK5QeuO/W1L6PtHynq8RaHyJsZcWj0aS1eeZ4/paNOf7Kc0aygVABnlf
         g93iKUL7pkhiML2CJeV2sdtTk28rK37GI/eNQgVzwIcG5h/vDdCDqslmp45Zc0uTHWYx
         iKUWFq0nPT/RIx7y3mE8kyqJQ2gGmiWyhGjUhXsPdUjJTI8qdQv+jd0fr2QfD92hGHaE
         WfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=yL7Qj8/ghjeqWsofoPv2csuJJiKJS+BI17hOcKQw/eM=;
        b=PoUw/61uB9FsCBpc1NU6ZF8dE8DLQMRVtdkjInvqV1Hw2Yw5N1oQBch3o69JqoXyDf
         eJUSlpzKkdK/h5Gd/ec3UHbdRrUyCEteyhKb4hniHQzuIheawd2oB6q86KmK33mq9wYy
         kb8I+6NmR2heLYXiumoZi4HSIDZUQ658vUR2g8U+0NiuvvTqPzh3dXxoRRF2F4cdSf+g
         L5z9qd/5d+vUPSfmlMreuGkAuTU/RdTEPQQmrvNWMOpIGC+hth559BlVgOVruGB2FBxS
         bPxKThjwHuanQ84S3kTBQx/g3Jdr40TvvWQ5usFGuG5GsedAfTgQGKEXCfLNa1W5v42B
         Uf1A==
X-Gm-Message-State: APjAAAU2p0mcuZEWcfV9AZaym2P2vse3BUJiPDf50mZvOT4EwhOZrBiF
        kOSfEMv/uJ7LddEzS/EVqLtNEw==
X-Google-Smtp-Source: APXvYqypBgv4+h2xzB6x2jro1gPLklFWjP4MlREzwJSLMBdhp7BPHn4y/qfxqstKhCBbnv49m/G4rQ==
X-Received: by 2002:a17:902:6acb:: with SMTP id i11mr24852585plt.16.1571654163559;
        Mon, 21 Oct 2019 03:36:03 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id y15sm22091643pfp.111.2019.10.21.03.36.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:03 -0700 (PDT)
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
Subject: [PATCH v6 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
Date:   Mon, 21 Oct 2019 16:05:25 +0530
Message-Id: <1726fdbf7cf7200ac5dc2a4c811aaee7edc47fd5.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8916 uses sensors 0, 1, 2, 4 and 5. Sensor 3 is NOT used. Fixup the
device tree so that the correct sensor ID is used and as a result we can
actually check the temperature for the cpu2_3 sensor.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87d..8686e101905cc 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -179,7 +179,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens 4>;
+			thermal-sensors = <&tsens 5>;
 
 			trips {
 				cpu0_1_alert0: trip-point@0 {
@@ -209,7 +209,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens 3>;
+			thermal-sensors = <&tsens 4>;
 
 			trips {
 				cpu2_3_alert0: trip-point@0 {
-- 
2.17.1

