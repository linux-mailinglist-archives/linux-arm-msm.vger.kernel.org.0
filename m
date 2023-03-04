Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64026AA9BE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 14:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjCDNDa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 08:03:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjCDND3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 08:03:29 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597AC10AA6
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 05:03:20 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id ay14so17019677edb.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 05:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677934998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJR6oU4xKUs4lYSyYP5+zTHR16nQ+SugySt6CqU73PU=;
        b=meLUljN1kRQFfQyXZaILv5wTYVAz93IaTM/ZaiGNZm1gYEIgmVg8bCm26nhhUzfX+g
         ZQ6eDrcuq+lSFIuQGs4OGz7ySh516Lg985orujn9fUsbiCMPxbf+L938EGXNuMsJY4Cb
         yP0lXx3UJeg3m0yFK66iYrOSSIjk4ZHsU6d2r4PALFcSyu7lGA7lg1vu5khfK9mG0O0Y
         0hMuKC1pHnimNE6rPYb7z4cRxrO9Sc3gCLuTBkoD4B17Ct6+t8bi7hEVY+fFKQFkPegB
         F5GsUWyt7vpuxlaljTqjei8tiZg6+WjeQghJlVH5g3qF68dMt7PdMbb5GAS76R4TckQF
         oloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677934999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJR6oU4xKUs4lYSyYP5+zTHR16nQ+SugySt6CqU73PU=;
        b=wYDiV97qH7gBvPh6xeK7LegCbXi8l8q0frTYqqr0XbaC7mqqtGmpQ78kUrD3KHH3Bz
         DUxm8Nw1G+qplbSoYUSVd+sJa1EyycZ2tf2SFXfFeOsYCHEOTT4KlgU83GptfvO8OTQT
         1QukBja9UQ7lOtIjv77Jq5/OtSkN01660byZKXIeQ8a4K+Z2Z+pbP8lsM/1IbW+M+VL9
         WiSbXFb8Mb0d8O2DD2iob2wWGwlmnkQhTyg6rlHpVLWnbW0+cUxDdu+zDXiv8AMWdTtW
         WYAmDAzLbjcc+eQdCuYOJW225s7tjv/9lcwFRYtiKMvAlmgCX7RMl2o0lDY8LKGn03Z0
         6WCA==
X-Gm-Message-State: AO0yUKXM0DM1BdzqEt6vk87CE64Af5pFx2QM5bavssyPxLkevjsIEQKT
        3TBazDiDvCR2KFSyoRLxXS4DKg==
X-Google-Smtp-Source: AK7set8B4W332A4II2SW8JiGYyWXFAhUHBnJ7z2y1vWrZX0ySzWjJIySJg8Gp0Za9rstQgX6XJ+wOw==
X-Received: by 2002:a05:6402:2052:b0:4b6:5d88:3fc4 with SMTP id bc18-20020a056402205200b004b65d883fc4mr5213394edb.1.1677934998736;
        Sat, 04 Mar 2023 05:03:18 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b758:6326:1292:e2aa])
        by smtp.gmail.com with ESMTPSA id u23-20020a50c057000000b004c19f1891fasm2423220edd.59.2023.03.04.05.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:03:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianhua Lu <lujianhua000@gmail.com>,
        Katherine Perez <kaperez@linux.microsoft.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: fix USB maximum speed property
Date:   Sat,  4 Mar 2023 14:03:14 +0100
Message-Id: <20230304130315.51595-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Fix typo in USB DWC3 node maximum speed property.

Fixes: a41b617530bf ("arm64: dts: qcom: sm8250: Add device tree for Xiaomi Mi Pad 5 Pro")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
index 24fc29f0ee5e..6bd0dda8b6e9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
@@ -595,7 +595,7 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	dr_mode = "peripheral";
-	maximum-spped = "high-speed";
+	maximum-speed = "high-speed";
 	/* Remove USB3 phy */
 	phys = <&usb_1_hsphy>;
 	phy-names = "usb2-phy";
-- 
2.34.1

