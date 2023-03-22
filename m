Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A176C54F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 20:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjCVTbH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 15:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjCVTbC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 15:31:02 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB2D64239
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:57 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id ew6so14406124edb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679513455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjZRp40FPRrskzF7ZI87t7kgEWRDXNcFtKlljyaufmU=;
        b=I4w03IzrYWAmk/+JiLr6F2z1+ONFW1HIkI+m4d2O6t0A36P+dwfw8RufoI4D5OVGwK
         6fRoCKk8PUWALnlUpSqbs50KgoqpC4GiuBSBkpcMUtm/wvglgDNY9Rj7LC2e8v2ShlAk
         Q0DY2ifmKDyoT4YweW6QmgfD2afvyGwYs09U548bPdk0bjWuJEQdTf5QyKaDMnvVq9lS
         tlNaThCoE+yABN14iFu1tQEM526hPEEOWxp1XfJllyGzb/Z69Kv5yYSfhBtSpR+ksVqi
         69tx6UjKDZggmPuRz4HGJY6lJ3fg7KR4HeZ6WBfRC9oNTl48fd38yjwI7/CGbd195Qs6
         6x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjZRp40FPRrskzF7ZI87t7kgEWRDXNcFtKlljyaufmU=;
        b=IO8wEfOOO2xkDBnR9vFInqzmg+CsUdV3UdpQEDrH/eriM70CS775mz54iKwWaoGbg0
         pGHA3/Cak9UvDhBEdWjw5lLSBe6EBffQAmrDtJfb/1th1Gbbw5nuB+eGYACUU+ADZJ7f
         CutjSZuxDEC53ENP5wTpBErvE2kfGXMyLi16GN9RrmjugwNNUEEzOiXRL9JJLtNyNfZ8
         j3kWQeSmZZqo2j/BBYqIUhWjtgHUel2nn6hTo/07dJpPNBaXRmSU7jfteUV5Eq0S+iH6
         TIqPkdmohc/ZrgrM72f10PLkgV+LUpAfH8l6dW4RNJqDcoCxG49aBOAY66dTZJuItP8F
         Pz/A==
X-Gm-Message-State: AO0yUKXm6GxXstiZAh9HA/08yf1L1aHV5j8m/fXMy8dQrlhc2OPiRNYN
        zRGZ3WiV6p/seXYbU9diiaUZWQ==
X-Google-Smtp-Source: AK7set958KtOpibEr6Y5biy/UzSGGFcFMZ0TaPqL2USPc4H1DRMEZtbkWoCoYp7+Tv4MYXKC21b96g==
X-Received: by 2002:a17:906:b847:b0:933:4a3e:c625 with SMTP id ga7-20020a170906b84700b009334a3ec625mr7592562ejb.40.1679513455655;
        Wed, 22 Mar 2023 12:30:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id n25-20020a1709061d1900b008e9c79ff14csm7660309ejh.96.2023.03.22.12.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:30:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 2/4] arm64: dts: qcom: sdm850-samsung-w737: Use proper WSA881x shutdown GPIO polarity
Date:   Wed, 22 Mar 2023 20:30:49 +0100
Message-Id: <20230322193051.826167-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322193051.826167-1-krzysztof.kozlowski@linaro.org>
References: <20230322193051.826167-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The WSA881x shutdown GPIO is active low (SD_N), but Linux driver assumed
DTS always comes with active high.  Since Linux drivers were updated to
handle proper flag, correct the DTS.

The change is not backwards compatible with older Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index 9850140514ba..41f59e32af64 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -662,7 +662,7 @@ swm: swm@c85 {
 		left_spkr: speaker@0,3 {
 			compatible = "sdw10217211000";
 			reg = <0 3>;
-			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_LOW>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrLeft";
 			#sound-dai-cells = <0>;
@@ -670,7 +670,7 @@ left_spkr: speaker@0,3 {
 
 		right_spkr: speaker@0,4 {
 			compatible = "sdw10217211000";
-			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_LOW>;
 			reg = <0 4>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrRight";
-- 
2.34.1

