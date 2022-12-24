Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457E5655A91
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Dec 2022 16:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbiLXPnH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Dec 2022 10:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiLXPnB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Dec 2022 10:43:01 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A3AD2F7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:43:00 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 1so10723134lfz.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IP5WXEi60/It1WkYOYioeSdz22+65pTAWDBcXYgbDN8=;
        b=tpbTCs1UakgOICdSL9Fg6XRlGv2tmDLXCg2vymdWuClfYf8vcAmHBrndmq7fKo9hVr
         2tCwFnbV/JCHnmZMLVKzT/c93EhK7VMz9jZIl4HuUEHg1D+yZ+FeOmE7deIvtGIdD6+3
         LRYEtdRtYv9qiBvnYuSG4eas9Bi75dSXCajgdMaASmLXHPbwBHkCMYG+li+254R1ocmz
         O/+QNwe5xWWZoG1rmeBiMlDL/ZXIC2DyApxQPDBPgyJe8DvzcTOYbhH/H03QLFyBJnCi
         qb+ZlbYi1UKtgge/l7JjuigbLlfD1u4T+apIyWWUSpOKPkydoSwg2WaYxP9Hat8A2rmR
         3fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IP5WXEi60/It1WkYOYioeSdz22+65pTAWDBcXYgbDN8=;
        b=7nPAnzfZPBEI3/0Jfw76e9wM7rmc9/IldM0113eDuboHa9SBmgYFLndmfclb/llqUa
         iyo9AKAgbkFWCJWECiu2H4pZYjX6m4SDlcW536SwDwh4jzfwSbtz4N+oEvCCKM3LWwNl
         piz38pnOsxHsReYnFqFKLcX6Ig2VOrDssmqfV6KWDhq/+GE+0Ugq+sXVVddYmonEMyPq
         OnZcvOqyaZ2FeyFk13hkH8gAEOzKr9iM4yJ5S5wtjElZ5BnYs3YCRvCVZSupVpeDUCK3
         ZyeMqdXSjvAanLMK8uL8lnSSOXxneSW2INYT2yGU3H0Kc0CoA3yYkg0ReTbOJ0Ci0soN
         umag==
X-Gm-Message-State: AFqh2krn3z4Gv5heOnemFwhwsigmVtOM+H1xgopENSsASW0JAlvzflfe
        PUT/rNqyvA0pVLPYaGRiQQ64tw==
X-Google-Smtp-Source: AMrXdXv4AvexJefOIj32sbuKUlGLId5wgzh+F8z1jfgnnz1uLZlN0NgV4ZUj6tqdEnoLEygOQ4yL0g==
X-Received: by 2002:ac2:4c24:0:b0:4b4:9124:8aa6 with SMTP id u4-20020ac24c24000000b004b491248aa6mr3343430lfq.27.1671896579087;
        Sat, 24 Dec 2022 07:42:59 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f14-20020ac251ae000000b004b257fef958sm999927lfk.94.2022.12.24.07.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 07:42:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] arm64: dts: qcom: sm6125: re-order USB2 phy clocks
Date:   Sat, 24 Dec 2022 16:42:52 +0100
Message-Id: <20221224154255.43499-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
References: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect USB2 phy clocks in other order:

  sm6125-sony-xperia-seine-pdx201.dtb: phy@1613000: clock-names:1: 'ref' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 7e25a4f85594..bf9e8d45ee44 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -442,9 +442,9 @@ hsusb_phy1: phy@1613000 {
 			reg = <0x01613000 0x180>;
 			#phy-cells = <0>;
 
-			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-				 <&gcc GCC_AHB2PHY_USB_CLK>;
-			clock-names = "ref", "cfg_ahb";
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
 			status = "disabled";
-- 
2.34.1

