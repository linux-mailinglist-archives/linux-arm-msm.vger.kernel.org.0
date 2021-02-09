Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470D0314F79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 13:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhBIMua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 07:50:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbhBIMtF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 07:49:05 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADEDC061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 04:48:21 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id w36so14515342lfu.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 04:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D4TIjkothfdEPJmp+jtQjnJHdWaAiiHT9uw9NxP1nxU=;
        b=Rbf2dZTJHnSqnhP5r8mq8jFsiFlTvtGHjFEpEfqqMFx5cZKTcam+1cL3esN7cCwWq+
         F7krbkkzlSOuZtkWR+JC/VPDaALlT+tYIDaS3NzAfpCjOB0jBncirMraoUIVfC4B9lz4
         /MR2eHah9uuaKfGTZ6McedDx/ohc+Me7GFE9Ulkhn+0JzPab+Mz4oP11pf4Xf7LSjRUU
         TKTh/uT6tpwck66VGbmy/X6tpND+Yfok1tS/YBttuQqATCxSoheKFEbVmueJNUnxhKZJ
         QOe7izNzL2IHYj/gWitedk79MR6IVWKfAaW/WUVwzyU0frVVmKMjR7/TERqKmxz8XVdh
         2CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D4TIjkothfdEPJmp+jtQjnJHdWaAiiHT9uw9NxP1nxU=;
        b=NnmwkiGxWYSrKWIjow/INiWBVBHjJCdzvSrhlirMCLxWwKj54yW/0Bge1TJ5Ejtl6q
         r2ErrcCxhxBdoxI5ESsG0bxhZ669Zk5t+KOy+2Rd2cyRLk0wQ4vW3xICPIWv8fuXbVLA
         hohj/yJKRBXPZoLt3lej/wpuu1OBt1+VuIbIogg+RMoWZNr6QOvGXn2sMmTAIVBQP7M8
         uBHe5amRTtG8dlsVWXZurxg3lF0J7G0yhF56B2SJjIQ+G315NZx2iElJZ6ECBHrHBQqE
         9nVmIv8AeqgK+vnvZrT9wK9nPxgcFm2dkoM5etVHldq0oKFZpo+QtN8GuqhwwEQcjs6t
         NZSw==
X-Gm-Message-State: AOAM531Ypteb+DXl50cIoTZU88bFEp19hB5poYfQ9uPNoVmYuXonuDIu
        rjd1bfyhE087EuPTR8gEeZyOCg==
X-Google-Smtp-Source: ABdhPJyKK/0QQhph8B8otWMXSEzuj4vyGv5W8DrlA2yTKC51RBJ3FglL8cTRb217OPkFwG+tL+5KNA==
X-Received: by 2002:ac2:5e90:: with SMTP id b16mr12790403lfq.122.1612874899716;
        Tue, 09 Feb 2021 04:48:19 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id e16sm1220653ljn.105.2021.02.09.04.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 04:48:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS
Date:   Tue,  9 Feb 2021 15:47:58 +0300
Message-Id: <20210209124758.990681-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209124758.990681-1-dmitry.baryshkov@linaro.org>
References: <20210209124758.990681-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GENI SPI controller shows several issues if it manages the CS on its own
(see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
use GPIO for CS")) for the details. Configure SPI0 CS pin as a GPIO.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index dd0ec0676258..4888ac47cc1d 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -815,7 +815,7 @@ &pm8150_rtc {
 	status = "okay";
 };
 
-&qup_spi0_cs {
+&qup_spi0_cs_gpio {
 	drive-strength = <6>;
 	bias-disable;
 };
@@ -962,7 +962,8 @@ codec {
 /* CAN */
 &spi0 {
 	status = "okay";
-	pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
+	pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs_gpio>;
+	cs-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
 
 	can@0 {
 		compatible = "microchip,mcp2518fd";
-- 
2.30.0

