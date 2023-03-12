Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECBBD6B6A33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Mar 2023 19:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbjCLSiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Mar 2023 14:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbjCLSiD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Mar 2023 14:38:03 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86388211A
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 11:37:25 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id r15so13068917edq.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678646189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTqyBeC+GZ8uw4WwDSFI+iV/rvPQQcy5WBfVxYcXc7E=;
        b=OpTC8Q5T09t1iGZiX0pMkyqfrXQaWE+X15nT2Z5rDXDFuTPpn9s6hbUDrLrm4Ux6xT
         cwiqHHTjZnbGZnQtFB4DD6OB2OAfnwclqbHzMWjyTSSrV4HCo0S1p47FXJN7IgZkIoU3
         jydT/DBSTxtYUGW8RDvxtGP7jghIDEaH7k7SvRas6C7Wz1jiMJ7QP1B8RwzxxCJfNrhX
         tv7HftJpEtyVkLvXZliWHYBgrSZbG+QxFg3kdeK3lFDzXSLhpMY3P2GKawmarkQjVEy7
         8IDaQKWu0hX6OAettMkDpa1xPj9mkEafZxZNRiOjVopNdFnJVFqKn2esfugtwk0rEjDx
         J7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678646189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTqyBeC+GZ8uw4WwDSFI+iV/rvPQQcy5WBfVxYcXc7E=;
        b=71GnqaEVdn45AA+sgtmMktGFb/ZC/4jJRlS88eZGLo2VCL3fMGiuv1JZJQc9XnjxG4
         yQKN/NguSXqQ5yugNZOsF9HCladPvJMGQ4iKmyemkdOwe7ePKdU3NuuD81atP6H+mw4H
         l5xOXn2Cf2ZsKdgvSX0CMyZfpvt468kaKVME9RlxqA9moEr/ID8l6DxJcL3f1hgw54bd
         Q/7AYnq5tHijIPDZSeKXe5e5mr0FwcDXhfcFa+V/poJ+vIkiEO19rnKsKVNJNR62zb57
         D5EsBNpdyIAZgWIciX8/NYCHRGg5scDoYvQbhnTdWt8N0kUurHB1Dd5UZv3+xk4bOYCU
         tlTg==
X-Gm-Message-State: AO0yUKUSkvfmHIbusyBTzm7ekn7YlDz861JuG2KtjRg0gMePvhRpo/nZ
        DR94UJWrIKpoeTbZMGr1HYI31Q==
X-Google-Smtp-Source: AK7set+3B0F1QNQ9KpgMtEOHtW9jO9YxKCqDv1YhcX7/BUWwA3kiKqDOSKyZ/nh20FGFcYHXbLh5yA==
X-Received: by 2002:a17:906:3e52:b0:91e:fcea:f25f with SMTP id t18-20020a1709063e5200b0091efceaf25fmr6891687eji.32.1678646188958;
        Sun, 12 Mar 2023 11:36:28 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709060dce00b0092669fb4ba1sm893806eji.130.2023.03.12.11.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:36:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/8] arm64: dts: qcom: sc7180-trogdor-lazor: correct trackpad supply
Date:   Sun, 12 Mar 2023 19:36:17 +0100
Message-Id: <20230312183622.460488-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The hid-over-i2c takes VDD, not VCC supply.  Fix copy-pasta from other
boards which use elan,ekth3000 with valid VCC:

  sc7180-trogdor-lazor-limozeen-nots-r4.dtb: trackpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

Fixes: 2c26adb8dbab ("arm64: dts: qcom: Add sc7180-lazor-limozeen skus")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
index 850776c5323d..70d5a7aa8873 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
@@ -26,7 +26,7 @@ trackpad: trackpad@2c {
 		interrupt-parent = <&tlmm>;
 		interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
 
-		vcc-supply = <&pp3300_fp_tp>;
+		vdd-supply = <&pp3300_fp_tp>;
 		hid-descr-addr = <0x20>;
 
 		wakeup-source;
-- 
2.34.1

