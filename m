Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7B76BBDF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 21:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjCOU17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 16:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbjCOU16 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 16:27:58 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DC612CE2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 13:27:55 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so1820125wmb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 13:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678912073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr9J0FxGpasTPmc3K9y6UFyT8zV90z0HoVcry+6uE6E=;
        b=2L9jwWtjQgMw4Wom5XCjvanMAxWUjvJaBTlUTFrZ57EgTRnL5zTrT4kcfGROxAwolc
         YfP6EQdhUAwSCxkD7HUA405gTuzmsJG4cXKmfwbY6kEEwWsuag/xTNEnGTwybtdCIN6f
         EQ1/tJ14wEccoNfklaPktvMV1A75wlBjWVumE8yDY9Tv3tJk6OJmcELD2p4jeqoP/eXZ
         sIRhM9PyO0NCWH7uTO1VtFBze+debapi0IeEEgqH85y/YVKjc7nN7oLzNUt4qrWbls7O
         TBGVmDtKpH6SFFxQBvR+wmyf7oYgIXwDLWanH5nlX7YikcBlhq7T5twGH0LkLGlWO8A7
         J7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678912073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr9J0FxGpasTPmc3K9y6UFyT8zV90z0HoVcry+6uE6E=;
        b=iAWTEgA/9E17KhTtK9UDH52CNdRZKb2EdZ+DTuMDBF/fcJGcB+E3OFwOqCRLPRZ+8t
         jkzarRuerG3I2s+WZYeIq1lv/jUmkSFeOOPw9e7Wk2XNfuC/tfWl0QXRqieqjXPYrTNs
         OptHZ/3rScKMAe/tU2rHnDr8HFgvXmJxY1WCfiphLXmyGtcrl8ZVyWGNk9ESAH2FhzaP
         srSsSDWL65h848pCSRUUDiVTP29p/KlG4XJGqD4Xf4yJ7o3Z11V8zhpS7yjr21tK2q68
         3IKUF1ejy9x54HNLmjxHrAIsawZiZLQLTvZI3aIRy0HKi4AXuYyeFbeqdIySyiThkzve
         gHjg==
X-Gm-Message-State: AO0yUKVmiws+6+YbuSFQTa3NFy8VERVnv6Phuu29dP3zLwx+QQfnSIDC
        YdXPWVPk3O8hd2m4yANOv4baYQ==
X-Google-Smtp-Source: AK7set8feVb5qr4tXzszszSx/y6GB+vQiduw8991Xje8cOUTvcJG+PH0bhx+FBWagDu5Bu/l+pWxIw==
X-Received: by 2002:a05:600c:1c0a:b0:3ed:22b3:6263 with SMTP id j10-20020a05600c1c0a00b003ed22b36263mr13127306wms.12.1678912073633;
        Wed, 15 Mar 2023 13:27:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:dc34:6420:c408:f64e])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c294700b003ebf9e36cd6sm2897478wmd.26.2023.03.15.13.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 13:27:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8150: fix the uart9 label
Date:   Wed, 15 Mar 2023 21:27:51 +0100
Message-Id: <20230315202751.1518543-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's a typo in the @<address> part of the uart9 label. Fix it.

Fixes: 10d900a834da ("arm64: dts: sm8150: add the QUPv3 high-speed UART node")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 926f40d85603..4e012c8ce10c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1342,7 +1342,7 @@ spi9: spi@a84000 {
 				status = "disabled";
 			};
 
-			uart9: serial@a8c000 {
+			uart9: serial@a84000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				reg-names = "se";
-- 
2.37.2

