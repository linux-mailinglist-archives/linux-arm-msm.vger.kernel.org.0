Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C8C3322DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 11:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhCIKU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 05:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhCIKUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 05:20:52 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA6BC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 02:20:51 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id y124-20020a1c32820000b029010c93864955so5577237wmy.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 02:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Ja9Ic3TL2OIWlc+akAnIVOY3PQa7HJDAI9iNG2O7tg=;
        b=CBl1RutLjVO06dsddUBm1LyGvDkB9emZwNK4aryNixf9G3nJte05bK8osMJ0aRpXuD
         jedgVpD7irPY/aisQJ5IqE9JbW7dPsotIiqtcY+rO4ZlrrfTS5umd7zy8jqWwBZcUC4i
         al7Y2fBP0U44fyQmcA7wpIlD46oNZZhg2FX1xXCGOBOD56qIy0LHooCUhCR9a0ttmcev
         E06D1kUMMweToMMN1qT51EfOYXm3lnUiAMtwHMVjB86QXt3HcWu+Uu4hsmWYf8hKUIWl
         OIFPSiSgsEyP+Bg87SzK9xYJZdw/VAgb+C40eLS12LZhQV2g7S4vx+kPzBEMR+K2pjqY
         S5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Ja9Ic3TL2OIWlc+akAnIVOY3PQa7HJDAI9iNG2O7tg=;
        b=ZDtvHyeJF76/q8fxD5sZpvH/ITOwAKR9XzrEwJaStx1TmlEcV9guTqnlzHXrmJxRVT
         urs9T3vKNnVX94xQWtLiT4TuS2k3vVf3PoMUOy5kqcL/LVjrGpJLuX2m6DaVayS5LLga
         qNJ3/QLd484sKXy3sIuaW8QyNF0uQTruNNbNbWw19ll1qDWzAPBrsSrHa+jIaO2h+90L
         C8f7Qf0RuU7J1L1+JiujcC4ftyees0QqKDqjTzG86izdMCuVfpwjcPptBLNjZKmMaH3c
         xOnyHLSGGMHNc4mJMDT1STfjmNrzJC05l0CymPVcT9wdA2Sc6asdswJO9nE2tj9TNulC
         sgwA==
X-Gm-Message-State: AOAM530wvNzKxRKhkgurhX9OEqbvGSOb6/h5+u8piljZO5x1ycc7DPMq
        GoRZxWuFcpXHbAzW94q15Xx0Tg==
X-Google-Smtp-Source: ABdhPJwjXgLlRTBp5I92BLBRZK7xXvPem5xmee1vAJ+jj2dbyhbZRCIyKIh8r2efK9gKsHunJF8aXA==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr3252207wmd.1.1615285250725;
        Tue, 09 Mar 2021 02:20:50 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id o20sm3421133wmq.5.2021.03.09.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 02:20:50 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        john.stultz@linaro.org, amit.pundir@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: db845c: fix correct powerdown pin for WSA881x
Date:   Tue,  9 Mar 2021 10:20:25 +0000
Message-Id: <20210309102025.28405-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

WSA881x powerdown pin is connected to GPIO1 not gpio2, so correct this.
This was working so far due to a shift bug in gpio driver, however
once that is fixed this will stop working, so fix this!

Fixes: 89a32a4e769cc ("arm64: dts: qcom: db845c: add analog audio support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 0040e138df67..5adf9dcbce2e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1015,7 +1015,7 @@
 		left_spkr: wsa8810-left{
 			compatible = "sdw10217201000";
 			reg = <0 1>;
-			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrLeft";
 			#sound-dai-cells = <0>;
@@ -1023,7 +1023,7 @@
 
 		right_spkr: wsa8810-right{
 			compatible = "sdw10217201000";
-			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
 			reg = <0 2>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrRight";
-- 
2.21.0

