Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E376E36BB81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 00:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbhDZWN5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 18:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbhDZWN4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 18:13:56 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E21C061761
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 15:13:12 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id f15-20020a05600c4e8fb029013f5599b8a9so3893144wmq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 15:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jlTbSEdZXfT6MxSN+IUIhlV19k9uBh2kVBWE92p9qiQ=;
        b=t+9SLn2WTexSIDQ+Eivw4b3WL8F4mZxTT0TfsTpSb91Aq7ats0DQ2QAvUAyweRQJws
         e5SpVVHUScBDAk8os26R6WgtDMXvJrE4FrNc/NYV4CNik07A9PSgJFtpmgsewP80Es02
         2nBGGvOYayhbByzXYos4h4OO957bL2PgaOHgdu1Njid4RpNKX7ql7ChW2gDR8qfdqoZH
         cMgs1bWHwEE2zGAFc0uDoEGiO+lM4JKBmhy4RGxPzc3e7OosajH8TpzsSIEWd101hXCb
         bYmHYiZ1twYpXvCtRJP2fZBy+/0KC7XFuVhhqQlqBPn7ULuWarGyJYPJF7Xph1PrSTMw
         e36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jlTbSEdZXfT6MxSN+IUIhlV19k9uBh2kVBWE92p9qiQ=;
        b=ere3oHyWknZQoXjEqUAxp6M/Gnhltjd0MGjFW5d5L/FnldjJvQLeD5lfC+z25V4OzZ
         Tf2EkzzKpo5K/0k4TqPezYyUeCJE2KRfrFfOMGDibdeLm5oVs7ekhcBHY7Q5CGsNUsuo
         Mjt2kkhmxBQKG8oKiPCo21jUnBVHBdM7wNhJVfwcN98GcjFS+WuM5MWrwjU3XoR/phk5
         +RXPaaIXjU3uh4G168rLMrpTQfE16jAuA0a3913lj4nNcui3HZVlwDRUX3T4mjHzrHF5
         msBFwfOt3iQbXalKCDjoMbLPfyZI6CkeSFLpragN/tK6Lxc0xk7yt/mjx/vr0nVCAiWa
         YWgQ==
X-Gm-Message-State: AOAM531xjX5l9Oy0SjOrlfwkWAb/X+fHoKH3L55kW7oNTcKmbz1ckiMn
        1uciZ+vJDLS6eQpm1gjlYrx82A==
X-Google-Smtp-Source: ABdhPJwEg6ikkyu+r1tHk8sMCPf4jfjOdSVnajJO7Xa2WpXxtwVHvkay8he1Zr3Dcsw1+Dd7yMCJEw==
X-Received: by 2002:a05:600c:35cf:: with SMTP id r15mr1014943wmq.183.1619475191681;
        Mon, 26 Apr 2021 15:13:11 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x9sm1756042wrt.13.2021.04.26.15.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 15:13:11 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/2] arm64: boot: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster
Date:   Mon, 26 Apr 2021 23:14:46 +0100
Message-Id: <20210426221446.1852572-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210426221446.1852572-1-bryan.odonoghue@linaro.org>
References: <20210426221446.1852572-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Wesley Cheng <wcheng@codeaurora.org>

Add the required DTS node for the USB VBUS output regulator, which is
available on PM8150B.  This will provide the VBUS source to connected
peripherals.

bod: Add minimum and maximum amperage values for the VBUS current provided
     by the pm8150b.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index b21e56a46145b..2a90d773810ad 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -53,6 +53,14 @@ power-on@800 {
 			status = "disabled";
 		};
 
+		pm8150b_vbus: dcdc@1100 {
+			compatible = "qcom,pm8150b-vbus-reg";
+			regulator-min-microamp = <500000>;
+			regulator-max-microamp = <3000000>;
+			status = "disabled";
+			reg = <0x1100>;
+		};
+
 		pm8150b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-- 
2.30.1

