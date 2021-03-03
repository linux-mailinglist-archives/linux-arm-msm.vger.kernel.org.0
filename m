Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DD232C14E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhCCV0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234944AbhCCDcu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 22:32:50 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5379FC0617A7
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 19:31:23 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id j12so15244112pfj.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 19:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cn2nXibIzD0MkhidCs0pgueHS+0vk99rUID4aeq6w6Y=;
        b=CLmmXpcEX5+Anb8wZZGcKGG/CeFLnu6I8e+fm741ocARS+TjchKVo2iDrMHSD1Nbt2
         9fhwi1sVXOtwNX4OgQeeiwzsT+mEntWK6ZKWmPRKHtTazpXdvJiYa762vlCjezwteNxe
         teSIaHPPAHFhMIUUqdFOE7CRcKi0cfyciqA0uaQyNF2vWt8bHKmarKsqFp+c/VBGhhwM
         rbMG8ZK4MzApHOALD+oW588JmebnGEOvRE+InxBfw9mKdlVetpNymOIQGBDNmdKMBrz2
         wBx+/7t+TKX3FnXqfW9/eEwKe53bT24W1eNohwIqXkv96aexuZLoPNF0pbrZcmaZM5sb
         H5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cn2nXibIzD0MkhidCs0pgueHS+0vk99rUID4aeq6w6Y=;
        b=UaJKvx0EKEbESrbaSUnBBjmg7yUY/e9ksrV18e9MK6XRamz5P+hi1xR7eCdyYywLMJ
         FtAQuG9WCtBGV+gc5Z0ghpfncNBrvBox/FYP5ibp3XqBBsLWxKRkgNZNlYQT0Dmmh7qX
         neTlk3ysOXbfhgpEAVP4Wc6lH+FHGl/8l9FrOU6+nq5SDRD7U/c2V7pyWkn0juP8R/ut
         87SMgWdn7Y9vXihR3RrlsW1QfcjtNrUTDisVVUvHcMQ6iXZZSxhLcQ7kqkaVpDRaou3J
         H9qtTS4bMRv5r/7InyNXi19efQQg00759EAiwcjqk7uUbyvy3pIOBMcvP3Zc0qDnFnWD
         Nusw==
X-Gm-Message-State: AOAM533qBB8+xYMpK7NyzaKeysrSaUbTzhcEbNiLiPRzJHV5NFJ9uZBP
        3d1q9U6ooD8N8dBW3bH/LKV8Lw==
X-Google-Smtp-Source: ABdhPJxUuYkhu4i6aduARS71TgXJShBmy+zKxt2isfiduxdLMnn1un8v+HreOtOXqf7YGR/bczwMLQ==
X-Received: by 2002:a05:6a00:a95:b029:1ee:471f:e323 with SMTP id b21-20020a056a000a95b02901ee471fe323mr19528594pfl.69.1614742282903;
        Tue, 02 Mar 2021 19:31:22 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c4sm16057511pfo.2.2021.03.02.19.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 19:31:22 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/4] arm64: dts: qcom: sm8150: fix number of pins in 'gpio-ranges'
Date:   Wed,  3 Mar 2021 11:31:04 +0800
Message-Id: <20210303033106.549-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303033106.549-1-shawn.guo@linaro.org>
References: <20210303033106.549-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The last cell of 'gpio-ranges' should be number of GPIO pins, and in
case of qcom platform it should match msm_pinctrl_soc_data.ngpio rather
than msm_pinctrl_soc_data.ngpio - 1.

This fixes the problem that when the last GPIO pin in the range is
configured with the following call sequence, it always fails with
-EPROBE_DEFER.

    pinctrl_gpio_set_config()
        pinctrl_get_device_gpio_range()
            pinctrl_match_gpio_range()

Fixes: e13c6d144fa0 ("arm64: dts: qcom: sm8150: Add base dts file")
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index e5bb17bc2f46..778613d3410b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -914,7 +914,7 @@
 			      <0x0 0x03D00000 0x0 0x300000>;
 			reg-names = "west", "east", "north", "south";
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-ranges = <&tlmm 0 0 175>;
+			gpio-ranges = <&tlmm 0 0 176>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.17.1

