Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3DF55B4E2B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiIKLPg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbiIKLOW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:14:22 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E243DBF4
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:57 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o2so8202782lfc.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VVRMe5K9zQktuETEV7D34ZSBEU0mHzUqiBeP7TQimRg=;
        b=TPRQYWyFaIE2NL91c/UGueEkDW+rrjJMXDWHFp3TrW0bEJZUszkyyLiQmYzzLZvmmw
         U1XLWPKZV6bgbcsX2kD8DFzB7Tlvp3okZ5qRN0cigKsRKnD1GBoJag3BUmIZJRGXJbhd
         LZiaSAVKs6/j7UhQ7uATMq64MWXHqaG8zfqCtNuau6c85ZJkESg53zXuEj3/yS80lFWc
         korb9iy5j8zNONCMdBNacqFphfPMkxxJJG/JjzAAkOUIgG+/jMgdtjcdEhnJl39Gctd9
         m8Hndvu9g8QEweuTC8OsvHtqcB8gQxEOemjE780WBtyNZlGfC/SeZE7qd8O8upE43KGx
         kd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VVRMe5K9zQktuETEV7D34ZSBEU0mHzUqiBeP7TQimRg=;
        b=rxSV3mIANAYuDeG7wAAt21mKa/MybgObTFysG9rf8wyZN9l1DJJoTps02aJvBp8aJo
         vdfPYLe4tf3NhVnOG8xw4DINtNZB9ux6VTuRY1yKkjhf974G+qz2sEbuD3Lu9gwfDZ5p
         Hzl4MknVZv+f+wCJUlU8TS/DF9lMUu/RitHpG994mYyG/TLiCjhzjpnadTXrjhMSj8xN
         pdkN/7fUij4ApPlS73ZcbYNKpw8eCgQNcA0eQRlMtY1flJ2tX4WJysGEVKal0usZeRDy
         qrJxDJmragk75/GbhsS1lZjWivPlj203yA0Rr7FDUNZRgx9uo33It+ouyJXhl08Qn+Jw
         GGtA==
X-Gm-Message-State: ACgBeo2/BZYCQ8GY3g0mFsem4l/uyruIm1CDG67zF+q1Ok929Mlht6vg
        WWxeHgPFWxUPuEGwSoyMX7VARA==
X-Google-Smtp-Source: AA6agR44IqbVtkDkNkeYN3N9BRB2ZKYL9EtrOXYqnVwp98NIzDUbDtydQjTlzVwyacE/DG3gHC7ayA==
X-Received: by 2002:a05:6512:c1c:b0:499:acb9:5788 with SMTP id z28-20020a0565120c1c00b00499acb95788mr2203332lfu.347.1662894776682;
        Sun, 11 Sep 2022 04:12:56 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 40/40] arm64: dts: qcom: sc7280-herobrine: correct TLMM gpio-line-names
Date:   Sun, 11 Sep 2022 13:12:00 +0200
Message-Id: <20220911111200.199182-41-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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

