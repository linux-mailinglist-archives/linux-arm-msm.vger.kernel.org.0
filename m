Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4E95B5477
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiILGWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiILGVb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:21:31 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162DF286F7
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:19:15 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id s6so1946758lfo.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VVRMe5K9zQktuETEV7D34ZSBEU0mHzUqiBeP7TQimRg=;
        b=E9zZ3Djr07TS3fJj6umSRVrlBqZsmRosVs7UWiwoZ84qNN/a0cVp/MbBsxbDvNCRK4
         C5PzUhuDTHzNoejdenm32fJ2OweRU0Ba1IodWlj6HzopWoL+AJtWDhtPW8BCMPIiBu+c
         l2YkgWv05vztqViwf+jj/DW/l0cVvqcEV3OEmjMYARPhi/aX+/uTK3bTtrxBJngTXC4z
         HlFxq0wupVH7fGCSL3l+sS8gAkYtfIEbVZpzdORYN/obVqWkMqM44XUykiTw1/g9wYw7
         VuVfp5t4SncEfaeUCbiZ0KkYaI/Kn/dEDiajc7EHNyX0bGlUKKNH/42dhQApHtcct4jL
         sSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VVRMe5K9zQktuETEV7D34ZSBEU0mHzUqiBeP7TQimRg=;
        b=QPbnheoIw5QkdhLB++1tHnG6Dimq4pBQCqIYDZiajUIdo313OGpHlG1eRHM5/s6FB/
         7bBsHfyubvoyPUVSsGXqa38/myZ5otOdBWehFQ0mEJ9vkt/9CZl0TLjuYFEhI47PNY4e
         e0jXkr+bZpwFSlEgayGWF7gU04sLRlUDK8X2kXEaTlgPw0AoV96LHFFGg+nB/sFQ1yYg
         4Zn2mqNTAvZwtAi1xT57aDLDscA0rONNHovfhH4E22BJEC459MVWHrxwfuDmzG/7Zy2O
         B99nozjiLd3KGMSlC1IGI/zpsTJRani05sNk+m0e9/dsG/GOIkUkyIEA4gpqDb1soBg1
         U2Ww==
X-Gm-Message-State: ACgBeo3hyon8x6UxtsxTHb/w51ysLlAqAAN4XM5H02RZgXpIwwHSKNY3
        uDSY742XM3ng54qp2enYy3VeQg==
X-Google-Smtp-Source: AA6agR5Ef8VuKaloSkqcwAVTmW4EDULh+UlSiGV/k2vvbAxBjr8D2hI70ANVmlLY8cttjljJtvwDYw==
X-Received: by 2002:ac2:5a46:0:b0:498:f53b:d19a with SMTP id r6-20020ac25a46000000b00498f53bd19amr5922678lfn.674.1662963529575;
        Sun, 11 Sep 2022 23:18:49 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 40/40] arm64: dts: qcom: sc7280-herobrine: correct TLMM gpio-line-names
Date:   Mon, 12 Sep 2022 08:17:46 +0200
Message-Id: <20220912061746.6311-41-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are 174 GPIOs in SC7280.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
index bc795c480352..3448e9ed8b03 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
@@ -371,7 +371,5 @@ &tlmm {
 			  "",				/* 170 */
 			  "MOS_BLE_UART_TX",
 			  "MOS_BLE_UART_RX",
-			  "",
-			  "",
 			  "";
 };
-- 
2.34.1

